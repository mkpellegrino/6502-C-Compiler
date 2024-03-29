int main()
{
  saveregs();

  poke( 0xD020, 0 );
  poke( 0xD021, 0 );
  shortcls();
  intro();

  uint g1 = rnd(1);
  
  mob ship = { 1, 192, 0, 24, 0, 0, 24, 0, 0, 36, 0, 0, 36, 0, 0, 66, 0, 0, 66, 0, 0, 153, 0, 0, 153, 0, 0, 153, 0, 17, 24, 136, 18, 0, 72, 20, 0, 40, 24, 0, 24, 16, 0, 8, 32, 0, 4, 64, 0, 2, 64, 102, 2, 63, 153, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  mob missle = { 2, 193, 0, 96, 0, 0, 96, 0, 0, 0, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0, 0, 32, 0, 0, 64, 0 };

  mob alien1 = { 3, 194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 96, 6, 0, 96, 1, 129, 128, 1, 129, 128, 7, 255, 224, 7, 255, 224, 30, 126, 120, 30, 126, 120, 127, 255, 254, 127, 255, 254, 102, 0, 102, 102, 0, 102, 102, 0, 102, 102, 0, 102, 1, 231, 128, 1, 231, 128 };
  
  mob alien2 = { 4, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 96, 6, 0, 96, 1, 129, 128, 1, 129, 128, 7, 255, 224, 7, 255, 224, 30, 126, 120, 30, 126, 120, 127, 255, 254, 127, 255, 254, 102, 0, 102, 102, 0, 102, 102, 0, 102, 102, 0, 102, 1, 231, 128, 1, 231, 128 };

  mob alien3 = { 5, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 96, 6, 0, 96, 1, 129, 128, 1, 129, 128, 7, 255, 224, 7, 255, 224, 30, 126, 120, 30, 126, 120, 127, 255, 254, 127, 255, 254, 102, 0, 102, 102, 0, 102, 102, 0, 102, 102, 0, 102, 1, 231, 128, 1, 231, 128 };

  //mob tf1 = { 2, 194, 64, 0, 2, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 62, 5, 160, 65, 5, 160, 156, 133, 160, 162, 133, 159, 85, 121, 128, 73, 1, 159, 85, 121, 160, 162, 133, 160, 156, 133, 160, 65, 5, 160, 62, 5, 160, 34, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 64, 0, 2 };

  //mob tf2 = { 3, 195, 64, 0, 2, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 62, 5, 160, 65, 5, 160, 156, 133, 160, 162, 133, 159, 85, 121, 128, 73, 1, 159, 85, 121, 160, 162, 133, 160, 156, 133, 160, 65, 5, 160, 62, 5, 160, 34, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 64, 0, 2 };

  //mob tf3 = { 4, 196, 64, 0, 2, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 160, 62, 5, 160, 65, 5, 160, 156, 133, 160, 162, 133, 159, 85, 121, 128, 73, 1, 159, 85, 121, 160, 162, 133, 160, 156, 133, 160, 65, 5, 160, 62, 5, 160, 34, 5, 160, 0, 5, 160, 0, 5, 160, 0, 5, 64, 0, 2 };

  mob alien1m = { 6, 197, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0 };

  mob alien2m = { 7, 198, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0 };

  mob alien3m = { 8, 199, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 36, 0, 0, 36, 0 };


  lda( 0x00 );
  //uint ship;
  uint a1fire;
  uint a2fire;
  uint a3fire;
  uint level;
  uint kills;
  uint firey;
  uint timer;

  //uint missle = 1;


  lda( 0x02 );
  uint aspeed1;
  uint aspeed2;
  uint aspeed3;
  //uint alien1;
  
  //uint alien2 = 3;

  lda( 0x04 );
  //uint alien3;
  uint amspeed;

  lda( 0x05 );
  uint plyvel;
  uint missvel;
  //uint alien1m;
  
  //uint alien2m = 6;
  //uint alien3m = 7;

  
  // player
  uint y = 230;


  lda( 80 );
  uint x;
  uint x2;
  uint x3;
  uint x4;
      
  uint y2 = 60;

  // alien 2
  uint y3 = 85;

  // alien 3
  uint y4 = 110;
  

  lda( 20 );
  uint adir1;
  uint adist1;

  lda( 30 );
  uint adir2;
  uint adist2;

  lda( 40 );
  uint adir3;
  uint adist3;

  uint s = rnd(1);

  float score = 0.0;
  
  spritecolour( 0, 15 );
  spritecolour( 1, 15 );
  
  for( uint i = 2; i < 8; inc(i) )
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
  levelup();

  sidirq( 0x1000, 0x1003 );
  spriteset( 0xFF ); // turn on all sprites
  spritexy( ship, x, y );
  spritexy( missle, 80, 200 );
  spritexy( alien1, x2, y2 );
  spritexy( alien2, x3, y3 );
  spritexy( alien3, x4, y4 );
  uint c = getin();
  while( c != 62 )
    {
      if( timer == 0 )
	{
	  checkLeft();
	  checkRight();
	  checkFire();
	  uMissPos();
	  uAMissPos();
	  alienFire();
	  updateAlienPosition();
	  updateStats();
	  checkAlienHit();
	}
      inc( timer );
      c = getin();
    }

  /* restore screen colours */
  spriteset( 0 );
  clearkb();
  shortcls();
  poke( 646, 14 );
  cursorxy( 15, 11 );
  printf( "GAME OVER\n\n\n\n\n\n\n\n" );
  restoreregs();
  return;
}

void checkFire()
{
  if( c == 60 )
    {
      if( firey == 0 )
	{
	  spriteon( 2 );
	  //spritexy( missle, x, 240 );
	  spritex( missle, x );
	  spritey( missle, 240 );
	  firey = 240;
	}
    }
  return;
}

void checkAlienHit()
{
  uint f = spritecollision();
  
  if( f == 6 )
    {
      cleanscore();
      score = score + 100.0;
      inc(kills);
      spritey( missle, 0 );
      firey=0;
      //s = rnd(1);
      spriteoff( 2 );
      //x2 = x2 + s;
      x2 = x2 + rnd(1);
    }
  
  if( f == 10 )
    {
      cleanscore();
      score = score + 150.0;
      inc(kills);
      spritey( missle, 0 );
      firey=0;
      //s = rnd(1);
      spriteoff( 2 );
      //x3 = x3 + s;
      x3 = x3 + rnd(1);
    }

  if( f == 18 )
    {
      cleanscore();
      score = score + 200.0;
      inc(kills);
      spritey( missle, 0 );
      firey=0;
      //s = rnd(1);
      spriteoff( 2 );
      //x4 = x4 + s;
      x4 = x4 + rnd(1);

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

void updateAlienPosition()
{
  if( adist1 > 0 )
    {
      if( adir1 > 128 )
	{
	  x2 = x2 + aspeed1;
	}
      else
	{
	  x2 = x2 - aspeed1;
	}
      dec( adist1 );
      spritex( alien1, x2 );
    }
  else
    {
      adist1 = rnd(1);
      adir1 = rnd(1);
    }

  if( adist2 > 0 )
    {
      if( adir2 > 128 )
	{
	  x3 = x3 + aspeed2;
	}
      else
	{
	  x3 = x3 - aspeed2;
	}
      dec( adist2 );
      spritex( alien2, x3 );
    }
  else
    {
      adist2 = rnd(1);
      adir2 = rnd(1);
    }

 if( adist3 > 0 )
    {
      if( adir3 > 128 )
	{
	  x4 = x4 + aspeed3;
	}
      else
	{
	  x4 = x4 - aspeed3;
	}
      dec( adist3 );
      spritex( alien3, x4 );
    }
  else
    {
      adist3 = rnd(1);
      adir3 = rnd(1);
    }
  return;
}

void checkLeft()
{
  // move left if "u" is pressed and x > 20
  if( c == 30 )
    {
      if( x > 25 )
	{
	  x = x - plyvel;
	  spritex( ship, x );
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
	  x = x + plyvel;
	  spritex( ship, x );
	}
    }
  return;
}

void updateStats()
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

      cursorxy( 31, 9 );
      printf( "LEVEL" );
      cursorxy( 33, 10 );
      printf( level );
    }
  return;
}

void uMissPos()
{
  if( firey > 0 )
    {
      firey = firey - missvel;
      spritey( missle, firey );
    }
  return;
}

void alienFire()
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
      g1 = rnd(1);
      if( g1 > 250 )
	{
	  spriteon( 64 );
	  spritex( alien2m, x3 );
	  a2fire = 85;
	}
    }
  if( a3fire > 250 )
    {
      g1 = rnd(1);
      if( g1 > 240 )
	{
	  spriteon( 128 );
	  spritex( alien3m, x4 );
	  a3fire = 110;
	}
    }
  return;
}

void uAMissPos()
{
  if( a1fire < 240 )
    {
      a1fire = a1fire + amspeed;
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
      a2fire = a2fire + amspeed;
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
      a3fire = a3fire + amspeed;
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

void cleanscore()
{
  cursorxy( 31, 4 );
  printf( "           " );
  cursorxy( 34, 7 );
  return;
}

void levelup()
{
  inc( level );
  spriteset(0);
  shortcls();
  cursorxy( 16, 6 );
  printf( "LEVEL " );
  printf( level );
  longdelay();
  cursorxy( 13, 10 );
  printf( "PRESS ANY KEY" );
  pause();
  shortcls();
  inc( amspeed );
  inc( aspeed1 );
  inc( aspeed2 );
  inc( aspeed3 );

  y2 = y2 + 5;
  y3 = y3 + 5;
  y4 = y4 + 5;
  
  return;
}

void intro()
{
  shortcls();
  //poke( 646, 15 );
  poke( 646, 1 );
  cursorxy( 13, 6 );
  printf( "THREE-ON-ONE" );
  cursorxy( 8, 8 );
  printf( "BY MICHAEL PELLEGRINO" );
  cursorxy( 11, 13 );
  printf( "<-- (U) (O) -->" );
  cursorxy( 8, 15 );
  printf( "(Q)UIT   (SPACE) FIRE" );
  longdelay();
  cursorxy( 6, 17 );
  printf( "PRESS ANY KEY TO BEGIN!!!" );
  
  pause();
  return;
}


void longdelay()
{
  clearkb();
  for( word ldxA = 0x0000; ldxA < 0x0C04; ldxA = ldxA + 1 )
  {
    nop();
  }
  return;
}
