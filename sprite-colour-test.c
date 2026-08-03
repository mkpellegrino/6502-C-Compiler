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


  uint uc0 = 0;
  uint uc1 = 1;
  uint uc2 = 2;
  uint uc3 = 3;
  int ic0 = 0;
  int ic4 = 4;

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
  word f = "BLACK  ";
  word g = "WHITE  ";
  word h = "RED    ";
  word i = "CYAN   ";
  word j = "MAGENTA";
  
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
  printf( "TYPE0   TYPE1   COLOUR  V1  V2\n" );
  
  describe(0,0);
  spritecolour( 0, 0 );
  spritereg( 1 );
  pause();
  
  describe(0,1);
  spritecolour( 0, uc1 );
  pause();

  describe(0,2);
  spritecolour( 0, touint(uc2) );
  pause();

  describe(0,3);
  spritecolour( 0, toword(uc3) );
  pause();
  
  describe(0,4);
  spritecolour( 0, ic4 );
  pause();
  
  // --------------------
  describe(1,0);
  spritecolour( uc0, 0 );
  pause();
  describe(1,1);
  spritecolour( uc0, uc1 );
  pause();
  describe(1,2);
  spritecolour( uc0, touint(uc2) );
  pause();
  describe(1,3);
  spritecolour( uc0, toword(uc3) );
  pause();
  describe(1,4);
  spritecolour( uc0, ic4 );
  pause();
  // --------------------
  describe(2,0);
  spritecolour( touint(uc0), 0 );
  pause();
  describe(2,1);
  spritecolour( touint(uc0), uc1 );
  pause();
  describe(2,2);
  asmcomment( "******************************" );
  spritecolour( touint(uc0), touint(uc2) );
  asmcomment( "******************************" );
  pause();
  describe(2,3);
  asmcomment( "******************************" );
  spritecolour( touint(uc0), toword(uc3) );
  asmcomment( "******************************" );
  pause();
  describe(2,4);
  spritecolour( touint(uc0), ic4 );
  pause();
  // --------------------
  describe(3,0);
  spritecolour( toword(uc0), 0 );
  pause();
  describe(3,1);
  spritecolour( toword(uc0), uc1 );
  pause();
  describe(3,2);
  spritecolour( toword(uc0), touint(uc2) );
  pause();
  describe(3,3);
  spritecolour( toword(uc0), toword(uc3) );
  pause();
  describe(3,4);
  spritecolour( toword(uc0), ic4 );
  pause();
  // --------------------
  describe(4,0);
  spritecolour( ic0, 0 );
  pause();
  describe(4,1);
  spritecolour( ic0, uc1 );
  pause();
  describe(4,2);
  spritecolour( ic0, touint(uc2) );
  pause();
  describe(4,3);
  spritecolour( ic0, toword(uc3) );
  pause();
  describe(4,4);
  spritecolour (ic0, ic4 );
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

