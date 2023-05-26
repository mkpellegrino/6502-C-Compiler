void main()
{
  lda( 0x00 );
  uint general8bit;

  
  // variables that WILL NEED TO get REinitialized
  // ZEROES
  uint subclock;
  uint wordSize;
  uint midjump;
  uint jerjump;
  uint subtimer;
  uint timer;
  uint lastdirectiontaken;
  uint standing;
  uint jerstanding;
  uint jerrybelow;
  uint whichtoblink;
  uint blinktoggle;
  uint shouldbeblinking;
  uint blinktimer;
  uint currentlyholding;
  uint collidedwith;
  word newX;
  uint checkNearParamY1;
  uint checkNearParamI;
 
  word score = 0x0000;
 word checkNearParamX1;
  word wordToPrint;
 
  romout(6);
  
  // INTRO SCREEN HERE!
  clearkb();

  saveregs();
  // create xy arrays
  word xarray[8];
  uint yarray[8];
  
  // save voice 3
  uint D41B = peek( 0xD418 );
  
  word clock = 420;
  //subclock = 0x00;
  
  // initialise variables
  
  //uint randomnessclock;
  //word printWordAddr;
  word jerrymoveclock;
  //uint jerrymoveclock2;
  uint plotDigitBindex;
  uint plotDigitColourValue1001;
  uint shownumParamUINT;
  
  word adr1;

  word shownumParamWORD = 0x0000;

  lda( 0x01 );
  uint jerrydirection;
  uint whichsprite;
  uint plotDigitX;
  uint plotDigitY;
  uint plotDigitColourValue11;
  
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
  //uint spriteI;

  //word delay = 0x00CC;
  //word cnX;
  word num;
  
  lda( 100 );
  uint y;
  uint jy;
  
  word x = 0x0020;
  word jx = 0x012C;
  
  word collXVar;
  uint collYVar;
  
  // restore voice 3
  poke( 0xD41B, D41B );

  // digits
  data digits =
    {
      0, 48, 204, 204, 204, 204, 204, 48,
      0, 48, 48, 48, 48, 48, 48, 48,
      0, 48, 204, 12, 48, 192, 192, 252,
      0, 48, 204, 12, 48, 12, 204, 48,
      0, 12, 204, 204, 252, 12, 12, 12,
      0, 252, 192, 240, 12, 12, 204, 48,
      0, 48, 204, 192, 240, 204, 204, 48,
      0, 252, 12, 12, 48, 48, 48, 48,
      0, 48, 204, 204, 48, 204, 204, 48,
      0, 252, 204, 204, 252, 12, 12, 12,
      // space
      0, 0, 0, 0, 0, 0, 0, 0
    };

  // letters
  data letters =
    {
      0, 48, 252, 204, 252, 204, 204, 204,
      0, 240, 204, 204, 240, 204, 204, 240,
      0, 48, 204, 192, 192, 192, 204, 48,
      0, 240, 204, 204, 204, 204, 204, 240,
      0, 252, 192, 192, 240, 192, 192, 252,

      0, 252, 192, 192, 240, 192, 192, 192,
      0, 48, 204, 204, 60, 12, 204, 48,
      0, 204, 204, 204, 252, 204, 204, 204,
      0, 252, 48, 48, 48, 48, 48, 252,
      0, 252, 12, 12, 12, 204, 204, 48,

      0, 204, 204, 204, 240, 204, 204, 204,
      0, 192, 192, 192, 192, 192, 192, 252,
      0, 204, 252, 252, 204, 204, 204, 204,
      0, 0, 0, 192, 252, 204, 204, 204,
      0, 252, 204, 204, 204, 204, 204, 252,

      0, 240, 204, 204, 240, 192, 192, 192,
      0, 48, 204, 204, 204, 204, 240, 60,
      0, 240, 204, 204, 240, 204, 204, 204,
      0, 48, 204, 192, 48, 12, 204, 48,
      0, 252, 48, 48, 48, 48, 48, 48,

      0, 204, 204, 204, 204, 204, 204, 252,
      0, 204, 204, 204, 204, 48, 48, 48,
      0, 204, 204, 204, 252, 252, 252, 204,
      0, 204, 204, 204, 48, 204, 204, 204,
      0, 204, 204, 204, 60, 12, 204, 48,
      
      0, 252, 12, 12, 48, 192, 192, 252,
      // space
      0, 0, 0, 0, 0, 0, 0, 0,
      // colon
      0, 0, 60, 60, 0, 60, 60, 0
    };

  //data zero = {'A'};
  data clockText = {'C', 'L', 'O', 'C', 'K' };
  data scoreText = {'S', 'C', 'O', 'R', 'E' };  
  data paused = {                'P', 'A', 'U', 'S', 'E', 'D' };
  data pak =    { 'P', 'R', 'E', 'S', 'S', ' ', 'A', 'N', 'Y', ' ', 'K', 'E', 'Y' };
  data spaces = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
  data hitY=    { 'H', 'I', 'T', ' ', 'Y', ' ', 'T', 'O', ' ', 'Q', 'U', 'I', 'T'} ;
  data title = { 'R', 'A', 'M', 'R', 'O', 'D' };
  data directions1 = {'U', ':', ' ', 'L', 'E', 'F', 'T', ' ', ' ', ' ', 'O', ':', ' ', 'R', 'I', 'G', 'H', 'T'};
  data directions1a= {'Q', ':', ' ', 'Q', 'U', 'I', 'T', ' ', ' ', ' ', 'W', ':', ' ', 'P', 'A', 'U', 'S', 'E'};
  data directions2 = {'I', ':', ' ', 'P', 'I', 'C', 'K', ' ', 'U', 'P', ' ', ' ', ' ', 'K', ':', ' ', 'D', 'R', 'O', 'P' };
  data directions3 = {'C', 'R', 'E', 'A', 'T', 'E', 'D', ' ', 'B', 'Y', ' ', 'M', 'I', 'C', 'H', 'A', 'E', 'L', ' ', 'P', 'E', 'L', 'L', 'E', 'G', 'R', 'I', 'N', 'O'};
  data directions5 = {'P', 'R', 'E', 'S', 'S', ' ', 'A', 'N', 'Y', ' ', 'K', 'E', 'Y', ' ', 'T', 'O', ' ', 'S', 'T', 'A', 'R', 'T' };
  data credit1 =    { 'C', 'A', 'S', 'E', 'Y', ' ', 'J', 'O', 'N', 'E', 'S', ' ', 'B', 'Y', ' ', 'T', 'H', 'E', ' ', 'G', 'R', 'A', 'T', 'E', 'F', 'U', 'L', ' ', 'D', 'E', 'A', 'D' };
  data credit2 =    { 'S', 'I', 'D', ' ', 'C', 'R', 'E', 'A', 'T', 'E', 'D', ' ', 'B', 'Y', ' ', 'I', 'V', 'A', 'N', ' ', 'K', 'O', 'H', 'L', 'E', 'R' };
  data endscreentext1 = {'G', 'A', 'M', 'E', ' ', 'O', 'V', 'E', 'R' };
  data endscreentext2 = {'P', 'R', 'E', 'S', 'S', ' ', 'Y', ' ', 'T', 'O', ' ', 'P', 'L', 'A', 'Y', ' ', 'A', 'G', 'A', 'I', 'N' };

  word plotDigitAddr = digits;

  // jump table
  data jt = { 0x00, 0xFC, 0xFC, 0xFD, 0xFD, 0xFD, 0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

  // down arrow
  //data olddownarrow = { 1, 1, 1, 21, 5, 5, 1, 1, 0, 0, 0, 80, 64, 64, 0, 0 };
  data downarrow = {169, 169, 169, 149, 165, 165, 169, 169, 170, 170, 170, 90, 106, 106, 170, 170 };

  // hotspots
  word hotspot[8];

  // used to be 0x4...
  hotspot[0] = 0x84CA;
  hotspot[1] = 0x85BA;
  hotspot[2] = 0x86AA;
  hotspot[3] = 0x84EC;
  hotspot[4] = 0x85DC;
  hotspot[5] = 0x86CC;
  hotspot[6] = 0x85F3;
  hotspot[7] = 0x870B;

  word hsX[8];
  hsX[0] = 0x0025;
  hsX[1] = 0x0025;
  hsX[2] = 0x0025;
  hsX[3] = 0x0134;
  hsX[4] = 0x0134;
  hsX[5] = 0x0134;
  hsX[6] = 0x00AA;
  hsX[7] = 0x00AA;
  uint hsY[8];
  hsY[0] = 0x55;
  hsY[1] = 0x85;
  hsY[2] = 0xB5;
  hsY[3] = 0x55;
  hsY[4] = 0x85;
  hsY[5] = 0xB5;
  hsY[6] = 0x8E;
  hsY[7] = 0xC5;

  uint hsScores[8];
  hsScores[0] = 42;
  hsScores[1] = 21;
  hsScores[2] = 7;
  hsScores[3] = 42;
  hsScores[4] = 21;
  hsScores[5] = 7;
  hsScores[6] = 84;
  hsScores[7] = 7;
  
  // background colours
  poke( 0xD020, 9 );
  poke( 0xD021, 12 );

  bank( 2 );

  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  word bmpaddr = getbmp_addr();
  word bmpaddrX = bmpaddr + 0x1FF8;
  word scraddr = getscr_addr();
  word scraddrX = scraddr + 0x03F0;
  
  clearhires();
  startScreen();

  seed();
  // pause here
  while( general8bit == 0 )
    {
      subclock=rnd(1);
      general8bit = getchar();
    }

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
  
  //mob mic2 = { 7, 13, 0, 0, 96,0, 31, 240,0, 2, 96,0, 4, 0,0, 4, 0,0, 8, 0,0, 8, 0,0, 24, 0,0, 24, 0,0, 40, 0,0, 40, 0,0, 72, 0,0, 72, 0,0, 136, 0,0, 136, 0,0, 8, 0,0, 8, 0,0, 8, 0,0, 127, 0,3, 128, 224,28, 0, 28};
    
  // multicolour sprite mode for some of the sprites  %0111 1011
  poke( 0xD01C, 0x7B );

  spriteon( 255 );
  
  // 01 = Yellow for all sprites
  poke( 0xD025, 7 );

  // 11 = black for all sprites
  poke( 0xD026, 0 );

  // set the sprites colours
  data spritecolours = { 2, 9, 0, 11, 9, 1, 2 };
  for( general8bit = 0; general8bit < 7; inc(general8bit) )
    {
      spritecolour( general8bit, (spritecolours)[general8bit] );
    }
  
  // start the music located at $1000 (4096)
  sidirq( 0x1000, 0x1003 );
  // the main loop

  uint c = getin();
  uint keepPlaying = 1;
  while( keepPlaying == 1 )
    {
      //while( c != 62 )
      ///{
	  if( clock < 0x001E )
	    {
	      poke( 0xD020, rnd(1) );
	    }
	  if( clock == 0x0000 )
	    {
	      endscreen();
	    }
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
		      // wiggle player's legs
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
		      checkI();
		      checkK();
		      checkW();
		      checkQ();
		    }
		}
	  
	      positionplayer();
	  
	      // position the equipment too
	      // (if there is any in the player's
	      // hands)
	      if( currentlyholding != 0 )
		{
		  xarray[currentlyholding] = x;
		  yarray[currentlyholding] = y;
		  spritex( currentlyholding, x );
		  spritey( currentlyholding, y );
		}

	      if( subclock == 0 )
		{
		  shownum();
		  dec(clock);
		}
	      inc(subclock);
	      // for testing only
	      subclock = subclock & 3;
	      //subclock = subclock & 0x0F;
	    }

	  inc( timer );
	  //timer = timer & 0x7F;
	  timer = timer & 0x3F;
      
	  if( shouldbeblinking == 1 )
	    {

	      if( blinktimer == 0x00 )
		{      
		  if( blinktoggle == 0 )
		    {
		      inc(blinktoggle);
		      poke( adr1, 0xCC );
		      poke( adr1+1, 0xCC );
		    }
		  else
		    {
		      dec( blinktoggle );
		      poke( adr1, 0x2C );
		      poke( adr1+1, 0x2C );
		    }
		}
	      inc( blinktimer );
	    }
      
	  c = getin();
	  //}
	  //quitscreen();
    }

  bank(0);
  romin();
  spriteoff( 255 );
  
  restoreregs();

  clearkb();

  sidoff();

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

// "returns" cnNear (uint)
void checkNear()
{
  lda( 0x00 );
  uint cnNear;
  if( checkNearParamX1 < hsX[checkNearParamI] + 0x000A )
    {
      if( checkNearParamX1 > hsX[checkNearParamI] - 0x000A )
	{
	  if( checkNearParamY1 < hsY[checkNearParamI] + 5 )
	    {
	      if( checkNearParamY1 > hsY[checkNearParamI] - 5 )
		{
		  cnNear = 0x01;
		  checkNearParamI = 8;
		}
	    }
	}
    }

  return;
}


// this is the function that
// figures out which direction
// jerry should move in
void calculateai()
{
  if( jerrymoveclock == 0x0000 )
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
      jerrymoveclock = rnd(1);
      asl( jerrymoveclock );
      
      // drop some gear
      if( gearnumber != currentlyholding )
	{
	  checkNearParamX1 = jx;
	  checkNearParamY1 = jy;

	  for( checkNearParamI = 2; checkNearParamI < 8; inc(checkNearParamI) )
	    {
	      checkNear();
	    }

	  if( cnNear == 0 )
	    {
	      spritex( gearnumber, jx );
	      spritey( gearnumber, jy );
      
	      xarray[gearnumber] = jx;
	      yarray[gearnumber] = jy;
	    }
	}
      
      inc( gearnumber );
      
      if( gearnumber == 7 )
	{
      	  gearnumber = 2;
	}
    }
  else
    {
      word newJX;
      if( jerrydirection == 1 )
	{
	  newJX = jx + 0x0001;
	  if( x != newJX )
	    {
	      jx = newJX;
	    }
	}
      else
	{
	  newJX = jx - 0x0001;
	  if( x != newJX )
	    {
	      jx = newJX;
	    }
	}

      // TODO: move jerry's legs here!
      
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

void clearhires()
{
  screen(0);
  // this is for the single colour (11) -- this is ALWAYS at 0xD800 - 0x3FF
  for( word mem1 = 0xD800; mem1 < 0xDBFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }  
  for( mem1 = scraddr; mem1 < scraddrX; mem1 = mem1 + 1 )
    {
      poke( mem1, 0x26 );
    }

  for( mem1 = bmpaddr; mem1 < bmpaddrX; mem1 = mem1 + 1 )
    {
      poke( mem1, 0x00 );
    }
  screen(1);
  return;
}

void checkW()
{
  if( c == 9 )
    {
      pausescreen();
      clearkb();
    }
  return;
}

void checkQ()
{
  if( c == 62 )
    {
      quitscreen();
    }
  return;
}

void checkI()
{
  // Pick up a piece of equipment
  if( c == 33 )
    {
      if( currentlyholding == 0 )
	{
	  uint sc = 1 & spritecollision();
	  //sc = sc & 1;
	  if( sc != 0 )
	    {
	      checkCollision();
	      currentlyholding = collidedwith;
	      if( currentlyholding != 0 )
		{
		  //inc(whichtoblink);
		  //whichtoblink = whichtoblink & 0x07;
		  whichtoblink = 0x07 & rnd(1);
		  adr1 = hotspot[whichtoblink];
		  shouldbeblinking = 1;
		  allArrowsOff();
		}
	    }
	}
    }
  return;
}


void checkK()
{
  // Drop a piece of equipment
  if( c == 37 )
    {

      if( currentlyholding != 0 )
	{
	  checkNearParamX1 = x;
	  checkNearParamY1 = y;
	  checkNearParamI = whichtoblink;
	  checkNear();

	  if( cnNear == 0x01 )
	    {
	      score = score + hsScores[whichtoblink];
	      clock = clock + 42;
	      // update score vvv
	      // erase old score
	      plotDigitY = 1;



	      for( general8bit = 11; general8bit < 15; inc( general8bit ) )
		{
		  plotDigitX = general8bit;
		  plotDigitBindex = 0x50;
		  plotDigit();
		}
	      // update score vvv
	      num = score;
	      plotDigitX = 0x0F;
	      plotDigitY = 0x01;
	      plotNumber();
	      // update score ^^^
	      
	      currentlyholding = 0;
	      shouldbeblinking = 0;
	      allArrowsOff();
	    }
	}
    }
  return;
}

void plotNumber()
{
  if( num == 0x0000 )
    {
      //wordToPrint = zero;
      //wordSize = 1;
      //plotDigitX = 23;
      //plotDigitY = 0;
      printWord();

      plotDigitBindex = 0;
      plotDigit();
      //plotDigitBindex = asl(asl(asl(peek(0x02))));
      //plotDigit();
      //dec(plotDigitX);
    }
  else
    {
      while( num > 0x0000 )
	{
	  num = num / 0x0A;
	  plotDigitBindex = asl(asl(asl(peek(0x02))));
	  plotDigit();
	  dec(plotDigitX);
	}
    }
  return;
}

void shownum()
{
  // erase xy
  //plotDigitX = 30;
  plotDigitY = 1;

  for( general8bit = 26; general8bit > 23; dec( general8bit ) )
    {
      plotDigitX = general8bit;
      plotDigitBindex = 0x50;
      plotDigit();
    }


  
  num = clock;
  plotDigitX = 26;
  plotNumber();
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
	  newX = x - 1;
	  if( jx != newX )
	    {
	      x = newX;
	      moveLegs();
	    }
	  else
	    {
	      if( jy != y )
		{
		  x = newX;
		  moveLegs();
		}

	    }
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
	  newX = x + 1;
	  if( jx != newX)
	    {
	      x = newX;
	      moveLegs();
	    }
	  else
	    {
	      if( jy != y )
		{
		  x = newX;
		  moveLegs();
		}
	    }
	}
    }
  return;
}

void checkJump()
{
  // space bar
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
  
  if( subtimer == 5 )
    {
      // this is for sprite number 1
      poke( 0x87F8, whichsprite );

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
  standing = getxy( lsr(x - 12), y - 29);
  if( standing != 0xFF )
    {
      standing = 0;
    }
  jerstanding = getxy( lsr(jx - 12), jy - 29 );
  if( jerstanding != 0xFF )
    {
      jerstanding = 0;
    }
  return;
}

void checkIfBelow()
{
  word myX = lsr(jx - 12);
  uint myY = jy - 49;
  //lsr( myX );
  word myXp = myX + 8;
  word myXm = myX - 8;
  jerrybelow = getxy( myX, myY);
  jerrybelow = jerrybelow | getxy( myXp, myY );
  jerrybelow = jerrybelow | getxy( myXm, myY );
  inc(myY);
  jerrybelow = jerrybelow | getxy( myXp, myY);
  jerrybelow = jerrybelow | getxy( myXm, myY);
  dec(myY);
  dec(myY);
  jerrybelow = jerrybelow | getxy( myXp, myY);
  jerrybelow = jerrybelow | getxy( myXm, myY);
  //jerrybelow = getxy( myX, myY );
  //jerrybelow = jerrybelow | getxy( myXp, myY );
  //jerrybelow = jerrybelow | getxy( myXm, myY );

  //jerrybelow =  getxy( myX, myY ) |  getxy( myXp, myY + 1 ) |   getxy( myXm, myY + 1) | getxy( myXp, myY - 1 ) |   getxy( myXm, myY - 1) | getxy( myXp, myY) |   getxy( myXm, myY);
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

void createplatforms()
{
  screen(0);
  
  // Draw the "X"'s on the Scaffolding
  data scafX =  {192, 192, 48, 48, 12, 12, 3, 3};
  data scafX2 = {3, 3, 12, 12, 48, 48, 192, 192};

  plotshapeAddr = scafX;
  plotshapeSize = 1;
  plotshapeColourValue1001 = 0x00;
  plotshapeColourValue11 = 0x00;  

  plotshapeY = 1;
  for(  uint cpI = 0; cpI < 4; inc( cpI ))
    {
      plotshapeX = 0;

      // replace with the code of the function to save a few bytes
      for(  general8bit = 0; general8bit < 6; inc(general8bit) )
	{
	  plotshape();
	  plotshapeX = plotshapeX + 34;
	  plotshape();
	  plotshapeX = plotshapeX - 34;
	  inc(plotshapeX);  
	  inc(plotshapeY);
	}

    }

  plotshapeAddr = scafX2;
  plotshapeY = 1;
  for( cpI = 0; cpI < 4; inc( cpI ))
    {
      plotshapeX = 5;

      //replace with the code of the function to save a few bytes
      for( general8bit = 0; general8bit < 6; inc(general8bit) )
	{
	  plotshape();
	  plotshapeX = plotshapeX + 34;
	  plotshape();
	  plotshapeX = plotshapeX - 34;
	  dec(plotshapeX);  
	  inc(plotshapeY);
	}
    }

  data tweeter =
    {
      85, 125, 235, 125, 85, 215, 190, 215
    };

  plotshapeAddr = tweeter;

  // Light Grey and Grey
  plotshapeColourValue1001 = 0xFB;
  // Black
  plotshapeColourValue11 = 0x00;

  Y0 = 5;
  Y1 = 7;
  X0 = 16;
  X1 = 24;

  // replace with the code of the function to save a few bytes
  plotXYloop();

  data fd =
    {
      // Bottom
      0, 190, 160, 200, 3,

      // Left Wall
      0, 0, 1, 200, 3,

      // Right Wall
      159, 0, 160, 200, 3, 

      // Stage
      24, 168, 136, 169, 3,
      
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
      72, 113, 88, 114, 3,
      
      // speaker platform 1
      28, 128, 60, 129, 3,
      28, 80, 52, 81, 3,

      // speaker platform 2
      108, 80, 112, 81, 3,
      124, 80, 132, 81, 3,
      100, 128, 132, 129, 3
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

  inc( plotshapeY );
  //plotshapeY = 1;
  plotshapeAddr = steal3;
  plotshape();
  
  inc( plotshapeY );
  //plotshapeY = 2;
  plotshapeAddr = steal5;
  plotshape();

  inc( plotshapeY );
  //plotshapeY = 3;
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
  	}
      inc(plotshapeX);
    }
  
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
  //plotshapeSize = 2;
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

  plotshapeAddr = downarrow;
  //plotshapeSize = 2;
  plotshapeColourValue1001 = 0x2C;
  plotshapeColourValue11 = 0x0C;
  
  for( general8bit = 5; general8bit < 18; general8bit = general8bit + 6 )
    {
      plotshapeX = 36;
      plotshapeY = general8bit;
      plotshape();
      plotshapeX = 2;
      plotshape();
    }

  plotshapeX = 19;
  plotshapeY = 12;
  plotshape();
    
  // Draw the platforms - the 105 is the number of values in fd
  for(  general8bit = 0; general8bit < 130; general8bit = general8bit + 5 )
    {
      for( uint fx = (fd)[general8bit]; fx < (fd)[general8bit+2]; inc(fx) )
	{
	  for( uint fy = (fd)[general8bit+1]; fy < (fd)[general8bit+3]; inc(fy) )
	    {
	      plot( fx, fy, (fd)[general8bit+4] );
	    }
	}
    }

  plotshapeY = 19;
  plotshapeColourValue1001 = 0x26;
  plotshape();

  allArrowsOff();

  //word printWordAddr = gameover;
  wordToPrint = clockText;
  wordSize = 5;
  plotDigitX = 23;
  plotDigitY = 0;
  printWord();

  //wordSize = 5;
  wordToPrint = scoreText;
  plotDigitX = 12;
  plotDigitY = 0;
  printWord();


  // put a zero for score
  plotDigitY = 1;
  plotDigitX = 15;
  plotDigitBindex = 0x00;
  plotDigitAddr=digits;
  plotDigit();

  screen(1);
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

void plotYloopSkip()
{
  for( plotshapeY = Y0; plotshapeY < Y1; inc(plotshapeY) )
    {
      plotshape();
      inc(plotshapeY);
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
  word plotshapeOffset = plotshapeX + plotshapeY * 40;
  word plotshapeColor1 = plotshapeOffset + 0xD800;
  //word plotshapeColors2And3 = plotshapeOffset + 0x8400;
  word plotshapeColors2And3 = plotshapeOffset + scraddr;
  asl( plotshapeOffset );
  asl( plotshapeOffset );
  asl( plotshapeOffset );
  //word plotshapePixels = plotshapeOffset + 0xA000;
  word plotshapePixels = plotshapeOffset + bmpaddr;
  
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
  collidedwith = 0;

  for( uint ccI = 2; ccI < 8; inc( ccI ) )
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

      if( collXVar < 0x0015 )
	{
	  if( collYVar < 0x15 )
	    {
	      collidedwith = ccI;
	      ccI = 8;	      
	    }
	}
    }
  return;
}

void plotDigit()
{
  word plotDigitOffset = plotDigitX + plotDigitY * 40;
  word plotDigitColor1 = plotDigitOffset + 0xD800;
  //word plotDigitColors2And3 = plotDigitOffset + 0x8400;
  word plotDigitColors2And3 = plotDigitOffset + scraddr;
  poke( plotDigitColor1, 1 );
  poke( plotDigitColors2And3, 0 );

  //word plotDigitPixels = asl(asl(asl(plotDigitOffset))) + 0xA000;
  word plotDigitPixels = asl(asl(asl(plotDigitOffset))) + bmpaddr;

  for( uint plotDigitI = 0; plotDigitI < 8; inc( plotDigitI ) )
    {
      poke( plotDigitPixels, (plotDigitAddr)[plotDigitBindex] );
      plotDigitPixels = plotDigitPixels + 1;
      inc( plotDigitBindex );
    }
  return;
}

void allArrowsOff()
{
  for(  general8bit = 0; general8bit < 8; inc( general8bit ))
    {
      poke( hotspot[general8bit], 0xCC );
      poke( hotspot[general8bit]+1, 0xCC );
    }
  return;
}


void printWord()
{
  //param printWordAddr
  
  //word printWordAddr = letters;
  plotDigitAddr= letters;
  //uint printWordI = 0x00;
  //plotDigitBindex = 0x00;
  
  //while ( (printWordAddr)[printWordI] != 0x00 )
  for( uint printWordI = 0x00; printWordI < wordSize; inc(printWordI) )
    {
      uint currentChar = (wordToPrint)[printWordI];
      if( currentChar == 58 )
	{
	  currentChar = 27;
	}
      else
	{
	  if( currentChar == 32 )
	    {
	      currentChar = 26;
	    }
	  else
	    {
	      currentChar = currentChar - 65;
	    }
	}
      plotDigitBindex = asl(asl(asl(currentChar)));
      plotDigit();
      
      inc(plotDigitX);
    }
  plotDigitAddr= digits;
  
  
  return;

}

void startScreen()
{
  
  wordToPrint = title;
  wordSize = 6;
  plotDigitX = 16;
  plotDigitY = 5;
  printWord();

  wordToPrint = directions1;
  wordSize = 18;
  plotDigitX = 11;
  plotDigitY = 9;
  printWord();
  
  wordToPrint = directions2;
  wordSize = 20;
  plotDigitX = 10;
  plotDigitY = 10;
  printWord();

  wordToPrint = directions1a;
  wordSize = 18;
  plotDigitX = 11;
  plotDigitY = 11;
  printWord();

  
  wordToPrint = directions3;
  wordSize = 29;
  plotDigitX = 3;
  plotDigitY = 13;
  printWord();

  num = 2023;
  plotDigitX = 36;
  plotDigitY = 13;
  plotNumber();

  wordToPrint = credit1;
  wordSize = 32;
  plotDigitX = 4;
  plotDigitY = 16;
  printWord();

  wordToPrint = credit2;
  wordSize = 26;
  plotDigitX = 7;
  plotDigitY = 17;
  printWord();
  
  wordToPrint = directions5;
  wordSize = 22;
  plotDigitX = 9;
  plotDigitY = 20;
  printWord();

  
  return;
}


void pausescreen()
{
  wordToPrint = paused;
  wordSize = 6;
  plotDigitX = 17;
  plotDigitY = 9;
  printWord();


  wordToPrint = pak;
  wordSize = 13;
  plotDigitX = 13;
  inc(plotDigitY);
  printWord();

  pause();

  wordToPrint = spaces;
  wordSize = 13;
  plotDigitX = 13;
  plotDigitY = 9;
  printWord();

  plotDigitX = 13;
  inc( plotDigitY );
  printWord();

  return;
}

void endscreen()
{

  spriteoff( 255 );
  
  clearhires();
  
  wordToPrint = endscreentext1;
  wordSize = 9;
  plotDigitX = 16;
  plotDigitY = 10;
  printWord();

  wordToPrint = scoreText;
  wordSize = 5;
  plotDigitX = 16;
  plotDigitY = 12;
  printWord();



  num = score;
  plotDigitX = 25;
  plotDigitY = 12;
  plotDigitAddr=digits;

  plotNumber();

  
  wordToPrint = endscreentext2;
  wordSize = 21;
  plotDigitX = 5;
  plotDigitY = 14;
  printWord();

  
  clearkb();
  uint esq = getchar();
  
  while( esq == 0 )
    {
      esq = getchar();
    }


  if( esq == 'Y' )
    {
      clearhires();
      // reinit everything

      y=100;
      jy=100;

  
      x = 0x0020;
      jx = 0x012C;

      spritex( 0, x );
      spritex( 1, jx );
      spritey( 0, y );
      spritey( 1, jy );
      
      for( general8bit=2; general8bit < 8; inc( general8bit ) )
	{
	  word tmpWord = 340;
	  spritex( general8bit, tmpWord );
	  spritey( general8bit, 0 );
	}

      
      for( general8bit=0; general8bit < 24; inc( general8bit ) )
      	{
      	  subclock[general8bit] = 0;
      	}

      clock = 420;
      spriteon( 255 );
      createplatforms();
    }
  else
    {
      keepPlaying = 0;
    }

  
  return;
}

void quitscreen()
{
  wordToPrint = hitY;
  wordSize = 13;
  plotDigitX = 13;
  plotDigitY = 9;
  printWord();
  clearkb();
  uint qsq = getchar();
  while( qsq == 0 )
    {
      qsq = getchar();
    }
  if( qsq == 'Y' )
    {
      keepPlaying = 0;
    }
  plotDigitX = 13;
  wordToPrint = spaces;
  printWord();
  return;
}
