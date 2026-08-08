void main()
{
  uint testnum = 0x01;
  cls();
  
  data sprite0 =
    {
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0x00, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0xFF,
      0x00 };
 
  asmcomment( "set sprite pointers" );
  poke( 0x07F8, 0xC0 );
  poke( 0x07F9, 0xC0 );
  poke( 0x07FA, 0xC0 );
  poke( 0x07FB, 0xC0 );
  
  poke( 0x07FC, 0xC0 );
  poke( 0x07FD, 0xC0 );
  poke( 0x07FE, 0xC0 );
  poke( 0x07FF, 0xC0 );

  asmcomment( "set all sprites double height" );
  poke( 0xD017, 0xFF );
  asmcomment( "set all sprites double width" );
  poke( 0xD01D, 0xFF );

  asmcomment( "set all sprites to monochrome" );
  poke( 0xD01C, 0x00 );

  
  spritecolour( 0x00, 0x00 );
  spritecolour( 0x01, 0x01 );
  spritecolour( 0x02, 0x02 );
  spritecolour( 0x03, 0x03 );

  spritecolour( 0x04, 0x07 );
  spritecolour( 0x05, 0x08 );
  spritecolour( 0x06, 0x09 );
  spritecolour( 0x07, 0x0A );
  
  asmcomment( "copy the sprite data to the correct memory location" );
  word saddr = sprite0;
  for( word ii = 0x3000; ii<0x3040; ii = ii + 0x0001 )
    {
      poke( ii, peek( saddr ) );
      saddr = saddr + 0x0001;      
    }




  spritereg( 0xFF );



  uint u80 = 0x80;
  uint u60 = 0x60;
  uint u40 = 0x40;
  uint u20 = 0x20;
  uint u00 = 0x00;
  uint i60 = 0x60;
  uint i20 = 0x20;
  uint i00 = 0x00;
  word w120 = 0x0120;
  word w40 = 0x0040;
  word w20 = 0x0020;
  word w0000 = 0x0000;
  word w0040 = 0x0040;
  word w0080 = 0x0080;
  word w0130 = 0x0130;
  word w80 = 0x0080;


  // First argument: w0000
  spritexy(w0000, w0130, 0x0080);
  myPause();
  spritexy(w0000, w0080, 0x0080);
  myPause();
  spritexy(w0000, w0130, 0x0080);
  myPause();

  spritexy(w0000, w0130, 0x80);
  myPause();
  spritexy(w0000, w0080, 0x40);
  myPause();
  spritexy(w0000, w0130, 0x80);
  myPause();

  spritexy(w0000, w0130, u80);
  myPause();
  spritexy(w0000, w0080, u40);
  myPause();
  spritexy(w0000, w0130, u80);
  myPause();

  spritexy(w0000, w0130, w0080);
  myPause();
  spritexy(w0000, w0080, w0040);
  myPause();
  spritexy(w0000, w0130, w0080);
  myPause();

  spritexy(w0000, w0130, toword(0x0080));
  myPause();
  spritexy(w0000, w0080, toword(0x0040));
  myPause();
  spritexy(w0000, w0130, toword(0x0080));
  myPause();

  spritexy(w0000, w0130, touint(0x80));
  myPause();
  spritexy(w0000, w0080, touint(0x40));
  myPause();
  spritexy(w0000, w0130, touint(0x80));
  myPause();

  
  spritexy(w0000, u80, 0x0080);
  myPause();
  spritexy(w0000, u80, 0x80);
  myPause();
  spritexy(w0000, u80, u80);
  myPause();
  spritexy(w0000, u80, w0080);
  myPause();
  spritexy(w0000, u80, toword(0x0080));
  myPause();
  spritexy(w0000, u80, touint(0x80));
  myPause();

  spritexy(w0000, touint(0x80), 0x0080);
  myPause();
  spritexy(w0000, touint(0x80), 0x80);
  myPause();
  spritexy(w0000, touint(0x80), u80);
  myPause();
  spritexy(w0000, touint(0x80), w0080);
  myPause();
  spritexy(w0000, touint(0x80), toword(0x0080));
  myPause();
  spritexy(w0000, touint(0x80), touint(0x80));
  myPause();

  spritexy(w0000, toword(0x80), 0x0080);
  myPause();
  spritexy(w0000, toword(0x80), 0x80);
  myPause();
  spritexy(w0000, toword(0x80), u80);
  myPause();
  spritexy(w0000, toword(0x80), w0080);
  myPause();
  spritexy(w0000, toword(0x0080), toword(0x0080));
  myPause();
  spritexy(w0000, toword(0x80), touint(0x80));
  myPause();

  spritexy(w0000, 0x0130, 0x0080);
  myPause();
  spritexy(w0000, 0x0130, 0x80);
  myPause();
  spritexy(w0000, 0x0130, u80);
  myPause();
  spritexy(w0000, 0x0130, w0080);
  myPause();
  spritexy(w0000, 0x0130, toword(0x0080));
  myPause();
  spritexy(w0000, 0x0130, touint(0x80));
  myPause();

  spritexy(w0000, 0x80, 0x0080);
  myPause();
  spritexy(w0000, 0x80, 0x80);
  myPause();
  spritexy(w0000, 0x80, u80);
  myPause();
  spritexy(w0000, 0x80, w0080);
  myPause();
  spritexy(w0000, 0x80, toword(0x0080));
  myPause();
  spritexy(w0000, 0x80, touint(0x80));
  myPause();


  // First argument: u00
  spritexy(u00, w0130, 0x0080);
  myPause();
  spritexy(u00, w0130, 0x80);
  myPause();
  spritexy(u00, w0130, u80);
  myPause();
  spritexy(u00, w0130, w0080);
  myPause();
  spritexy(u00, w0130, toword(0x0080));
  myPause();
  spritexy(u00, w0130, touint(0x80));
  myPause();

  spritexy(u00, u80, 0x0080);
  myPause();
  spritexy(u00, u80, 0x80);
  myPause();
  spritexy(u00, u80, u80);
  myPause();
  spritexy(u00, u80, w0080);
  myPause();
  spritexy(u00, u80, toword(0x0080));
  myPause();
  spritexy(u00, u80, touint(0x80));
  myPause();

  spritexy(u00, touint(0x80), 0x0080);
  myPause();
  spritexy(u00, touint(0x80), 0x80);
  myPause();
  spritexy(u00, touint(0x80), u80);
  myPause();
  spritexy(u00, touint(0x80), w0080);
  myPause();
  spritexy(u00, touint(0x80), toword(0x0080));
  myPause();
  spritexy(u00, touint(0x80), touint(0x80));
  myPause();

  spritexy(u00, toword(0x80), 0x0080);
  myPause();
  spritexy(u00, toword(0x80), 0x80);
  myPause();
  spritexy(u00, toword(0x80), u80);
  myPause();
  spritexy(u00, toword(0x80), w0080);
  myPause();
  spritexy(u00, toword(0x80), toword(0x0080));
  myPause();
  spritexy(u00, toword(0x80), touint(0x80));
  myPause();

  spritexy(u00, 0x0130, 0x0080);
  myPause();
  spritexy(u00, 0x0130, 0x80);
  myPause();
  spritexy(u00, 0x0130, u80);
  myPause();
  spritexy(u00, 0x0130, w0080);
  myPause();
  spritexy(u00, 0x0130, toword(0x0080));
  myPause();
  spritexy(u00, 0x0130, touint(0x80));
  myPause();

  spritexy(u00, 0x80, 0x0080);
  myPause();
  spritexy(u00, 0x80, 0x80);
  myPause();
  spritexy(u00, 0x80, u80);
  myPause();
  spritexy(u00, 0x80, w0080);
  myPause();
  spritexy(u00, 0x80, toword(0x0080));
  myPause();
  spritexy(u00, 0x80, touint(0x80));
  myPause();


  // First argument: touint(0x00)
  spritexy(touint(0x00), w0130, 0x0080);
  myPause();
  spritexy(touint(0x00), w0130, 0x80);
  myPause();
  spritexy(touint(0x00), w0130, u80);
  myPause();
  spritexy(touint(0x00), w0130, w0080);
  myPause();
  spritexy(touint(0x00), w0130, toword(0x0080));
  myPause();
  spritexy(touint(0x00), w0130, touint(0x80));
  myPause();

  spritexy(touint(0x00), u80, 0x0080);
  myPause();
  spritexy(touint(0x00), u80, 0x80);
  myPause();
  spritexy(touint(0x00), u80, u80);
  myPause();
  spritexy(touint(0x00), u80, w0080);
  myPause();
  spritexy(touint(0x00), u80, toword(0x0080));
  myPause();
  spritexy(touint(0x00), u80, touint(0x80));
  myPause();

  spritexy(touint(0x00), touint(0x80), 0x0080);
  myPause();
  spritexy(touint(0x00), touint(0x80), 0x80);
  myPause();
  spritexy(touint(0x00), touint(0x80), u80);
  myPause();
  spritexy(touint(0x00), touint(0x80), w0080);
  myPause();
  spritexy(touint(0x00), touint(0x80), toword(0x0080));
  myPause();
  spritexy(touint(0x00), touint(0x80), touint(0x80));
  myPause();

  spritexy(touint(0x00), toword(0x80), 0x0080);
  myPause();
  spritexy(touint(0x00), toword(0x80), 0x80);
  myPause();
  spritexy(touint(0x00), toword(0x80), u80);
  myPause();
  spritexy(touint(0x00), toword(0x80), w0080);
  myPause();
  spritexy(touint(0x00), toword(0x80), toword(0x0080));
  myPause();
  spritexy(touint(0x00), toword(0x80), touint(0x80));
  myPause();

  spritexy(touint(0x00), 0x0130, 0x0080);
  myPause();
  spritexy(touint(0x00), 0x0130, 0x80);
  myPause();
  spritexy(touint(0x00), 0x0130, u80);
  myPause();
  spritexy(touint(0x00), 0x0130, w0080);
  myPause();
  spritexy(touint(0x00), 0x0130, toword(0x0080));
  myPause();
  spritexy(touint(0x00), 0x0130, touint(0x80));
  myPause();

  spritexy(touint(0x00), 0x80, 0x0080);
  myPause();
  spritexy(touint(0x00), 0x80, 0x80);
  myPause();
  spritexy(touint(0x00), 0x80, u80);
  myPause();
  spritexy(touint(0x00), 0x80, w0080);
  myPause();
  spritexy(touint(0x00), 0x80, toword(0x0080));
  myPause();
  spritexy(touint(0x00), 0x80, touint(0x80));
  myPause();


  // First argument: toword(0x0000)
  spritexy(toword(0x0000), w0130, 0x0080);
  myPause();
  spritexy(toword(0x0000), w0130, 0x80);
  myPause();
  spritexy(toword(0x0000), w0130, u80);
  myPause();
  spritexy(toword(0x0000), w0130, w0080);
  myPause();
  spritexy(toword(0x0000), w0130, toword(0x0080));
  myPause();
  spritexy(toword(0x0000), w0130, touint(0x80));
  myPause();

  spritexy(toword(0x0000), u80, 0x0080);
  myPause();
  spritexy(toword(0x0000), u80, 0x80);
  myPause();
  spritexy(toword(0x0000), u80, u80);
  myPause();
  spritexy(toword(0x0000), u80, w0080);
  myPause();
  spritexy(toword(0x0000), u80, toword(0x0080));
  myPause();
  spritexy(toword(0x0000), u80, touint(0x80));
  myPause();

  spritexy(toword(0x0000), touint(0x80), 0x0080);
  myPause();
  spritexy(toword(0x0000), touint(0x80), 0x80);
  myPause();
  spritexy(toword(0x0000), touint(0x80), u80);
  myPause();
  spritexy(toword(0x0000), touint(0x80), w0080);
  myPause();
  spritexy(toword(0x0000), touint(0x80), toword(0x0080));
  myPause();
  spritexy(toword(0x0000), touint(0x80), touint(0x80));
  myPause();

  spritexy(toword(0x0000), toword(0x80), 0x0080);
  myPause();
  spritexy(toword(0x0000), toword(0x80), 0x80);
  myPause();
  spritexy(toword(0x0000), toword(0x80), u80);
  myPause();
  spritexy(toword(0x0000), toword(0x80), w0080);
  myPause();
  spritexy(toword(0x0000), toword(0x80), toword(0x0080));
  myPause();
  spritexy(toword(0x0000), toword(0x80), touint(0x80));
  myPause();

  spritexy(toword(0x0000), 0x0130, 0x0080);
  myPause();
  spritexy(toword(0x0000), 0x0130, 0x80);
  myPause();
  spritexy(toword(0x0000), 0x0130, u80);
  myPause();
  spritexy(toword(0x0000), 0x0130, w0080);
  myPause();
  spritexy(toword(0x0000), 0x0130, toword(0x0080));
  myPause();
  spritexy(toword(0x0000), 0x0130, touint(0x80));
  myPause();

  spritexy(toword(0x0000), 0x80, 0x0080);
  myPause();
  spritexy(toword(0x0000), 0x80, 0x80);
  myPause();
  spritexy(toword(0x0000), 0x80, u80);
  myPause();
  spritexy(toword(0x0000), 0x80, w0080);
  myPause();
  spritexy(toword(0x0000), 0x80, toword(0x0080));
  myPause();
  spritexy(toword(0x0000), 0x80, touint(0x80));
  myPause();


  // First argument: 0x0000
  spritexy(0x0000, w0130, 0x0080);
  myPause();
  spritexy(0x0000, w0130, 0x80);
  myPause();
  spritexy(0x0000, w0130, u80);
  myPause();
  spritexy(0x0000, w0130, w0080);
  myPause();
  spritexy(0x0000, w0130, toword(0x0080));
  myPause();
  spritexy(0x0000, w0130, touint(0x80));
  myPause();

  spritexy(0x0000, u80, 0x0080);
  myPause();
  spritexy(0x0000, u80, 0x80);
  myPause();
  spritexy(0x0000, u80, u80);
  myPause();
  spritexy(0x0000, u80, w0080);
  myPause();
  spritexy(0x0000, u80, toword(0x0080));
  myPause();
  spritexy(0x0000, u80, touint(0x80));
  myPause();

  spritexy(0x0000, touint(0x80), 0x0080);
  myPause();
  spritexy(0x0000, touint(0x80), 0x80);
  myPause();
  spritexy(0x0000, touint(0x80), u80);
  myPause();
  spritexy(0x0000, touint(0x80), w0080);
  myPause();
  spritexy(0x0000, touint(0x80), toword(0x0080));
  myPause();
  spritexy(0x0000, touint(0x80), touint(0x80));
  myPause();

  spritexy(0x0000, toword(0x80), 0x0080);
  myPause();
  spritexy(0x0000, toword(0x80), 0x80);
  myPause();
  spritexy(0x0000, toword(0x80), u80);
  myPause();
  spritexy(0x0000, toword(0x80), w0080);
  myPause();
  spritexy(0x0000, toword(0x80), toword(0x0080));
  myPause();
  spritexy(0x0000, toword(0x80), touint(0x80));
  myPause();

  spritexy(0x0000, 0x0130, 0x0080);
  myPause();
  spritexy(0x0000, 0x0130, 0x80);
  myPause();
  spritexy(0x0000, 0x0130, u80);
  myPause();
  spritexy(0x0000, 0x0130, w0080);
  myPause();
  spritexy(0x0000, 0x0130, toword(0x0080));
  myPause();
  spritexy(0x0000, 0x0130, touint(0x80));
  myPause();

  spritexy(0x0000, 0x80, 0x0080);
  myPause();
  spritexy(0x0000, 0x80, 0x80);
  myPause();
  spritexy(0x0000, 0x80, u80);
  myPause();
  spritexy(0x0000, 0x80, w0080);
  myPause();
  spritexy(0x0000, 0x80, toword(0x0080));
  myPause();
  spritexy(0x0000, 0x80, touint(0x80));
  myPause();


  // First argument: 0x00
  spritexy(0x00, w0130, 0x0080);
  myPause();
  spritexy(0x00, w0130, 0x80);
  myPause();
  spritexy(0x00, w0130, u80);
  myPause();
  spritexy(0x00, w0130, w0080);
  myPause();
  spritexy(0x00, w0130, toword(0x0080));
  myPause();
  spritexy(0x00, w0130, touint(0x80));
  myPause();

  spritexy(0x00, u80, 0x0080);
  myPause();
  spritexy(0x00, u80, 0x80);
  myPause();
  spritexy(0x00, u80, u80);
  myPause();
  spritexy(0x00, u80, w0080);
  myPause();
  spritexy(0x00, u80, toword(0x0080));
  myPause();
  spritexy(0x00, u80, touint(0x80));
  myPause();

  spritexy(0x00, touint(0x80), 0x0080);
  myPause();
  spritexy(0x00, touint(0x80), 0x80);
  myPause();
  spritexy(0x00, touint(0x80), u80);
  myPause();
  spritexy(0x00, touint(0x80), w0080);
  myPause();
  spritexy(0x00, touint(0x80), toword(0x0080));
  myPause();
  spritexy(0x00, touint(0x80), touint(0x80));
  myPause();

  spritexy(0x00, toword(0x80), 0x0080);
  myPause();
  spritexy(0x00, toword(0x80), 0x80);
  myPause();
  spritexy(0x00, toword(0x80), u80);
  myPause();
  spritexy(0x00, toword(0x80), w0080);
  myPause();
  spritexy(0x00, toword(0x80), toword(0x0080));
  myPause();
  spritexy(0x00, toword(0x80), touint(0x80));
  myPause();

  spritexy(0x00, 0x0130, 0x0080);
  myPause();
  spritexy(0x00, 0x0130, 0x80);
  myPause();
  spritexy(0x00, 0x0130, u80);
  myPause();
  spritexy(0x00, 0x0130, w0080);
  myPause();
  spritexy(0x00, 0x0130, toword(0x0080));
  myPause();
  spritexy(0x00, 0x0130, touint(0x80));
  myPause();

  spritexy(0x00, 0x80, 0x0080);
  myPause();
  spritexy(0x00, 0x80, 0x80);
  myPause();
  spritexy(0x00, 0x80, u80);
  myPause();
  spritexy(0x00, 0x80, w0080);
  myPause();
  spritexy(0x00, 0x80, toword(0x0080));
  myPause();
  spritexy(0x00, 0x80, touint(0x80));
  myPause();
  spritereg( 0x00 );
  return;  
}

void myPause()
{
  word X = peek(0xD010) * 256;
  X = X + peek(0xD000);
  uint Y = peek(0xD001);
  
  printf( "%u) ", testnum );
  printf( "X: %u  ", X );
  printf( "Y: %u\n", Y );
  printf( "PRESS A KEY\n" );
  pause();
  spritexy( 0, 16, 40 );
  inc(testnum);
  return;
}

void delay()
{
  for( uint i = 0x00; i != 0xFF; inc(i) )
    {
      nop();
    }
  return;
}
  
