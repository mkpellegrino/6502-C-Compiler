

void main()
{
  lda( 0x00 );
  uint direction;
  uint pixelShift;
  uint previousDirection;
  
  data joshua = {
    
    0, 0, 0, 64, 64, 64, 85, 85, 
    20, 20, 20, 20, 20, 20, 84, 84, 
    85, 64, 64, 64, 80, 80, 80, 85, 
    84, 4, 4, 4, 4, 4, 4, 84, 
    85, 64, 64, 85, 0, 64, 64, 85, 
    84, 4, 0, 84, 4, 20, 20, 84, 
    85, 64, 64, 64, 80, 80, 80, 80, 
    84, 4, 4, 4, 4, 4, 4, 4, 
    64, 64, 64, 64, 80, 80, 80, 85, 
    4, 4, 4, 4, 4, 4, 4, 84,
    21, 0, 0, 85, 64, 80, 80, 85, 
    84, 4, 4, 84, 4, 4, 4, 84
  };

  uint oldD011a = peek( 0xD011 );
  uint oldD016a = peek( 0xD016 );
  uint oldD018a = peek( 0xD018 );
  uint oldD020a = peek( 0xD020 );
  uint oldD021a = peek( 0xD021 );
  uint old0286a = peek( 0x0286 );
  
  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  word bmpaddr = getbmp_addr();
  // word bmpaddrX = bmpaddr + 0x1FF8;
  word bmpaddrX = bmpaddr + 0x0500;
  word scraddr = getscr_addr();
  //word scraddrX = scraddr + 0x03F0;
  word scraddrX = scraddr + 0x00A0;

  word colraddr = 0xD800;
  word colraddrX = 0xD8A0;
  
  word loc = bmpaddr + 328;
  
  clearhires();

  for( uint j = 0; j < 96; inc(j) )
    {
      poke( loc, (joshua)[j] );
      loc = loc + 1;
    }
  irq( ptr(int1), 0x31, 1);


  uint c = getin();
  while( c != 62 )
    {
      if( c == 30 )
	{
	  direction = 0xFF;
	}
      if( c == 38 )
	{
	  direction = 0x01;
	}
      c = getin();
    }

  clearkb();
  
  poke( 0x0286, old0286a );
  poke( 0xD020, oldD020a );
  poke( 0xD021, oldD021a );
  return;
}

void int1()
{
  // set it to mc bitmap mode
  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  // shift the screen
      if( direction == 0xFF )
	{
	  dec( pixelShift );
	}
      if( direction == 0x01 )
	{
	  inc( pixelShift );
	}
  
  pixelShift = pixelShift & 0x07;
  poke( 0xD016, pixelShift | 0xC8 );

  
  irq( ptr(int2), 0x51, 0 );

  // ack the int

  poke( 0xD019, 0x01 );

  jmp( 0xEA7E );
}


void int2()
{

  nop();
  nop();
  nop();
  nop();
  nop();
  nop();
  nop();

  // put the screen back into textmode
  poke( 0xD011, oldD011a );
  poke( 0xD016, oldD016a );
  poke( 0xD018, oldD018a );
  

  // no pixel shift in this frame
  poke( 0xD016, 0xC8 );

  if( direction == 0xFF )
    {
      if( pixelShift == 0x00 )
	{
	  memcpy( 0x2140, 0x2640, 0x08 );
	  //memcpy( 0x2280, 0x2648, 0x08 );
	  memcpy( 0x2148, 0x2140, 0xF8 );
	  memcpy( 0x2240, 0x2238, 0x40 );
	  //memcpy( 0x2288, 0x2280, 0xF8 );
	  //memcpy( 0x2380, 0x2378, 0x40 );
	  memcpy( 0x2640, 0x2278, 0x08 );
	  //memcpy( 0x2648, 0x23B8, 0x08 );
	}
    }
  if( direction == 0x01 )
    {
      if( pixelShift == 0x07 )
	{
	  memcpy( 0x2278, 0x2640, 0x08 );
	  // memcpy( 0x23B8, 0x2648, 0x08 );
	  memcpy( 0x2238, 0x2240, 0x40 );
	  memcpy( 0x2140, 0x2148, 0xF8 );
	  //memcpy( 0x2378, 0x2380, 0x40 );
	  //memcpy( 0x2280, 0x2288, 0xF8 );
	  memcpy( 0x2640, 0x2140, 0x08 );
	  //memcpy( 0x2648, 0x2280, 0x08 );
	}
    }
  //poke( 0xD019, 0x01 );
  previousDirection = direction;
  irq( ptr(int1), 0x31, 0 );

  // ack the int
  poke( 0xD019, 0x01 );

  jmp( 0xEA31 );
}

void clearhires()
{
  for( word mem1 = colraddr; mem1 < colraddrX; mem1 = mem1 + 1 )
    {
      poke( mem1, 0x00 );
    }  
  for( mem1 = 0x0400; mem1 < 0x0478; mem1 = mem1 + 1 )
    {
      //poke( mem1, 0xD0 );
      poke( mem1, 0x10 );
    }
  for( mem1 = 0x0478; mem1 < 0x04A0; mem1 = mem1 + 1 )
    {
      poke( mem1, 0x20 );
    }
  for( mem1 = bmpaddr; mem1 < bmpaddrX; mem1 = mem1 + 1 )
    {
      poke( mem1, 0x00 );
    }

  poke( 0x0429, 0x00 );
  poke( 0x042A, 0xB0 );
  poke( 0x042B, 0xF0 );
  poke( 0x042C, 0x10 );
  
  return;
}
