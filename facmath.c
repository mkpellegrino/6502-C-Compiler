void main()
{
  data PAK = { "\n\nPRESS ANY KEY\n\n" };
  float x = 1.234;

  uint y = 2;
  float yFloat = 2.0;
  word yWord = 0x0002;
  int yInt = 2;

  printf( "FAC MATH A\n" );
  float z = ( x ** 2 ) + touint(y);
  disp(3.52276);

  z = ( x ** 2 ) -  touint(y);
  disp(-0.477244);

  z = ( x ** 2 ) *  touint(y);
  disp(3.04551);

  z = ( x ** 2 ) /  touint(y);
  disp(0.761378);

  z = ( x ** 2 ) ** touint(y);
  disp(2.31878);

  printf( "\nFAC MATH FAC\n" );
  z = ( x ** 2 ) + (1.0*y);
  disp(3.52276);

  z = ( x ** 2 ) - (1.0*y);
  disp(-0.477244);

  z = ( x ** 2 ) * (1.0*y);
  disp(3.04551);

  z = ( x ** 2 ) / (1.0*y);
  disp(0.761378);

  z = ( x ** 2 ) ** (1.0*y);
  disp(2.31878);


  
  printf( "\nFAC MATH FLOATID\n" );

  z = ( x ** 2 ) + yFloat;
  disp(3.52276);

  z = ( x ** 2 ) - yFloat;
  disp(-0.477244);

  z = ( x ** 2 ) * yFloat;
  disp(3.04551);

  z = ( x ** 2 ) / yFloat;
  disp(0.761378);

  z = ( x ** 2 ) ** yFloat;
  disp(2.31878);

  myPause();


  printf( "\nFAC MATH FLOATIMM\n" );

  z = ( x ** 2 ) + 2.0;
  disp(3.52276);

  z = ( x ** 2 ) - 2.0;
  disp(-0.477244);

  z = ( x ** 2 ) * 2.0;
  disp(3.04551);

  z = ( x ** 2 ) / 2.0;
  disp(0.761378);

  z = ( x ** 2 ) ** 2.0;
  disp(2.31878);

  
  printf( "\nFAC MATH XA\n" );

  z = ( x ** 2 ) + toword(yWord);
  disp(3.52276);

  z = ( x ** 2 ) - toword(yWord);
  disp(-0.477244);

  z = ( x ** 2 ) * toword(yWord);
  disp(3.04551);

  z = ( x ** 2 ) / toword(yWord);
  disp(0.761378);

  z = ( x ** 2 ) ** toword(yWord);
  disp(2.31878);


  printf( "\nFAC MATH INTIMM\n" );

  z = ( x ** 2 ) + -2;
  disp(-0.477244);

  z = ( x ** 2 ) - -2;
  disp(3.522756);

  z = ( x ** 2 ) * -2;
  disp(-3.045512);

  z = ( x ** 2 ) / -2;
  disp(-0.761378);

  z = ( x ** 2 ) ** -2;
  disp(0.43126);

  myPause();
  
  printf( "\nFAC MATH UINTIMM\n" );

  z = ( x ** 2 ) + 2;
  disp(3.52276);

  z = ( x ** 2 ) - 2;
  disp(-0.477244);

  z = ( x ** 2 ) * 2;
  disp(3.04551);

  z = ( x ** 2 ) / 2;
  disp(0.761378);

  z = ( x ** 2 ) ** 2;
  disp(2.31878);

  printf( "\nFAC MATH WORDIMM\n" );

  z = ( ( x ** 2 ) + 0x0004 ) - 2;
  disp(3.52276);

  z = ( x ** 2 ) - 0x0002;
  disp(-0.477244);

  z = ( x ** 2 ) * 0x0002;
  disp(3.04551);

  z = ( x ** 2 ) / 0x0002;
  disp(0.761378);

  z = ( x ** 2 ) ** 0x0002;
  disp(2.31878);

  printf( "\nFAC MATH UINTID\n" );

  z = ( x ** 2 ) + y;
  disp(3.52276);

  z = ( x ** 2 ) - y;
  disp(-0.477244);

  z = ( x ** 2 ) * y;
  disp(3.04551);

  z = ( x ** 2 ) / y;
  disp(0.761378);

  z = ( x ** 2 ) ** y;
  disp(2.31878);

  myPause();

  printf( "\nFAC MATH WORDID\n" );

  z = ( x ** 2 ) + yWord;
  disp(3.52276);

  z = ( x ** 2 ) - yWord;
  disp(-0.477244);

  z = ( x ** 2 ) * yWord;
  disp(3.04551);

  z = ( x ** 2 ) / yWord;
  disp(0.761378);

  z = ( x ** 2 ) ** yWord;
  disp(2.31878);

  
  printf( "\nFAC MATH INTID\n" );

  z = ( x ** 2 ) + yInt;
  disp(3.522756);

  z = ( x ** 2 ) - yInt;
  disp(-0.477244);

  z = ( x ** 2 ) * yInt;
  disp(3.045512);

  z = ( x ** 2 ) / yInt;
  disp(0.761378);

  z = ( x ** 2 ) ** yInt;
  disp(2.3187858355);

  return;
}

void myPause()
{
  prints( PAK );
  pause();
  return;
}

// argument is the expected value
void disp( float R )
{
  printf( R );
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
