int main()
{

  float time1 = tofloat(65535);
  float time2 = tofloat(32767);
  
  uint t1[3];
  uint t2[3];

  t1[0] = peek(160);
  t1[1] = peek(161);
  t1[2] = peek(162);
  
  for( word j = 0xFF00; j > 0xFE00; dec( j ) )
    {
      printf( j + 0x0000 );
      //printf( tan(j) );
      sp();
    }

  t2[0] = peek(160);
  t2[1] = peek(161);
  t2[2] = peek(162);
  
  printf( t1[0] );
  printf( t1[1] );
  printf( t1[2] );
  sp();
  sp();
  printf( t2[0] );
  printf( t2[1] );
  printf( t2[2] );

  cr();
  printf( time1 );

  sp();
  printf( time2 );
  
  return;
}

