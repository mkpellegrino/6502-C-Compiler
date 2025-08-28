void main()
{
  saveregs();
  word textArray[25];

  data  f0 = { "       aKNIGHTS QUEST -- GAME OVERb       " };
  data  f1 = { "                                        " };
  data  f2 = { "                 STATS                  " };
  data  f3 = { "                                        " };
  data  f4 = { "       GOLD COINS:                      " };
  data  f5 = { "                                        " };
  data  f6 = { "EXPERIENCE POINTS:                      " };
  data  f7 = { "                                        " };
  data  f8 = { "       HIT POINTS:                      " };
  data  f9 = { "                                        " };
  data f10 = { "            LEVEL:                      " };
  data f11 = { "                                        " };
  data f12 = { " EFFICIENCY SCORE:                      " };
  data f13 = { "                                        " };
  data f14 = { "                                        " };
  data f15 = { "CREDITS:                                " };
  data f16 = { "                                        " };
  data f17 = { "DESIGN, PROGRAMMING, MUSIC, AND SOUND FX" };
  data f18 = { "        BY MICHAEL K PELLEGRINO         " };
  data f19 = { "                                        " };
  data f20 = { "                                        " };
  data f21 = { "                                        " };
  data f22 = { "                                        " };
  data f23 = { "                                        " };
  data f24 = { "                                        " };

  textArray[0] = f0;
  textArray[1] = f1;
  textArray[2] = f2;
  textArray[3] = f3;
  textArray[4] = f4;
  textArray[5] = f5;
  textArray[6] = f6;
  textArray[7] = f7;
  textArray[8] = f8;
  textArray[9] = f9;
  textArray[10] = f10;
  textArray[11] = f11;
  textArray[12] = f12;
  textArray[13] = f13;
  textArray[14] = f14;
  textArray[15] = f15;
  textArray[16] = f16;
  textArray[17] = f17;
  textArray[18] = f18;
  textArray[19] = f19;
  textArray[20] = f20;
  textArray[21] = f21;
  textArray[22] = f22;
  textArray[23] = f23;
  textArray[24] = f24;
  
  uint filestatus = 0x00;
  data buffer = {0x00};
  printf( "PHASE 1: CREATE A FILE OF TEXT\n" );

  //data fn = { "SYNOPSIS?,S,?" };
  //data fn = { "SHOPPE,S,R" };
  data fn = { "END-TEXT,S,W" };
  
  // Write (0x57 = W)  
  poke( fn + 0x000B, 0x57 );
  //poke( fn + 0x0009, 0x57 );  
  setfilename( fn );  
  setlfs( 3, 8, 3 );
  fopen();
  fchkout( 3 );

  for( uint i = 0x00; i < 25; inc(i) )
    {
      word dataPointer = textArray[i];
      for( uint j = 0x00; j < 80; inc(j) )
	{
	  uint a = peek( dataPointer + j );
	  if( a == 0x00 )
	    {
	      j=90;
	    }
	  else
	    {
	      if( a > 0x60 )
		{
		  a = a - 0x61;
		}
	      fchrout( a );
	    }
	}
    }
  fclose(3);
  fclrchn();

  printf( "PHASE 2: READ THE FILE & DISPLAY IT\n" );
  // Write (0x52 = R)  
  poke( fn + 0x000B, 0x52 );
  //poke( fn + 0x0009, 0x52 );  
  setfilename( fn );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );
  uint in = NULL;
  while( filestatus == 0x00 )
    {
      in = fchrin();
      lda( in );
      jsr( 0xFFD2 );
      filestatus = peek( 0x0090 );
    }

  fclose(3);
  fclrchn();


  poke( 0xD021, 0x0C );
  poke( 0xD020, 0x0C );

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
      // dash
      0, 0, 0, 0, 0x3C, 0, 0, 0,
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

  
  bank(2);

  setScreenMode( 0x03 );
  romout(6);
  word bmpaddr = getbmp_addr();
  word bmpaddrX = bmpaddr + 0x1FF8;
  word scraddr = getscr_addr();
  word scraddrX = scraddr + 0x03EF;
  clearhires();

  uint YY = 0x00;
  uint XX = 0x00;

  setfilename( fn );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  textColour = 1;

  filestatus = 0x00;
  while( filestatus == 0x00 )
    {
      in = fchrin();
      poke( buffer, in );

      if( in < 16 )
	{
	  textColour = in;
	}
      else
	{
	  if( in < 0x3A )
	    {
	      if( in > 0x2F )
		{
		  // then its a digit
		  plotNum = in - 0x30;
		  plotDigitX = XX;
		  plotDigitY = YY;
		  plotNumber();
		}
	      else
		{
		  wordToPrint = buffer;
		  wordSize = 1;
		  plotDigitX = XX;
		  plotDigitY = YY;
		  printWord();
		}
	    }
	  else
	    {
	      wordToPrint = buffer;
	      wordSize = 1;
	      plotDigitX = XX;
	      plotDigitY = YY;
	      printWord();
	    }

	  if( XX == 0x28 )
	    {
	      XX = 0x00;
	      inc( YY );
	    }
	  inc( XX );
	}
      filestatus = peek( 0x0090 );
    }
  

  fclose(3);
  fclrchn();

  pause();
  romin();
  bank(0);


  restoreregs();
  
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
			      if( currentChar == '-' )
				{
				  currentChar = 27;
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
	}
      plotDigitBindex = asl(asl(asl(currentChar)));
      plotDigit();
      
      inc(plotDigitX);
    }
  plotDigitAddr= digits;
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

void clearhires()
{
  //                                           Colours
  // 0 - Black  1 - White   2 - Red   3 - Cyan  4 - Purple  5 - Green  6 - Dark Blue
  // 7 - Yellow 8 - Orange  9 - Brown A - Pink  B - Drk Gry C - Grey   D - Bright Green
  //                        E - Light Blue                   F - Light Grey

  // this is for the single colour (11) -- this is ALWAYS at 0xD800 - 0x3FF
  for( general16bit = 0xD800; general16bit < 0xDBFF; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, 0x06 );
    }
  
  for( general16bit = bmpaddr; general16bit < bmpaddrX; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, 0x00 );
    }
  return;
}

void setScreenMode( uint mode )
{
  uint newD011 = peek(0xD011);
  uint newD016 = peek(0xD016);

  if( mode == 0x00 )
    {
      newD011 = newD011 & 0x9F;
      newD016 = newD016 & 0xEF;
    }
  if( mode == 0x01 )
    {
      newD011 = newD011 & 0x9F;
      newD016 = newD016 | 0x10;
    }
  if( mode == 0x02 )
    {
      newD011 = newD011 & 0xBF;
      newD011 = newD011 | 0x20;
      newD016 = newD016 & 0xEF;
    }
  if( mode == 0x03 )
    {
      newD011 = newD011 & 0xBF;
      newD011 = newD011 | 0x20;
      newD016 = newD016 | 0x10;
    }
  if( mode == 0x04 )
    {
      newD011 = newD011 & 0xDF;
      newD011 = newD011 | 0x40;
      newD016 = newD016 & 0xEF;
    }
  if( mode < 0x05 )
    { 
      poke( 0xD011, newD011 );
      poke( 0xD016, newD016 );
      poke( 0xD018, 0x18 );
    }
  return;
}

void pause()
{
  poke( 0x00C6, 0 );
  //jsr( 0xFFE4 );

  uint pausev = getchar();
  while( pausev == 0 )
    {
      pausev = getchar();
    }
  return;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
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
