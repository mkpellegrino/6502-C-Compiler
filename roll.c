void main()
{
  seed();
  uint x = rnd();

  for( uint i = 0x00; i < 20; inc( i ) )
    {
      doit();
    }
  
  return;
}

void doit()
{
  byte2hex( x );
  ror( x );
  lda( 0x20 );
  jsr( 0xFFD2 );
  printf( "-> " );
  byte2hex( x );
  lda( 0x0D );
  jsr( 0xFFD2 );
  return;
}
