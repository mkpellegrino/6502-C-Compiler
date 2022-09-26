#include <stdio.h>
int main()
{
  int x = 3;


  if( x <= 2 )
    {
      printf( "3 <= 2 (FAIL) );
    }
  else
    {
      printf( "3 > 2" );
    }
if( x <= 3 )
    {
      printf( "3 <= 3" );
    }
  else
    {
      printf( "3 < 3 (FAIL)" );
    }
if( x <= 4 )
    {
      printf( "3 <= 4" );
    }
  else
    {
      printf( "3 > 4 (FAIL)" );
    }

  return;
}
