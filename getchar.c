#include <stdio.h>

int main()
{
  uint c = 0;


  c = getchar();

  while( c != 13 )
    {
      c = getchar();
      if( c > 0 )
	{
	  byte2hex( c );
	  printf( " " );
	}
    }

  printf( "DONE\n" );


}
