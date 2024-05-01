int main()
{
  mob sphere1 = { 0, 192, 0, 255, 0, 3, 170, 192, 13, 170, 176, 54, 170, 172, 58, 170, 172, 234, 170, 171, 234, 170, 171, 234, 170, 171, 234, 170, 171, 58, 170, 172, 58, 170, 172, 14, 170, 176, 3, 170, 192, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  //poke( 2040, 192 );
	     
  // colours for all sprites
  poke( 0xD025, 0x0D );
  poke( 0xD026, 0x05 );

  // colour for sprite 1
  poke( 0xD027, 0x0B );

  // set multicolour mode for sprite #1
  poke( 0xD01C, 0x01 );

  // turn on the high bit for all sprites
  //poke( 0xD010, 0xFF );

  spriteon( 0x01 );

  uint s = 0x00;
  uint y = 0x64;
  word x = 0x0140;
  word wordx1 = 0x0140;
  word wordx2 = 0x0020;
  uint x2 = 0x40;

  //UIntIMM, UIntIMM, UIntIMM

  printall( 1, 1, 1 );
  spritexy( 0x00, 0x40, 0x64 );
  left();
  pak();
  spritexy( 0x00, 0xC9, 0x42 );
  left();
  pak();
  
  // UIntIMM, WordID, UIntIMM
  printall( 1, 4, 1 );
  spritexy( 0x00, wordx1, 0x64 );
  right();
  pak();
  spritexy( 0x00, wordx2, 0x46 );
  left();
  pak();
  spritexy( 0x00, wordx1, 0x64 );
  right();
  pak();

  // UIntIMM, WordID, UIntID
  printall( 1, 4, 2 );
  spritexy( 0x00, x, y );
  right();
  pak();
 spritexy( 0x00, wordx2, y );
  left();
  pak();

  

  y = y + 0x20;  
  // UIntIMM, UIntIMM, UIntID
  printall( 1, 1, 2 );
  spritexy( 0x00, 0x30, y );
  left();
  pak();

  y = y - 0x20;
  printall( 1, 2, 2 );
  // UIntIMM, UIntID, UIntID
  spritexy( 0x00, x2, y );
  left();
  pak();

  x = x + 0x20;
  printall( 1, 2, 1 );
  // UIntIMM, UIntID, UIntIMM
  spritexy( 0x00, x2, 0x64 );
  left();
  pak();

  x = x - 0x20;
  printall( 2, 2, 2 );
  // UIntID, UIntID, UIntID
  spritexy( s, x2, y );
  left();
  pak();

  printall( 2, 1, 1 );
  // UIntID, UIntIMM, UIntIMM
  spritexy( s, 0x80, 0x64 );
  left();
  pak();

  printall( 2, 3, 1 );
  // UIntID, WordIMM, UIntIMM
  spritexy( s, 0x0140, 0x64 );
  right();
  pak();
  spritexy( s, 0x0070, 0x64 );
  left();
  pak();
  
  // UIntIMM, WordIMM, UIntIMM
  printall( 1, 3, 1 );
  spritexy( 0x00, 0x0120, 0x72 );
  right();
  pak();
  spritexy( 0x00, 0x0020, 0x72 );
  left();
  pak();

  // UintID, WordID, UintID
  printall( 2, 4, 2 );
  spritexy( s, wordx1, y );
  right();
  pak();
  spritexy( s, wordx2, y );
  left();
  pak();

  return;
}

void pak()
{
  printf( "PRESS ANY KEY\n");
  pause();
  return;
}

void printall( uint b, uint c, uint d )
{
  shortcls();
  showLine();
  prn( b );
  prn( c );
  prn( d );
  lda( 0x0D );
  jsr( 0xFFD2 );
  return;
}

void prn( uint a )
{
  if( a == 1 )
    {
      printf( "UINTIMM " );
    }
  else
    {
      if( a == 2 )
	{
	  printf( "UINTID " );
	}
      else
	{
	  if( a == 3 )
	    {
	      printf( "WORDIMM " );
	    }
	  else
	    {
	      printf( "WORDID " );
	    }
	}
    }
    return;
}

void left()
{
  printf("<---\n");
  return;
}

void right()
{
  printf("--->\n");
  return;
}

void showLine()
{
  for( uint i = 0; i<10; inc(i))
    {
      printf( "                               .\n" );
    }
  return;
}
