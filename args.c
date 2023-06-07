int main()
{

  myFunc3( 0x1000, 0x20, 0x2A);
  myFunc2( 0x1000, 0x20 );
  
  return;
}


void myFunc3( word a, uint b, uint c )
{
  printf( a );
  cr();
  printf( b );
  cr();
  printf( c );
  cr();
  return;
}


void myFunc2( word d, uint e )
{
  printf( d );
  cr();
  printf( e );
  cr();
  return;
}
