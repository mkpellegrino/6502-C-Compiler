int main()
{
  //test2( 1,2,3 );

  word y = test1( 5, 0);
  printf( y );
  return;
}


//void test2( uint test3a, uint test3b, uint test3c)
//{
//  printf( "ARG1: " );
//  printf( test3a );
//  cr();
//  printf( "ARG2: " );
//  printf( test3b );
//  cr();
//  printf( "ARG3: " );
//  printf( test3c );
//  cr();
//  return;
//}


word test1( uint x, uint throwaway)
{
  x = x * 2;
  return x;
}
