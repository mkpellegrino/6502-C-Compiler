#include <stdio.h>


void main()
{
  int myY;
  // clear the hires screen
  for( word mem1 = 0x2000; mem1 < 0x3FFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }



  uint oldD011 = peek( 0xD011 );
  uint oldD016 = peek( 0xD016 );
  uint oldD018 = peek( 0xD018 );
  uint oldD020 = peek( 0xD020 );
  uint oldD021 = peek( 0xD021 );
  uint oldChar = peek( 0x0286 );
  // set multicolour bitmap mode
  poke( 0xD011, 59 ); 
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );
      
  // set bg and fg colours
  poke( 0xD020, 0 );      
  poke( 0xD021, 0 );      


  uint x = 10;
  uint y = 10;
  
  uint POINT = getxy( x, y );
  

  
  printf( POINT );
  cr();
  pause();
  
  plot( x, y );
  inc(x);
  plot( x, y );
  
  POINT = getxy( x, y );
  
  printf( POINT );
  
  pause();
  clearkb();
      
  poke( 0xD011, oldD011 );
  poke( 0xD016, oldD016 );
  poke( 0xD018, oldD018 );
  poke( 0xD020, oldD020 );
  poke( 0xD021, oldD021 );
  poke( 0x0286, oldChar );

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

void pause()
{
  poke( 198, 0 );
  jsr( 65508 );

  uint pausev = getchar();
  while( pausev == 0 )
    {
      pausev = getchar();
    }
  return;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}
