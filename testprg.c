#include <stdio.h>
int main()
{
  int x;
  for( int i=0; i<5; i=i+2)
    {
      x=i;
      for( int j=0; j<10; j=j+3 )
	{
	  x=j;
	}
    }
  x=100;
  while( x>0 )
    {
      x--;
    }
  return 0;
}
