// to compile:
// compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./conway.c > conway2100.asm
//
// You're on your own to assemble it into a .PRG
//
// to execute:
// SYS 2100

void main()
{
  word shadow = 0xC000;
  word board = 0x0400;
  word colour = 0xD800;
  uint n = NULL;
  uint alive = NULL;
  word i = NULL;
  word arg0 = NULL;
  word arg1 = NULL;
  
  saveregs();
  seed();

  romout(6);

  poke( 0xD020, 0x0C );
  poke( 0xD021, 0x0C );
  
  clearShadowAndBoard();

  lda( 0x9B );
  jsr( 0xFFD2 );  
  cursorxy(0, 24);
  printf( " CONWAYS GAME OF LIFE       HOLD R OR Q" );
  
  randomizeBoard();

  memcpy( 0xC028, 0x0428, 0xFF );
  memcpy( 0xC127, 0x0527, 0xFF );
  memcpy( 0xC226, 0x0626, 0xFF );
  memcpy( 0xC325, 0x0725, 0x9A );
  
  uint k = getin();
  while( k != 62 )    
    {
      for(i = 0x0028; i < 0x0398; i = i + 1 )
	{
	  n = 0x00;
	  arg0 = board + i;
	  arg1 = shadow + i;

	  if( peek(arg0 - 0x29) != 0x20 )
	    {
	      inc( n );
	    }
	  if( peek(arg0 - 0x28) != 0x20 )
	    {
	      inc( n );
	    }
	  if( peek(arg0 - 0x27) != 0x20 )
	    {
	      inc( n );
	    }

	  if( peek(arg0 - 0x01) != 0x20 )
	    {
	      inc( n );
	    }
	  if( peek(arg0 + 0x01) != 0x20 )
	    {
	      inc( n );
	    }
	  if( peek(arg0 + 0x27) != 0x20 )
	    {
	      inc( n );
	    }
	  if( peek(arg0 + 0x28) != 0x20 )
	    {
	      inc( n );
	    }
	  if( peek(arg0 + 0x29) != 0x20 )
	    {
	      inc( n );
	    }


	  
	  if( peek( arg0 ) == 0x20 )
	    {
	      if( n == 3 )
		{
		  poke( arg1, 0x51 );
		}
	    }
	  else
	    {
	      if( n < 2 )
		{
		  poke( arg1, 0x20 );
		}
	      if( n > 3 )
		{
		  poke( arg1, 0x20 );
		}
	    }
	}

      // copy shadow to board
      memcpy( 0xC028, 0x0428, 0xFF );
      memcpy( 0xC127, 0x0527, 0xFF );
      memcpy( 0xC226, 0x0626, 0xFF );
      memcpy( 0xC325, 0x0725, 0x9A );
      
      k = getin();
      if( k == 17 )
	{
	  randomizeBoard();
	}
      
	  
    }

  // clearkb
  poke(198,0);
  jsr( 0xFFE4 );

  clearShadowAndBoard();
  restoreregs();

  cursorxy( 10, 10 );
  // change printf colour to white
  lda( 0x05 );
  jsr( 0xFFD2 );
  printf( "CONWAYS GAME OF LIFE\n\n" );
  lda( 0x9A );
  jsr( 0xFFD2 );
  printf( "  PROGRAMMED BY: MICHAEL K. PELLEGRINO\n USING HIS 6502 C COMPILER   2023 04 07\n\n         GITHUB.COM/MKPELLEGRINO\n");
  romin();
  return;
}

uint randomizeBoard()
{
  for( i = 0x0028; i < 0x0398; i = i + 1 )
    {
      uint a = rnd(1);
      if( a > 127 )
	{
	  a = 0x51;
	}
      else
	{
	  a = 0x20;
	}

      poke( board + i, a );
      poke( shadow + i, a );
    }
  return;
}

void clearShadowAndBoard()
{  
  for( i = 0x0000; i < 0x03E8;  i = i + 1 )
    {
      poke( board + i, 0x20 );
      poke( shadow + i, 0x20 );
      poke( colour + i, 0x01 );
    }   
  return;
}

void saveregs()
{
  uint oldD020 = peek( 0xD020 );
  uint oldD021 = peek( 0xD021 );
  uint oldChar = peek( 0x0286 );
  return;
}

void restoreregs()
{
  poke( 0xD020, oldD020 );
  poke( 0xD021, oldD021 );
  poke( 0x0286, oldChar );
  return;
}
