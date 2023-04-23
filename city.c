int main()
{
  uint r = NULL;
  bank(2);
  uint y[8];
  y[0] = 0x6B;
  y[1] = 0x6D;
  y[2] = 0x6E;
  y[3] = 0x70;
  y[4] = 0x71;
  y[5] = 0x72;
  y[6] = 0x73;
  y[7] = 0x7D;

  randomizeScreen();
  r = getin();

  while( r != 62 )
    {
      r = getin();
      if( r == 17 )
	{
	  randomizeScreen();
	}
    }

  poke( 0x00C6, 0 );  
  jsr( 0xFFE4 );
  bank(0);
  return;
}

void randomizeScreen()
{
  screen(0);
  
  // because we're in bank 2, the screenmem is @ 0x8400 and
  // the standard character set is available
  for( word i = 0x8400; i < 0x87E8; i = i + 1 )
    {
      r = rnd(1);
      lsr( r );
      lsr( r );
      lsr( r );
      lsr( r );
      lsr( r );
      poke( i, y[r] );
    }
  screen(1);  
  return;
}
