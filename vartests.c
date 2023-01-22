#include <stdio.h>

int main()
{
  word x = 0x1234;
  word y = x;
  word z = 0x9ABC;
  
  z = x;

  printf( "X=" );
  printf( x );
  cr();
  printf( "Y=" );
  printf( y );
  cr();
  printf( "Z=" );
  printf( z );
  cr();
  printf( "DONE.\n\n");
  return; 
}

void cr()
{
  lda( 0x0D );
  jsr( 0xFFD2 );
  return;
}
