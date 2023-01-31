#include <stdio.h>

// Colours
// 0 - Black
// 1 - White
// 2 - Red
// 3 - Cyan
// 4 - Purple
// 5 - Green
// 6 - Dark Blue
// 7 - Yellow
// 8 - Orange
// 9 - Brown
// 10 - Pink
// 11 - Dark Grey
// 12 - Grey
// 13 - Bright Green
// 14 - Light Blue
// 15 - Light Grey

void main()
{
  cls();
  printf( "O  :  MOVE RIGHT\nU  :  MOVE LEFT\nSPACE  :  JUMP" );
  pause();
  romout();
  saveregs();

  // building blocks
  data bb =
    {
      0xFA, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0xAA, 0xAA, 0xFA, 0x0F, 0x00, 0x00, 0x00, 0x00,
      0xAA, 0xAA, 0xAA, 0xAA, 0xFF, 0x00, 0x00, 0x00,
      0xAA, 0xAA, 0xAF, 0xF0, 0x00, 0x00, 0x00, 0x00,
      0xAF, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };
    
  // jump table
  data jt = { 0x00, 0xFC, 0xFC, 0xFD, 0xFD, 0xFD, 0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
  uint midjump = 0;
  uint jerjump = 0;
  
  // a timer to slow down the leg movement
  uint subtimer = 0;
  // parameters for floor building
  uint spriteI;

  // background colours
  poke( 0xD020, 9 );
  poke( 0xD021, 12 );

  bank( 1 );

  uint lastdirectiontaken=0;
  uint standing=0;
  uint jerstanding=0;

  uint jerrybelow=0;
  uint jerrybelow2=0;
  
  uint whichsprite = 1;
  word delay = 0x00CC;

  word x = 0x0020;
  uint y = 100;

  word jx = 0x012C;
  uint jy = 100;

  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  clearhires();
  createplatforms();
  createbackground();
  
  // the blue dude walking
  //mob blueguy1 = { 0, 1, 0, 255, 0, 3, 170, 192, 14, 170, 176, 14, 170, 172, 14, 170, 172, 14, 170, 172, 58, 251, 235, 58, 186, 235, 58, 170, 171, 58, 171, 171, 58, 170, 171, 58, 186, 187, 58, 175, 235, 14, 170, 171, 15, 170, 172, 14, 234, 188, 14, 186, 176, 58, 190, 172, 58, 195, 171, 59, 0, 235, 63, 0, 63};

  //mob blueguy2 = { 0, 2, 0, 255, 0, 3, 170, 192, 14, 170, 176, 14, 170, 172, 14, 170, 172, 14, 170, 172, 58, 251, 235, 58, 186, 235, 58, 170, 171, 58, 171, 171, 58, 170, 171, 58, 186, 187, 58, 175, 235, 14, 170, 171, 15, 170, 172, 14, 170, 188, 58, 175, 240, 58, 179, 172, 58, 195, 171, 59, 0, 235, 63, 0, 63};

  //mob treasurechest = { 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 192, 0, 14, 176, 0, 58, 172, 0, 234, 172, 3, 170, 171, 14, 234, 171, 58, 186, 175, 58, 186, 187, 234, 174, 235, 234, 175, 171, 234, 174, 187, 234, 174, 235, 234, 174, 171, 234, 174, 171, 234, 174, 172, 234, 174, 176, 234, 174, 192, 255, 255, 0 };

  mob Jerry1 = { 1, 5, 0, 255, 0, 3, 255, 192, 15, 247, 240, 15, 213, 240, 15, 85, 112, 13, 255, 240, 13, 247, 240, 15, 85, 112, 3, 255, 195, 0, 255, 11, 0, 170, 58, 2, 186, 250, 10, 159, 232, 41, 87, 160, 233, 87, 128, 218, 94, 128, 214, 122, 128, 53, 122, 128, 15, 226, 128, 2, 162, 160, 10, 162, 168};

  // Jerry Walking
  //mob Jerry2 = { 4, 5, 0, 255, 0, 3, 255, 192, 15, 247, 240, 15, 213, 240, 15, 85, 112, 13, 255, 240, 13, 247, 240, 15, 85, 112, 3, 255, 195, 0, 255, 11, 0, 170, 58, 2, 186, 250, 10, 159, 232, 41, 87, 160, 234, 87, 128, 218, 94, 128, 213, 122, 128, 53, 122, 160, 15, 224, 162, 10, 128, 170, 2, 160, 40};



  //mob thinguy1 = { 0, 1, 0, 168, 0, 2, 170, 0, 3, 87, 0, 3, 119, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 252, 0, 0, 252, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 3, 207, 0};
  mob twr1 = { 0, 1, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 195, 0, 3, 3, 0, 12, 3, 48, 48, 0, 192, 12, 0, 192};
  mob twr2 = { 0, 2, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 3, 12, 0, 3, 12, 0, 3, 207, 0};
  mob twr3 = { 0, 3, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 252, 0, 0, 252, 0, 0, 252, 0, 0, 204, 0, 3, 12, 0, 3, 207, 0};
  mob twr4 = { 0, 4, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 3, 12, 0, 3, 12, 0, 3, 207, 0};

  mob twl1 = { 0, 6, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 0, 195, 0, 3, 207, 0};
  mob twl2 = { 0, 7, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 0, 195, 0, 0, 195, 0, 3, 207, 0};
mob twl3 = { 0, 8, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 252, 0, 0, 252, 0, 0, 252, 0, 0, 204, 0, 0, 195, 0, 3, 207, 0};
  mob twl4 = { 0, 7, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 0, 195, 0, 0, 195, 0, 3, 207, 0};
  
  // the hat dude
  //mob sprite1 = { 0, 6, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 1, 29, 6, 1, 21, 0, 1, 42, 0, 2, 42, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 162, 128, 0, 162, 128 };
  //mob sprite2 = { 1, 5, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 5, 29, 6, 4, 21, 0, 4, 42, 0, 8, 42, 0, 0, 34, 0, 0, 32, 128, 0, 32, 128, 0, 32, 128, 0, 40, 160, 0, 40, 160 };

  spritex( 0, x );
  spritey( 0, y );

  // Jerry
  spritexy( 3, 160, 190 );

  // multicolour sprite mode for both sprites  %00000011
  poke( 0xD01C, 3 );

  // turns on 0 and 1  %00000011
  spriteon( 3 );
  
  // 01 = Yellow for all sprites
  poke( 0xD025, 7 );

  // 11 = black for all sprites
  poke( 0xD026, 0 );
  
  // 10 = yellow
  // sprite one
  poke( 0xD027, 2 );
  
  // 10 = brown
  // sprite two
  poke( 0xD028, 9 );

  // 10 = brown
  //poke( 0xD029, 9 );

  // 10 = brown for Jerry
  //poke( 0xD02A, 9 );

  // 10 = brown for Jerry
  //poke( 0xD02B, 9 );

  // the main loop
  
  uint timer = 0;
  uint c = getin();
  while( c != 62 )
    {
      if( timer == 0 )
	{
	  checkIfStanding();

	  // ====================================
	  //                 AI
	  // ====================================
	  if( jerjump >= 1 )
	    {
	      calculatejerjump();
	    }
	  else
	    {
	      if( jerstanding == 20 )
		{
		  checkIfBelow();
		  calculateai();
		}
	      else
		{
		  inc(jy);
		}
	    }

	  positionai();
	  // ====================================
	  
	  if( standing == 0 )
	    {
	      if( midjump != 0 )
		{
		  calculatejump();
		}
	      else
		{
		  inc(y);
		  poke( 0x47F8, whichsprite );
		  
		  inc( whichsprite );
		  
		  if( whichsprite == 5 )
		    {
		      whichsprite = 1;
		    }
		  
		}
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

void calculateai()
{
  if( x < jx )
    {
      if( jx > 0x0017 )
	{
	  jx = jx - 1;
	}
      else
	{
	  jx = 0x0017;
	}
    }
  else
    {
      if( jx < 320 )
	{
	  jx = jx + 1;
	}
      else
	{
	  jx = 320;
	}
    }
  return;
}

void positionai()
{
  spritey( 1, jy );
  spritex( 1, jx );
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
  spritex( 0, x );
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
  
  // this is for the colours for 01 and 10 of the bitmap
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
  inc( subtimer );

  if( subtimer == 10 )
    {
      poke( 0x47F8, whichsprite );

      inc( whichsprite );
      
      if( whichsprite == 5 )
      {
      	  whichsprite = 1;
      }
      subtimer = 0;
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
  word myX = x - 12;
  uint myY = y - 29;
  lsr( myX );
  standing = getxy( myX, myY );
  standing = standing & 0x3C;
  if( standing != 20 )
    {
      standing = 0;
    }
  myX = jx - 12;
  myY = jy - 29;
  lsr( myX );
  jerstanding = getxy( myX, myY );
  jerstanding = jerstanding & 0x3C;
  //if( jerstanding != 20 )
  //  {
  //    jerstanding = 0;
  //  }
  return;
}

void checkIfBelow()
{
  myX = jx - 12;
  myY = jy - 49;
  lsr( myX );
  word myXp = myX + 8;
  word myXm = myX - 8;
  jerrybelow = getxy( myX, myY );
  jerrybelow = jerrybelow | getxy( myXp, myY + 1);
  jerrybelow = jerrybelow | getxy( myXm, myY + 1);
  jerrybelow = jerrybelow | getxy( myXp, myY - 1);
  jerrybelow = jerrybelow | getxy( myXm, myY - 1);
  //jerrybelow = getxy( myX, myY );
  jerrybelow = jerrybelow | getxy( myXp, myY );
  jerrybelow = jerrybelow | getxy( myXm, myY );

  //jerrybelow = jerrybelow & 0x3C;
  poke( 0x6148, jerrybelow );
  if( myY > y )
    {
      if( jerrybelow > 0 )
      {
	jerjump = 1;
      }
    }

  //plot( myX, myY, 3 );
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

void calculatejerjump()
{
  
  if( lastdirectiontaken == 2 )
    {
      if( x > 0x0017 )
	{
	  jx = jx + 1;
	}
      else
	{
	  jx = 0x0017;
	}
    }
  else
    {
      if( x < 320 )
	{
	  jx = jx - 1;
	}
      else
	{
	  jx = 320;
	}
    }
  
  jy = jy + (jt)[ jerjump ];
    
  checkIfStanding();

  inc( jerjump );

  
  if( jerjump == 25 )
    {
      jerjump = 0;
    }
  return;
}

void animatebg()
{
  // TO DO: animate the background here
  nop();
  return;
}

void createbackground()
{
  data cp =
    {
      0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0xDE, 0xFF
    };

  data cp2 =
    {
      0x7B, 0xFF, 0xDE, 0xFF, 0x00, 0x00, 0x00, 0x00
    };
  
  uint cpi = 0;
  for( word pa = 0x7CC0; pa < 0x7EE0; pa = pa + 1 )
    {
      poke( pa, (cp)[cpi] );
      inc(cpi);
      cpi = cpi & 7;
    }
  cpi = 0;
  for( pa = 0x7E00; pa < 0x7F40; pa = pa + 1 )
    {
      poke( pa, (cp2)[cpi] );
      inc(cpi);
      cpi = cpi & 7;
    }

  // Colours
// 0 - Black
// 1 - White
// 2 - Red
// 3 - Cyan
// 4 - Purple
// 5 - Green
// 6 - Dark Blue
// 7 - Yellow
// 8 - Orange
// 9 - Brown
// 10 - Pink
// 11 - Dark Grey
// 12 - Grey
// 13 - Bright Green
// 14 - Light Blue
// 15 - Light Grey

  for( pa = 0x4398; pa < 0x43C0; pa = pa + 1 )
    {
      poke( pa, 0x26 );
    }
  
  // the colour
  poke( 0x4429, 125 );


  word bbx = 0x0081;

  // for colour 11
  word bbx1 = bbx + 0xD800;
  // white
  poke( bbx1, 1 );

  bbx1 = bbx + 0x4400;
  // blue and red
  poke( bbx, 0x26 );

  

  // multiply it by 8
  asl( bbx );
  asl( bbx );
  asl( bbx );

  bbx = bbx + 0x6000;
  
  for( uint bi = 0; bi < 8; inc(bi) )
    {
      poke( bbx, (bb)[bi] );
      bbx = bbx + 1;
    }
  
  for( bi = 8; bi<16; inc(bi) )
    {
      poke( bbx, (bb)[bi] );
      bbx = bbx + 1;
    }
  for( bi = 16; bi<24; inc(bi) )
    {
      poke( bbx, (bb)[bi] );
      bbx = bbx + 1;
    }
  for( bi = 24; bi<32; inc(bi) )
    {
      poke( bbx, (bb)[bi] );
      bbx = bbx + 1;
    }

  return;
}

void createplatforms()
{

  // Colours
  // 0 - Black
  // 1 - White
  // 2 - Red
  // 3 - Cyan
  // 4 - Purple
  // 5 - Green
  // 6 - Dark Blue
  // 7 - Yellow
  // 8 - Orange
  // 9 - Brown
  // A - Pink
  // B - Dark Grey
  // C - Grey
  // D - Bright Green
  // E - Light Blue
  // F - Light Grey

  
  data fd =
    {
      0, 190, 160, 200, 1, 
      0, 0, 1, 200, 1,
      159, 0, 160, 200, 1, 
      0, 170, 70, 171, 1,
      20, 150, 40, 151, 1,
      40, 130, 60, 131, 1,
      20, 110, 40, 111, 1,
      40, 90, 60, 91, 1,
      80, 80, 160, 83, 1,
      48, 101, 80, 102, 1
    };


  poke( 0x45EF, 0x61 );
  poke( 0x45F0, 0x54 );
  
  for( uint floorL = 0; floorL < 65; floorL = floorL + 5 )
    {
      for( uint fx = (fd)[floorL]; fx < (fd)[floorL+2]; inc(fx) )
	{
	  for( uint fy = (fd)[floorL+1]; fy < (fd)[floorL+3]; inc(fy) )
	    {
	      plot( fx, fy, (fd)[floorL+4] );

	    }
	}
  
    }

  putbits();
  
  return;
}


void putbits()
{
  data b =
    {
      0xFA, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0xAA, 0xAA, 0xFA, 0x0F, 0x00, 0x00, 0x00, 0x00,
      0xAA, 0xAA, 0xAA, 0xAA, 0xFA, 0x0F, 0x00, 0x00,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xFA, 0x0F,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAF, 0xF0,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAF, 0xF0, 0x00, 0x00,
      0xAA, 0xAA, 0xAF, 0xF0, 0x00, 0x00, 0x00, 0x00,
      0xAF, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

    };

  
  uint bindex = 0;
  uint pbx = 20;
  uint pby = 9;
  word offset = 0x0000;
  offset = pby;
  offset = offset * 40;
  offset = offset + pbx;

  word color1 = offset + 0xD800;
  word colors2and3 = offset + 0x4400;

  asl( offset );
  asl( offset );
  asl( offset );

  word pixels = offset + 0x6000;
  
  for( uint pbu = 0; pbu < 10; inc(pbu) )
    {

      poke( color1, 1 );
      // 01:7 10:6
      poke( colors2and3, 0x76 );

      color1 = color1 + 1;
      colors2and3 = colors2and3 + 1;
      
      for( uint i = 0; i < 8; inc( i ) )
	{
	  poke( pixels, (b)[bindex] );
	  pixels = pixels + 1;
	  inc( bindex );
	}
    }


  data amp =
    {
      0x3F, 0xD5, 0xD5, 0xD5, 0xD5, 0xD5, 0xD5, 0xFF,
      0xFC, 0x57, 0xF7, 0x57, 0x57, 0x57, 0x57, 0xFF
    };


  bindex = 0;
  pbx = 33;
  pby = 9;
  offset = 0x0000;
  offset = pby;
  offset = offset * 40;
  offset = offset + pbx;

  color1 = offset + 0xD800;
  colors2and3 = offset + 0x4400;

  asl( offset );
  asl( offset );
  asl( offset );

  pixels = offset + 0x6000;
  
  for( pbu = 0; pbu < 2; inc(pbu) )
    {

      poke( color1, 0 );
      // 01:7 10:6
      poke( colors2and3, 0x76 );

      color1 = color1 + 1;
      colors2and3 = colors2and3 + 1;
      
      for( i = 0; i < 8; inc( i ) )
	{
	  poke( pixels, (amp)[bindex] );
	  pixels = pixels + 1;
	  inc( bindex );
	}
    }

  
  
  return;
}


//void rect()
//{
//  for( uint rx = p1; rx < p3; inc(rx) )
//    {
//      for( uint ry = p2; ry < p4; inc(ry) )
//	{
//	  plot( rx, ry, p5 );
//	}
//  }
// return;
//}
