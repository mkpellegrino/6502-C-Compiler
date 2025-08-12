void main()
{
  data PAK = { "\n\nPRESS ANY KEY\n\n" };
  float expected = 0.0;
  
  float x = 1.234;
  uint y = 2;
  float yFloat = 2.0;
  word yWord = 0x0002;
  int yInt = 2;

  printf( "FAC MATH A\n" );
  float z = ( x ** 2 ) + touint(y);
  expected = 3.522756;
  disp();
  
  z = ( x ** 2 ) - touint(y);
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * touint(y);
  expected = 3.045512;
  disp();

  z = ( x ** 2 ) / touint(y);
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** touint(y);
  expected = 2.318785;
  disp();

  myPause();

  
  printf( "\nFAC MATH FAC\n" );
  z = ( x ** 2 ) + (1.0 * y);
  expected = 3.522756;
  disp();
  
  z = ( x ** 2 ) - (1.0 * y);
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * (1.0 * y);
  expected = 3.045512;
  disp();

  z = ( x ** 2 ) / (1.0 * y);
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** (1.0 * y);
  expected = 2.318785;
  disp();

  myPause();

  printf( "\nFAC MATH FLOATID\n" );

  z = ( x ** 2 ) + yFloat;
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) - yFloat;
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * yFloat;
  expected = 3.045512;
  disp();

  z = ( x ** 2 ) / yFloat;
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** yFloat;
  expected = 2.318785;
  disp();

  myPause();


  printf( "\nFAC MATH FLOATIMM\n" );
  z = ( x ** 2 ) + 2.0;
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) - 2.0;
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * 2.0;
  expected = 3.045512;
  disp();

  z = ( x ** 2 ) / 2.0;
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** 2.0;
  expected = 2.318785;
  disp();

  myPause();
  
  printf( "\nFAC MATH XA\n" );
  z = ( x ** 2 ) + toword(yWord);
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) - toword(yWord);
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * toword(yWord);
  expected = 3.045512;
  disp();

  z = ( x ** 2 ) / toword(yWord);
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** toword(yWord);
  expected = 2.318785;
  disp();

  myPause();

  printf( "\nFAC MATH INTIMM\n" );
  z = ( x ** 2 ) + -2;
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) - -2;
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) * -2;
  expected = -3.045512;
  disp();

  z = ( x ** 2 ) / -2;
  expected = -0.761378;
  disp();

  z = ( x ** 2 ) ** -2;
  expected = 0.43126;
  disp();

  myPause();
  
  printf( "\nFAC MATH UINTIMM\n" );

  z = ( x ** 2 ) + 2;
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) - 2;  
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * 2;
  expected = 3.04551;
  disp();

  z = ( x ** 2 ) / 2;
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** 2;
  expected = 2.31878;
  disp();

  myPause();

  printf( "\nFAC MATH WORDIMM\n" );

  z = ( ( x ** 2 ) + 0x0004 ) - 2;
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) - 0x0002;
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * 0x0002;
  expected = 3.04551;
  disp();

  z = ( x ** 2 ) / 0x0002;
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** 0x0002;
  expected = 2.31878;
  disp();

  myPause();

  printf( "\nFAC MATH UINTID\n" );

  z = ( x ** 2 ) + y;
  expected = 3.522756;
  disp();
  
  z = ( x ** 2 ) - y;
  expected = -0.477244;
  disp();
  
  z = ( x ** 2 ) * y;
  expected = 3.04551;
  disp();

  z = ( x ** 2 ) / y;
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** y;
  expected = 2.31878;
  disp();

  myPause();

  printf( "\nFAC MATH WORDID\n" );

  z = ( x ** 2 ) + yWord;
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) - yWord;
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * yWord;
  expected = 3.04551;
  disp();

  z = ( x ** 2 ) / yWord;
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** yWord;
  expected = 2.31878;
  disp();

  myPause();

  printf( "\nFAC MATH INTID\n" );

  z = ( x ** 2 ) + yInt;
  expected = 3.522756;
  disp();

  z = ( x ** 2 ) - yInt;
  expected = -0.477244;
  disp();

  z = ( x ** 2 ) * yInt;
  expected = 3.045512;
  disp();

  z = ( x ** 2 ) / yInt;
  expected = 0.761378;
  disp();

  z = ( x ** 2 ) ** yInt;
  expected = 2.3187858355;
  disp();

  printf( "\n\nDONE TESTING FACMATH.\n" );
  return;
}

void myPause()
{
  prints( PAK );
  pause();
  return;
}

// argument is the expected value
void disp()
{
  printf( expected );
  sp();
  printf( z );
  cr();
  return;
}

void sp()
{
 lda( 0x20 );
 jsr( 0xFFD2 );
 return;
}

void cr()
{
 lda( 0x0D );
 jsr( 0xFFD2 );
 return;
}
