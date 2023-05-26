void main()
{
  romout(6);
  bank(1);
  saveregs();

  lda( 0x00 );
  uint plotDigitBindex;

  lda( 0x01 );
  uint plotDigitX;
  uint plotDigitY;
  uint plotDigitColourValue11;

  uint plotDigitColourValue1001 = 0x0E;
 
  data digits = {
    0, 52, 221, 221, 221, 221, 221, 52,
    0, 52, 52, 52, 52, 52, 52, 52,
    0, 52, 221, 13, 52, 208, 208, 253,
    0, 253, 13, 52, 13, 221, 221, 52,
    0, 13, 221, 221, 221, 253, 13, 13,
    0, 253, 208, 244, 13, 13, 221, 52,
    0, 52, 221, 208, 244, 221, 221, 52,
    0, 253, 13, 13, 52, 52, 52, 52,
    0, 52, 221, 221, 48, 221, 221, 52,
    0, 52, 221, 221, 61, 13, 221, 52,
    // space
    0, 0, 0, 0, 0, 0, 0, 0
  };

  word plotDigitAddr = digits;
  
  clearhires();
  
  // set multicolour bitmap mode
  poke( 0xD011, 59 ); 
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );
      
  // set border and background colours to black
  poke( 0xD020, 6 );      
  poke( 0xD021, 6 );      

  word score = 0xFF00;

  for( word j = 0x0000; j < 0x0F00; j = j + 0x0001 )
    {
      score = score + rnd();
      eraseScore();
      updateScore();
    }
  
  
  pause();
  clearkb();
      

  restoreregs();
  bank(0);
  romin();
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

void eraseScore()
{
  plotDigitY = 24;
  for( uint xI = 5; xI < 10; inc( xI ) )
    {
      plotDigitX = xI;
      plotDigitBindex = 0x50;
      plotDigit();
    }
  return;
}

void updateScore()
{
  word num = score;
  plotDigitY = 24;
  plotDigitX = 10;
  
  plotNumber();
  
  return;
}

void plotNumber()
{
  uint ten = 0x0A;
  while( num > 0x0000 )
    {
      num = num / ten;      
      uint rem = peek( 0x0002 );

      plotDigitBindex = rem;
      asl( plotDigitBindex );
      asl( plotDigitBindex );
      asl( plotDigitBindex );
      
      plotDigit();

      dec(plotDigitX);
    }
  return;
}

void plotDigit()
{
  word plotDigitOffset = plotDigitY;
  plotDigitOffset = plotDigitOffset * 40;
  plotDigitOffset = plotDigitOffset + plotDigitX;

  word plotDigitColor1 = plotDigitOffset + 0xD800;
  word plotDigitColors2And3 = plotDigitOffset + 0x4400;
  poke( plotDigitColor1, plotDigitColourValue11 );
  poke( plotDigitColors2And3, plotDigitColourValue1001 );

  asl( plotDigitOffset );
  asl( plotDigitOffset );
  asl( plotDigitOffset );

  word plotDigitPixels = plotDigitOffset + 0x6000;
  

  for( uint plotDigitI = 0; plotDigitI < 8; inc( plotDigitI ) )
    {
      poke( plotDigitPixels, (plotDigitAddr)[plotDigitBindex] );
      plotDigitPixels = plotDigitPixels + 1;
      inc( plotDigitBindex );
    }

  return;
}
