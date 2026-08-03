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
 
  poke( 0x07F8, 0xC0 );
  word saddr = sprite0;
  
  for( word ii = 0x3000; ii<0x3040; ii = ii + 0x0001 )
    {
      poke( ii, peek( saddr ) );
      saddr = saddr + 0x0001;      
    }


  uint uc0 = 64;
  uint uc1 = 96;
  uint uc2 = 128;
  uint uc3 = 160;
  int ic0 = 64;
  int ic4 = 120;

  word str[5];
  word a = "UINTIMM ";
  word b = "UINTID  ";
  word c = "A       ";
  word d = "XA      ";
  word e = "INTID   ";
  
  str[0] = a;
  str[1] = b;
  str[2] = c;
  str[3] = d;
  str[4] = e;


  word col[5];
  word f = "  64   ";
  word g = "  96   ";
  word h = "  128  ";
  word i = "  160  ";
  word j = "  120  ";
  
  col[0] = f;
  col[1] = g;
  col[2] = h;
  col[3] = i;
  col[4] = j;


  
  // all sprites double height
  poke( 0xD017, 0xFF );
  // all sprites double width
  poke( 0xD01D, 0xFF );

  // all sprites Mono
  poke( 0xD01C, 0x00 );

  spritexy( 0, 50, 75 );
  //       1234567890123456789012345678901234567890
  printf( "PRESS A KEY TO BEGIN TESTING\nSPRITECOLOUR\n\n" );
  pause();
  printf( "TYPE0   TYPE1   Y-CORD  V1  V2\n" );
  
  describe(0,0);
  spritey( 0, 64 );
  spritereg( 1 );
  pause();
  
  describe(0,1);
  spritey( 0, uc1 );
  pause();

  describe(0,2);
  spritey( 0, touint(uc2) );
  pause();

  describe(0,3);
  spritey( 0, toword(uc3) );
  pause();
  
  describe(0,4);
  spritey( 0, ic4 );
  pause();
  
  // --------------------
  describe(1,0);
  spritey( uc0, 64 );
  pause();
  describe(1,1);
  spritey( uc0, uc1 );
  pause();
  describe(1,2);
  spritey( uc0, touint(uc2) );
  pause();
  describe(1,3);
  spritey( uc0, toword(uc3) );
  pause();
  describe(1,4);
  spritey( uc0, ic4 );
  pause();
  // --------------------
  describe(2,0);
  spritey( touint(uc0), 64 );
  pause();
  describe(2,1);
  spritey( touint(uc0), uc1 );
  pause();
  describe(2,2);
  spritey( touint(uc0), touint(uc2) );
  pause();
  describe(2,3);
  spritey( touint(uc0), toword(uc3) );
  pause();
  describe(2,4);
  spritey( touint(uc0), ic4 );
  pause();
  // --------------------
  describe(3,0);
  spritey( toword(uc0), 64 );
  pause();
  describe(3,1);
  spritey( toword(uc0), uc1 );
  pause();
  describe(3,2);
  spritey( toword(uc0), touint(uc2) );
  pause();
  describe(3,3);
  spritey( toword(uc0), toword(uc3) );
  pause();
  describe(3,4);
  spritey( toword(uc0), ic4 );
  pause();
  // --------------------
  describe(4,0);
  spritey( ic0, 64 );
  pause();
  describe(4,1);
  spritey( ic0, uc1 );
  pause();
  describe(4,2);
  spritey( ic0, touint(uc2) );
  pause();
  describe(4,3);
  spritey( ic0, toword(uc3) );
  pause();
  describe(4,4);
  spritey (ic0, ic4 );
  pause();

  spritereg( 0x00 );
  return;  
}

void describe( uint arg0, uint arg1 )
{
  prints( str[arg0] );
  prints( str[arg1] );
  prints( col[arg1] );
  printf( " %u   ", arg0 );
  printf( "%u\n", arg1 );

  return;
}

