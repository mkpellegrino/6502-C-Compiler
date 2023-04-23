void main()
{
  intro();
  
  // fill all of the screens
  fillScreens();
  
  for( uint j = 0; j < 4; inc(j) )
    {
      bank(0);
      cls(5);
      printf( "BANK: " );
      printf( j );
      pause();
      if( j == 0 )
	{
	  putStuffOnScreen( 0x0400 ); 
	}      
      bank(j);
      pause();
      test(j);
      pause();
    }

  // fill all of the screens
  //fillScreens();
  bank(0);
  cls(5);
  printf( "BANK: 0" );
  pause();
  putStuffOnScreen( 0x0400 );
  j = 0;
  pause();
  test(j);
  pause();

  bank(0);
  cls(5);
  printf( "BANK: 1" );
  pause();
  putStuffOnScreen( 0x4400 );
  bank(1);
  j = 4;
  pause();
  test(j);
  pause();

  bank(0);
  cls(5);
  printf( "BANK: 2" );
  pause();
  putStuffOnScreen( 0x8400 );
  bank(2);
  j = 8;
  pause();
  test(j);
  pause();


  bank(0);
  cls(5);
  printf( "BANK: 3" );
  pause();
  putStuffOnScreen( 0xC400 );
  bank(3);
  j = 12;
  pause();
  test(j);
  pause();


  bank(0);
  printf( "\nDONE." );
  clearkb();
  return;
}

void test( uint testARG0 )
{
  cls(testARG0);
  return;
}

void fillScreens()
{
  screen(0);
  putStuffOnScreen( 0x0400 );
  putStuffOnScreen( 0x4400 );
  putStuffOnScreen( 0x8400 );
  putStuffOnScreen( 0xC400 );
  screen(1);
  return;
}

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

void intro()
{
  cls(5);
  printf( "SCREEN WAS JUST CLEARED USING KERNAL CLS\n(JSR $FF81)\n");
  pause();
  return;
}
