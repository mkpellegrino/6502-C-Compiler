void main()
{

  uint num = 0x30;
  
  uint BDR = peek( 0xD020 );

  float zerofloat = 0.0;
  word zeroword = 0x0000;
  uint xuint = 18;
  uint yuint = 5;
  int xint = 14;
  int yint = 16;
  word xword = 0x0009;
  word yword = 0x0004;
  float xfloat = 3.0;
  float yfloat = 23.0;

  
  data T0 = { "A" };
  data T1 = { "FAC" };
  data T2 = { "FLOATID" };
  data T3 = { "FLOATIMM" };
  data T4 = { "INTID" };
  data T5 = { "INTIMM" };
  data T6 = { "UINTID" };
  data T7 = { "UINTIMM" };
  data T8 = { "WORDID" };
  data T9 = { "WORDIMM" };
  data TA = { "XA" };

  data doneText = { "\nDONE.\n" };

  testA();
 
  testFAC();

  testFloatID();

  testFloatIMM();

  testIntID();

  testUintID();

  testUintIMM();

  testWordID();

  testWordIMM();

  testXA();

  cls();

  prints( doneText );
  
  poke( 0xD020, BDR );
  return;
}

void testXA()
{
  grid();

  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( TA );

  // 28,18
  cursorxy( toword(0x001C), touint(18) );
  star();

  // 24,22
  cursorxy( toword(0x0018), 22.0 + zerofloat );
  star();

  // 19, 23
  cursorxy( toword(0x0013), yfloat);
  star();

  // 13, 21
  cursorxy( toword(0x000D), 21.0 );
  star();

  // 10, 16
  cursorxy( toword(0x000A), yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  cursorxy( toword(0x000D), yuint);
  star();

  // 19, 3
  cursorxy( toword(0x0013), 0x03);
  star();

  // 24, 4
  cursorxy( toword(0x0018), yword );
  star();

  // 28, 8
  cursorxy( toword(0x001C), 0x0008 );
  star();

  // 30, 13
  cursorxy( toword(0x001E), toword( 0x000D ));
  star();

  pause();

  return;
}

void testWordIMM()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T9 );

  // 28,18
  cursorxy( 0x001C, touint(18) );
  star();

  // 24,22
  cursorxy( 0x0018, 22.0 + zerofloat );
  star();

  // 19, 23
  cursorxy( 0x0013, yfloat);
  star();

  // 13, 21
  cursorxy( 0x000D, 21.0 );
  star();

  // 10, 16
  cursorxy( 0x000A, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  cursorxy( 0x000D, yuint);
  star();

  // 19, 3
  cursorxy( 0x0013, 0x03);
  star();

  // 24, 4
  cursorxy( 0x0018, yword );
  star();

  // 28, 8
  cursorxy( 0x001C, 0x0008 );
  star();

  // 30, 13
  cursorxy( 0x001E, toword( 0x000D ));
  star();

  pause();

  return;
}


void testWordID()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T8 );

  // 28,18
  xword = 28;
  cursorxy( xword, touint(18) );
  star();

  // 24,22
  xword = 24;
  cursorxy( xword, 22.0 + zerofloat );
  star();

  // 19, 23
  xword = 19;
  cursorxy( xword, yfloat);
  star();

  // 13, 21
  xword = 13;
  cursorxy( xword, 21.0 );
  star();

  // 10, 16
  xword = 10;
  cursorxy( xword, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  xword = 13;
  cursorxy( xword, yuint);
  star();

  // 19, 3
  xword = 19;
  cursorxy( xword, 0x03);
  star();

  // 24, 4
  xword = 24;
  cursorxy( xword, yword );
  star();

  // 28, 8
  xword = 28;
  cursorxy( xword, 0x0008 );
  star();

  // 30, 13
  xword = 30;
  cursorxy( xword, toword( 0x000D ));
  star();

  pause();

  return;
}


void testUintIMM()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T7 );

  // 28,18
  cursorxy( 28, touint(18) );
  star();

  // 24,22
  cursorxy( 24, 22.0 + zerofloat );
  star();

  // 19, 23
  cursorxy( 19, yfloat);
  star();

  // 13, 21
  cursorxy( 13, 21.0 );
  star();

  // 10, 16
  cursorxy( 10, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  cursorxy( 13, yuint);
  star();

  // 19, 3
  cursorxy( 19, 0x03);
  star();

  // 24, 4
  cursorxy( 24, yword );
  star();

  // 28, 8
  cursorxy( 28, 0x0008 );
  star();

  // 30, 13
  cursorxy( 30, toword( 0x000D ));
  star();

  pause();

  return;
}

void testUintID()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T6 );

  // 28,18
  xuint = 28;
  cursorxy( xuint, touint(18) );
  star();

  // 24,22
  xuint = 24;
  cursorxy( xuint, 22.0 + zerofloat );
  star();

  // 19, 23
  xuint = 19;
  cursorxy( xuint, yfloat);
  star();

  // 13, 21
  xuint = 13;
  cursorxy( xuint, 21.0 );
  star();

  // 10, 16
  xuint = 10;
  cursorxy( xuint, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  xuint = 13;
  cursorxy( xuint, yuint);
  star();

  // 19, 3
  xuint = 19;
  cursorxy( xuint, 0x03);
  star();

  // 24, 4
  xuint = 24;
  cursorxy( xuint, yword );
  star();

  // 28, 8
  xuint = 28;
  cursorxy( xuint, 0x0008 );
  star();

  // 30, 13
  xuint = 30;
  cursorxy( xuint, toword( 0x000D ));
  star();

  pause();

  return;
}



void testIntID()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T4 );

  // 28,18
  xint = 28;
  cursorxy( xint, touint(18) );
  star();

  // 24,22
  xint = 24;
  cursorxy( xint, 22.0 + zerofloat );
  star();

  // 19, 23
  xint = 19;
  cursorxy( xint, yfloat);
  star();

  // 13, 21
  xint = 13;
  cursorxy( xint, 21.0 );
  star();

  // 10, 16
  xint = 10;
  cursorxy( xint, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  xint = 13;
  cursorxy( xint, yuint);
  star();

  // 19, 3
  xint = 19;
  cursorxy( xint, 0x03);
  star();

  // 24, 4
  xint = 24;
  cursorxy( xint, yword );
  star();

  // 28, 8
  xint = 28;
  cursorxy( xint, 0x0008 );
  star();

  // 30, 13
  xint = 30;
  cursorxy( xint, toword( 0x000D ));
  star();

  pause();

  return;
}


void testFloatIMM()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T3 );

  // 28,18
  cursorxy( 28.0, touint(18) );
  star();

  // 24,22
  cursorxy( 24.0, 22.0 + zerofloat );
  star();

  // 19, 23
  cursorxy( 19.0, yfloat);
  star();

  // 13, 21
  cursorxy( 13.0, 21.0 );
  star();

  // 10, 16
  cursorxy( 10.0, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  cursorxy( 13.0, yuint);
  star();

  // 19, 3
  cursorxy( 19.0, 0x03);
  star();

  // 24, 4
  cursorxy( 24.0, yword );
  star();

  // 28, 8
  cursorxy( 28.0, 0x0008 );
  star();

  // 30, 13
  cursorxy( 30.0, toword( 0x000D ));
  star();

  pause();

  return;
}

void testFloatID()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T2 );

  // 28,18
  xfloat = 28.0;
  cursorxy( xfloat, touint(18) );
  star();

  // 24,22
  xfloat = 24.0;
  cursorxy( xfloat, 22.0 + zerofloat );
  star();

  // 19, 23
  xfloat = 19.0;
  cursorxy( xfloat, yfloat);
  star();

  // 13, 21
  xfloat = 13.0;
  cursorxy( xfloat, 21.0 );
  star();

  // 10, 16
  xfloat = 10.0;
  cursorxy( xfloat, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  xfloat = 13.0;
  cursorxy( xfloat, yuint);
  star();

  // 19, 3
  xfloat = 19.0;
  cursorxy( xfloat, 0x03);
  star();

  // 24, 4
  xfloat = 24.0;
  cursorxy( xfloat, yword );
  star();

  // 28, 8
  xfloat = 28.0;
  cursorxy( xfloat, 0x0008 );
  star();

  // 30, 13
  xfloat = 30.0;
  cursorxy( xfloat, toword( 0x000D ));
  star();

  pause();

  return;
}

void testFAC()
{
  grid();

  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T1 );

  // 28,18
  cursorxy( 28.0 + zerofloat, touint(18) );
  star();

  // 24,22
  cursorxy( 24.0 + zerofloat, xfloat + 19.0);
  star();

  // 19, 23
  cursorxy( 19.0 + zerofloat, yfloat);
  star();

  // 13, 21
  cursorxy( 13.0 + zerofloat, 21.0 );
  star();

  // 10, 16
  cursorxy( 10.0 + zerofloat, yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  cursorxy( 13.0 + zerofloat, yuint);
  star();

  // 19, 3
  cursorxy( 19.0 + zerofloat, 0x03);
  star();

  // 24, 4
  cursorxy( 24.0 + zerofloat, yword );
  star();

  // 28, 8
  cursorxy( 28.0 + zerofloat, 0x0008 );
  star();

  // 30, 13
  cursorxy( 30.0 + zerofloat, toword( 0x000D ));
  star();

  pause();

  return;
}

void testA()
{
  grid();
  
  // 15 19 20 18 13 -7- 2 0 1 5 10 
  // A FAC FLOATID FLOATIMM INTID INTIMM
  // UINTID UINTIMM WORDID WORDIMM XA
  // A
  cursorxy(5,2);
  prints( T0 );

  // 28,18
  cursorxy( touint(28), touint(18) );
  star();

  // 24,22
  cursorxy( touint(24), xfloat + 19.0);
  star();

  // 19, 23
  cursorxy( touint(19), yfloat);
  star();

  // 13, 21
  cursorxy( touint(13), 21.0 );
  star();

  // 10, 16
  cursorxy( touint(10), yint);
  star();

  // 10, 10 (A, INTIMM)
  //cursorxy( touint(10, -10);
  //star();

  // 13, 5
  cursorxy( touint(13), yuint);
  star();

  // 19, 3
  cursorxy( touint(19), 0x03);
  star();

  // 24, 4
  cursorxy( touint(24), yword );
  star();

  // 28, 8
  cursorxy( touint(28), 0x0008 );
  star();

  // 30, 13
  cursorxy( touint(30), toword( 0x000D) );
  star();

  pause();

  return;
}

void grid()
{
  inc( 0xD020 );
  cls();
  num = 0x30;
  // change these to uints later
  cursorxy( 0.0, 0.0 );
  printf( "012345678901234567890123456789012345678\n" );
  for( uint l = 1; l < 24; inc(l) )
    {
      printf( l );
      cr();
    }
  return;
}
  
  
void star()
{
  lda( num );
  jsr( 0xFFD2 );
  inc( num );
  return;
}

void cr()
{
  lda( 0x0D );
  jsr( 0xFFD2 );
  return;
}

void sp()
{
  lda( 0x20 );
  jsr( 0xFFD2 );
  return;
}
