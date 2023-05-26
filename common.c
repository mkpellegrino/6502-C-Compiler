  //                                           Colours
  // 0 - Black  1 - White   2 - Red   3 - Cyan  4 - Purple  5 - Green  6 - Dark Blue
  // 7 - Yellow 8 - Orange  9 - Brown A - Pink  B - Drk Gry C - Grey   D - Bright Green
  //                        E - Light Blue                   F - Light Grey

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
  
  
