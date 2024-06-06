void main()
{
  printf( "PHASE 1: CREATE A FILE OF TEXT\n" );
  setfilename( "SYNOPSIS3,S,W" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkout( 3 );
  //        1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40

  data f0 = { 0x00,'K','N','I','G','H','T','S',' ','Q','U','E','S','T',' ',' ','L','E','V','E','L',' ','3',' ',' ','T','H','E',' ','C','U','R','S','E',' ','O','F',' ','I','N','X', 0x01};
  data f1 = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data f2 = { 'Y','O','U',' ','H','A','V','E',' ','A','C','Q','U','I','R','E','D',' ','T','H','E',' ','O','R','B',' ','O','F',' ','I','N','X',' ','A','N','D',' ','I','N',' '};
  data f3 = { 'S','O',' ','D','O','I','N','G',' ','D','I','M','I','N','I','S','H','E','D',' ','T','H','E',' ','P','O','W','E','R','S',' ','O','F',' ','T','H','E',' ',' ',' '};
  data f4 = { 'E','V','I','L',' ',0x00,'L','O','R','D',' ','R','O','R','B','I','T',0x01,'.',' ',' ','H','O','W','E','V','E','R',',',' ','T','H','E',' ','O','R','B',' ','H','A','S',' '};
  data f5 = { 'A',' ','C','U','R','S','E',' ','U','P','O','N',' ','I','T',' ','A','N','Y',' ','W','H','O',' ','T','A','K','E',' ','I','T','.',' ',' ',' ',' ',' ',' ',' ',' '};
  data f6 = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data f7 = { 'T','H','E',' ','C','U','R','S','E',' ','W','I','L','L',' ','M','A','K','E',' ','Y','O','U',' ','D','I','S','O','R','I','E','N','T','E','D',' ','A','N','D',' '};
  data f8 = { 'U','N','A','B','L','E',' ','T','O',' ','M','O','V','E',' ','I','N',' ','A',' ','N','O','R','M','A','L',' ','F','A','S','H','I','O','N','.',' ',' ',' ',' ',' '};
  data f9 = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data fA = { 'T','O',' ','H','A','V','E',' ','T','H','E',' ','C','U','R','S','E',' ','L','I','F','T','E','D',' ','P','E','R','M','A','N','E','N','T','L','Y',' ',' ',' ',' '};
  data fB = { 'Y','O','U',' ','M','U','S','T',' ','F','I','N','D',' ','T','H','E',' ','I','N','C','A','N','T','A','T','I','O','N',' ','H','I','D','D','E','N',' ',' ',' ',' '};
  data fC = { 'S','O','M','E','W','H','E','R','E',' ','I','N',' ','T','H','E',' ','C','A','S','T','L','E','.',' ',' ','T','H','E','N',' ','B','R','I','N','G',' ','T','H','E'};
  data fD = { 'I','N','C','A','N','T','A','T','I','O','N',' ','T','O',' ','T','H','E',' ','W','I','T','C','H',' ','S','O',' ','S','H','E',' ','C','A','N',' ',' ',' ',' ',' '};
  data fE = { 'R','E','L','E','A','S','E',' ','Y','O','U',' ','F','R','O','M',' ','T','H','E',' ','C','U','R','S','E','.',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data fF = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data f10 = { 'A','L','O','N','G',' ','T','H','E',' ','W','A','Y',' ','Y','O','U',' ','M','I','G','H','T',' ','F','I','N','D',' ','T','H','E',' ','R','O','O','T',' ','O','F'};
  data f11 = { 'T','H','E',' ',0x06,'O','R','A','S','T','Y',' ','P','L','A','N','T',0x01,'.',' ',' ','E','A','T',' ','I','T',' ','T','O',' ','E','A','S','E',' ','T','H','E',' ',' ',' '};
  data f12 = { 'S','Y','M','P','T','O','M','S',' ','O','F',' ','T','H','E',' ','C','U','R','S','E',' ','O','F',' ','I','N','X','.',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data f13 = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data f14 = { 'A','S',' ','A','L','W','A','Y','S',',',' ','B','E','W','A','R','E',' ','T','H','E',' ','W','O','R','M','H','O','L','E',' ','P','A','S','S','A','G','E','S',' '};
  data f15 = { 'A','N','D',' ','W','H','E','N',' ','Y','O','U',' ','H','A','V','E',' ','C','O','M','P','L','E','T','E','D',' ','T','H','E',' ','T','A','S','K',' ',' ',' ',' '};
  data f16 = { 'E','S','C','A','P','E',' ','T','H','E',' ','C','A','S','T','L','E',' ','T','H','E',' ','W','A','Y',' ','Y','O','U',' ','C','A','M','E',' ','I','N','.',' ',' '};
  data f17 = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data f18 = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};
  data f19 = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};


  // 0x0005 is the number of control codes
  // 0x03E8 + 0x0006 = 0x03EE
  for( word j = 0x0000; j< 0x03EE; j = j + 0x0001 )
    {
      fchrout( peek(f0+j) );
    }
  
  fclose(3);
  fclrchn();


  
  printf( "PRESS ANY KEY TO READ AND DISPLAY THE TEXT\n" );
  pause();
  
  saveregs();
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
      //0, 204, 204, 204, 60, 12, 204, 48,
      0, 204, 204, 204, 48, 48, 48, 48,
      
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

  
  bank(2);

  setScreenMode( 0x03 );
  romout(6);
  word bmpaddr = getbmp_addr();
  word bmpaddrX = bmpaddr + 0x1FF8;
  word scraddr = getscr_addr();
  word scraddrX = scraddr + 0x03EF;
  clearhires();


  // ===================================
  // Drk Grey and Grey
  //plotshapeColourValue0110 = 0xBC;
  // Black
  //plotshapeColourValue11 = 0x00;

  uint YY = 0x00;
  uint XX = 0x00;

  setfilename( "SYNOPSIS3,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );
  uint status = 0x00;

  textColour = 1;

  data buffer = { 0x00 };
  
  while( status == 0x00 )
    {
      uint in = fchrin();
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
      status = peek( 0x0090 );
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
