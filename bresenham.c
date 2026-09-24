void main()
{  
  saveregs();
  bank( 2 );

  setScreenMode(2);
  poke( 0xD018, 0x18 );

  romout(6);
  // colour
  // 11 - green
  fillmem( 0xD8, 0x05, 0x04 );

  // 01 - 07
  // 10 - 0D
  fillmem( 0x84, 0x7D, 0x12 );

  // bitmap
  clearmem( 0xA0, 0x20 );

  uint i = NULL;
  // Q IV
  for( i = 100; i != 200; inc(i) )
  {
   bres( 80, 100, 159, i, 0);
  }
  for( i = 159; i != 80; dec(i) )
  {
   bres( 80, 100, i, 200, 1 );
  }

  // QIII
  for( i = 80; i != 0; dec(i) )
  {
   bres( 80, 100, i, 199, 2 );
  }
  
  for( i = 199; i != 100; dec(i) )
    {
      bres( 80, 100, 0, i, 3 );
    }



  // Q II
  for( i = 100; i != 0; dec(i) )
  {
    bres( 80, 100, 0, i, 4 );
  }
  for( i = 0; i != 80; inc(i) )
  {
    bres( 80, 100, i, 0, 5 );
  }

  // Q I
  for( i = 80; i != 160; inc(i) )
    {
      bres( 80, 100, i, 0, 6 );
    }
  for( i = 0; i != 100; inc(i) )
    {
      bres( 80, 100, 159, i, 7 );
    }
      

  pause();
  romin();
  bank(0);

  restoreregs();
  
  return;
}
