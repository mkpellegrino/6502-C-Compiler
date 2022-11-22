#include <stdio.h>
int main()
{
  uint lines = 0;
  uint a1 = 10;
  int a2 = -128;

  for( uint i = 0; i != 255; i++ )
    {
      compare();
      lines++;
      a2++;
      if( lines == 23 )
	{
	  pause();
	  lines = 0;
	}
    }
  return;
}

int compare()
{
  uint crbyte = 13;

  printf( a1 );
  if( a1 > a2 )
    {
      printf( ">" );
    }
  else
    {
      printf( "<=" );
    }
  
  printf( a2 );

  lda( crbyte );
  jsr( 65490 );
  return;
}

int pause()
{
  clearkb();
  uint pausev = getchar();
  while( pausev == 0 )
    {
      pausev = getchar();
    }
  return;
}

int clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}
