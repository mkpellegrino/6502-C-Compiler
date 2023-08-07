void main()
{

  word A1 = 0x0400;
  
  for( uint j = 0x00; j < 10; inc(j) )
    {
      poke( A1, 96 );
      A1 = A1 + 0x0001;
    }

  
  read( 0x0000, 0x0400, 0x0000A );
  

  return;
}


void read( word fname, word addr, word bytes )
{
  
  word addrX = addr + bytes;

  for( word addrI = addr; addrI < addrX; addrI = addrI + 0x0001 )
    {
      byte2hex( peek(addrI) );
      lda( 0x20 );
      jsr( 0xFFD2 );
    }

  return;
}
