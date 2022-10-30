#include <stdio.h>
int main()
{
  printf( "    FLOATING POINT ARITHMETIC TESTS\n" );
  hl();
  float x = 2.0;
  float y = -5.141973;
  float z = 3.14159;

  float w = 0.0;

  printf( "W");
  printINIT();
  printf( w );
  printf( "X" );
  printINIT();
  printf( x );
  printf( "Y" );
  printINIT();
  printf( y );
  printf( "Z" );
  printINIT();
  printf( z );
  pause();
  
 

  cls();
  printf( "                ADDITION\n" );
  hl();
  printf( "W = Z + Y =\n" );
  w = z + y;
  printf( w );
  printf( "W = Z + 2.71828 (IMM) =\n" );
  w = z + 2.71828;
  printW();
  printf( "W = 2.71828 (IMM) + Z =\n" );
  w = 2.71828 + z;
  printW();
  printf( "W = 3.14159 (IMM) + 2.71828 (IMM) =\n" );
  w = 3.14159 + 2.71828;
  printW();
  pause();

  cls();
  printf( "              SUBTRACTION\n" );
  hl();
  printf( "W = Z - Y =\n" );
  w = z - y;
  printf( w );
  printf( "W = Z - 2.71828 (IMM) =\n" );
  w = z - 2.71828;
  printW();
  printf( "W = 2.71828 (IMM) - Z =\n" );
  w = 2.71828 - z;
  printW();
  printf( "W = 3.14159 (IMM) - 2.71828 (IMM) =\n" );
  w = 3.14159 - 2.71828;
  printW();
  pause();

  cls();
  printf( "            MULTIPLICATION\n" );
  hl();
  printf( "W = Z * Y =\n" );
  w = z * y;
  printf( w );
  printf( "W = Z * 2.71828 (IMM) =\n" );
  w = z * 2.71828;
  printW();
  printf( "W = 2.71828 (IMM) * Z =\n" );
  w = 2.71828 * z;
  printW();
  printf( "W = 3.14159 (IMM) * 2.71828 (IMM) =\n" );
  w = 3.14159 * 2.71828;
  printW();
  pause();

  cls();
  printf( "               DIVISION\n" );
  hl();
  printf( "W = Z / Y =\n" );
  w = z / y;
  printf( w );
  printf( "W = Z / 2.71828 (IMM) =\n" );
  w = z / 2.71828;
  printW();
  printf( "W = 2.71828 (IMM) / Z =\n" );
  w = 2.71828 / z;
  printW();
  printf( "W = 3.14159 (IMM) / 2.71828 (IMM) =\n" );
  w = 3.14159 / 2.71828;
  printW();
  pause();
  
  printf( "\nDONE.\n" );
  return;
}

int printINIT()
{
  printf( " INITIALIZED TO:" );
  return;
}

int printW()
{
  printf( w );
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
