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

  printf( "DONE" );


  
  
  return;
}
