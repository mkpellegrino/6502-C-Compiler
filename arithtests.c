#include <stdio.h>
int main()
{
  int m = 33;
  printf( "INT M=33      M = " );
  byte2hex(m);
  cr();
  int z = 16 + 17;
  printf( "INT Z=16+17   Z = " );
  byte2hex(z);
  cr();
  int y;
  printf( "INT Y;        Y = " );
  byte2hex(y);
  cr();
  m = 23 + 19;
  printf( "M = 23 + 19   M = " );
  byte2hex(m);
  cr();
  m = y + 45;
  printf( "M = Y + 45    M = " );
  byte2hex(m);
  cr();
  m = y + m;
  printf( "M = Y + M     M = " );
  byte2hex(m);
  cr();
  m = 61 + y;
  printf( "M = 61 + Y    M = " );
  byte2hex(m);
  cr();
  return;
}

int cr()
{
  printf( "\n" );
  return;
}
