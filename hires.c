#include <stdio.h>


void main()
{
  cls();
  clearhires();

  uint whichsprite = 1;

  word x = 0x0080;
  uint y = 192;

  mob sprite1 = { 0, 192, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 1, 29, 6, 1, 21, 0, 1, 42, 0, 2, 42, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 34, 0, 0, 162, 128, 0, 162, 128 };

  mob sprite2 = { 1, 193, 0, 0, 0, 0, 15, 0, 0, 63, 240, 0, 63, 0, 0, 234, 0, 0, 10, 0, 0, 8, 0, 0, 21, 0, 0, 85, 64, 1, 93, 80, 1, 85, 20, 5, 29, 6, 4, 21, 0, 4, 42, 0, 8, 42, 0, 0, 34, 0, 0, 32, 128, 0, 32, 128, 0, 32, 128, 0, 40, 160, 0, 40, 160 };
  

  spritexy( 0, x, y );
  spritexy( 1, x, y );

  // multicolour sprite mode
  poke( 0xD01C, 3 );

  spriteset( 3 );
  pause();
  spriteset( 1 );
  
  // the 01/11/10 sprite colours
  poke( 0xD025, 6 );
  poke( 0xD026, 4 );
  poke( 0xD027, 7 );
  poke( 0xD028, 7 );
  

  // Terraform
  word mem = 0x3E00;
  word cmem = 0x07C0;
  for( uint j = 0; j < 40; inc(j) )
    {
      for( uint i = 0; i < 7; inc(i) )
	{
	  generateLand();
	  incMem();
	}
      generateBottom();
      incMem();
      
      generateColours();
      incCmem();
    }


  // save the old values of the VIC-II
  uint oldD011 = peek( 0xD011 );
  uint oldD016 = peek( 0xD016 );
  uint oldD018 = peek( 0xD018 );
  uint oldD020 = peek( 0xD020 );
  uint oldD021 = peek( 0xD021 );
  uint oldChar = peek( 0x0286 );


  // set multicolour bitmap mode
  poke( 0xD011, 59 ); 
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  // set bg and fg colours
  poke( 0xD020, 0 );      
  poke( 0xD021, 0 );      

  uint timer = 0;
  uint c = getin();
  while( c != 62 )
    {
      if( timer == 0 )
	{
	  checkLeft();
	  checkRight();
	}
      inc( timer );
      c = getin();
    }

  // restore old Vic-II values

  clearkb();
  cls();

  poke( 0xD011, oldD011 );
  poke( 0xD016, oldD016 );
  poke( 0xD018, oldD018 );
  poke( 0xD020, oldD020 );
  poke( 0xD021, oldD021 );
  poke( 0x0286, oldChar );
  return;
}

void clearkb()
{
  poke( 198, 0 );
  jsr( 65508 );
  return;
}

void incMem()
{
  mem = mem + 1;
  return;
}

void incCmem()
{
  cmem = cmem + 1;
  return;
}

void generateLand()
{
  uint r = rnd(1);
  if( r < 65 )
    {
      poke( mem, 170 );
    }
  else
    {
      if( r < 128 )
	{
	  poke( mem, 166 );
	}
      else
	{
	  if( r < 196 )
	    {
	      poke( mem, 149 );
	    }
	  else
	    {
	      poke( mem, 90 );
	    }
	}
    }
  return;
}

void generateBottom()
{
  uint r1 = rnd(1);
  if( r1 < 65 )
    {
      poke( mem, 24 );
    }
  else
    {
      if( r1 < 128 )
	{
	  poke( mem, 8 );
	}
      else
	{
	  if( r1 < 196 )
	    {
	      poke( mem, 0 );
	    }
	  else
	    {
	      poke( mem, 32 );
	    }
	}
    }
  return;
}

void generateColours()
{
  uint r2 = rnd(2);
  if( r2 < 128 )
    {
      poke( cmem, 89 );
    }
  else
    {
      poke( cmem, 149 );
    }
  return;
}

void clearhires()
{  
  // this is for the pixel data
  for( word mem1 = 0x2000; mem1 < 0x3FFF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
    }

  // this is for the single colour (11)
  //for( mem1 = 0xD800; mem1 < 0xDBFF; mem1 = mem1 + 1 )
  //  {
  //    poke( mem1, 5 );
  //  }

  // this is for the colours for 01 and 10
  for( mem1 = 0x0400; mem1 < 0x07FF; mem1 = mem1 + 1 )
    {
      poke( mem1, 0 );
      mem1 = mem1 + 1;
      poke( mem1, 0 );
    }
  return;
}

void pause()
{
  poke( 198, 0 );
  jsr( 65508 );

  uint pausev = getchar();
  while( pausev == 0 )
    {
      pausev = getchar();
    }
  return;
}

void cr()
{
  lda( 0x0D );
  jsr( 0xFFD2 );
  return;
}

void checkLeft()
{
  // move left if "u" is pressed and x > 23
  if( c == 30 )
    {
      if( x > 0x0017 )
	{
	  x = x - 1;
	  spritex( 0, x );
	  spritex( 1, x );
	  moveLegs();
	}
    }
  
  if( x < 0x0017 )
    {
      x = 0x0017;
    }
  return;
}

void checkRight()
{
  // move right if "o" is pressed and x < 320
  if( c == 38 )
    {
      if( x < 320 )
	{
	  x = x + 1;
	  spritex( 0, x );
	  spritex( 1, x );
	  moveLegs();
	}
    }
  
  if( x > 320 )
    {
      x = 320;
    }
  return;
}

void moveLegs()
{
  if( whichsprite == 1 )
    {
      whichsprite = 2;
      spriteset( 2 );
    }
  else
    {
      whichsprite = 1;
      spriteset( 1 );
    }
  
  return;

}
