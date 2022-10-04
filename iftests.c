#include <stdio.h>
int main()
{
  int x=10;
  if( x <= 20 )
    {
      printf( "<= PASS" );
    }
  else
    {
      printf( "<= F" );
    }
  if( x <= 10 )
    {
      printf( "<= PASS" );
    }
  else
    {
      printf( "<= F" );
    }
  if( x <= 5 )
    {
      printf( "<= F" );
    }
  else
    {
      printf( "<= PASS" );
    }
  printf( "PRESS ENTER" );
  scanf(" ");
  printf( " " );
  if( x < 20 )
    {
      printf( "<  PASS" );
    }
  else
    {
      printf( "<  F" );
    }
  if( x <= 10 )
    {
      printf( "<  PASS" );
    }
  else
    {
      printf( "<  F" );
    }
  if( x <= 5 )
    {
      printf( "<  F" );
    }
  else
    {
      printf( "<  PASS" );
    }
  printf( "PRESS ENTER" );
  scanf(" ");
  printf( " " );
  if( x > 5 )
    {
      printf( ">  PASS" );
    }
  else
    {
      printf( ">  F" );
    }
  if( x > 10 )
    {
      printf( ">  F" );
    }
  else
    {
      printf( ">  PASS" );
    }

  if( x > 11 )
    {
      printf( ">  F" );
    }
  else
    {
      printf( ">  PASS" );
    }
  printf( "PRESS ENTER" );
  scanf(" ");
  printf( " " );
  if( x >= 5 )
    {
      printf( ">= PASS" );
    }
  else
    {
      printf( ">= F" );
    }
  if( x >= 10 )
    {
      printf( ">= PASS" );
    }
  else
    {
      printf( ">= F" );
    }

  if( x >= 11 )
    {
      printf( ">= F" );
    }
  else
    {
      printf( ">= PASS" );
    }
  printf( "PRESS ENTER" );
  scanf(" ");
  printf( " " );
  if( x == 5 )
    {
      printf( "== F" );
    }
  else
    {
      printf( "== PASS" );
    }
  if( x == 10 )
    {
      printf( "== PASS" );
    }
  else
    {
      printf( "== F" );
    }
  if( x == 11 )
    {
      printf( "== F" );
    }
  else
    {
      printf( "== PASS" );
    }
  printf( "PRESS ENTER" );
  scanf(" ");
  printf( " " );
  if( x != 5 )
    {
      printf( "!= PASS" );
    }
  else
    {
      printf( "!= F" );
    }
  if( x != 10 )
    {
      printf( "!= F" );
    }
  else
    {
      printf( "!= PASS" );
    }
  if( x != 11 )
    {
      printf( "!= PASS" );
    }
  else
    {
      printf( "!= F" );
    }
  printf( "PRESS ENTER" );
  scanf(" ");
  printf( " " );


  printf( "NOW FOR THE FOR-LOOP TESTS: PRESS ENTER" );
  scanf(" ");
  for( int i=0; i<10; i= i + 1 )
    {
      printf( "FOR( INT I=0; I<10; I=I+1)" );
    }
  printf( "PRESS ENTER" );
  scanf( " " );
  printf( " " );


  for( int j=0; j<=10; j= j + 1 )
    {
      printf( "FOR( INT I=0; I<=10; I=I+1)" );
    }
  printf( "PRESS ENTER" );
  scanf( " " );
  printf( " " );



  for( int k=10; k>3; k= k - 1 )
    {
      printf( "FOR( INT I=10; I>3; I=I-1)" );
    }
  printf( "PRESS ENTER" );
  scanf( " " );
  printf( " " );

  for( int l=10; l>=3; l= l - 1 )
    {
      printf( "FOR( INT I=10; I>=3; I=I-1)" );
    }
  printf( "PRESS ENTER" );
  scanf( " " );
  printf( " " );

  for( int m=0; m<10; m= m + 3 )
    {
      printf( "FOR( INT I=0; I<10; I=I+3)" );
    }
  printf( "PRESS ENTER" );
  scanf( " " );
  printf( " " );

  for( int n=10; n>=3; n= n - 2 )
    {
      printf( "FOR( INT I=10; I>=3; I=I-2)" );
    }
  printf( "PRESS ENTER" );
  scanf( " " );
  printf( " " );
  
  
  printf( "DONE" );
  return;
}
