int main()
{
  saveregs();

  introScreen();

  uint i = NULL;
  word j = NULL;
  
  uint x1 = NULL;
  uint y1 = NULL;
  
  uint length = NULL;
  uint lastx = NULL;
  uint lasty = NULL;
  uint gameover = NULL;
  uint newx1 = NULL;
  uint c = NULL;
  word score = NULL;
  word r0 = NULL;
  
  uint newy1 = NULL;

  uint player = 81;
  uint trail = 87;

  word timer = 0x0000;
  word freq = NULL;
  
  poke( XYtoMEMLOC(), trail );

  //lda( 0x12 );
  //lda( 147 );
  // set printf colour to white
  lda( 0x05 );
  jsr( 0xFFD2 );

  uint keepplaying = 0x01;
  while( keepplaying == 1 )
    {
      resetVariables();
      screenSetup();
      c = getin();
      setcolours();
      while( gameover == 0 )
	{
	  if( timer == freq )
	    {
	      checkUp();
	      checkDown();
	      checkLeft();
	      checkRight();
	      timer = 0x0000;
	      c = getin();
	      updatePosition();
	    }
	  inc(timer);
	  
	  if( c == 62 )
	    {
	      gameover = 1;
	      clearkb();
	    }
	}
      keepplaying = playAgain();
    }
  clearkb();
  restoreregs();
  return;
}

void resetVariables()
{
  x1 = 20;
  y1 = 12;
  freq = 0x04FF;
  length = 0x00;
  lastx = 0x00;
  lasty = 0x00;
  gameover = 0x00;
  newx1 = 0x00;
  newy1 = 0x00;
  score = 0x0000;
  return;
}

word XYtoMEMLOC()
{
  r0 = 1024 + x1 + y1 * 40;
  return r0;
}

word NextXYtoMEMLOC()
{
  r0 = 1024 + newx1 + newy1 * 40;
  return r0;
}

void updatePosition()
{
  newx1 = x1 + lastx;
  newy1 = y1 + lasty;
  if( newx1 == 0xFF )
    {
      newx1 = 0x00;
    }
  if( newx1 == 40 )
    {
      newx1 = 39;
    }
  if( newy1 == 0x01 )
    {
      newy1 = 0x02;
    }
  if( newy1 == 25 )
    {
      newy1 = 24;
    }

  poke( XYtoMEMLOC(), trail );

  if( peek(NextXYtoMEMLOC()) == trail )
    {
      if( newx1 != x1 )
	{
	  gameover = 1;
	}
      if( newy1 != y1 )
	{
	  gameover = 1;
	}
    }
  else
    {
      score = score + 1;
      showScore();
      freq = freq - 2;
    }

  x1=newx1;
  y1=newy1;
  
  poke( XYtoMEMLOC(), player );
  return;
}

void checkLeft()
{
  if( c == 30 )
    {
      if( x1 != 0 )
	{
	  lastx = 0xFF;
	  lasty = 0x00;
	}
      else
	{
	  lastx = 0x00;
	}
    }
  return;
}

void checkRight()
{
  if( c == 38 )
    {
      if( x1 != 39 )
	{
	  lastx = 0x01;
	  lasty = 0x00;
	}
      else
	{
	  lastx = 0x00;
	}
    }
  return;
}

void checkUp()
{
  if( c == 33 )
    {
      if( y1 != 0 )
	{
	  lastx = 0x00;
	  lasty = 0xFF;
	}
      else
	{
	  lasty = 0x00;
	}
    }
  return;
}

void checkDown()
{
  if( c == 37 )
    {
      if( y1 != 24 )
	{
	  lastx = 0x00;
	  lasty = 0x01;
	}
      else
	{
	  lasty = 0x00;
	}
    }
  return;
}

void showScore()
{
  cursorxy( 7, 0 );
  printf( score );
  return;
}

void screenSetup()
{
  cls();
  cursorxy( 0, 0 );
  printf( "SCORE:" );
  cursorxy( 11, 0 );
  printf( "MOVE:  UP:I  DN:K  LT:U  RT:O" );
  for( j = 1064; j < 1104; j = j + 1 )
    {
      poke( j, 67 );
    }
  return;
}

void introScreen()
{
  cls();

  cursorxy( 2, 1 );
  printf( " SSSSS  N     N  AAAA  K    K EEEEEE" );
  cursorxy( 2, 2 );
  printf( "SS   SS NN    N A    A K  K   E" );
  cursorxy( 2, 3 );
  printf( "SS      N N   N A    A KK     E" );
  cursorxy( 2, 4 );
  printf( "  SS    N  N  N AAAAAA K K    EEEE" );
  cursorxy( 2, 5 );
  printf( "   SS   N   N N A    A K  K   E" );
  cursorxy( 2, 6 );
  printf( "     SS N    NN A    A K   K  E" );
  cursorxy( 2, 7 );
  printf( "SS   SS N     N A    A K    K EEEEEE" );
  cursorxy( 2, 8 );
  printf( " SSSSS " );
  cursorxy( 8, 12 );
  printf( "BY: MICHAEL PELLEGRINO" );
  cursorxy( 14, 14 );
  printf( "MARCH 2023" );
  cursorxy( 2, 18 );
  printf( "UP: I   DOWN: K   LEFT: U   RIGHT: O" );
  cursorxy( 8, 20 );
  printf( "PRESS ANY KEY TO START" );
  pause();
  shortcls();
  return;
}

uint playAgain()
{

  // clear a portion of the gameboard
  for( i = 9; i < 15; inc( i ) )
    {
      cursorxy( 4, i );
      printf( "                                " );
    }
  
  cursorxy( 14, 10 );
  printf( "GAME OVER!!" );
  longdelay();
  cursorxy( 12, 12 );
  printf( "PRESS Q TO QUIT" );
  cursorxy( 6, 13 );
  printf( "ANY OTHER KEY TO PLAY AGAIN" );
  clearkb();

  i = getchar();
  while( i == 0 )
    {
      i = getchar();
    }
  if( i == 81 )
    {
      i = 0;
    }
  else
    {
      i = 1;
    }
  return i;
}

void longdelay()
{
  for( j = 0x0000; j < 0xFA04; j = j + 1 )
  {
    nop();
  }
  clearkb();
  return;
}

void setcolours()
{
  for( j = 0xD800; j < 0xD850; j = j + 1 )
    {
      poke( j, 1 );
    }
  for( j = 0xD850; j < 0xDBE8; j = j + 1 )
    {
      i = rnd(1);
      i = i & 0x0F;
      if( i == 0x06 )
	{
	  i = 1;
	}
      poke( j, i );
    }
  return;

}
  //                                           Colours
  // 0 - Black  1 - White   2 - Red   3 - Cyan  4 - Purple  5 - Green  6 - Dark Blue
  // 7 - Yellow 8 - Orange  9 - Brown A - Pink  B - Drk Gry C - Grey   D - Bright Green
  //                        E - Light Blue                   F - Light Grey

void pause()
{
  poke( 0x00C6, 0 );
  jsr( 0xFFE4 );

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

void saveregs()
{
  uint oldD011 = peek( 0xD011 );
  uint oldD016 = peek( 0xD016 );
  uint oldD018 = peek( 0xD018 );
  uint oldD020 = peek( 0xD020 );
  uint oldD021 = peek( 0xD021 );
  uint oldChar = peek( 0x0286 );
  return;
}

void restoreregs()
{
  poke( 0xD011, oldD011 );
  poke( 0xD016, oldD016 );
  poke( 0xD018, oldD018 );
  poke( 0xD020, oldD020 );
  poke( 0xD021, oldD021 );
  poke( 0x0286, oldChar );
  return;
}

void shortcls()
{
  lda( 0x93 );
  jsr( 0xFFD2 );
  return;
}
  
  
