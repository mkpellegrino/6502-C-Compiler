int main()
{
  cls();
  romout(6);
  saveregs();
  spriteon(0);
  bank(1);
  
  mob sphere1 = { 0, 1, 0, 255, 0, 3, 170, 192, 13, 170, 176, 54, 170, 172, 58, 170, 172, 234, 170, 171, 234, 170, 171, 234, 170, 171, 234, 170, 171, 58, 170, 172, 58, 170, 172, 14, 170, 176, 3, 170, 192, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  mob sphere2 = { 1, 2, 0, 255, 0, 3, 170, 192, 13, 106, 176, 53, 170, 172, 58, 170, 172, 234, 170, 171, 234, 170, 171, 234, 170, 171, 234, 170, 171, 58, 170, 172, 58, 170, 172, 14, 170, 176, 3, 170, 192, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
 
  // Setup multicolour bitmap 
  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  poke( 0x4478, 0x01 );
  poke( 0x4479, 0x02 );

  spritexy( 0x00, 100, 100);
  spritexy( 0x01, 200, 100 );

  
  spriteon(3);

  
  
  // Bit Combo: 01 = Bright Green (13) for all sprites
  poke( 0xD025, 13 );

  // Bit Combo: 11 = Green (5) for all sprites
  poke( 0xD026, 5 );
  
  // Bit Combo: 10 = Dark Grey (11) for Sprite 1
  poke( 0xD027, 11 );

  // multicolour for sprites 0 and 1
  poke( 0xD01C, 0x03 );

  pause();
  sweep(0);
  pause();

  
  //sweep(1);
  
  //pause();

  //spritexy( 1, 200, 100 );

  //sweep(0);

  //pause();

  //spritexy( 0, 100, 100 );
  
  bank(0);

  restoreregs();
  romin();
  return;
}

void sweep( uint sweepI )
{
  word k = 0x0017;
  for( uint j = 0; j < 200; inc(j) )
    {
      // delay
      for( uint i = 0x00; i != 0xFF; inc(i) )
	{
	  nop();
	}
      spritexy( sweepI, j, j );
    }
  

  return;
}
