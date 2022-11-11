#include <stdio.h>

int main()
{

  uint oldbg = peek( 53281 );
  uint oldbd = peek( 53280 );
  
  poke( 53280, 0 );
  poke( 53281, 0 );
  cls();


  intro();

  uint g1 = 0;
  uint g2 = 0;
  uint g3 = 0;
  g1 = rnd(1);
  g2 = rnd(2);
  g3 = rnd(3);
  
  mob sprite1 = { 0, 192, 0, 24, 0, 0, 24, 0, 0, 36, 0, 0, 36, 0, 0, 66, 0, 0, 66, 0, 0, 153, 0, 0, 153, 0, 0, 153, 0, 17, 24, 136, 18, 0, 72, 20, 0, 40, 24, 0, 24, 16, 0, 8, 32, 0, 4, 64, 0, 2, 64, 102, 2, 63, 153, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  mob sprite2 = { 1, 193, 0, 96, 0, 0, 96, 0, 0, 0, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0 };

  mob tf1 = { 2, 194, 64, 0, 2, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 62, 5, 160, 65, 5, 160, 156, 133, 160, 162, 133, 159, 85, 121, 128, 73, 1, 159, 85, 121, 160, 162, 133, 160, 156, 133, 160, 65, 5, 160, 62, 5, 160, 34, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 64, 0, 2 };

  mob tf2 = { 3, 195, 64, 0, 2, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 62, 5, 160, 65, 5, 160, 156, 133, 160, 162, 133, 159, 85, 121, 128, 73, 1, 159, 85, 121, 160, 162, 133, 160, 156, 133, 160, 65, 5, 160, 62, 5, 160, 34, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 64, 0, 2 };

  mob tf3 = { 4, 196, 64, 0, 2, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 62, 5, 160, 65, 5, 160, 156, 133, 160, 162, 133, 159, 85, 121, 128, 73, 1, 159, 85, 121, 160, 162, 133, 160, 156, 133, 160, 65, 5, 160, 62, 5, 160, 34, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 64, 0, 2 };

  mob alm1 = { 5, 197, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0 };

  mob alm2 = { 6, 198, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0 };

  mob alm3 = { 7, 199, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0 };

  
  //mob sprite3 = { 2, 194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 96, 6, 0, 96, 1, 129, 128, 1, 129, 128, 7, 255, 224, 7, 255, 224, 30, 126, 120, 30, 126, 120, 127, 255, 254, 127, 255, 254, 102, 0, 102, 102, 0, 102, 102, 0, 102, 102, 0, 102, 1, 231, 128, 1, 231, 128 };
  
  //mob sprite4 = { 3, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 96, 6, 0, 96, 1, 129, 128, 1, 129, 128, 7, 255, 224, 7, 255, 224, 30, 126, 120, 30, 126, 120, 127, 255, 254, 127, 255, 254, 102, 0, 102, 102, 0, 102, 102, 0, 102, 102, 0, 102, 1, 231, 128, 1, 231, 128 };

  //mob sprite5 = { 4, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 96, 6, 0, 96, 1, 129, 128, 1, 129, 128, 7, 255, 224, 7, 255, 224, 30, 126, 120, 30, 126, 120, 127, 255, 254, 127, 255, 254, 102, 0, 102, 102, 0, 102, 102, 0, 102, 102, 0, 102, 1, 231, 128, 1, 231, 128 };

  //uint arg = 0;
  //uint ret = 0;


  
  uint missle = 1;
  uint ship = 0;
  uint alien1 = 2;
  uint alien2 = 3;
  uint alien3 = 4;
  uint alien1m = 5;
  uint alien2m = 6;
  uint alien3m = 7;

  uint a1fire = 0;
  uint a2fire = 0;
  uint a3fire = 0;


  uint level = 0;
  
  // player
  uint x = 80;
  uint y = 230;


  // alien 1
  uint x2 = 80;
  uint y2 = 60;

  uint kills = 0;
  // alien 2
  uint x3 = 80;
  uint y3 = 85;

  // alien 3
  uint x4 = 80;
  uint y4 = 110;
  
  uint playerspeed = 4;
  uint misslespeed = 4;

  
  uint alienmisslespeed = 4;
  
  uint alien1speed = 2;
  uint alien1direction = 20;
  uint alien1distance = 20;

  uint alien2speed = 3; // was 4
  uint alien2direction = 30;
  uint alien2distance = 30;

  uint alien3speed = 4;  // was 6
  uint alien3direction = 40;
  uint alien3distance = 40;

  uint s = rnd(1);

  float score = 1.0;
  score = score - 1.0;

  

  spritecolour( 0, 15 );
  spritecolour( 1, 15 );
  
  for( uint i = 2; i < 8; i = i + 1 )
    {
      spritecolour( i, 10 );
    }

  
  
  
  // Hx  K    Dc 
  // 3E (Q) = 62   Quit
  // 3C ( ) = 60   Fire
  // 1E (U) = 30   <--
  // 26 (O) = 38   -->
  // 21 (I) = 33    ^
  // 25 (K) = 37    v
  // 40 ()  = 64   No Keypress
  // 2D ({) = 45 
  // 32 (}) = 50
  uint firey = 0;
  uint c = 0;
  uint timer = 0;
  levelup();
  spriteset( 255 );
  spritexy( ship, x, y );
  spritexy( missle, 80, 200 );
  spritexy( alien1, x2, y2 );
  spritexy( alien2, x3, y3 );
  spritexy( alien3, x4, y4 );
  c = getin();
  while( c != 62 )
    {
      if( timer == 0 )
	{
	  checkLeft();
	  checkRight();
	  checkFire();
	  updateMisslePosition();
	  updateAlienMisslePosition();
	  alienFire();
	  updateAlienPosition();
	  updateStats();
	  checkAlienHit();
	}
      
      timer = timer + 1;

      c = getin();
    }

  /* restore screen colours */
  poke( 53280, oldbd );
  poke( 53281, oldbg );
  return;
}

int checkFire()
{
  if( c == 60 )
    {
      if( firey == 0 )
	{
	  spriteon( 2 );
	  spritex( missle, x );
	  spritey( missle, 240 );
	  firey = 240;
	}
    }
  return;
}

int checkAlienHit()
{
  uint f = spritecollision();
  
  if( f == 6 )
    {
      cleanscore();
      score = score + 100.0;
      kills = kills + 1;
      spritey( missle, 0 );
      spriteoff( 2 );
      firey=0;
      s = rnd(1);
      x2 = x2 + s;
    }
  
  if( f == 10 )
    {
      cleanscore();
      score = score + 150.0;
      kills = kills + 1;
      spritey( missle, 0 );
      spriteoff( 2 );

      firey=0;
      s = rnd(1);
      spriteoff( 2 );
      x3 = x3 + s;
    }

  if( f == 18 )
    {
      cleanscore();
      score = score + 200.0;
      kills = kills + 1;
      spriteoff( 2 );
      spritey( missle, 0 );
      firey=0;
      s = rnd(1);
      x4 = x4 + s;
    }
  
  if( f == 33 )
    {
      cleanscore();
      score = score - 100.0;
      a1fire = 254;
      spriteoff( 32 );
      spritey( alien1m, 254 );
    }

  if( f == 65 )
    {
      cleanscore();
      score = score - 150.0;
      a2fire = 254;
      spriteoff( 64 );
      spritey( alien2m, 254 );
    }

  if( f == 129 )
    {
      cleanscore();
      score = score - 200.0;
      a1fire = 254;
      spriteoff( 128 );
      spritey( alien3m, 254 );
    }

  if( kills == 8 )
    {
      kills = 0;
      levelup();
      spriteset(255);
    }
  return;
}

int updateAlienPosition()
{
  if( alien1distance > 0 )
    {
      if( alien1direction > 128 )
	{
	  x2 = x2 + alien1speed;
	}
      else
	{
	  x2 = x2 - alien1speed;
	}      
      alien1distance = alien1distance - 1;
      spritex( alien1, x2 );

    }
  else
    {
      alien1distance = rnd(1);
      alien1direction = rnd(1);
    }

  if( alien2distance > 0 )
    {
      if( alien2direction > 128 )
	{
	  x3 = x3 + alien2speed;
	}
      else
	{
	  x3 = x3 - alien2speed;
	}
      alien2distance = alien2distance - 1;
      spritex( alien2, x3 );

    }
  else
    {
      alien2distance = rnd(1);
      alien2direction = rnd(1);
    }


 if( alien3distance > 0 )
    {
      if( alien3direction > 128 )
	{
	  x4 = x4 + alien3speed;
	}
      else
	{
	  x4 = x4 - alien3speed;
	}      
      alien3distance = alien3distance - 1;

      spritex( alien3, x4 );

    }
  else
    {
      alien3distance = rnd(1);
      alien3direction = rnd(1);
    }
  
  return;
}

int checkLeft()
{
  // move left if "u" is pressed and x > 20
  if( c == 30 )
    {
      if( x > 23 )
	{
	  x = x - playerspeed;
	  spritex( ship, x );

	}
    }
  return;
}

int checkRight()
{
  // move right if "o" is pressed and x < 240
  if( c == 38 )
    {
      if( x < 240 )
	{
	  x = x + playerspeed;
	  spritex( ship, x );
	}
    }
  return;
}

int updateStats()
{
  if( timer == 0 )
    {
      cursorxy( 31, 3 );
      printf( "SCORE" );
      cursorxy( 31, 4 );
      printf( score );

      cursorxy( 31, 6 );
      printf( "KILLS" );
      cursorxy( 33, 7 );
      printf( kills );
    }
  return;
}

int updateMisslePosition()
{
  if( firey > 0 )
    {
      firey = firey - misslespeed;
      spritey( missle, firey );
    }
  return;
}

int alienFire()
{
  if( a1fire > 240 )
    {
      g1 = rnd(1);
      if( g1 > 250 )
	{
	  spriteon( 32 );
	  spritex( alien1m, x2 );
	  a1fire = 60;
	}
    }
  if( a2fire > 240 )
    {
      g2 = rnd(1);
      if( g2 > 250 )
	{
	  spriteon( 64 );
	  spritex( alien2m, x3 );
	  a2fire = 85;
	}
    }
  if( a3fire > 250 )
    {
      g3 = rnd(1);
      if( g3 > 240 )
	{
	  spriteon( 128 );

	  spritex( alien3m, x4 );
	  a3fire = 110;
	}
    }
  return;
}

int updateAlienMisslePosition()
{
  
  if( a1fire < 240 )
    {
      a1fire = a1fire + alienmisslespeed;
      spritey( alien1m, a1fire );
    }
  
  if( a1fire >= 240 )
    {
      a1fire = 254;
      spriteoff( 32 );
      spritey( alien1m, 254 );
    }
  
  if( a2fire < 240 )
    {
      a2fire = a2fire + alienmisslespeed;
      spritey( alien2m, a2fire );
    }
    
  if( a2fire >= 240 )
    {
      a2fire = 254;
      spriteoff( 64 );
      spritey( alien2m, 254 );
    }

  if( a3fire <240 )
    {
      a3fire = a3fire + alienmisslespeed;
      spritey( alien3m, a3fire );
    }
  
  if( a3fire >= 240 )
    {
      a3fire = 254;
      spriteoff( 128 );

      spritey( alien3m, 254);
    }

  return;
}

int cleanscore()
{
  cursorxy( 31, 4 );
  printf( "           " );
  cursorxy( 34, 7 );
  return;
}

int levelup()
{
  level = level + 1;
  spriteset(0);
  cls();
  cursorxy( 13, 6 );
  printf( "LEVEL " );
  printf( level );
  cursorxy( 8, 10 );
  printf( "PRESS ENTER TO BEGIN!!!" );
  pause();
  cls();
  alienmisslespeed = alienmisslespeed + 1;
  
  alien1speed = alien1speed + 1;
  alien2speed = alien2speed + 1;
  alien3speed = alien3speed + 1;

  y2 = y2 + 5;
  y3 = y3 + 5;
  y4 = y4 + 5;
  
  return;
}

int intro()
{
  cls();

  cursorxy( 13, 6 );
  printf( "THREE-ON-ONE" );
  cursorxy( 9, 8 );
  printf( "BY MICHAEL PELLEGRINO" );
  cursorxy( 8, 10 );
  printf( "PRESS ENTER TO BEGIN!!!" );
  cursorxy( 11, 13 );
  printf( "<-- (U) (O) -->" );
  cursorxy( 9, 15 );
  printf( "(Q)UIT   (SPACE) FIRE" );
  pause();
  return;
}

int pause()
{
  scanf( " " );
  return;
}
