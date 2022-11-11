#include <stdio.h>

int main()
{  
  uint y[10];
  y[1] = 2;
  y[3] = 8;
  y[9] = 16;
  for( uint l = 0; l < 10; l = l + 1 )
    {
      printf( y[ l ] );
      printf( " " );
    }
  
  return;
}
