int main()
{
  // Using a Karnaugh Map on the Low Order Word of the Joystick BYTE in memory
  // yields the following:
  // xxx0 goes North
  // xx0x goes South
  // x0xx goes West
  // 0xxx goes East

  // For the High Order Word
  // xxx0 is a button press
  
  uint general8bit=0x01;

  uint portA=NULL;
  uint btnPressA=NULL;
  uint north=NULL;
  uint south=NULL;
  uint east=NULL;
  uint west=NULL;

  while( general8bit != 0x00 )
    {
      shortcls();

      portA = peek(0xDC00);
      btnPressA = portA & 0x10;
      north = portA & 0x01;
      south = portA & 0x02;
      west = portA & 0x04;
      east = portA & 0x08;
      
      if( btnPressA == 0x00 )
	{
	  printf( "FIRE " );
	}
      if( north == 0x00 )
	{
	  printf( "N" );
	}
      if( south == 0x00 )
	{
	  printf( "S" );
	}
      if( west == 0x00 )
	{
	  printf( "W" );
	}
      if( east == 0x00 )
	{
	  printf( "E" );
	}
    }
  return;
}
