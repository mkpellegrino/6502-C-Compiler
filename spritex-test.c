void main()
{
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
 
  asmcomment( "set sprite0 pointer" );
  poke( 0x07F8, 0xC0 );

  asmcomment( "set all sprites double height" );
  poke( 0xD017, 0xFF );
  asmcomment( "set all sprites double width" );
  poke( 0xD01D, 0xFF );

  asmcomment( "set all sprites to monochrome" );
  poke( 0xD01C, 0x00 );

  spritexy( 0, 0, 75 );


  asmcomment( "copy the sprite data to the correct memory location" );
  word saddr = sprite0;
  for( word ii = 0x3000; ii<0x3040; ii = ii + 0x0001 )
    {
      poke( ii, peek( saddr ) );
      saddr = saddr + 0x0001;      
    }

  

  uint u0 = 0x00;
  int i0 = 0x00;
  word w0 = 0x0000;

  uint u32 = 0x32;
  int i32 = 0x32;
  word w32 = 0x0032;

  uint uF0 = 0xF0;
  int iF0 = 0xF0;
  word wF0 = 0x00F0;
  
  word w130 = 0x0130;
  
  word str[5];
  word a = "UINTIMM ";
  word b = "UINTID  ";
  word c = "INTID   ";
  word d = "A       ";
  word e = "XA      ";
  word f = "WORDIMM ";
  word g = "WORDID  ";
  
  str[0] = a;
  str[1] = b;
  str[2] = c;
  str[3] = d;
  str[4] = e;
  str[5] = f;
  str[6] = g;

  spritexy( 0, 0, 75 );
  printf( "PRESS A KEY TO BEGIN TESTING SPRITEX\n\n" );
  pause();
  spritereg( 1 );
  printf( "TYPE0   TYPE1   VALUE\n" );

  describe(0,0);
  spritex( 0x00, 0x32 );
  pause();
  describe(0,0);
  spritex( 0x00, 0xF0 );
  pause();
  describe(0,0);
  spritex( 0x00, 0x32 );
  pause();

  describe(0,1);
  spritex( 0x00, u32 );
  pause();
  describe(0,1);
  spritex( 0x00, uF0 );
  pause();
  describe(0,1);
  spritex( 0x00, u32 );
  pause();

  describe(0,2);
  spritex( 0x00, i32 );
  pause();
  describe(0,2);
  spritex( 0x00, iF0 );
  pause();
  describe(0,2);
  spritex( 0x00, i32 );
  pause();

  describe(0,3);
  spritex( 0x00, touint(0x32) );
  pause();
  describe(0,3);
  spritex( 0x00, touint(0xF0) );
  pause();
  describe(0,3);
  spritex( 0x00, touint(0x32) );
  pause();

  describe(0,4);
  spritex( 0x00, toword(0x0032) );
  pause();
  describe(0,4);
  spritex( 0x00, toword(0x00F0) );
  pause();
  describe(0,4);
  spritex( 0x00, toword(0x0130) );
  pause();
  describe(0,4);
  spritex( 0x00, toword(0x00F0) );
  pause();

  describe(0,5);
  spritex( 0x00, 0x0032 );
  pause();
  describe(0,5);
  spritex( 0x00, 0x00F0 );
  pause();
  describe(0,5);
  spritex( 0x00, 0x0130 );
  pause();
  describe(0,5);
  spritex( 0x00, 0x00F0 );
  pause();

  describe(0,6);
  spritex( 0x00, w32 );
  pause();
  describe(0,6);
  spritex( 0x00, wF0 );
  pause();
  describe(0,6);
  spritex( 0x00, w130 );
  pause();
  describe(0,6);
  spritex( 0x00, wF0 );
  pause();


  asmcomment( "************************" );
  describe(1,0);
  spritex( u0, 0x32 );
  pause();
  describe(1,0);
  spritex( u0, 0xF0 );
  pause();
  describe(1,0);
  spritex( u0, 0x32 );
  pause();

  describe(1,1);
  spritex( u0, u32 );
  pause();
  describe(1,1);
  spritex( u0, uF0 );
  pause();
  describe(1,1);
  spritex( u0, u32 );
  pause();

  describe(1,2);
  spritex( u0, i32 );
  pause();
  describe(1,2);
  spritex( u0, iF0 );
  pause();
  describe(1,2);
  spritex( u0, i32 );
  pause();

  describe(1,3);
  spritex( u0, touint(0x32) );
  pause();
  describe(1,3);
  spritex( u0, touint(0xF0) );
  pause();
  describe(1,3);
  spritex( u0, touint(0x32) );
  pause();

  describe(1,4);
  spritex( u0, toword(0x0032) );
  pause();
  describe(1,4);
  spritex( u0, toword(0x00F0) );
  pause();
  describe(1,4);
  spritex( u0, toword(0x0130) );
  pause();
  describe(1,4);
  spritex( u0, toword(0x00F0) );
  pause();

  describe(1,5);
  spritex( u0, 0x0032 );
  pause();
  describe(1,5);
  spritex( u0, 0x00F0 );
  pause();
  describe(1,5);
  spritex( u0, 0x0130 );
  pause();
  describe(1,5);
  spritex( u0, 0x00F0 );
  pause();

  describe(1,6);
  spritex( u0, w32 );
  pause();
  describe(1,6);
  spritex( u0, wF0 );
  pause();
  describe(1,6);
  spritex( u0, w130 );
  pause();
  describe(1,6);
  spritex( u0, wF0 );
  pause();

  asmcomment( "************************" );
  describe(2,0);
  spritex( i0, 0x32 );
  pause();
  describe(2,0);
  spritex( i0, 0xF0 );
  pause();
  describe(2,0);
  spritex( i0, 0x32 );
  pause();

  describe(2,1);
  spritex( i0, u32 );
  pause();
  describe(2,1);
  spritex( i0, uF0 );
  pause();
  describe(2,1);
  spritex( i0, u32 );
  pause();

  describe(2,2);
  spritex( i0, i32 );
  pause();
  describe(2,2);
  spritex( i0, iF0 );
  pause();
  describe(2,2);
  spritex( i0, i32 );
  pause();

  describe(2,3);
  spritex( i0, touint(0x32) );
  pause();
  describe(2,3);
  spritex( i0, touint(0xF0) );
  pause();
  describe(2,3);
  spritex( i0, touint(0x32) );
  pause();

  describe(2,4);
  spritex( i0, toword(0x0032) );
  pause();
  describe(2,4);
  spritex( i0, toword(0x00F0) );
  pause();
  describe(2,4);
  spritex( i0, toword(0x0130) );
  pause();
  describe(2,4);
  spritex( i0, toword(0x00F0) );
  pause();



  describe(2,5);
  spritex( i0, 0x0032 );
  pause();
  describe(2,5);
  spritex( i0, 0x00F0 );
  pause();
  describe(2,5);
  spritex( i0, 0x0130 );
  pause();
  describe(2,5);
  spritex( i0, 0x00F0 );
  pause();

  describe(2,6);
  spritex( i0, w32 );
  pause();
  describe(2,6);
  spritex( i0, wF0 );
  pause();
  describe(2,6);
  spritex( i0, w130 );
  pause();
  describe(2,6);
  spritex( i0, wF0 );
  pause();

  asmcomment( "************************" );
  describe(3,0);
  spritex( touint(0), 0x32 );
  pause();
  describe(3,0);
  spritex( touint(0), 0xF0 );
  pause();
  describe(3,0);
  spritex( touint(0), 0x32 );
  pause();

  describe(3,1);
  spritex( touint(0), u32 );
  pause();
  describe(3,1);
  spritex( touint(0), uF0 );
  pause();
  describe(3,1);
  spritex( touint(0), u32 );
  pause();

  describe(3,2);
  spritex( touint(0), i32 );
  pause();
  describe(3,2);
  spritex( touint(0), iF0 );
  pause();
  describe(3,2);
  spritex( touint(0), i32 );
  pause();

  describe(3,3);
  spritex( touint(0), touint(0x32) );
  pause();
  describe(3,3);
  spritex( touint(0), touint(0xF0) );
  pause();
  describe(3,3);
  spritex( touint(0), touint(0x32) );
  pause();

  describe(3,4);
  spritex( touint(0), toword(0x0032) );
  pause();
  describe(3,4);
  spritex( touint(0), toword(0x00F0) );
  pause();
  describe(3,4);
  spritex( touint(0), toword(0x0130) );
  pause();
  describe(3,4);
  spritex( touint(0), toword(0x00F0) );
  pause();

  describe(3,5);
  spritex( touint(0), 0x0032 );
  pause();
  describe(3,5);
  spritex( touint(0), 0x00F0 );
  pause();
  describe(3,5);
  spritex( touint(0), 0x0130 );
  pause();
  describe(3,5);
  spritex( touint(0), 0x00F0 );
  pause();

  describe(3,6);
  spritex( touint(0), w32 );
  pause();
  describe(3,6);
  spritex( touint(0), wF0 );
  pause();
  describe(3,6);
  spritex( touint(0), w130 );
  pause();
  describe(3,6);
  spritex( touint(0), wF0 );
  pause();

  asmcomment( "************************" );
  describe(4,0);
  spritex( toword(0), 0x32 );
  pause();
  describe(4,0);
  spritex( toword(0), 0xF0 );
  pause();
  describe(4,0);
  spritex( toword(0), 0x32 );
  pause();

  describe(4,1);
  spritex( toword(0), u32 );
  pause();
  describe(4,1);
  spritex( toword(0), uF0 );
  pause();
  describe(4,1);
  spritex( toword(0), u32 );
  pause();

  describe(4,2);
  spritex( toword(0), i32 );
  pause();
  describe(4,2);
  spritex( toword(0), iF0 );
  pause();
  describe(4,2);
  spritex( toword(0), i32 );
  pause();

  describe(4,3);
  spritex( toword(0), touint(0x32) );
  pause();
  describe(4,3);
  spritex( toword(0), touint(0xF0) );
  pause();
  describe(4,3);
  spritex( toword(0), touint(0x32) );
  pause();

  describe(4,4);
  spritex( toword(0), toword(0x0032) );
  pause();
  describe(4,4);
  spritex( toword(0), toword(0x00F0) );
  pause();
  describe(4,4);
  spritex( toword(0), toword(0x0130) );
  pause();
  describe(4,4);
  spritex( toword(0), toword(0x00F0) );
  pause();

  describe(4,5);
  spritex( toword(0), 0x0032 );
  pause();
  describe(4,5);
  spritex( toword(0), 0x00F0 );
  pause();
  describe(4,5);
  spritex( toword(0), 0x0130 );
  pause();
  describe(4,5);
  spritex( toword(0), 0x00F0 );
  pause();

  describe(4,6);
  spritex( toword(0), w32 );
  pause();
  describe(4,6);
  spritex( toword(0), wF0 );
  pause();
  describe(4,6);
  spritex( toword(0), w130 );
  pause();
  describe(4,6);
  spritex( toword(0), wF0 );
  pause();

  asmcomment( "************************" );
  describe(5,0);
  spritex( 0x0000, 0x32 );
  pause();
  describe(5,0);
  spritex( 0x0000, 0xF0 );
  pause();
  describe(5,0);
  spritex( 0x0000, 0x32 );
  pause();

  describe(5,1);
  spritex( 0x0000, u32 );
  pause();
  describe(5,1);
  spritex( 0x0000, uF0 );
  pause();
  describe(5,1);
  spritex( 0x0000, u32 );
  pause();

  describe(5,2);
  spritex( 0x0000, i32 );
  pause();
  describe(5,2);
  spritex( 0x0000, iF0 );
  pause();
  describe(5,2);
  spritex( 0x0000, i32 );
  pause();

  describe(5,3);
  spritex( 0x0000, touint(0x32) );
  pause();
  describe(5,3);
  spritex( 0x0000, touint(0xF0) );
  pause();
  describe(5,3);
  spritex( 0x0000, touint(0x32) );
  pause();

  describe(5,4);
  spritex( 0x0000, toword(0x0032) );
  pause();
  describe(5,4);
  spritex( 0x0000, toword(0x00F0) );
  pause();
  describe(5,4);
  spritex( 0x0000, toword(0x0130) );
  pause();
  describe(5,4);
  spritex( 0x0000, toword(0x00F0) );
  pause();

  describe(5,5);
  spritex( 0x0000, 0x0032 );
  pause();
  describe(5,5);
  spritex( 0x0000, 0x00F0 );
  pause();
  describe(5,5);
  spritex( 0x0000, 0x0130 );
  pause();
  describe(5,5);
  spritex( 0x0000, 0x00F0 );
  pause();

  describe(5,6);
  spritex( 0x0000, w32 );
  pause();
  describe(5,6);
  spritex( 0x0000, wF0 );
  pause();
  describe(5,6);
  spritex( 0x0000, w130 );
  pause();
  describe(5,6);
  spritex( 0x0000, wF0 );
  pause();

  asmcomment( "************************" );
  describe(6,0);
  spritex( w0, 0x32 );
  pause();
  describe(6,0);
  spritex( w0, 0xF0 );
  pause();
  describe(6,0);
  spritex( w0, 0x32 );
  pause();

  describe(6,1);
  spritex( w0, u32 );
  pause();
  describe(6,1);
  spritex( w0, uF0 );
  pause();
  describe(6,1);
  spritex( w0, u32 );
  pause();

  describe(6,2);
  spritex( w0, i32 );
  pause();
  describe(6,2);
  spritex( w0, iF0 );
  pause();
  describe(6,2);
  spritex( w0, i32 );
  pause();

  describe(6,3);
  spritex( w0, touint(0x32) );
  pause();
  describe(6,3);
  spritex( w0, touint(0xF0) );
  pause();
  describe(6,3);
  spritex( w0, touint(0x32) );
  pause();

  describe(6,4);
  spritex( w0, toword(0x0032) );
  pause();
  describe(6,4);
  spritex( w0, toword(0x00F0) );
  pause();
  describe(6,4);
  spritex( w0, toword(0x0130) );
  pause();
  describe(6,4);
  spritex( w0, toword(0x00F0) );
  pause();

  describe(6,5);
  spritex( w0, 0x0032 );
  pause();
  describe(6,5);
  spritex( w0, 0x00F0 );
  pause();
  describe(6,5);
  spritex( w0, 0x0130 );
  pause();
  describe(6,5);
  spritex( w0, 0x00F0 );
  pause();

  describe(6,6);
  spritex( w0, w32 );
  pause();
  describe(6,6);
  spritex( w0, wF0 );
  pause();
  describe(6,6);
  spritex( w0, w130 );
  pause();
  describe(6,6);
  spritex( w0, wF0 );
  pause();
  printf( "TEST COMPLETE\n" );
  asmcomment( "************************" );


  

  spritereg( 0x00 );
  return;  
}

void describe( uint arg0, uint arg1 )
{
  spritecolour( 0x00, arg1 + 0x07 );
  
  prints( str[arg0] );
  prints( str[arg1] );
  printf( " %u\n", arg0 );

  return;
}

