void main()
{
  word x = 0x00A0;
  uint y = 0x30;
  uint velocity = 0x00;
  uint gravity[7];
  uint gravityI=0x00;
  uint gravityclock = 0x00;

  // initialise as false
  uint gravityOnBool = 0x00;

  gravity[0] = 1;
  gravity[1] = 1;
  gravity[2] = 2;
  gravity[3] = 4;
  gravity[4] = 7;
  gravity[5] = 10;
  gravity[6] = 13;
  
  
  mob sprite1 = { 0, 192, 0, 24, 0, 0, 60, 0, 3, 24, 192, 3, 24, 192, 3, 231, 192, 3, 36, 192, 3, 66, 192, 0, 66, 0, 0, 66, 0, 0, 129, 0, 0, 129, 0, 0, 129, 0, 0, 129, 0, 0, 153, 0, 6, 165, 96, 6, 129, 96, 7, 129, 224, 7, 129, 224, 6, 129, 96, 6, 66, 96, 0, 60, 0 };

  spriteset( 1 );

  spritex( 0, x );
  spritey( 0, y );
  poke( 0x7F8, 192 );

  uint clock = 0x00;
  
  uint c = getin();

  while( c != 62 )
    {
      if( clock == 0x00 )
	{
	  checkLeft();
	  checkRight();
	  checkThrust();
	  checkG();
	  updateGravity();
	  applyGravity();
	  updateSpritePosition();
	  inc(gravityclock);
	}
      
      
      inc( clock );
      c = getin();
    }
  
  clearkb();
  return;
}


void checkLeft()
{
  // move left if "u" is pressed
  if( c == 30 )
    {
      if( x > 0x0016 )
	{
	  x = x - 1;
	}
    }
  return;
}

void checkRight()
{
  // move right if "o" is pressed 
  if( c == 38 )
    {
      if( x < 320 )
	{
	  x = x + 1;
	}
    }
  return;
}

void checkThrust()
{
  // space bar
  if( c == 60 )
    {
      if( velocity < 0x07 )
	{
	  inc( velocity );
	}
      y = y - velocity;
      printf( "VELOCITY: " );
      printf( velocity );
      cr();
    }
  else
    {
      if( velocity != 0x00 )
	{
	  dec( velocity );
	}
    }
  return;
}

void updateGravity()
{
  if( gravityOnBool == 1 )
    {
      if( gravityclock == 0x35 )
	{
	  if( c == 60 )
	    {
	      dec(gravityI);
	      gravityclock = 0;
	    }
	  else
	    {
	      inc(gravityI);
	      gravityclock = 0;
	    }
	}
      
    }
    
  return;
}
void applyGravity()
{
  if( gravityOnBool == 1 )
    {
      if( y < 220 )
	{
	  y = y + gravity[gravityI];
	}
      else
	{
	  y = 220;
	  gravityI = 0;
	}
    }
  return;
}

void updateSpritePosition()
{
  spritex( 0, x );
  spritey( 0, y );
  return;
}

void gravityOn()
{
  gravityOnBool = 0x01;
  printf( "GRAVITY ON\n" );
  return;
}

void gravityOff()
{
  gravityOnBool = 0x00;
  printf( "GRAVITY OFF\n" );
  return;
}

void checkG()
{
  if( c == 26 )
    {
      if( gravityOnBool == 0x01 )
	{
	  gravityOff();
	}
      else
	{
	  gravityOn();
	}
    }

  clearkb();
  return;
}
