needs("mcplot");
needs("mul16");
needs("div16");
void main()
{
  uint JSportA = NULL;
  uint JSbtnPressA = NULL;
  uint JSnorth = NULL;
  uint JSsouth = NULL;
  uint JSwest = NULL;
  uint JSeast = NULL;
  word clock = NULL;
  word playerx = 80;
  uint playery = 100;
  uint thrust = 0x00;
  uint rtn8bit = NULL;

  word direction = NULL;

  uint playerOnFloor = NULL;
  uint toTheRight = NULL;
  uint toTheLeft = NULL;
  uint onFloorRET;
  word xtocheck;
  uint ytocheck;
  uint byte0;
  uint byte1;
  uint byte2;

  asmcomment( "LETTER/DIGIT DEFINITIONS" );
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
      0, 48, 204, 192, 252, 204, 204, 48,
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
      0, 0, 0, 60, 0, 60, 0, 0,
      // period
      0,0,0,0,0,0,192,192,
      // (
      12, 48, 48, 48, 48, 48, 48, 12, 
      // )
      192, 48, 48, 48, 48, 48, 48, 192,
      // ,
      0, 0, 0, 0, 0, 0, 48, 192
    };

  data zeroText = {'0'};


  word plotDigitAddr = digits;
  word wordToPrint;
  word plotNum;
  word general16bit;
  
  uint plotDigitBindex;
  uint plotDigitX;
  uint plotDigitY;
  uint wordSize;
  uint general8bit;
  // Blue and Red
  uint plotshapeColourValue0110;
  // White
  uint plotshapeColourValue11;

  uint textColour;
  inc( textColour );


  data spritedata = { 0x00, 0x3C, 0x00,0x01, 0xC3, 0x80,0x06, 0x00, 0x60,0x08, 0x00, 0x10,0x10, 0x00, 0x08,0x10, 0x00, 0x08,0x20, 0x00, 0x04,0x20, 0x00, 0x04,0x20, 0x00, 0x04,0x40, 0x00, 0x02,0x40, 0x00, 0x02,0x40, 0x00, 0x02,0x20, 0x00, 0x04,0x20, 0x00, 0x04,0x20, 0x00, 0x04,0x10, 0x00, 0x08,0x10, 0x00, 0x08,0x08, 0x00, 0x10,0x06, 0x00, 0x60,0x01, 0xC3, 0x80,0x00, 0x3C, 0x00, 0x00 };
  
  saveregs();
  bank( 2 );

  poke( 0xD018, 0x18 );
  setScreenMode(3);
  
  romout(6);
    
  word bmpaddr = getbmp_addr();
  word bmpaddrX = bmpaddr + 0x1FF8;
  word scraddr = getscr_addr();
  word scraddrX = scraddr + 0x03EF;

  fillmem( 0xA0, 0x00, 0x20 );

  asmcomment( "all sprites mono" );
  poke( 0xD01C, 0x00 );

  asmcomment( "universal sprite colours" );
  //poke( 0xD025, 0x00 );
  //poke( 0xD026, 0x01 );

  word saddr = 0x8800;
  for( uint i = 0x00; i<0x40; inc(i) )
    {
      poke( saddr, peek( spritedata+i) );
      inc( saddr );
    }

  word sprptr0 = scraddr + 0x03F8;
  poke( sprptr0, 0x20 );
  
  spritecolour( 0x00, 0x01 );
  spritexy( 0x00, playerx, playery );
  spriteset( 0x01 );


  line( 30, 60, 100, 50 );
  line( 1, 90, 130, 100 );
  line( 30, 120, 160, 130 );
  line( 1, 180, 130, 170 );
  line( 1, 200, 150, 200 );
  
  uint keepPlaying = 0x00;
  uint c = getin();
  while( keepPlaying != 0x01 )
    {
      getJS();
      playerOnFloor = onFloor();
      toTheRight = whatsToTheRight();
      toTheLeft = whatsToTheLeft();
      if( c == 60 )
	{
	  JSbtnPressA = 0x00;
	}
      if( c == 33 )
	{
	  // UP
	  JSnorth = 0x00;
	}
      if( c == 37 )
	{
	  // DOWN
	  JSsouth = 0x00;
	}
      if( c == 30 )
	{
	  // LEFT
	  JSwest = 0x00;
	}
      if( c == 38 )
	{
	  // RIGHT
	  JSeast = 0x00;
	}	  
      if( JSbtnPressA == 0x00 )
	{
	  keepPlaying = 0x01;
	}

      if( JSsouth == 0x00 && playerOnFloor == 0x00 )
	{
	  inc(playery);
	}
      if( JSnorth == 0x00 && playery > 0x32 )
	{
	  inc( thrust );
	  inc( thrust );
	  if( thrust > 0x03 )
	    {
	      thrust = 0x03;
	    }
	}
      if( JSeast == 0x00 && playerx < 0x0140)
	{
	  if( toTheRight == 0x01 )
	    {
	      playery = playery - 0x01;
	    }
	  if( toTheRight != 0xFF )
	    {
	      direction = 0x0001;
	      playerx = playerx + 0x0001;
	    }
	}
      if( JSwest == 0x00 && playerx > 0x0018 )
	{
	  if( toTheLeft == 0x01 )
	    {
	      playery = playery - 0x01;
	    }
	  if( toTheLeft != 0xFF )
	    {
	      direction = 0xFFFF;
	      playerx = playerx - 0x0001;
	    }
	}

      // gravity
      if( playerOnFloor == 0x00 )
	{
	  inc( playery );
	}

      
      if( thrust != 0x00 )
	{
	  playery = playery - thrust;
	  dec( thrust );
	}
      spritexy( 0x00, playerx, playery );	    
      c = getin();	    
    }
  
  clearkb();

  //segment( 0x10, 0x10, 0x20, 0x20, 0x03 );

  romin();

  bank(0);
  restoreregs();
  
  return;
}

uint whatsToTheRight()
{
  rtn8bit = 0x00;
  xtocheck = playerx - 0x0004;
  ytocheck = playery - 0x1E;
  
  byte0 = peek(getpixel( xtocheck, ytocheck  ));
  byte1 = peek(getpixel( xtocheck, ytocheck - 0x01  ));

  if( byte0 != 0x00 || byte1 != 0x00 )
    {
      if( byte1 == 0x00 )
	{
	  // player can climb
	  inc( rtn8bit );
	  //rtn8bit = 0x01;
	}
      else
	{
	  // wall is to the right
	  dec( rtn8bit );
	  //rtn8bit = 0xFF;
	}
    }
  return rtn8bit;
}

uint whatsToTheLeft()
{
  rtn8bit = 0x00;
  xtocheck = playerx - 0x000C;
  ytocheck = playery - 0x1E;
  
  byte0 = peek(getpixel( xtocheck, ytocheck  ));
  byte1 = peek(getpixel( xtocheck, ytocheck - 0x01  ));

  if( byte0 != 0x00 || byte1 != 0x00 )
    {
      if( byte1 == 0x00 )
	{
	  // player can climb
	  inc( rtn8bit );
	}
      else
	{
	  // wall is to the right
	  dec( rtn8bit );
	}
    }
  return rtn8bit;
}

uint onFloor()
{
  word RIGHT = getpixel( playerx - 0x0004, playery  - 0x1D );
  byte0 = peek( RIGHT );
  byte1 = peek( RIGHT - 0x0008 );
  byte2 = peek( RIGHT - 0x0010 );
  rtn8bit = byte0 | byte1;
  rtn8bit = rtn8bit | byte2;
  return rtn8bit;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}

void getJS()
{
  JSportA = peek(0xDC00);
  JSbtnPressA = JSportA & 0x10;
  JSnorth = JSportA & 0x01;
  JSsouth = JSportA & 0x02;
  JSwest = JSportA & 0x04;
  JSeast = JSportA & 0x08;
  return;
}

void line( uint X1, uint Y1, uint X2, uint Y2 )
{
  //dec( X1);
  segment( X1, Y1, X2, Y2, 0x03 );
  inc( Y1 );
  inc( Y2 );
  segment( X1, Y1, X2, Y2, 0x03 );
  return;
}

void plotshape(word plotshapeAddr, uint plotshapeX, uint plotshapeY, uint plotshapeSize)
{
  uint plotshapeBindex = 0;
  word plotshapeOffset = plotshapeX + plotshapeY * 40;
  word plotshapeColor1 = plotshapeOffset + 0xD800;
  word plotshapeColors2And3 = plotshapeOffset + scraddr;
  word plotshapePixels = asl(asl(asl(plotshapeOffset))) + bmpaddr;
  
  for( uint plotshapeJ = 0; plotshapeJ < plotshapeSize; inc(plotshapeJ) )
    {
      poke( plotshapeColor1, plotshapeColourValue11 );
      poke( plotshapeColors2And3, plotshapeColourValue0110 );
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

void plotNumber()
{
  if( plotNum == 0x0000 )
    {
      wordToPrint = zeroText;
      wordSize = 0x01;
      printWord();
      dec( plotDigitX );
      plotDigitBindex = 0;
      plotDigit();
    }
  else
    {
      while( plotNum > 0x0000 )
	{
	  plotNum = plotNum / 0x0A;
	  plotDigitBindex = asl(asl(asl(peek(0x02))));
	  plotDigit();
	  dec(plotDigitX);
	}
    }
  return;
}
void printWord()
{
  plotDigitAddr= letters;
  for( uint printWordI = 0x00; printWordI < wordSize; inc(printWordI) )
    {
      uint currentChar = (wordToPrint)[printWordI];
      if( currentChar == ',' )
	{
	  currentChar = 31;
	}
      else
	{
	  if( currentChar == ')' )
	    {
	      currentChar = 30;
	    }
	  else
	    {
	      if( currentChar == '(' )
		{
		  currentChar = 29;
		}
	      else
		{
		  if( currentChar == '.' )
		    {
		      currentChar = 28;
		    }
		  else
		    {
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
		    }
		}
	    }
	}
      plotDigitBindex = asl(asl(asl(currentChar)));
      plotDigit();
      
      inc(plotDigitX);
    }
  plotDigitAddr= digits;
  return;
}
void plotDigit()
{
  word plotDigitOffset = plotDigitY * 40;
  plotDigitOffset = plotDigitOffset + plotDigitX;
  
  word plotDigitColor1 = plotDigitOffset + 0xD800;
  word plotDigitColors2And3 = plotDigitOffset + scraddr;
  poke( plotDigitColor1, textColour );
  poke( plotDigitColors2And3, 0x00 );

  word plotDigitPixels = asl(asl(asl(plotDigitOffset))) + bmpaddr;

  for( uint plotDigitI = 0; plotDigitI < 8; inc( plotDigitI ) )
    {
      poke( plotDigitPixels, (plotDigitAddr)[plotDigitBindex] );
      plotDigitPixels = plotDigitPixels + 1;
      inc( plotDigitBindex );
    }
  return;
}

  
