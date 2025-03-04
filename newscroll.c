void main()
{
  uint scrollindex = 0x00;
  uint direction = NULL;
			      
  asmcomment( "38 column mode" );
  uint D016value = peek( 0xD016 ) & 0xF7;
  poke( 0xD016, D016value );
  irq( ptr(scrollTopHalfOfScreen), 0x82, 0x01 );
  return;
}



void scrollBottomHalfOfScreen()
{
  asl( 0xD019 );
  direction = peek( 0x0334 );
  //poke( 0xD020, 0x00 );

  D016value = peek( 0xD016 ) & 0xF8;
  D016value = D016value + scrollindex;
  poke( 0xD016, D016value );

  if( direction == 0x01 )
    {
      if( scrollindex == 0x00 )
	{
	  moveTopL2R();
	}
      inc( scrollindex );
      scrollindex = scrollindex & 0x07;
    }
  else
    {
      if( scrollindex == 0x07 )
	{
	  moveTopR2L();
	}
      dec( scrollindex );
      scrollindex = scrollindex & 0x07;

    }
  irq( ptr(scrollTopHalfOfScreen), 0x82, 0x01 );
  jmp( 0xEA31 );
}


void scrollTopHalfOfScreen()
{
  asl( 0xD019 );
  //poke( 0xD020, 0x02 );
  poke( 0xD016, 0x00 );
  
  irq( ptr(scrollBottomHalfOfScreen), 0xFF, 0x01 );
  jmp( 0xEA31 );
}

void moveTopR2L()
{

  inline( "lda $0400", 3);
  inline( "pha", 1 );
  inline( "lda $0428", 3);
  inline( "pha", 1 );
  inline( "lda $0450", 3);
  inline( "pha", 1 );
  inline( "lda $0478", 3);
  inline( "pha", 1 );
  inline( "lda $04A0", 3);
  inline( "pha", 1 );
  inline( "lda $04C8", 3);
  inline( "pha", 1 );
  inline( "lda $04F0", 3);
  inline( "pha", 1 );
  inline( "lda $0518", 3);
  inline( "pha", 1 );
  inline( "lda $0540", 3);
  inline( "pha", 1 );
  inline( "lda $0568", 3);
  inline( "pha", 1 );
  
  inline( "ldx #$00", 2);
  inline( "!:" );

  inline( "lda $0401,X", 3 );
  inline( "sta $0400,X", 3 );
  
  inline( "lda $0429,X", 3 );
  inline( "sta $0428,X", 3 );
  
  inline( "lda $0451,X", 3 );
  inline( "sta $0450,X", 3 );
  
  inline( "lda $0479,X", 3 );
  inline( "sta $0478,X", 3 );

  inline( "lda $04A1,X", 3 );
  inline( "sta $04A0,X", 3 );

  inline( "lda $04C9,X", 3 );
  inline( "sta $04C8,X", 3 );
  
  inline( "lda $04F1,X", 3 );
  inline( "sta $04F0,X", 3 );
  
  inline( "lda $0519,X", 3 );
  inline( "sta $0518,X", 3 );

  inline( "lda $0541,X", 3 );
  inline( "sta $0540,X", 3 );

  inline( "lda $0569,X", 3 );
  inline( "sta $0568,X", 3 );

  inline( "inx", 1);
  inline( "txa", 1);
  inline( "cmp #$27", 2);
  inline( "bne !-", 2);
  
  inline( "pla", 1 );
  inline( "sta $058F", 3 );
  inline( "pla", 1 );
  inline( "sta $0567", 3 );
  inline( "pla", 1 );
  inline( "sta $053F", 3 );
  inline( "pla", 1 );
  inline( "sta $0517", 3 );
  inline( "pla", 1 );
  inline( "sta $04EF", 3 );
  inline( "pla", 1 );
  inline( "sta $04C7", 3 );
  inline( "pla", 1 );
  inline( "sta $049F", 3 );
  inline( "pla", 1 );
  inline( "sta $0477", 3 );
  inline( "pla", 1 );
  inline( "sta $044F", 3 );
  inline( "pla", 1 );
  inline( "sta $0427", 3 );

  
  return;
}
void moveTopL2R()
{
  inline( "lda $0427", 3);
  inline( "pha", 1 );
  inline( "lda $044F", 3);
  inline( "pha", 1 );
  inline( "lda $0477", 3);
  inline( "pha", 1 );
  inline( "lda $049F", 3);
  inline( "pha", 1 );
  inline( "lda $04C7", 3);
  inline( "pha", 1 );
  inline( "lda $04EF", 3);
  inline( "pha", 1 );
  inline( "lda $0517", 3);
  inline( "pha", 1 );
  inline( "lda $053F", 3);
  inline( "pha", 1 );
  inline( "lda $0567", 3);
  inline( "pha", 1 );
  inline( "lda $058F", 3);
  inline( "pha", 1 );
  
  inline( "ldx #$27", 2);
  inline( "!:" );
  
  inline( "lda $03FF,X", 3);
  inline( "sta $0400,X", 3);
  
  inline( "lda $0427,X", 3);
  inline( "sta $0428,X", 3);
  
  inline( "lda $044F,X", 3);
  inline( "sta $0450,X", 3);

  inline( "lda $0477,X", 3);
  inline( "sta $0478,X", 3);

  inline( "lda $049F,X", 3);
  inline( "sta $04A0,X", 3);

  inline( "lda $04C7,X", 3);
  inline( "sta $04C8,X", 3);

  inline( "lda $04EF,X", 3);
  inline( "sta $04F0,X", 3);

  inline( "lda $0517,X", 3);
  inline( "sta $0518,X", 3);

  inline( "lda $053F,X", 3);
  inline( "sta $0540,X", 3);

  inline( "lda $0567,X", 3);
  inline( "sta $0568,X", 3);

  inline( "dex", 1);
  inline( "bne !-", 2);
  
  inline( "pla", 1 );
  inline( "sta $0568", 3 );
  inline( "pla", 1 );
  inline( "sta $0540", 3 );
  inline( "pla", 1 );
  inline( "sta $0518", 3 );
  inline( "pla", 1 );
  inline( "sta $04F0", 3 );
  inline( "pla", 1 );
  inline( "sta $04C8", 3 );
  inline( "pla", 1 );
  inline( "sta $04A0", 3 );
  inline( "pla", 1 );
  inline( "sta $0478", 3 );
  inline( "pla", 1 );
  inline( "sta $0450", 3 );
  inline( "pla", 1 );
  inline( "sta $0428", 3 );
  inline( "pla", 1 );
  inline( "sta $0400", 3 );

  
  return;
}
