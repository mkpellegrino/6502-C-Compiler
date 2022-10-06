#include <stdio.h>
int main()
{
  int x=10;
  if( x <= 20 )
    {
      printf( "10 <= 20            <= PASS\n" );
    }
  else
    {
      printf( "<= F\n" );
    }
  if( x <= 10 )
    {
      printf( "10 <= 10            <= PASS\n" );
    }
  else
    {
      printf( "<= F\n" );
    }
  if( x <= 5 )
    {
      printf( "<= F\n" );
    }
  else
    {
      printf( "10 IS NOT <= 5      <= PASS\n" );
    }

  int a  = -10;
  
 if( a <= 20 )
    {
      printf( "-10 <= 20           <= PASS\n" );
    }
  else
    {
      printf( "<= F\n" );
    }
  if( a <= -10 )
    {
      printf( "-10 <= -10          <= PASS\n" );
    }
  else
    {
      printf( "<= F\n" );
    }
  if( a <= -15 )
    {
      printf( "-10 <= -15          <= FAIL\n" );
    }
  else
    {
      printf( "-10 IS NOT <= -15   <= PASS\n" );
    }




  
  printf( "PRESS ENTER\n" );
  scanf(" ");
  printf( "\n" );
  if( x < 20 )
    {
      printf( "10 < 20             <  PASS\n" );
    }
  else
    {
      printf( "<  F\n" );
    }
  if( x <  10 )
    {
      printf( "<  F\n" );
    }
  else
    {
      printf( "10 IS NOT < 10      <  PASS\n" );
    }
  if( x < 5 )
    {
      printf( "<=  F\n" );
    }
  else
    {
      printf( "10 IS NOT < 5       <  PASS\n" );
    }
  printf( "PRESS ENTER\n" );
  scanf(" ");
  printf( "\n" );
  if( x > 5 )
    {
      printf( "10 > 5              >  PASS\n" );
    }
  else
    {
      printf( ">  F\n" );
    }
  if( x > 10 )
    {
      printf( ">  F\n" );
    }
  else
    {
      printf( "10 IS NOT > 10      >  PASS\n" );
    }

  if( x > 11 )
    {
      printf( ">  F\n" );
    }
  else
    {
      printf( "10 IS NOT > 11      >  PASS\n" );
    }
  printf( "PRESS ENTER\n" );
  scanf(" ");
  printf( "\n" );
  if( x >= 5 )
    {
      printf( "10 >= 5             >= PASS\n" );
    }
  else
    {
      printf( ">= F\n" );
    }
  if( x >= 10 )
    {
      printf( "10 >= 10            >= PASS\n" );
    }
  else
    {
      printf( ">= F\n" );
    }

  if( x >= 11 )
    {
      printf( ">= F\n" );
    }
  else
    {
      printf( "10 IS NOT >= 11     >= PASS\n" );
    }
  printf( "PRESS ENTER\n" );
  scanf(" ");
  printf( "\n" );
  if( x == 5 )
    {
      printf( "== F\n" );
    }
  else
    {
      printf( "10 IS NOT == 5      == PASS\n" );
    }
  if( x == 10 )
    {
      printf( "10 == 10            == PASS\n" );
    }
  else
    {
      printf( "== F\n" );
    }
  if( x == 11 )
    {
      printf( "== F\n" );
    }
  else
    {
      printf( "10 IS NOT == 11     == PASS\n" );
    }
  printf( "PRESS ENTER\n" );
  scanf(" ");
  printf( "\n" );
  if( x != 5 )
    {
      printf( "10 != 5             != PASS\n" );
    }
  else
    {
      printf( "!= F\n" );
    }
  if( x != 10 )
    {
      printf( "!= F\n" );
    }
  else
    {
      printf( "10 DOES == 10       != PASS\n" );
    }
  if( x != 11 )
    {
      printf( "10 != 11            != PASS\n" );
    }
  else
    {
      printf( "!= F\n" );
    }
  printf( "PRESS ENTER\n" );
  scanf(" ");
  printf( "\n" );


  printf( "NOW FOR THE FOR-LOOP TESTS: PRESS ENTER\n" );
  scanf(" ");
  printf( "FOR(INT I=0; I<10; I=I+1)\n" );
  for( int i=0; i<10; i= i + 1 )
    {
      byte2hex(i);
      printf( " " );
    }
  printf( "\nPRESS ENTER\n" );
  scanf( " " );
  printf( "\n" );


  printf( "FOR(INT I=0; I<=10; I=I+1)\n" );
  for( int j=0; j<=10; j= j + 1 )
    {
      byte2hex(j);
      printf( " " );
    }
  printf( "\nPRESS ENTER\n" );
  scanf( " " );
  printf( "\n" );



  printf( "FOR(INT I=10; I>3; I=I-1)\n" );
  for( int k=10; k>3; k= k - 1 )
    {
      byte2hex(k);
      printf( " " );

    }
  printf( "\nPRESS ENTER\n" );
  scanf( " " );
  printf( "\n" );

  printf( "FOR(INT I=10; I>=3; I=I-1)\n" );
  for( int l=10; l>=3; l= l - 1 )
    {
      byte2hex(l);
      printf( " " );
    }
  printf( "\nPRESS ENTER\n" );
  scanf( " " );
  printf( "\n" );

  printf( "FOR(INT I=0; I<10; I=I+3)\n" );
  for( int m=0; m<10; m= m + 3 )
    {
      byte2hex( m );
      printf( " " );

    }
  printf( "\nPRESS ENTER\n" );
  scanf( " " );
  printf( "\n" );

  printf( "FOR(INT I=10; I>=3; I=I-2)\n" );
  for( int n=10; n>=3; n= n - 2 )
    {
      byte2hex( n );
      printf( " " );
    }
  
  printf( "\nPRESS ENTER\n" );
  scanf( " " );
  printf( "\n" );

  printf( "FOR(INT O=-10; O<3; O=O+1)\n" );
  for( int o=-10; o<3; o=o + 1 )
    {
      byte2hex( o );
      printf( " " );
    }
  
  printf( "\nDONE.\n" );
  return;
}


