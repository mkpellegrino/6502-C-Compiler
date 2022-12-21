#include <stdio.h>

int main()
{
  uint buffer[16];

  scanf( buffer );

  lda( 0x0D );
  jsr( 0xFFD2 );
  
  uint i = 0;
  uint letter = buffer[i];
  while( letter != 0 )
    {
      lda( letter );
      jsr( 0xFFD2 );
      inc(i);
      letter = buffer[i];
    }
  return;
}

int sp()
{
  lda( 0x20 );
  jsr( 0xFFD2 );
  return;
}
