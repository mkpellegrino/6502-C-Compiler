#include <stdio.h>

int main()
{
  mob sprite0 = { 0, 192, 0, 96, 0, 0, 224, 0, 1, 224, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 1, 248, 0, 1, 248, 0 };
  

  mob sprite1 = { 1, 193, 0, 126, 0, 0, 255, 0, 1, 129, 128, 0, 1, 128, 0, 1, 128, 0, 3, 0, 0, 6, 0, 0, 12, 0, 0, 24, 0, 0, 48, 0, 0, 96, 0, 0, 192, 0, 1, 128, 0, 1, 255, 128, 1, 255, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };


  mob sprite2 = { 2, 194, 0, 0, 0, 0, 0, 0, 1, 192, 0, 2, 32, 0, 0, 32, 0, 0, 192, 0, 0, 32, 0, 2, 32, 0, 1, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  mob sprite3 = { 3, 195, 0, 0, 0, 0, 0, 0, 0, 96, 0, 12, 96, 0, 12, 96, 0, 12, 96, 0, 12, 96, 0, 15, 248, 0, 15, 248, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  uint i=0; 
  for( i=0; i<4; i = i + 1 )
  { 
    spritecolour( i, 15 );
  }

  spritexy( 0, 40, 60 );
  spritexy( 1, 80, 60 );
  spritexy( 2, 120, 60 );
  spritexy( 3, 160, 60 );
  

  printf( "SPRITEON & SPRITEOFF\n" );
  spriteon( 1 );
  pressenter();
  spriteon( 2 );
  pressenter();
  spriteon( 4 );
  pressenter();
  spriteon( 8 );
  pressenter();
  spriteoff( 4 );
  pressenter();
  spriteoff( 3 );
  pressenter();
  
  printf( "SPRITESET\n" );
  spriteset( 10 );
  pressenter();
  spriteset( 5 );
  pressenter();
  spriteset( 15 );  
  pressenter();

  printf( "SPRITETOGGLE\n" );
  spritetoggle( 3 );
  pressenter();
  spritetoggle( 3 );
  pressenter();
  
  spritetoggle( 12 );
  pressenter();
  spritetoggle( 12 );
  pressenter();
  spritetoggle( 15 );
  pressenter();


  printf( "NOW WITH VARIABLES\n" );
  pressenter();
  printf( "SPRITEON & SPRITEOFF\n" );

  uint s = 1;
  while( s < 9 )
    {
      spriteon( s );
      pressenter();
      asl( s );
    }

  s = 4;
  spriteoff( s );
  pressenter();

  s = 3;
  spriteoff( s );
  pressenter();
  
  printf( "SPRITESET\n" );
  s = 10;
  spriteset( s );
  pressenter();
  s = 5;
  spriteset( s );
  pressenter();
  s = 15;
  spriteset( s );  
  pressenter();

  printf( "SPRITETOGGLE\n" );
  s = 3;
  spritetoggle( s );
  pressenter();
  spritetoggle( s );
  pressenter();

  s = 12;
  spritetoggle( s );
  pressenter();
  spritetoggle( s );
  pressenter();
  s = 15;
  spritetoggle( s );
  

  
  printf( "DONE\n" );
  return;
}

int pressenter()
{
  scanf( " " );
  return;
}
