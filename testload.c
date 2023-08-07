void main()
{
  saveregs();
  bank(2);
  romout(6);
  poke( 0xD020, 0 );
  poke( 0xD021, 0 );
  
  poke( 0xD011, 0x2B );
  poke( 0xD016, 0x18 );
  poke( 0xD018, 0x18 );

  setfilename( "SPLASH,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  word addr = 0xA000;
  for( word i = 0x0000; i < 0x1F40; i = i + 0x0001 )
    {
      poke( addr, fchrin() );
      addr = addr + 0x0001;
    }

  addr = 0x8400;
  for( i = 0x0000; i < 0x03E8; i = i + 0x0001 )
    {
      poke( addr, fchrin() );
      addr = addr + 0x0001;
    }

  addr = 0xD800;
  for( i = 0x0000; i < 0x03E8; i = i + 0x0001 )
    {
      poke( addr, fchrin() );
      addr = addr + 0x0001;
    }


  fclose(3);
  fclrchn();
  poke( 0xD011, 0x3B );
  pause();
  romin();
  bank(0);
  restoreregs();
  return;
}
