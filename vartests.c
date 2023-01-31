#include <stdio.h>

int main()
{
  cls();
  romout();
  saveregs();

  
  // background colours
  poke( 0xD020, 9 );
  poke( 0xD021, 12 );

  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );
  
  bank(1);
  clearhires();

  putbits();


  
  pause();
  bank(0);
  restoreregs();
  romin();
  return;
}

void putbits()
{
  data b =
    {
      0xFA, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0xAA, 0xAA, 0xFA, 0x0F, 0x00, 0x00, 0x00, 0x00,
      0xAA, 0xAA, 0xAA, 0xAA, 0xFA, 0x0F, 0x00, 0x00,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xFA, 0x0F,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAF, 0xF0,
      0xAA, 0xAA, 0xAA, 0xAA, 0xAF, 0xF0, 0x00, 0x00,
      0xAA, 0xAA, 0xAF, 0xF0, 0x00, 0x00, 0x00, 0x00,
      0xAF, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };

  
  uint bindex = 0;
  uint x = 20;
  uint y = 5;
  word offset = 0x0000;
  offset = y;
  offset = offset * 40;
  offset = offset + x;

  word color1 = offset + 0xD800;
  word colors2and3 = offset + 0x4400;

  asl( offset );
  asl( offset );
  asl( offset );

  word pixels = offset + 0x6000;
  
  for( uint u = 0; u < 10; inc(u) )
    {

      poke( color1, 1 );
      poke( colors2and3, 0x26 );

      color1 = color1 + 1;
      colors2and3 = colors2and3 + 1;
      
      for( uint i = 0; i < 8; inc( i ) )
	{
	  poke( pixels, (b)[bindex] );
	  pixels = pixels + 1;
	  inc( bindex );
	}
    }
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

void clearhires()
{
  word mem1 = 0x0000;
  
  for( mem1 = 0xD800; mem1 < 0xDBFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }
  
  for( mem1 = 0x4400; mem1 < 0x47FF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }

  for( mem1 = 0x6000; mem1 < 0x7FF8; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }
  
  return;
}
