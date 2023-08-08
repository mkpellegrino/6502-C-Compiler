void main()
{
  shortcls();
  poke( 0xD020, 1 );
  poke( 0xD021, 1 );
  
  // multicolour for sprites other than #2
  poke( 0xD01C, 0x1B );
 
  // colours for all sprites (Light grey)
  poke( 0xD025, 0x0F );

  // Black for all sprites
  poke( 0xD026, 0x00 );


  word xstart = 0x0040;
  
  for( uint i = 0x00; i < 0x05; inc( i ) )
    {
      spritecolour( i, 0x09 );
      spritex( i, xstart );
      spritey( i, 0x40 );
      xstart = xstart + 0x0020;
    }

  spritecolour( 0x02, 0x07 );
  
  // turn on sprites   (b000000011 = 0x03 = zero and one)
  spriteon( 0x1F );


  // sprite pointers
  poke( 0x07F8, 192 );
  poke( 0x07F9, 211 );
  poke( 0x07FA, 224 );
  poke( 0x07FB, 225 );
  poke( 0x07FC, 226 );

  
  setfilename( "SPRITES1,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  for( word addr = 0xB000; addr < 0xB8C0; addr = addr + 0x0001 )
    {
      poke( addr, fchrin() );
    }
  
  fclose(3);
  fclrchn();

  animate();
  
  return;
}

void animate()
{

  uint A = peek( 0x07F8 );
  uint B = peek( 0x07F9 );

  clearkb();
  uint c = getin();
  while( c != 62 )
    {
      poke( 0x07F8, A );
      poke( 0x07F9, B );
      inc( A );
      inc( B );
      if( A > 210 )
	{
	  A = 192;
	}
      if( B > 223 )
	{
	  B = 211;
	}
      delay();
      c = getin();
    }
  clearkb();
  return;
}

void delay()
{
  for( word x = 0x0000; x < 0x0AFF; x = x + 0x0001 )
    {
      nop();
      nop();
      nop();
    }

  return;
}
