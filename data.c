#include <stdio.h>


void main()
{
  data testdata = { 12, 236, 202, 151, 150, 155, 112, 50, 166, 77, 117, 108, 1, 182, 41, 232, 2, 104, 105, 67, 136, 157, 247, 250, 83, 28, 16, 200, 244, 47, 146, 195, 22, 191, 102, 251, 233, 78, 114, 25, 236, 26, 147, 230, 14, 61, 179, 147, 130, 226, 219, 93, 206, 108, 166, 181, 210, 79, 117, 213, 101, 106, 38, 66, 170, 146, 169, 84, 157, 155, 97, 192, 252, 48, 190 };

  for( uint loop = 0; loop < 65; inc(loop) )
    {
      printf( (testdata)[loop] );
      sp();
    }
  cr();

  
  
  return;
}

void cr()
{
  lda( 0x0D );
  jsr( 0xFFD2 );
  return;
}

void sp()
{
  lda( 0x20 );
  jsr( 0xFFD2 );
  return;
}