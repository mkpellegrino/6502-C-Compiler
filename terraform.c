#include <stdio.h>


void main()
{
  cls();
  clearhires();

  uint lastdirectiontaken=0;
  uint recentjump=0;
  uint standing=0;
  
  uint whichsprite = 1;
  word delay = 0x00CC;

  word x = 0x0020;
  //uint y = 224;
  uint y = 100;
  //word x3 = 0x0080;
  //uint y3 = 100;

  mob sprite1 = { 0, 192, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 1, 29, 6, 1, 21, 0, 1, 42, 0, 2, 42, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 162, 128, 0, 162, 128 };

  mob sprite2 = { 1, 193, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 5, 29, 6, 4, 21, 0, 4, 42, 0, 8, 42, 0, 0, 34, 0, 0, 32, 128, 0, 32, 128, 0, 32, 128, 0, 40, 160, 0, 40, 160 };

  // add the rest of the sprites here, but with all zeroes
  
  spritex( 0, x );
  spritey( 0, y );
  spritex( 1, x );
  spritey( 1, y );

  // multicolour sprite mode
  poke( 0xD01C, 7 );

  spriteon( 1 );
  
  
  // the 01/11/10 sprite colours
  poke( 0xD025, 6 );
  poke( 0xD026, 4 );

  // for sprite 0
  poke( 0xD027, 7 );

  // for sprite 1
  poke( 0xD028, 7 );

  // Terraform
  word mem = 0x3E00;
  word cmem = 0x07C0;
  for( uint j = 0; j < 40; inc(j) )
    {
      for( uint i = 0; i < 7; inc(i) )
	{
	  generateLand();
	  incMem();
	}
      generateBottom();
      incMem();
      
      generateColours();
      incCmem();
    }

  // save the old values of the VIC-II
  uint oldD011 = peek( 0xD011 );
  uint oldD016 = peek( 0xD016 );
  uint oldD018 = peek( 0xD018 );
  uint oldD020 = peek( 0xD020 );
  uint oldD021 = peek( 0xD021 );
  uint oldChar = peek( 0x0286 );

  // set multicolour bitmap mode
  poke( 0xD011, 59 ); 
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  // set bg and fg colours
  poke( 0xD020, 0 );      
  poke( 0xD021, 0 );


  uint dfSTART=20;
  uint dfEND=70;
  uint dfCOLOR=3;
  uint dfY=130;
  drawFloor();

  dfSTART=60;
  dfEND=120;
  dfCOLOR=2;
  dfY=150;
  drawFloor();

  dfSTART=80;
  dfEND=160;
  dfCOLOR=1;
  dfY=170;
  drawFloor();

  dfSTART=0;
  dfEND=70;
  dfCOLOR=3;
  dfY=110;
  drawFloor();

  dfSTART=60;
  dfEND=160;
  dfCOLOR=1;
  dfY=90;
  drawFloor();

  
  uint timer = 0;
  uint c = getin();
  while( c != 62 )
    {
      if( timer == 0 )
	{
	  checkIfStanding();
	  if( standing == 0 )
	    {
	      y = y + 1;
	      if( recentjump == 1 )
		{
		  if( lastdirectiontaken == 2 )
		    {
		      if( x < 320 )
			{
			  x = x + 1;
			}
		    }
		  else
		    {
		      if( x > 0x0017 )
			{
			  x = x - 1;
			}
		    }
		  spritex( 0, x );
		  spritex( 1, x );
		}
	      spritey( 0, y );
	      spritey( 1, y );
	    }
	  else
	    {
	      recentjump=0;
	      checkLeft();
	      checkRight();
	      checkJump();
	      checkIfStanding();
	    }
	}
      inc( timer );
      c = getin();
    }

  // restore old Vic-II values

  clearkb();
  //cls();
  
  poke( 0xD011, oldD011 );
  poke( 0xD016, oldD016 );
  poke( 0xD018, oldD018 );
  poke( 0xD020, oldD020 );
  poke( 0xD021, oldD021 );
  poke( 0x0286, oldChar );
  return;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}

void incMem()
{
  mem = mem + 1;
  return;
}

void incCmem()
{
  cmem = cmem + 1;
  return;
}

void generateLand()
{
  uint r = rnd(1);
  if( r < 65 )
    {
      poke( mem, 170 );
    }
  else
    {
      if( r < 128 )
	{
	  poke( mem, 166 );
	}
      else
	{
	  if( r < 196 )
	    {
	      poke( mem, 149 );
	    }
	  else
	    {
	      poke( mem, 90 );
	    }
	}
    }
  return;
}

void generateBottom()
{
  uint r1 = rnd(1);
  if( r1 < 65 )
    {
      poke( mem, 24 );
    }
  else
    {
      if( r1 < 128 )
	{
	  poke( mem, 8 );
	}
      else
	{
	  if( r1 < 196 )
	    {
	      poke( mem, 0 );
	    }
	  else
	    {
	      poke( mem, 32 );
	    }
	}
    }
  return;
}

void generateColours()
{
  uint r2 = rnd(2);
  if( r2 < 128 )
    {
      poke( cmem, 89 );
    }
  else
    {
      poke( cmem, 149 );
    }
  return;
}

void clearhires()
{

  //uint cc=0;
  //for( uint ii = 0; ii<160; inc(ii))
  //  {
  //    for( uint jj=0; jj<200; inc(jj))
  //{
  //	  plot( ii,jj,cc );
  //	}
  //}
  
  // this is for the pixel data
  for( word mem1 = 0x2000; mem1 < 0x3FFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }
  // this is for the single colour (11)
  for( mem1 = 0xD800; mem1 < 0xDBFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 14 );
    }

  // this is for the colours for 01 and 10
  for( mem1 = 0x0400; mem1 < 0x07FF; mem1 = mem1 + 1 )
    {
      poke( mem1, 89 );
      mem1 = mem1 + 1;
      poke( mem1, 134 );
    }
  return;
}

void pause()
{
  poke( 198, 0 );
  jsr( 65508 );

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
	  spritex( 0, x );
	  spritex( 1, x );
	  moveLegs();
	}
    }
  
  if( x < 0x0017 )
    {
      x = 0x0017;
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
	  spritex( 0, x );
	  spritex( 1, x );
	  moveLegs();
	}
    }
  
  if( x > 320 )
    {
      x = 320;
    }
  return;
}

void checkJump()
{
  if( c == 60 )
    {
      if( standing != 0 )
	{
	  recentjump = 1;
	  for( uint jumpclock = 0; jumpclock < 24; inc( jumpclock ) )
	    {
	      delayfunction();
	      y = y - 1;
	      if( lastdirectiontaken == 2 )
		{
		  x = x + 1;
		}
	      else
		{
		  x = x - 1;
		}
	      spritex( 0, x );
	      spritex( 1, x );
	      spritey( 0, y );
	      spritey( 1, y );
	    }
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
  uint streturn = 0;
  // calibrate where
  // program should
  // look for a floor
  myX = myX - 11;
  myY = myY - 29;
  standing = getxy( myX, myY );
  return;
}

void drawFloor()
{  
  for( uint dfIT = dfSTART; dfIT < dfEND; inc(dfIT) )
    {
      plot( dfIT, dfY, dfCOLOR);
    }
  return;
}
