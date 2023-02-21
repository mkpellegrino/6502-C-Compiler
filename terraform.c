void main()
{
  //cls();
  //printf( "O  :  MOVE RIGHT\nU  :  MOVE LEFT\nSPACE  :  JUMP" );
  //pause();

  word xarray[8];
  uint yarray[8];
  uint rands[32];
  
  // save voice 3
  uint D41B = peek( 0xD418 );
  lda( 0 );
  uint randomnessclock;
  uint jerrymoveclock;
  uint midjump;
  uint jerjump;
  uint subtimer;
  uint timer;

  uint lastdirectiontaken;
  uint standing;
  uint jerstanding;

  uint jerrybelow;
  uint jerrybelow2;

  lda( 0x01 );
  uint jerrydirection;
  uint whichsprite;

  lda( 0x02 );
  uint gearnumber;
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
  uint spriteI;


  word delay = 0x00CC;
  word x = 0x0020;
  lda( 100 );
  uint y;
  uint jy;
  word jx = 0x012C;

  word collXVar;
  uint collYVar;


  rands[0] = rnd(1);
  shortcls();
  printf( "\n\n\n\n\n          PRESS ANY KEY TO PLAY" );
  pause();
  for( uint randI = 0; randI < 32; inc( randI ))
    {
      rands[randI] = rnd(1);
    }
    
  // restore voice 3
  poke( 0xD41B, D41B );
  
  romout();
  saveregs();

  
  // jump table
  data jt = { 0x00, 0xFC, 0xFC, 0xFD, 0xFD, 0xFD, 0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
   
  // background colours
  poke( 0xD020, 9 );
  poke( 0xD021, 12 );

  bank( 1 );


  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  clearhires();
  createplatforms();

  mob twr1 = { 0, 1, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 195, 0, 3, 3, 0, 12, 3, 48, 48, 0, 192, 12, 0, 192};
  mob twr2 = { 0, 2, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 3, 12, 0, 3, 12, 0, 3, 207, 0};
  mob twr3 = { 0, 3, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 252, 0, 0, 252, 0, 0, 252, 0, 0, 204, 0, 3, 12, 0, 3, 207, 0};
  mob twr4 = { 0, 4, 0, 168, 0, 2, 170, 0, 3, 213, 0, 3, 213, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 3, 12, 0, 3, 12, 0, 3, 207, 0};

  mob Jerry1 = { 1, 5, 0, 255, 0, 3, 255, 192, 15, 247, 240, 15, 213, 240, 15, 85, 112, 13, 255, 240, 13, 247, 240, 15, 85, 112, 3, 255, 195, 0, 255, 11, 0, 170, 58, 2, 186, 250, 10, 159, 232, 41, 87, 160, 233, 87, 128, 218, 94, 128, 214, 122, 128, 53, 122, 128, 15, 226, 128, 2, 162, 160, 10, 162, 168};
  
  //mob twl1 = { 0, 6, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 0, 204, 0, 0, 195, 0, 3, 207, 0};
  //mob twl2 = { 0, 7, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 0, 195, 0, 0, 195, 0, 3, 207, 0};
  //mob twl3 = { 0, 8, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 252, 0, 0, 252, 0, 0, 252, 0, 0, 204, 0, 0, 195, 0, 3, 207, 0};
  //mob twl4 = { 0, 7, 0, 168, 0, 2, 170, 0, 1, 95, 0, 1, 95, 0, 0, 252, 0, 0, 32, 0, 0, 168, 0, 2, 34, 0, 2, 34, 0, 8, 32, 128, 8, 32, 128, 16, 48, 16, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 204, 0, 0, 204, 0, 0, 195, 0, 0, 195, 0, 3, 207, 0};


  // these are the gear items bandmembers can drop
  mob mic1 = { 2, 8, 0, 0, 96,0, 31, 240,0, 2, 96,0, 4, 0,0, 4, 0,0, 8, 0,0, 8, 0,0, 24, 0,0, 24, 0,0, 40, 0,0, 40, 0,0, 72, 0,0, 72, 0,0, 136, 0,0, 136, 0,0, 8, 0,0, 8, 0,0, 8, 0,0, 127, 0,3, 128, 224,28, 0, 28};

  mob amplifier = { 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 0, 63, 255, 252, 234, 170, 171, 234, 171, 251, 234, 170, 171, 234, 170, 171, 234, 170, 171, 234, 170, 171, 234, 170, 171, 234, 170, 171, 234, 170, 171, 255, 255, 255};

  mob acousticguitar = { 4, 10, 0, 252, 0, 0, 252, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 3, 255, 0, 14, 170, 192, 14, 170, 192, 14, 170, 192, 3, 171, 0, 14, 186, 192, 58, 254, 176, 58, 254, 176, 58, 186, 176, 58, 170, 176, 14, 254, 192, 14, 170, 192, 3, 171, 0, 0, 252, 0};


  mob drums = { 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 3, 255, 85, 67, 171, 12, 3, 171, 15, 195, 255, 58, 176, 48, 234, 172, 48, 234, 172, 48, 234, 172, 48, 234, 172, 48, 234, 172, 48, 58, 176, 48, 207, 204, 252};
  mob electricguitar = { 6, 12, 0, 192, 0, 0, 240, 0, 0, 240, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 0, 48, 0, 3, 48, 0, 14, 240, 192, 14, 243, 192, 14, 190, 192, 3, 170, 192, 3, 155, 0, 3, 171, 0, 14, 171, 0, 14, 154, 192, 14, 170, 192, 14, 254, 192, 3, 170, 192, 0, 255, 0};
  mob mic2 = { 7, 13, 0, 0, 96,0, 31, 240,0, 2, 96,0, 4, 0,0, 4, 0,0, 8, 0,0, 8, 0,0, 24, 0,0, 24, 0,0, 40, 0,0, 40, 0,0, 72, 0,0, 72, 0,0, 136, 0,0, 136, 0,0, 8, 0,0, 8, 0,0, 8, 0,0, 127, 0,3, 128, 224,28, 0, 28};
  
  spritex( 0, x );
  spritey( 0, y );

  // Jerry
  spritexy( 2, 160, 190 );

  //                                           Colours
  // 0 - Black    1 - White     2 - Red     3 - Cyan    4 - Purple      5 - Green  6 - Dark Blue
  // 7 - Yellow   8 - Orange    9 - Brown   A - Pink    B - Dark Grey   C - Grey   D - Bright Green
  //                          E - Light Blue                F - Light Grey
  
  // multicolour sprite mode for some of the sprites  %01111011
  poke( 0xD01C, 0x7B );

  // turns on all sprites
  spriteon( 255 );
  
  // 01 = Yellow for all sprites
  poke( 0xD025, 7 );

  // 11 = black for all sprites
  poke( 0xD026, 0 );
  
  // Colour Bit-pair: 10
  // Jerry
  spritecolour( 0, 2 );
  // Roadie
  spritecolour( 1, 9 );
  // Microphone 1 (mono Black)
  spritecolour( 2, 0 );
  // Amplifier (Dark Grey)
  spritecolour( 3, 11 );
  // Acoustic Guitar (brown)
  spritecolour( 4, 9);
  // Drums (white)
  spritecolour( 5, 1 );
  // Electric Guitar (red)
  spritecolour( 6, 2 );
  // Microphone 2 (mono Black)
  spritecolour( 7, 0 );

  // start the music located at $1000 (4096)
  sidirq( 0x1000, 0x1003 );
  // the main loop
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
	      if( jerstanding == 0 )
		{
		  inc(jy);
		  if( jy > 219 )
		    {
		      jy = 219;
		    }
		}
	      else
		{
		  checkIfBelow();
		  calculateai();
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
		  if( y > 219 )
		    {
		      y = 219;
		    }
		  
		  // wiggle legs
		  moveLegs();
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
      if( timer > 200 )
	{
	  timer = 0;
	}
      c = getin();
    }

  clearkb();
  restoreregs();
  bank(0);
  romin();
  return;
}

// this is the function that
// figures out which direction
// jerry should move in
void calculateai()
{
  if( jerrymoveclock == 0 )
    {
      jerjump = 1;
      if( jerrydirection == 1 )
	{
	  jerrydirection = 0xFF;
	}
      else
	{
	  jerrydirection = 1;
	}
      jerrymoveclock = rands[randomnessclock];
      inc( randomnessclock );
      randomnessclock = randomnessclock & 63;
      
      // drop some gear
      spritex( gearnumber, jx );
      spritey( gearnumber, jy );
      xarray[gearnumber] = jx;
      yarray[gearnumber] = jy;

      inc( gearnumber );
      if( gearnumber == 8 )
	{
	  gearnumber = 0;
	}
    }
  else
    {
      if( jerrydirection == 1 )
	{
	  jx = jx + 1;
	}
      else
	{
	  jx = jx - 1;
	}
      
      if( jx < 0x0017 )
	{
	  jerrydirection = 1;
	  jx = 0x0017;
	}
      if( jx > 320 )
	{
	  jerrydirection = 0xFF;
	  jx = 320;
	}
      dec( jerrymoveclock );
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
  uint sc = spritecollision();
  sc = sc & 1;
  if( sc != 0 )
  {
    checkCollision();
  }
  return;
}

void collisiondetected()
{
  for( uint cdi = 0; cdi < 8; inc( cdi ) )
    {
      word cd1 = x & 0xEFFF;
      cd1 = cd1 - xarray[cdi];
      uint cd2 = y - yarray[cdi];
      cd2 = cd2 & 0xEF;
      if( cd1 < 0x000A )
	{
	  poke( 0x6041, 0xFF );
	  if( cd2 < 10 )
	    {
	      poke( 0x6040, 0xFF );
	      
	    }
	  else
	    {
	      poke( 0x6040, 0x00 );
	    }
	}
      else
	{
	  poke( 0x6041, 0x00 );
	}
    }
  

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
  for( mem1 = 0x4400; mem1 < 0x47F0; mem1 = mem1 + 1 )
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

  //subtimer = subtimer & 0x0A;
  
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
  poke( 0x601A, standing );
  //standing = standing & 0x3C;
  //if( standing != 20 )
  if( standing != 0xFF )
    {
      standing = 0;
    }
  myX = jx - 12;
  myY = jy - 29;
  lsr( myX );
  jerstanding = getxy( myX, myY );
  //jerstanding = jerstanding & 0x3C;
  poke( 0x600A, jerstanding );
  if( jerstanding != 0xFF )
    {
      jerstanding = 0;
    }
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
  if( jerrydirection == 0xFF )
    {
      if( jx > 0x0017 )
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
      if( jx < 320 )
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
  plotshapeColourValue1001 = 0x00;
  plotshapeColourValue11 = 0x00;  

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
      0, 190, 160, 200, 3,

      // Left Wall
      0, 0, 1, 200, 3,

      // Right Wall
      159, 0, 160, 200, 3, 

      // Stage
      //24, 168, 136, 200, 1,
      24, 168, 136, 169, 3,
      //24, 169, 136, 190, 2,
      
      // Left Scaffolding Platforms
      0, 8, 24, 9, 3,
      0, 56, 24, 57, 3,
      0, 104, 24, 105, 3,
      0, 152, 24, 153, 3,
      24, 8, 25, 200, 3,

      // Right Scaffolding Platforms
      136, 8, 160, 9, 3,
      136, 56, 160, 57, 3,
      136, 104, 160, 105, 3,
      136, 152, 160, 153, 3,
      136, 8, 137, 200, 3,

      // casing and hangers for hanging speakers
      68, 0, 69, 40, 3,
      91, 0, 92, 40, 3,
      64, 40, 96, 41, 3,
      64, 40, 65, 72, 3,
      95, 40, 96, 72, 3,

      // center console
      72, 112, 88, 168, 2,
      72, 113, 88, 114, 3,
      // speaker platform 1
      28, 128, 60, 129, 3,
      28, 152, 60, 153, 3,
      28, 80, 52, 81, 3
      //0, 165, 160, 167, 3,
      //0, 165, 160, 167, 3,


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
  // Blue and Red
  plotshapeColourValue1001 = 0x62;
  // White
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
  // Grey and Light Grey
  plotshapeColourValue1001 = 0xBF;
  // Black?
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
	  //nop();
  	}
    inc(plotshapeX);
  }

  data tweeter =
    {
      85, 125, 235, 125, 85, 215, 190, 215
    };

  plotshapeAddr = tweeter;
  plotshapeSize = 1;

  // Light Grey and Grey
  plotshapeColourValue1001 = 0xFB;
  // Black
  plotshapeColourValue11 = 0x00;

  Y0 = 5;
  Y1 = 7;
  X0 = 16;
  X1 = 24;
  plotXYloop();
  
  data woofertop = {255, 213, 215, 222, 222, 250, 251, 251, 255, 87, 215, 183, 183, 175, 239, 239};
  data wooferbottom = {251, 251, 250, 222, 222, 215, 213, 255, 239, 239, 175, 183, 183, 215, 87, 255};

  plotshapeAddr = woofertop;
  plotshapeSize = 2;
  // Grey and Light Grey
  plotshapeColourValue1001 = 0xBF;
  // Black
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
  // Grey and Light Grey
  plotshapeColourValue1001 = 0xBF;
  // Black
  plotshapeColourValue11 = 0x00;  
  plotshapeX = 13;

  Y0 = 12;
  Y1 = 21;
  plotYloopSkip();
  
  plotshapeX = 25;
  Y0 = 12;
  Y1 = 21;
  plotYloopSkip();

  // Draw the platforms - the 105 is the number of values in fd
  for( uint floorL = 0; floorL < 130; floorL = floorL + 5 )
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

void checkCollision()
{
  for( uint ccI = 0; ccI < 8; inc( ccI ) )
    {
      collXVar = x - xarray[ccI];
      collYVar = y - yarray[ccI];
      
      if( collXVar > 320 )
      	{
      	  collXVar = xarray[ccI] - x;
      	}
      
      if( collYVar > 200 )
	{
	  collYVar = yarray[ccI] - y;
	}
      // for now... just increment the border colour
      if( collXVar < 0x0015 )
	{
	  if( collYVar < 0x15 )
	    {
	      inc( 0xD020 );
	    }
	}
    }
  return;
}
