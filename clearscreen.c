void main()
{
  bank(0);
  printf( "TESTING BANK(0) AND CLS(0)" );  
  pause();
  bank(0);
  putStuffOnScreen( 0x0400 );
  pause();
  cls(0);
  
  pause();
  bank(0);
  printf( "\nTESTING BANK(1) AND CLS(1)" );  
  pause();
  bank(1);
  putStuffOnScreen( 0x4400 );
  pause();
  cls(1);

  pause();
  bank(0);
  printf( "\nTESTING BANK(2) AND CLS(2)" );  
  pause();

  bank(2);
  putStuffOnScreen( 0x8400 );
  pause();
  cls(2);

  pause();
  bank(0);
  printf( "\nTESTING BANK(3) AND CLS(3)" );  
  pause();

  bank(3);
  putStuffOnScreen( 0xC400 );
  pause();
  cls(3);

  pause();
  bank(0);
  printf( "\nTESTING BANK(1) AND CLS(4)" );  
  pause();

  bank(1);
  putStuffOnScreen( 0x4400 );
  pause();
  cls(4);

  pause();
  bank(0);
  printf( "\nTESTING BANK(2) AND CLS(8)" );  
  pause();
  bank(2);
  putStuffOnScreen( 0x8400 );
  pause();
  cls(8);

  pause();
  bank(0);
    printf( "\nTESTING BANK(3) AND CLS(12)" );  
  pause();

  bank(3);
  putStuffOnScreen( 0xC400 );
  pause();
  cls(0x0C);

  
  pause();
  bank(0);
  //cls(0);
  printf( "\nDONE." );
  
  clearkb();

  return;
}

  //                                           Colours
  // 0 - Black  1 - White   2 - Red   3 - Cyan  4 - Purple  5 - Green  6 - Dark Blue
  // 7 - Yellow 8 - Orange  9 - Brown A - Pink  B - Drk Gry C - Grey   D - Bright Green
  //                        E - Light Blue                   F - Light Grey

void putStuffOnScreen( word putStuffOnScreenARG0 )
{
  for( word i = 0x0000; i < 0x03E8; inc(i) )
    {
      poke( putStuffOnScreenARG0, rnd() );
      inc( putStuffOnScreenARG0 );
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

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}
