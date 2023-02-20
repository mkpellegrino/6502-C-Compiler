uint main()
{
  word xa[4];
  xa[0] = 0x1000;
  xa[1] = 0x0F00;
  xa[2] = 0x0AAA;
  xa[3] = 0x1111;

  word tmp;

  for( uint i = 1; i<4; inc(i) )
    {
      tmp = xa[0] - xa[i];
      printf( xa[0] );
      printf( "-" );
      printf( xa[i] );
      printf( "=" );
      printf( tmp ); 
      cr();
    }

  lda( 0x0D );
  jsr( 0xFFD2 );
  jsr( 0xFFD2 );
  

  uint ya[4];
  ya[0] = 0x10;
  ya[1] = 0x0F;
  ya[2] = 0x0A;
  ya[3] = 0x11;

  uint tmp2;

  for( uint j = 1; j < 4; inc(j) )
    {
      tmp2 = ya[0] - ya[j];
      printf( ya[0] );
      printf( "-" );
      printf( ya[j] );
      printf( "=" );
      printf( tmp2 );
      if( tmp2 < 5 )
	{
	  printf( " *** COLLISION ***" );
	  inc( 0xD020 );
	}
      cr();
    }

  
  

  return;
}
