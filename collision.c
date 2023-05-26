#include <stdio.h>

int main()
{
  cls();
  // player
  uint x = 80;
  uint y = 230;
  uint timer = 0;
  uint collisiontracker=0;

  word location = 0x040A;
  
  cursorxy( 20, 23 );
  
  mob sprite1 = { 0, 192, 0, 24, 0, 0, 24, 0, 0, 36, 0, 0, 36, 0, 0, 66, 0, 0, 66, 0, 0, 153, 0, 0, 153, 0, 0, 153, 0, 17, 24, 136, 18, 0, 72, 20, 0, 40, 24, 0, 24, 16, 0, 8, 32, 0, 4, 64, 0, 2, 64, 102, 2, 63, 153, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
  
  spriteset( 1 ); // turn on all sprites
  spritexy( 0, x, y );
  uint c = getin();
  while( c != 62 )
    {
      poke( location, 1 );
      if( timer == 0 )
	{
	  checkLeft();
	  checkRight();
	  bkgcoll();
	  poke( location, 32 );
	  location = location + 40;
	  if(location > 0x07E7)
	    {
	      location = 0x040A;
	    }
	}
      inc( timer );
      c = getin();
    }
  spriteset( 0 );
  clearkb();
  return;
}

void bkgcoll()
{
  uint coll = mobbkgcollision( 1 );
  cursorxy( 1,1 );
  if( coll > 0 )
    {
      printf( "COLLISION" );
    }
  else
    {
      printf( "         " );
    }

  return;
}

void checkLeft()
{
  if( c == 30 )
    {
      if( x > 23 )
	{
	  x = x - 2;
	  spritex( 0, x );
	}
    }
  return;
}

void checkRight()
{
  // move right if "o" is pressed and x < 240
  if( c == 38 )
    {
      if( x < 240 )
	{
	  x = x + 2;
	  spritex( 0, x );
	}
    }
  return;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}

