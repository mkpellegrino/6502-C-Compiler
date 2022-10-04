#include <stdio.h>
int main()
{
  int j=0;
  for( int i=0; i<34; i=i+3 )
    {
      printf( "#$" );
      chrout( i );
      printf( " " );
      j = j + 1;
      if( j == 3 )
	{
	  printf( "\n" );
	  j = 0;
	}
    }
  return; 
}

