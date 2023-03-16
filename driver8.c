int main()
{
  cls();
  word x = 0x0080;
  uint y = 220;
  word timer = 0;
  uint shipvelocity = 0;
  uint gravtimer = 0;
  uint grav[10];
  grav[0] = 0;
  grav[1] = 0;
  grav[2] = 0;
  grav[3] = 1;
  grav[4] = 2;
  grav[5] = 3;
  grav[6] = 4;
  grav[7] = 5;
  grav[8] = 6;
  grav[9] = 8;
  grav[10] = 10;
  grav[11] = 12;
  grav[12] = 14;
  grav[13] = 17;
  grav[14] = 20;
  grav[15] = 23;
  
  for( uint i = 0; i<16; i++ )
    {
      uint j = grav[i];
      printf( j );
      lda( 0x20 );
      jsr( 0xFFD2 );
    }


  //rts();
  mob sprite1 = { 0, 192, 0, 24, 0, 0, 60, 0, 3, 24, 192, 3, 24, 192, 3, 231, 192, 3, 36, 192, 3, 66, 192, 0, 66, 0, 0, 66, 0, 0, 129, 0, 0, 129, 0, 0, 129, 0, 0, 129, 0, 0, 153, 0, 6, 165, 96, 6, 129, 96, 7, 129, 224, 7, 129, 224, 6, 129, 96, 6, 66, 96, 0, 60, 0 };

  spriteset( 1 );
  
  spritexy( 0, x, y );

  uint c = getin();
  while( c != 62 )
    {
      uint T = timer & 0x007F;
      uint G = timer & 0x1000;
      if( T == 0 )
	{
	  checkLeft();
	  checkRight();
	  checkUp();
	  checkDown();
	  placeShip();
	}
      if( G == 0 )
	{
	  gravity();
	}
      inc( timer );
      c = getin();
    }
  spriteset( 0 );
  clearkb();
  return;
}

void gravity()
{
  if( y < 240 )
    {
      uint a = grav[ gravtimer ];
      if( y > 240 )
	{
	  y = 240;
	}
      inc( gravtimer );
      gravtimer = gravtimer & 0x0F;
    }
  return;
}

void placeShip()
{
  y = y - shipvelocity;
  y = y + a;
  
  if( y < 20 )
    {
      y = 20;
    }
  if( y > 240 )
    {
      y = 240;
      shipvelocity = 0;
      a=0;
      gravtimer=0;
    }
  spritexy( 0, x, y );
  
  return;
}


void checkLeft()
{
  if( c == 30 )
    {
      if( x > 0x0015 )
	{
	  x = x - 2;
	}
    }
  return;
}

void checkRight()
{
  if( c == 38 )
    {
      if( x < 0x0143 )
	{
	  x = x + 2;
	}
    }
  return;
}

void checkUp()
{
  if( c == 33 )
    {
      if( shipvelocity < 10 )
	{
	  shipvelocity = shipvelocity + 2;
	}
    }
      
  return;
}

void checkDown()
{
  if( c == 37 )
    {
      shipvelocity = shipvelocity - 2;
    }
  return;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}
