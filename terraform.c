#include <stdio.h>

void main()
{
  //cls();
  //printf( "O  :  MOVE RIGHT\nU  :  MOVE LEFT\nSPACE  :  JUMP" );
  //pause();
  romout();
  saveregs();

  uint plotshapeX;
  uint plotshapeY;
  uint plotshapeSize;
  word plotshapeAddr;
  uint plotshapeColourValue11;
  uint plotshapeColourValue1001;

  uint X0;
  uint X1;
  uint Y0;
  uint Y1;
  
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

  // start the music located at $1000 (4096)
  sidirq( 0x1000, 0x1003 );


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

  // Colours
  // 0 - Black    1 - White     2 - Red     3 - Cyan    4 - Purple      5 - Green  6 - Dark Blue
  // 7 - Yellow   8 - Orange    9 - Brown   A - Pink    B - Dark Grey   C - Grey   D - Bright Green
  //                          E - Light Blue                F - Light Grey

  word mem1 = 0x0000;
  
  // this is for the single colour (11) -- this is ALWAYS at 0xD800
  for( mem1 = 0xD800; mem1 < 0xDBFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }
  
  // this is for the colours for 01 and 10 of the bitmap
  for( mem1 = 0x4400; mem1 < 0x47FF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0x26 );
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
  if( jx < 0x0017 )
    {
      jx = 0x0017;
    }
  if( jx > 320 )
    {
      jx = 320;
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

void createplatforms()
{
  // Draw the "X"'s on the Scaffolding
  data scafX = {192, 192, 48, 48, 12, 12, 3, 3 };
  data scafX2 = { 3, 3, 12, 12, 48, 48, 192, 192 };

  plotshapeAddr = scafX;
  plotshapeSize = 1;
  plotshapeColourValue1001 = 0xBF;
  plotshapeColourValue11 = 0x02;  

  plotshapeY = 1;
  for( uint ppp = 0; ppp < 4; inc( ppp ))
    {
      plotshapeX = 0;
      plotXLeft();
    }

  plotshapeAddr = scafX2;
  plotshapeY = 1;
  for( ppp = 0; ppp < 4; inc( ppp ))
    {
      plotshapeX = 5;
      plotXRight();
    }

  
  // Colours
  // 0 - Black    1 - White     2 - Red     3 - Cyan    4 - Purple      5 - Green  6 - Dark Blue
  // 7 - Yellow   8 - Orange    9 - Brown   A - Pink    B - Dark Grey   C - Grey   D - Bright Green
  //                          E - Light Blue                F - Light Grey

  // floor data
  // start X, start Y, end X, end Y, Color
  data fd =
    {
      // Bottom
      0, 190, 160, 200, 1,

      // Left Wall
      0, 0, 1, 200, 1,

      // Right Wall
      159, 0, 160, 200, 1, 

      // Stage
      //24, 168, 136, 200, 1,
      24, 168, 136, 169, 1,
      24, 169, 136, 192, 2,
      
      // Left Scaffolding Platforms
      0, 8, 24, 9, 1,
      0, 56, 24, 57, 1,
      0, 104, 24, 105, 1,
      0, 152, 24, 153, 1,

      // Right Scaffolding Platforms
      136, 8, 160, 9, 1,
      136, 56, 160, 57, 1,
      136, 104, 160, 105, 1,
      136, 152, 160, 153, 1,

      // casing and hangers for hanging speakers
      68, 0, 69, 40, 3,
      91, 0, 92, 40, 3,
      64, 40, 96, 41, 3,
      64, 40, 65, 72, 3,
      95, 40, 96, 72, 3,

      // center console
      72, 112, 88, 168, 2,

      // speaker platform 1
      100, 136, 132, 137, 3
      
      //20, 150, 40, 151, 1,
      //40, 130, 60, 131, 1,
      //20, 110, 40, 111, 1,
      //40, 90, 60, 91, 1,
      //80, 80, 160, 83, 1,
      //48, 101, 80, 102, 1
    };

  // Create Objects in the background

// steal your face logo
  data steal1 = {0, 0, 0, 1, 1, 7, 7, 23,     0, 63, 122, 234, 234, 170, 170, 170,     0, 252, 174, 151, 183, 181, 253, 245,    0, 0, 0, 128, 128, 224, 224, 232};
  data steal3 = {30, 30, 94, 94, 94, 94, 94, 94, 171, 171, 171, 171, 175, 191, 175, 191, 253, 245, 245, 245, 245, 213, 245, 213, 120, 122, 122, 122, 122, 122, 122, 122 };
  data steal5 = {95, 87, 87, 87, 87, 87, 23, 23, 175, 175, 173, 253, 213, 245, 255, 235, 85, 85, 85, 87, 87, 95, 255, 235, 250, 234, 234, 234, 234, 234, 232, 232 };
  data steal7 = {21, 5, 5, 1, 1, 0, 0, 0, 255, 255, 127, 95, 95, 95, 23, 0, 255, 255, 254, 250, 250, 250, 232, 0, 168, 160, 160, 128, 128, 0, 0, 0 };

  plotshapeAddr = steal1;
  plotshapeSize = 4;
  plotshapeColourValue1001 = 0x62;
  plotshapeColourValue11 = 0x01;
  plotshapeX = 18;
  plotshapeY = 0;
  plotshape();

  plotshapeY = 1;
  plotshapeAddr = steal3;
  plotshape();

  plotshapeY = 2;
  plotshapeAddr = steal5;
  plotshape();

  plotshapeY = 3;
  plotshapeAddr = steal7;
  plotshape();

  data speaker =
    {
      63, 234, 235, 237, 237, 235, 234, 63,
      252, 171, 235, 123, 123, 235, 171, 252
    };

  plotshapeAddr = speaker;
  plotshapeSize = 2;
  plotshapeColourValue1001 = 0xBF;
  plotshapeColourValue11 = 0x00;

  plotshapeX = 7;
  Y0 = 1;
  Y1 = 21;
  plotYloop();
  
  plotshapeX = 9;
  Y0 = 4;
  Y1 = 21;
  plotYloop();

  plotshapeX = 11;
  Y0 = 7;
  Y1 = 21;
  plotYloop();

  plotshapeX = 27;
  Y0 = 1;
  Y1 = 21;
  plotYloop();

  plotshapeX = 29;
  Y0 = 13;
  Y1 = 21;
  plotYloop();
  
  plotshapeX = 31;
  Y0 = 10;
  Y1 = 21;
  plotYloop();
  
  for( plotshapeX = 16; plotshapeX < 23; inc(plotshapeX) )
  {
    for( plotshapeY = 7; plotshapeY < 9; inc(plotshapeY) )
  	{
  	  plotshape();
  	}
    inc(plotshapeX);
  }

  data tweeter =
    {
      85, 125, 235, 125, 85, 215, 190, 215
    };

  plotshapeAddr = tweeter;
  plotshapeSize = 1;
  plotshapeColourValue1001 = 0xFB;
  plotshapeColourValue11 = 0x00;

  Y0 = 5;
  Y1 = 7;
  X0 = 16;
  X1 = 24;
  plotXYloop();
  
  //plotshapeAddr = tweeter;
  //plotshapeSize = 2;
  //plotshapeColourValue1001 = 0xBF;
  //plotshapeColourValue11 = 0x00;

  //plotshapeX = 16;
  //plotshapeY = 5;
  //plotshape();

  data woofertop = {255, 213, 215, 222, 222, 250, 251, 251, 255, 87, 215, 183, 183, 175, 239, 239};
  data wooferbottom = {251, 251, 250, 222, 222, 215, 213, 255, 239, 239, 175, 183, 183, 215, 87, 255};

  plotshapeAddr = woofertop;
  plotshapeSize = 2;
  plotshapeColourValue1001 = 0xBF;
  plotshapeColourValue11 = 0x00;  
  plotshapeX = 13;

  Y0 = 11;
  Y1 = 21;
  plotYloopSkip();
  
  plotshapeX = 25;
  Y0 = 11;
  Y1 = 21;
  plotYloopSkip();
  
  plotshapeAddr = wooferbottom;
  plotshapeSize = 2;
  plotshapeColourValue1001 = 0xBF;
  plotshapeColourValue11 = 0x00;  
  plotshapeX = 13;

  Y0 = 12;
  Y1 = 21;
  plotYloopSkip();
  
  plotshapeX = 25;
  Y0 = 12;
  Y1 = 21;
  plotYloopSkip();

  // Draw the platforms
  for( uint floorL = 0; floorL < 100; floorL = floorL + 5 )
    {
      for( uint fx = (fd)[floorL]; fx < (fd)[floorL+2]; inc(fx) )
	{
	  for( uint fy = (fd)[floorL+1]; fy < (fd)[floorL+3]; inc(fy) )
	    {
	      plot( fx, fy, (fd)[floorL+4] );
	    }
	}
    }
  
  return;
}

void plotXLeft()
{
  for( uint plotXLeftIndex = 0; plotXLeftIndex < 6; inc(plotXLeftIndex) )
    {
      plotshape();
      plotshapeX = plotshapeX + 34;
      plotshape();
      plotshapeX = plotshapeX - 34;
      inc(plotshapeX);  
      inc(plotshapeY);
    }


  return;
}

void plotXRight()
{
  for( plotXLeftIndex = 0; plotXLeftIndex < 6; inc(plotXLeftIndex) )
    {
      plotshape();
      plotshapeX = plotshapeX + 34;
      plotshape();
      plotshapeX = plotshapeX - 34;

      dec(plotshapeX);  
      inc(plotshapeY);
    }


  return;
}

void plotYloop()
{
  for( plotshapeY = Y0; plotshapeY < Y1; inc(plotshapeY) )
    {
      plotshape();
    }
  return;
}

void plotXloop()
{
  for( plotshapeX = X0; plotshapeX < X1; inc(plotshapeX) )
    {
      plotshape();
    }
  return;
}

void plotYloopSkip()
{
  for( plotshapeY = Y0; plotshapeY < Y1; inc(plotshapeY) )
    {
      plotshape();
      inc(plotshapeY);
    }
  return;
}

void plotXloopSkip()
{
  for( plotshapeX = X0; plotshapeX < X1; inc(plotshapeX) )
    {
      plotshape();
      inc(plotshapeX);
    }
  return;
}

void plotXYloop()
{
  for( plotshapeY = Y0; plotshapeY < Y1; inc( plotshapeY ) )
    {
      for( plotshapeX = X0; plotshapeX < X1; inc(plotshapeX) )
	{
	  plotshape();
	}
    }
  return;
}


void plotshape()
{
  uint plotshapeBindex = 0;
  word plotshapeOffset = 0x0000;
  plotshapeOffset = plotshapeY;
  plotshapeOffset = plotshapeOffset * 40;
  plotshapeOffset = plotshapeOffset + plotshapeX;

  word plotshapeColor1 = plotshapeOffset + 0xD800;
  // these TWO addresses might change
  word plotshapeColors2And3 = plotshapeOffset + 0x4400;
  asl( plotshapeOffset );
  asl( plotshapeOffset );
  asl( plotshapeOffset );
  word plotshapePixels = plotshapeOffset + 0x6000;
  
  for( uint plotshapeJ = 0; plotshapeJ < plotshapeSize; inc(plotshapeJ) )
    {
      poke( plotshapeColor1, plotshapeColourValue11 );
      poke( plotshapeColors2And3, plotshapeColourValue1001 );
      plotshapeColor1 = plotshapeColor1 + 1;
      plotshapeColors2And3 = plotshapeColors2And3 + 1;
      for( uint plotshapeI = 0; plotshapeI < 8; inc( plotshapeI ) )
	{
	  poke( plotshapePixels, (plotshapeAddr)[plotshapeBindex] );
	  plotshapePixels = plotshapePixels + 1;
	  inc( plotshapeBindex );
	}
    }
  return;
}
