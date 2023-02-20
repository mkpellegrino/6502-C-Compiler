int main()
{
  word one = 0x0001;

  word xa[8];
  uint ya[8];

  
  lda( 0x02 );
  uint x1d;
  uint y2d;
  // clear the screen
  shortcls();

  // swap out the BASIC rom
  romout();

  // save all of the VIC-II registers
  saveregs();

  // set border colour to blue
  poke( 0xD020, 0 );

  // set screen colout\r to black
  poke( 0xD021, 0 );

  // cursor colour
  poke( 646, 5 );

  printf( "SPRITE COLLISION TEST\nBY MICHAEL K. PELLEGRINO\nUSING 64C COMPILER\nFEBRUARY 11, 2023\nUP: 8, DOWN: K, LEFT: U, RIGHT: O" );

  // turn off all sprites
  spriteon(0);



  // switch to bank 1
  bank(1);
  
  mob sprite1 = {
    0, 1,
    255, 255, 255,
    234, 170, 171,
    229, 85, 91,
    229, 85, 91,
    229, 101, 155,
    229, 117, 219,
    229, 150, 91,
    229, 166, 155,
    
    229, 182, 219,
    229, 215, 91,
    229, 231, 155,
    229, 247, 219,
    230, 89, 91,
    230, 105, 155,
    230, 121, 219,
    230, 154, 91,

    230, 170, 155,
    230, 186, 219,
    229, 85, 91,
    234, 170, 171,
    255, 255, 255
  };

  mob sprite2 = { 1, 2, 105, 234, 90, 221, 127, 94, 121, 150, 109, 253, 158, 166, 109, 173, 222, 233, 126, 218, 239, 93, 118, 221, 87, 95, 89, 219, 245, 237, 245, 150, 187, 106, 234, 251, 157, 253, 230, 246, 250, 239, 238, 223, 149, 89, 150, 86, 171, 219, 233, 250, 215, 85, 247, 185, 229, 167, 246, 213, 246, 125, 89, 106, 94};

  mob sprite3 = { 2, 3, 105, 234, 90, 221, 127, 94, 121, 150, 109, 253, 158, 166, 109, 173, 222, 233, 126, 218, 239, 93, 118, 221, 87, 95, 89, 219, 245, 237, 245, 150, 187, 106, 234, 251, 157, 253, 230, 246, 250, 239, 238, 223, 149, 89, 150, 86, 171, 219, 233, 250, 215, 85, 247, 185, 229, 167, 246, 213, 246, 125, 89, 106, 94};

  mob sprite4 = { 3, 4, 189, 111, 213, 230, 249, 238, 93, 239, 183, 93, 215, 189, 110, 117, 213, 229, 91, 89, 175, 223, 127, 157, 217, 105, 119, 249, 245, 117, 245, 102, 91, 91, 170, 183, 237, 187, 231, 187, 119, 222, 101, 253, 229, 222, 85, 149, 109, 187, 101, 117, 239, 91, 173, 127, 254, 111, 117, 175, 87, 157, 155, 251, 153};

  mob sprite5 = { 4, 5, 189, 174, 153, 173, 229, 174, 127, 166, 107, 91, 95, 185, 234, 214, 237, 123, 105, 250, 255, 246, 250, 158, 150, 154, 91, 251, 175, 253, 167, 121, 153, 238, 230, 106, 159, 229, 249, 169, 219, 89, 245, 222, 159, 186, 106, 237, 215, 127, 166, 218, 230, 183, 153, 103, 149, 101, 223, 111, 185, 89, 221, 191, 247};

  mob sprite6 = { 5, 6, 109, 87, 150, 234, 233, 222, 181, 247, 223, 253, 185, 110, 222, 235, 103, 221, 218, 245, 103, 233, 186, 127, 189, 154, 230, 223, 149, 239, 86, 109, 245, 102, 233, 247, 214, 217, 157, 86, 94, 122, 221, 121, 123, 234, 87, 151, 174, 87, 183, 103, 159, 249, 122, 174, 86, 237, 155, 229, 187, 93, 105, 218, 106};

  mob sprite7 = { 6, 7, 121, 253, 166, 215, 126, 213, 109, 230, 85, 235, 85, 169, 239, 190, 251, 169, 101, 118, 237, 233, 187, 253, 85, 154, 154, 106, 111, 107, 111, 230, 87, 247, 111, 126, 238, 219, 191, 86, 154, 107, 127, 106, 167, 254, 221, 183, 154, 170, 159, 213, 219, 122, 250, 110, 175, 165, 239, 181, 183, 94, 249, 126, 221};

  mob sprite8 = { 7, 8, 229, 86, 107, 247, 249, 167, 254, 106, 154, 118, 255, 126, 214, 221, 215, 174, 174, 89, 251, 117, 102, 101, 117, 166, 247, 189, 126, 183, 87, 222, 157, 85, 109, 245, 222, 157, 238, 217, 149, 174, 219, 123, 231, 111, 165, 183, 89, 234, 117, 157, 230, 247, 103, 170, 222, 123, 246, 159, 171, 229, 190, 154, 149};


  
  // Setup multicolour bitmap 
  poke( 0xD011, 59 );
  poke( 0xD016, 24 );
  poke( 0xD018, 24 );

  // clear the bitmap screen and set its colours
  clearhires();

  // set sprite coordinates to be center screen

  xa[0] = 0x0120;
  xa[1] = 0x0080;
  xa[2] = 0x00F0;
  xa[3] = 0x0020;
  xa[4] = 0x0080;
  xa[5] = 0x00F0;
  xa[6] = 0x0020;
  xa[7] = 0x0080;
  
  ya[0] = 0x40;
  ya[1] = 0x40;
  ya[2] = 0x40;
  ya[3] = 0x70;
  ya[4] = 0x70;
  ya[5] = 0x70;
  ya[6] = 0xA0;
  ya[7] = 0xA0;

  // Bit Combo: 01 = Bright Green (13) for all sprites
  poke( 0xD025, 13 );

  // Bit Combo: 11 = Green (5) for all sprites
  poke( 0xD026, 5 );
  
  // Bit Combo: 10 = Dark Grey (11) for Sprite 1
  //poke( 0xD027, 11 );
  spritecolour( 0, 10 );
  spritecolour( 1, 11 );
  spritecolour( 2, 12 );
  spritecolour( 3, 1 );
  spritecolour( 4, 2 );
  spritecolour( 5, 3 );
  spritecolour( 6, 4 );
  spritecolour( 7, 5 );
  
  poke( 0xD01C, 0xFF );

  updateSpritePositions();
  
  // turns on all sprites
  spriteon( 0xFF );

  //poke( 0x47F7, 0 );

  // because we're using bank 1 (and not bank 0)
  // the sprite pointers are 0x03F8 off of 0x4400
  poke( 0x47F8, 1 );
  poke( 0x47F9, 2 );
  poke( 0x47FA, 3 );
  poke( 0x47FB, 4 );
  poke( 0x47FC, 5 );
  poke( 0x47FD, 6 );
  poke( 0x47FE, 7 );
  poke( 0x47FF, 8 );

  uint timer = 0;
  uint c = getin();
  while( c != 62 )
    {
      if( timer == 10 )
	{
	  checkRight();
	  checkLeft();
	  checkUp();
	  checkDown(); 
	  updateAIPositions();
	  updateSpritePositions();
	  checkCollision();
	}
      inc( timer );
      timer = timer & 0x3F;
      c = getin();
    }
  //pause();
  
  // flush the kb buffer
  clearkb();

  // turn the sprites all off
  spriteset( 0 );

  // set current bank to bank 0
  bank(0);

  
  restoreregs();
  romin();
  return;
}

void updateSpritePositions()
{

  for( uint uspI = 0; uspI < 8; inc(uspI) )
    {
      spritex( uspI, xa[uspI] );
      spritey( uspI, ya[uspI] );
    }
  
  return;
}

void clearhires()
{
  word mem1 = 0x0000;
  
  // this is for the single colour (11) -- this is ALWAYS at 0xD800
  for( mem1 = 0xD800; mem1 < 0xDBFF; mem1 = mem1 + 0x0001 )
    {
      poke( mem1, 17 );
    }

  // this is for the colours for 01 and 10
  // must stop at 0x47F8 so as to not override
  // the sprite pointers in bank 1
  for( mem1 = 0x4400; mem1 < 0x47F8; mem1 = mem1 + 0x0001 )
    {
      poke( mem1, 188 );
    }
  
  // the pixels
  for( mem1 = 0x6000; mem1 < 0x7FF8; mem1 = mem1 + 0x0001 )
    {
      poke( mem1, 0 );
    }
  return;
}

void checkLeft()
{
  // move left if "u" is pressed and x > 24
  if( c == 30 )
    {
      if( xa[0] > 0x0018 )
      	{
	  xa[0] = xa[0] - 1;
	}
    }
  return;
}

void checkRight()
{
  // move right if "o" is pressed and x < 320
  if( c == 38 )
    {
      if( xa[0] < 320 )
      {
	  xa[0] = xa[0] + 1;
      }
    }  
  return;
}

void checkUp()
{
  // move up if "8" is pressed and y > 0
  if( c == 27 )
    {
      if( ya[0] > 50 )
	{
	  //y0 = y0 - 1;
	  ya[0] = ya[0] - 1;
	  //nop();
	}
    }  
  return;
}

void checkDown()
{
  // move down if "k" is pressed and y < 200
  if( c == 37 )
    {
      if( ya[0] < 229 )
	{
	  //y0 = y0 + 1;
	  ya[0] = ya[0] + 1;
	  //nop();
	}
    }  
  return;
}


void checkCollision()
{
  word collXVar;
  uint collYVar;
  
  for( uint ccI = 1; ccI < 8; inc( ccI ) )
    {
      collXVar = xa[0] - xa[ccI];
      collYVar = ya[0] - ya[ccI];
      
      if( collXVar > 320 )
      	{
      	  collXVar = xa[ccI] - xa[0];
      	}
      
      if( collYVar > 200 )
	{
	  collYVar = ya[ccI] - ya[0];
	}

      if( collXVar < 0x0018 )
	{
	  if( collYVar < 0x15 )
	    {
	      inc( 0xD020 );
	    }
	}
    }
  return;
}

void updateAIPositions()
{
  if( x1d == 2 )
    {
      xa[1] = xa[1] - 1;
    }
  else
    {
      xa[1] = xa[1] + 1;
    }

   if( xa[1] < 0x0018 )
    {
      x1d = 1;
    }

  if( xa[1] > 315 )
    {
      x1d = 2;
    }


  if( y2d == 2 )
    {
      ya[2] = ya[2] - 1;
    }
  else
    {
      ya[2] = ya[2] + 1;
    }

  if( ya[2] < 29 )
    {
      y2d = 1;
    }

  if( ya[2] > 180 )
    {
      y2d = 2;
    }

  return;
}
