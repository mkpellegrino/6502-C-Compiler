#include <stdio.h>

void main()
{
  cls();
  printf( "O  :  MOVE RIGHT\nU  :  MOVE LEFT\nSPACE  :  JUMP" );
  pause();
  romout();
  saveregs();

  data jt = { 0xF8, 0xF9, 0xF9, 0xFA, 0xFB, 0xFC, 0xFC, 0xFD, 0xFD, 0xFD, 0xFE, 0xFF, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 1, 0, 0 };
    
  uint midjump = 0;
  uint p1;
  uint p2;
  uint p3;
  uint p4;
  uint p5;
  uint spriteI;

  // background colours
  poke( 0xD020, 9 );
  poke( 0xD021, 12 );

  bank( 1 );

  uint lastdirectiontaken=0;
  uint standing=0;
  uint whichsprite = 1;
  word delay = 0x00CC;

  word x = 0x0020;
  uint y = 100;

  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  clearhires();
  createplatforms();
  
  // the blue dude walking
  mob blueguy1 = { 0, 1, 0, 255, 0, 3, 170, 192, 14, 170, 176, 14, 170, 172, 14, 170, 172, 14, 170, 172, 58, 251, 235, 58, 186, 235, 58, 170, 171, 58, 171, 171, 58, 170, 171, 58, 186, 187, 58, 175, 235, 14, 170, 171, 15, 170, 172, 14, 234, 188, 14, 186, 176, 58, 190, 172, 58, 195, 171, 59, 0, 235, 63, 0, 63};

  mob blueguy2 = { 1, 2, 0, 255, 0, 3, 170, 192, 14, 170, 176, 14, 170, 172, 14, 170, 172, 14, 170, 172, 58, 251, 235, 58, 186, 235, 58, 170, 171, 58, 171, 171, 58, 170, 171, 58, 186, 187, 58, 175, 235, 14, 170, 171, 15, 170, 172, 14, 170, 188, 58, 175, 240, 58, 179, 172, 58, 195, 171, 59, 0, 235, 63, 0, 63};

  mob treasurechest = { 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 192, 0, 14, 176, 0, 58, 172, 0, 234, 172, 3, 170, 171, 14, 234, 171, 58, 186, 175, 58, 186, 187, 234, 174, 235, 234, 175, 171, 234, 174, 187, 234, 174, 235, 234, 174, 171, 234, 174, 171, 234, 174, 172, 234, 174, 176, 234, 174, 192, 255, 255, 0 };

  
  // the hat dude
  //mob sprite1 = { 0, 6, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 1, 29, 6, 1, 21, 0, 1, 42, 0, 2, 42, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 162, 128, 0, 162, 128 };
  //mob sprite2 = { 1, 5, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 5, 29, 6, 4, 21, 0, 4, 42, 0, 8, 42, 0, 0, 34, 0, 0, 32, 128, 0, 32, 128, 0, 32, 128, 0, 40, 160, 0, 40, 160 };

  spritex( 0, x );
  spritey( 0, y );
  spritex( 1, x );
  spritey( 1, y );
  
  spritexy( 2, 210, 175 );

  // multicolour sprite mode for all 3 sprites  %00000111
  poke( 0xD01C, 7 );

  // turns on 1 and 3  %00000101
  spriteon( 5 );
  
  // 01 = White for all sprites
  poke( 0xD025, 1 );

  // 11 = black for all sprites
  poke( 0xD026, 0 );
  
  // 11 = light blue
  poke( 0xD027, 3 );
  poke( 0xD028, 3 );

  // 11 = brown
  poke( 0xD029, 9 );


  // the main loop
  
  uint timer = 0;
  uint c = getin();
  while( c != 62 )
    {
      if( timer == 0 )
	{
	  checkIfStanding();
	  if( standing == 0 )
	    {
	      if( midjump != 0 )
		{
		  calculatejump();
		}
	      y = y + 1;	      
	    }
	  else
	    {
	      if( midjump != 0 )
		{
		  calculatejump();
		}
	      else
		{
		  checkLeft();
		  checkRight();
		  checkJump();
		}
	    }
	  positionplayer();
	}
      inc( timer );

      c = getin();
    }

  clearkb();
  restoreregs();
  bank(0);
  romin();
  return;
}

void positionplayer()
{
  if( x < 0x0017 )
    {
      x = 0x0017;
    }
  if( x > 320 )
    {
      x = 320;
    }
  
  spritey( 0, y );
  spritey( 1, y );
  spritex( 0, x );
  spritex( 1, x );

  return;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}



void clearhires()
{
  word mem1 = 0x0000;
  
  // this is for the single colour (11) -- this is ALWAYS at 0xD800
  for( mem1 = 0xD800; mem1 < 0xDBFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 8 );
    }

  // this is for the colours for 01 and 10
  for( mem1 = 0x4400; mem1 < 0x47C0; mem1 = mem1 + 1 )
    {
      poke( mem1, 35 );
    }
  
  for( mem1 = 0x47C0; mem1 < 0x47FF; mem1 = mem1 + 1 )
    {
      poke( mem1, 97 );
    }

  // the pixels
  for( mem1 = 0x6000; mem1 < 0x7FF8; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }

  poke( 0x6148, 40 );
  poke( 0x6149, 170 );
  poke( 0x614A, 170 );
  poke( 0x614B, 40 );
  poke( 0x4429, 125 );
  
  return;
}

void pause()
{
  poke( 0x00C6, 0 );
  jsr( 0xFFE4 );

  uint pausev = getchar();
  while( pausev == 0 )
    {
      pausev = getchar();
    }
  return;
}

void checkLeft()
{
  // move left if "u" is pressed and x > 23
  if( c == 30 )
    {
      lastdirectiontaken=1;
      if( x > 0x0017 )
	{
	  x = x - 1;
	  moveLegs();
	}
    }
  return;
}

void checkRight()
{
  // move right if "o" is pressed and x < 320
  if( c == 38 )
    {
      lastdirectiontaken=2;
      if( x < 320 )
	{
	  x = x + 1;
	  moveLegs();
	}
    }  
  return;
}

void checkJump()
{
  if( c == 60 )
    {
      if( midjump == 0 )
	{
	  midjump = 1;
	}
    }

  return;
}

// animate the legs during movement
void moveLegs()
{
  if( whichsprite == 1 )
    {
      whichsprite = 2;
      spriteoff( 1 );
      spriteon( 2 );
    }
  else
    {
      whichsprite = 1;
      spriteoff( 2 );
      spriteon( 1 );
    }
  return;

}

void delayfunction()
{
  for( word ldx = 0; ldx < delay; ldx = ldx + 1 )
    {
      nop();
    }
  return;
}


void checkIfStanding()
{
  word myX = x;
  uint myY = y;
  lsr( myX );
  uint XXX = touint(myX);
  XXX = XXX - 6;
  myY = myY - 29;
  standing = getxy( XXX, myY );
  standing = standing & 0x3C;
  if( standing != 20 )
    {
      standing = 0;
    }
  return;
}

void cr()
{
  lda( 0x0D );
  jsr( 0xFFD2 );
  return;
}

void sp()
{
  lda( 0x20 );
  jsr( 0xFFD2 );
  return;
}

void saveregs()
{
  uint oldD011 = peek( 0xD011 );
  uint oldD016 = peek( 0xD016 );
  uint oldD018 = peek( 0xD018 );
  uint oldD020 = peek( 0xD020 );
  uint oldD021 = peek( 0xD021 );
  uint oldChar = peek( 0x0286 );
  return;
}

void restoreregs()
{
  poke( 0xD011, oldD011 );
  poke( 0xD016, oldD016 );
  poke( 0xD018, oldD018 );
  poke( 0xD020, oldD020 );
  poke( 0xD021, oldD021 );
  poke( 0x0286, oldChar );
  return;
}


void calculatejump()
{
  
  if( lastdirectiontaken == 2 )
    {
      x = x + 2;
    }
  else
    {
      x = x - 2;
    }
  
  y = y + (jt)[ midjump ];
    
  checkIfStanding();

  inc( midjump );

  if( standing != 0 )
    {
      midjump = 0;
    }
  
  if( midjump == 25 )
    {
      midjump = 0;
    }
  

  return;
}


void createplatforms()
{  
  // floor
  // x1
  p1 = 0;
  // y1
  p2 = 190;
  // x2
  p3 = 160;
  // y2
  p4 = 200;
  // colour
  p5 = 1;
  rect();

  // left border
  p1 = 0;
  p2 = 0;
  p3 = 1;
  p4 = 200;
  p5 = 1;
  rect();

  // right border
  p1 = 159;
  p2 = 0;
  p3 = 160;
  p4 = 200;
  p5 = 1;
  rect();

  // A
  p1 = 0;
  p2 = 160;
  p3 = 40;
  p4 = 161;
  //p5 = 1;
  rect();

  // B
  p1 = 40;
  p2 = 150;
  p3 = 41;
  p4 = 160;
  //p5 = 1;
  rect();

  // C
  //p1 = 40;
  p2 = 150;
  p3 = 80;
  p4 = 151;
  //p5 = 1;
  rect();

  // D
  p1 = 90;
  p2 = 150;
  p3 = 120;
  p4 = 151;
  //p5 = 1;
  rect();

  
  return;
}


void rect()
{
  for( uint rx = p1; rx < p3; inc(rx) )
    {
      for( uint ry = p2; ry < p4; inc(ry) )
	{
	  plot( rx, ry, p5 );
	}
    }
  return;
}
