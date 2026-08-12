void main()
{
  uint conversion[16];
  conversion[0] = 0xFF;
  conversion[1] = 0xFF;
  conversion[2] = 0x04;
  conversion[3] = 0x0C;
  conversion[4] = 0x0E;
  conversion[5] = 0x10;
  conversion[6] = 0x18;
  conversion[7] = 0x1A;
  conversion[8] = 0x1C;
  conversion[9] = 0xFF;
  conversion[10] = 0xFF;
  conversion[11] = 0xFF;
  conversion[12] = 0xFF;
  conversion[13] = 0xFF;
  conversion[14] = 0x00;
  conversion[15] = 0x02;

  uint map[9];
  map[0] = 0x00;
  map[1] = 0x02;
  map[2] = 0x04;
  map[3] = 0x0C;
  map[4] = 0x0E;
  map[5] = 0x10;
  map[6] = 0x18;
  map[7] = 0x1A;
  map[8] = 0x1C;
  
  uint stillPlaying = 0x01;
  uint convertedDigit = NULL;
  uint whosTurn =  79;
  uint cfwreturn = NULL;
  uint moves = NULL;
  data prompt = { "\n[1-9] OR [Q]UIT\nYOUR MOVE: " };
  data error0 = { "\n\n\n*** ALREADY TAKEN ***" };
  data winnerFound0 = { "\n\n\nWINNER FOUND: "};
  data winnerFound1 = { "!!!\n\n" };
  data drawText = { "\n\n\nIT'S A DRAW.\n\n" };
  data title = { "SIMPLE TIC-TAC-TOE FOR 2 PLAYERS BY:\n   MICHAEL K PELLEGRINO - AUGUST 2026\n" };
  data youveQuit = { "\n\n\nYOU HAVE QUIT\n\n" };
  data turnText = { "'S TURN\n\n" };
  data preboard = { 0x0D, 0x0D, 0x0D };
  data board =
    {
      0x20, 0x7D, 0x20, 0x7D, 0x20, 0x0D,
      0x60, 0x7B, 0x60, 0x7B, 0x60, 0x0D,
      0x20, 0x7D, 0x20, 0x7D, 0x20, 0x0D,
      0x60, 0x7B, 0x60, 0x7B, 0x60, 0x0D,
      0x20, 0x7D, 0x20, 0x7D, 0x20, 0x0D, 0x0D, 0x0D, 0x00
    };

  initBoard();
  cls();
  cursorxy( 0x02, 0x00 );
  prints( title );
  word addr = board;
  showBoard();
  while( stillPlaying == 0x01 )
    {
      fchrout( whosTurn );
      prints( turnText );
      
      clearkb();
      prints( prompt );
      
      uint qsq = getin();
      while( qsq == 0x40 )
	{
	  qsq = getin();
	  clearkb();
	}
      
      cls();
      cursorxy( 0x02, 0x00 );
      prints( title );

      if( qsq == 62 )
	{
	  prints( youveQuit );
	  stillPlaying = 0x00;
	}
      else
	{
	  asmcomment( "convert the digit to a value" );
	  inline( "lda qsq", 2 );
	  inline( "clc", 1 );
	  inline( "lsr", 1 );
	  inline( "php", 1 );
	  inline( "lsr", 1 );
	  inline( "lsr", 1 );
	  inline( "plp", 1 );
	  inline( "rol", 1 );
	  inline( "sta convertedDigit", 3 );

	  uint maybe = peek( addr + conversion[convertedDigit] );
	  if( maybe == 0x20 )
	    {
	      poke( addr + conversion[convertedDigit], whosTurn );
	      inline( "lda whosTurn", 3 );
	      inline( "eor #$17", 2 );
	      inline( "sta whosTurn", 3 );
	      inc(moves);
	    }
	  else
	    {
	      prints( error0 );
	    }
	}

      if( checkForWinner() == 79 || checkForWinner() == 88)
	{
	  stillPlaying = 0x00;
	  prints( winnerFound0 );
	  fchrout( cfwreturn );
	  prints( winnerFound1 );
	}
      if( checkForWinner() == 1 )
	{
	  stillPlaying = 0x00;
	  prints( drawText );
	}
      showBoard();
    }

  return;
}

void showBoard()
{
  prints( preboard );
  
  return;
}

void clearkb()
{
  inline( "lda #$00", 2 );
  inline( "sta $C6", 2 );
  return;
}

uint checkForWinner()
{
  // 79: O wins
  // 88: X wins
  // 0 : no winner yet
  // 1 : TIE GAME

  cfwreturn = 0;
  
  // top row
  uint C1 = peek( board );
  uint C2 = peek( board + 2 );
  uint C3 = peek( board + 4 );
  check();

  // -----------------------
  C1 = peek( board + 0x0C);
  C2 = peek( board + 0x0E);
  C3 = peek( board + 0x10);
  if( cfwreturn == 0 )
    {
      check();
    }
  // -----------------------
  C1 = peek( board + 0x18);
  C2 = peek( board + 0x1A);
  C3 = peek( board + 0x1C);
  if( cfwreturn == 0 )
    {
      check();
    }
  // -----------------------
  C1 = peek( board );
  C2 = peek( board + 0x0C);
  C3 = peek( board + 0x18);
  if( cfwreturn == 0 )
    {
      check();
    }
  // -----------------------
  C1 = peek( board + 0x02);
  C2 = peek( board + 0x0E);
  C3 = peek( board + 0x1A);
  if( cfwreturn == 0 )
    {
      check();
    }
  // -----------------------
  C1 = peek( board + 0x04);
  C2 = peek( board + 0x10);
  C3 = peek( board + 0x1C);
  if( cfwreturn == 0 )
    {
      check();
    }
  // -----------------------
  C1 = peek( board );
  C2 = peek( board + 0x0E);
  C3 = peek( board + 0x1C);
  if( cfwreturn == 0 )
    {
      check();
    }
  // -----------------------
  C1 = peek( board + 0x4);
  C2 = peek( board + 0x0E);
  C3 = peek( board + 0x18);
  if( cfwreturn == 0 )
    {
      check();
    }

  if( moves == 0x09 && cfwreturn == 0x00 )
    {
      cfwreturn = 0x01;
    }
  
  return cfwreturn;
}
  
void check()
{
  cfwreturn = 0x00;
  
  if( C1 == 79 && C2 == 79 && C3 == 79 )
    {
      cfwreturn = 79;
    }
  if( C1 == 88 && C2 == 88 && C3 == 88 )
    {
      cfwreturn = 88;
    }
  return;
}

void initBoard()
{
  moves = 0x00;
  for( uint i = 0x00; i < 0x09; inc(i) )
  {
    poke( board + map[i], 0x20 );
  }
  return;
}
