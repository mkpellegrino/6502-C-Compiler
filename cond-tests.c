#include <stdio.h>
int main()
{
  int x=10;
  printf( "10 <= 20: " );
  if( x <= 20 )
    {
      pass();
    }
  else
    {
      fail();
    }
  printf( "10 <= 10: ");
  if( x <= 10 )
    {
      pass();
    }
  else
    {
      fail();
    }
  printf( "10 <= 5: " );
  if( x <= 5 )
    {
      fail();
    }
  else
    {
      pass();
    }

  x  = -10;

  printf( "-10 <= 20: " );
  if( x <= 20 )
    {
      pass();
    }
  else
    {
      fail();
    }
  printf( "-10 <= -10: " );
  if( x <= -10 )
    {
      pass();
    }
  else
    {
      fail();
    }
  printf( "-10 <= -15: " );
  if( x <= -15 )
    {
      fail();
    }
  else
    {
      pass(); 
    }
  
  pause();

  x = 10;

  printf( "10 < 20: " );
  if( x < 20 )
    {
      pass();
    }
  else
    {
      fail();
    }

  printf( "10 < 10: " );
  if( x <  10 )
    {
      fail();
    }
  else
    {
      pass();
    }
  printf( "10 < 5: " );
  if( x < 5 )
    {
      fail();
    }
  else
    {
      pass();
    }
  pause();

  printf( "10 > 5: " );
  if( x > 5 )
    {
      pass();
    }
  else
    {
      fail();
    }
  printf( "10 > 10: " );
  if( x > 10 )
    {
      fail();
    }
  else
    {
      pass();
    }

  printf( "10 > 11: " );
  if( x > 11 )
    {
      fail();
    }
  else
    {
      pass();
    }
  pause();

  printf( "10 >= 5: "  );
  if( x >= 5 )
    {
      pass();
    }
  else
    {
      fail();
    }

  printf( "10 >= 10: " );
  if( x >= 10 )
    {
      pass();
    }
  else
    {
      fail();
    }

  printf( "10 >= 11: " );
  if( x >= 11 )
    {
      fail();
    }
  else
    {
      pass();
    }
  pause();

  printf( "10 == 5: " );
  if( x == 5 )
    {
      fail();
    }
  else
    {
      pass();
    }

  printf( "10 == 10: " );
  if( x == 10 )
    {
      pass();
    }
  else
    {
      fail();
    }
  printf( "10 == 11: " );
  if( x == 11 )
    {
      fail();
    }
  else
    {
      pass();
    }
  pause();

  printf( "10 != 5: " );
  if( x != 5 )
    {
      pass();
    }
  else
    {
      fail();
    }

  printf( "10 != 10: " );
  if( x != 10 )
    {
      fail();
    }
  else
    {
      pass();
    }

  printf( "10 != 11: " );
  if( x != 11 )
    {
      pass();
    }
  else
    {
      fail();
    }
  pause();


  printf( "NOW FOR THE FOR-LOOP TESTS\n" );
  pause();
  printf( "FOR(INT X=0; X<10; X=X+1)\n" );

  for( x=0; x<10; x=x + 1 )
    {
      byte2hex(x);
      space();
    }
  pause();


  printf( "FOR(INT I=0; I<=10; I=I+1)\n" );
  for(  x=0; x<=10; x=x + 1 )
    {
      byte2hex(x);
      space();
    }
  pause();



  printf( "FOR(INT I=10; I>3; I=I-1)\n" );
  for( x=10; x>3; x=x - 1 )
    {
      byte2hex(x);
      space();

    }
  pause();

  printf( "FOR(INT I=10; I>=3; I=I-1)\n" );
  for(  x=10; x>=3; x=x - 1 )
    {
      byte2hex(x);
      space();
    }
  pause();

  printf( "FOR(INT I=0; I<10; I=I+3)\n" );
  for(  x=0; x<10; x=x + 3 )
    {
      byte2hex( x );
      space();

    }
  pause();

  printf( "FOR(INT I=10; I>=-4; I=I-2)\n" );
  for(  x=10; x>=-4; x=x - 2 )
    {
      byte2hex( x );
      space();
    }
  
  pause();

  printf( "FOR(INT I=-10; I<3; I=I+1)\n" );
  for(  x=-10; x<3; x=x + 1 )
    {
      byte2hex( x );
      space();
    }

  pause();

  printf( "FOR(X=15; X>-4; X=X-1)\n" );
  for(  x = 15; x >-4; x = x - 1 )
    {
      byte2hex( x );
      space();
    }
  cr();
  cr();
  printf( "AND NOW FOR MATH TESTS\n" );
  pause();

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
  printf( "\nDONE.\n" );
  
  return;
}


int pause()
{
  printf( "\nPRESS ENTER\n" );
  scanf( " " );
  printf( "\n" );
  return;
}

int fail()
{
  printf( "FAIL\n" );
  return;
}

int pass()
{
  printf( "PASSED\n" );
  return;
}

int space()
{
  printf( " " );
  return;
}
int cr()
{
  printf( "\n" );
  return;
}
