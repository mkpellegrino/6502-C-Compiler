int main()
{
  word scraddr = getscr_addr();
  word s[8];

  s[0] = scraddr + 0x03F8;
  for( uint i = 0; i < 7; inc(i) )
    {
      s[i+0x01] = s[i]+0x0001;
    }

  for( i = 0; i < 8; inc(i) )
    {
      printf( s[i] );
      cr();      
    }

  
  return;
}
