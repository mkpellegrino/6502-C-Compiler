#include <stdio.h>
int main()
{
  cls();
  printf( "               PRINTF TEST\n" );
  hl();
  float x = 3.14159;
  printf("X = ");
  printf(x);
  cr();
  int y = 28;
  printf("Y = ");
  printf(y);
  cr();
  uint z = 99;
  printf("Z = ");
  printf(z);
  cr();
  return;
}

int pause()
{
  printf( "PRESS ENTER" );
  scanf( " " );
  return;
}

int hl()
{
  printf( "=======================================\n" );
  return;
}

int cr()
{
  printf( "\n" );
  return;
}
