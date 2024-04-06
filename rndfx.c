#include <stdio.h>

int main()
{
  asmcomment( "setup some variables" );
  uint general8bit = 0x00;
  uint tmp;
  uint flag;
  word general16bit = 0x0000;

  asmcomment("load the SID data into memory from disk" );
  setfilename( "RNDSID,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );
  
  asmcomment("skip the first 0x7E bytes of the SID file" );
  for( general8bit = 0; general8bit < 0x7E; inc(general8bit) )
    {
      tmp = fchrin();
    }
  
  asmcomment("poke the SID data into memory at 0xC000" );
  for( general16bit = 0x1000; general16bit < 0x1900; general16bit = general16bit + 0x0001 )
  {
    poke( general16bit, fchrin() );
  }

  asmcomment( "close the file" );
  fclose(3);
  fclrchn();
  
  asmcomment( "init the SID music" );
  jsr( 0x1000 );

  asmcomment( "setup the SID irq" );
  irq( ptr(playSID), 0x00, 1 );

  asmcomment( "wait for keypress" );
  general8bit = 0;
  printf( "SPACE TO PLAY SOUND : O TO QUIT\n" );
  while( general8bit != 38 )
    {
      general8bit = getin();
      //jsr( 0xFFD2 );
      if( general8bit == 60 )
	{
	  general8bit = 0x00;
	  flag = 0x01;
	}
    }
  
  irq( ptr( irqrestore ), 0x00, 1 );

  return;
}

void playSID()
{
  asmcomment( "ACK the interrupt" );
  asl( 0xD019 );
  asmcomment( "call the SID routine" );
  jsr( 0x1006 );

  if( flag > 0x00 )
    {
      asmcomment("player attack sound effect");
      poke( 0xD412, 0x81 );      
      // AD
      poke( 0xD413, 0x00 );
      // SR
      poke( 0xD414, 0xF0 );
      // Frequency
      poke( 0xD40F, 34 );
      poke( 0xD40E, 75 );
      dec( flag );
    }
  
  asmcomment( "return to normal loop" );
  jmp( 0xEA31 );
  return;
}

void irqrestore()
{
  asl( 0xD019 );
  jmp( 0xEA31 );
  return;
}

