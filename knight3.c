int main()
{
  uint joystickdata=NULL;
  uint buttonpress=NULL;
  uint joystickenabled=NULL;

  uint JSportA=NULL;
  uint JSbtnPressA=NULL;
  uint JSnorth=NULL;
  uint JSsouth=NULL;
  uint JSeast=NULL;
  uint JSwest=NULL;

  asmcomment( "Bitmap Graphics Definitions" );  
  data sdoor = { 213, 213, 253, 255, 255, 255, 255, 255, 85, 85, 85, 245, 255, 255, 255, 255, 85, 85, 85, 95, 255, 255, 255, 255, 87, 87, 127, 255, 255, 255, 255, 255 };
  data empty2 = { 170, 170, 170, 170, 170, 170, 170, 170 };
  data steal1 = {0, 0, 0, 1, 1, 7, 7, 23,     0, 63, 122, 234, 234, 170, 170, 170,     0, 252, 174, 151, 183, 181, 253, 245,    0, 0, 0, 128, 128, 224, 224, 232};
  data steal3 = {30, 30, 94, 94, 94, 94, 94, 94, 171, 171, 171, 171, 175, 191, 175, 191, 253, 245, 245, 245, 245, 213, 245, 213, 120, 122, 122, 122, 122, 122, 122, 122 };
  data steal5 = {95, 87, 87, 87, 87, 87, 23, 23, 175, 175, 173, 253, 213, 245, 255, 235, 85, 85, 85, 87, 87, 95, 255, 235, 250, 234, 234, 234, 234, 234, 232, 232 };
  data steal7 = {21, 5, 5, 1, 1, 0, 0, 0, 255, 255, 127, 95, 95, 95, 23, 0, 255, 255, 254, 250, 250, 250, 232, 0, 168, 160, 160, 128, 128, 0, 0, 0 };
  data wall2 = { 106, 106, 106, 106, 106, 106, 106, 85, 170, 170, 170, 170, 170, 170, 170, 85 };
  data door1to4 = { 255, 255, 255, 255, 255, 255, 255, 255 };
  data door0topL = { 3, 3, 15, 15, 63, 63, 255, 255 };
  data door0topR = { 192, 192, 240, 240, 252, 252, 255, 255 };
  data armour0 = { 0, 0, 0, 0, 3, 3, 3, 3, 63, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
  data armour1 = { 3, 3, 3, 3, 3, 3, 3, 3, 255, 255, 255, 255, 255, 255, 255, 255, 192, 0, 0, 0, 0, 0, 0, 255, 3, 3, 3, 3, 3, 3, 3, 255 };
  data armour2 = { 63, 255, 195, 195, 195, 195, 195, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3 };
  data armour3 = { 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 192, 192, 192, 192, 192, 192, 192, 192, 3, 3, 3, 3, 3, 3, 3, 3 };
  data armour4 = { 3, 3, 3, 3, 3, 3, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 192, 192, 192, 192, 192, 192, 255, 255, 3, 3, 3, 3, 3, 3, 3, 3 };
  data torch0 = { 1, 5, 26, 25, 6, 6, 63, 15, 0, 128, 144, 96, 64, 128, 240, 192 };
  data torch1 = { 3, 3, 3, 3, 3, 3, 3, 3 };


  data cuff0 = { 149, 157, 157, 140, 140, 176, 176, 186, 1, 1, 1, 0, 0, 0, 0, 170, 80, 208, 208, 192, 192, 48, 48, 186 };
  data cuff1 = { 176, 192, 192, 192, 192, 240, 192, 170, 0, 0, 0, 0, 0, 0, 0, 170, 48, 12, 12, 12, 12, 51, 12, 170 };


  data window0 = { 64, 64, 64, 67, 78, 78, 122, 122, 0, 0, 255, 170, 170, 170, 170, 170, 64, 64, 255, 170, 170, 170, 170, 170, 0, 0, 192, 176, 172, 172, 171, 171 };
  data window1L = { 122, 122, 122, 122, 122, 122, 122, 122 };
  data window1R = { 171, 171, 171, 171, 171, 171, 171, 171 };
  data window3L = { 122, 122, 122, 122, 122, 122, 122, 127 };
  data window3M = { 170, 170, 170, 170, 170, 170, 170, 255 };
  data window3R = { 171, 171, 171, 171, 171, 171, 171, 255 };

  data paintingtop = { 10, 8, 8, 8, 11, 8, 10, 10, 170, 255, 255, 255, 255, 165, 151, 149, 170, 0, 0, 0, 240, 0, 64, 80, 160, 32, 32, 32, 32, 32, 32, 32 };

  data paintingbot = { 8, 8, 8, 11, 11, 11, 11, 10, 93, 23, 253, 255, 255, 255, 255, 170, 1, 1, 67, 255, 252, 192, 192, 170, 96, 96, 224, 224, 32, 32, 32, 160 };


  data painting2top = {170, 128, 128, 128, 128, 128, 128, 128, 170, 0, 0, 63, 253, 245, 246, 245, 170, 0, 0, 240, 112, 92, 108, 156, 170, 2, 2, 2, 2, 2, 2, 2 };

  data painting2bot = { 128, 128, 128, 130, 130, 130, 138, 170, 245, 253, 250, 250, 186, 186, 250, 170, 80, 64, 168, 106, 170, 110, 174, 170, 2, 2, 2, 2, 130, 130, 130, 170 };


  data leftWallTop = { 252, 240, 192, 192, 192, 192, 192, 192 };
  data leftWallMid = { 192, 192, 192, 192, 192, 192, 192, 192 };
  data leftWallBot = { 192, 192, 192, 192, 192, 192, 240, 252 };

  data rightWallTop = { 63, 15, 3, 3, 3, 3, 3, 3 };
  data rightWallMid = { 3, 3, 3, 3, 3, 3, 3, 3 };
  data rightWallBot = { 3, 3, 3, 3, 3, 3, 15, 63 };


  data fleurdelistop = { 255, 234, 234, 234, 234, 214, 214, 213, 255, 150, 150, 85, 85, 85, 85, 150, 255, 171, 171, 171, 171, 151, 151, 87 };
  data fleurdelisbot = { 217, 218, 234, 234, 234, 234, 234, 255, 85, 85, 150, 150, 150, 105, 170, 255, 103, 167, 171, 171, 171, 171, 171, 255 };


  data shieldtop = { 192, 255, 192, 192, 200, 194, 200, 192, 48, 207, 168, 32, 32, 170, 32, 32, 76, 252, 12, 12, 140, 12, 140, 12 };
    
  data shieldbot = { 112, 112, 112, 76, 76, 67, 64, 85, 32, 32, 32, 32, 168, 3, 204, 117, 48, 48, 48, 192, 192, 64, 64, 85 };


  data keyonwall = { 60, 195, 195, 60, 12, 60, 12, 60 };

  asmcomment( "Text Definitions" );
  
  data scoreText = {'E', 'X', 'P', ':' };
  data healthText = {'H', 'E', 'A', 'L', 'T', 'H', ':' };
  data monsterHealthText = {'E', 'N', 'E', 'M', 'Y', ':' };
  data livesText = {'L', 'I', 'V', 'E', 'S', ':' };
  data spacesText = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
  data zeroText = {'0'};
  data goldText = {'G', 'O', 'L', 'D', ':' };
  data youDiedText = {'Y', 'O', 'U', ' ', 'H', 'A', 'V', 'E', ' ', 'P', 'E', 'R', 'I', 'S', 'H', 'E', 'D' };
  //               1    2    3    4    5    6    7    8    9    0    1    2    3    4    5    6    7    8    9    0    1    2    3    4    5
  data pakText = {'P', 'R', 'E', 'S', 'S', ' ', 'A', 'N', 'Y', ' ', 'K', 'E', 'Y', ' ', 'T', 'O', ' ', 'C', 'O', 'N', 'T', 'I', 'N', 'U', 'E' };
  // 17 chars
  data lastTimeText = { 'F', 'O', 'R', ' ', 'T', 'H', 'E', ' ', 'L', 'A', 'S', 'T', ' ', 'T', 'I', 'M', 'E' };
  
  data pressyText = {'P', 'R', 'E', 'S', 'S', ' ', 'Y', ' ', 'T', 'O', ' ', 'P', 'L', 'A', 'Y', ' ', 'A', 'G', 'A', 'I', 'N' };
  data quitText = {'P', 'R', 'E', 'S', 'S', ' ', 'Q', ' ', 'T', 'O', ' ', 'Q', 'U', 'I', 'T' };
  asmcomment( "LETTER/DIGIT DEFINITIONS" );
  // digits
  data digits =
    {
      0, 48, 204, 204, 204, 204, 204, 48,
      0, 48, 48, 48, 48, 48, 48, 48,
      0, 48, 204, 12, 48, 192, 192, 252,
      0, 48, 204, 12, 48, 12, 204, 48,
      0, 12, 204, 204, 252, 12, 12, 12,
      0, 252, 192, 240, 12, 12, 204, 48,
      0, 48, 204, 192, 240, 204, 204, 48,
      0, 252, 12, 12, 48, 48, 48, 48,
      0, 48, 204, 204, 48, 204, 204, 48,
      0, 252, 204, 204, 252, 12, 12, 12,
      // space
      0, 0, 0, 0, 0, 0, 0, 0
    };
  // letters
  data letters =
    {
      0, 48, 252, 204, 252, 204, 204, 204,
      0, 240, 204, 204, 240, 204, 204, 240,
      0, 48, 204, 192, 192, 192, 204, 48,
      0, 240, 204, 204, 204, 204, 204, 240,
      0, 252, 192, 192, 240, 192, 192, 252,

      0, 252, 192, 192, 240, 192, 192, 192,
      0, 48, 204, 204, 60, 12, 204, 48,
      0, 204, 204, 204, 252, 204, 204, 204,
      0, 252, 48, 48, 48, 48, 48, 252,
      0, 252, 12, 12, 12, 204, 204, 48,

      0, 204, 204, 204, 240, 204, 204, 204,
      0, 192, 192, 192, 192, 192, 192, 252,
      0, 204, 252, 252, 204, 204, 204, 204,
      0, 0, 0, 192, 252, 204, 204, 204,
      0, 252, 204, 204, 204, 204, 204, 252,

      0, 240, 204, 204, 240, 192, 192, 192,
      0, 48, 204, 204, 204, 204, 240, 60,
      0, 240, 204, 204, 240, 204, 204, 204,
      0, 48, 204, 192, 48, 12, 204, 48,
      0, 252, 48, 48, 48, 48, 48, 48,

      0, 204, 204, 204, 204, 204, 204, 252,
      0, 204, 204, 204, 204, 48, 48, 48,
      0, 204, 204, 204, 252, 252, 252, 204,
      0, 204, 204, 204, 48, 204, 204, 204,
      0, 204, 204, 204, 60, 12, 204, 48,
      
      0, 252, 12, 12, 48, 192, 192, 252,
      // space
      0, 0, 0, 0, 0, 0, 0, 0,
      // colon
      0, 0, 60, 60, 0, 60, 60, 0
    };

  
  word plotDigitAddr = digits;


  
  // the background colour should be controlled by a raster int
  // from 0-32 bg should be blue
  // from 33 - 120 bg should be grey
  // from 121 - bottom of floor it should be brown
  // and then i don't care ... black maybe

  // setup background colours
  //irq( ptr(irqfunc1), 0x00, 1 );

  saveregs();
  
  
  //irq( ptr(playsid), 0x32, 1 );

  
  poke( 0xD020, 0x0B );
  poke( 0xD021, 0 );
  // directions
  //   0
  // 3   1
  //   2

  lda( 0x00 );
  uint direction;
  uint dieRoll;
  uint Adirection;
  uint prevdirection;
  uint Aprevdirection;
  uint currentupframe;
  uint currentdownframe;
  uint Acurrentupframe;
  uint Acurrentdownframe;
  uint Acurrentleftframe;
  uint Acurrentrightframe;
  uint general8bit;
  uint roomIndex;
  uint goN;
  uint goE;
  uint goS;
  uint goW;
  uint plotDigitBindex;
  uint plotDigitX;
  uint plotDigitY;
  uint wordSize;
  uint rndinit;
  
  uint thing;
  uint thing2;
  uint currentRoom;
  uint currentleftframe;
  uint currentrightframe;
  uint specialBitFlag;
  uint monsterisinroom;
  uint treasureinroom;
  uint healthpackinroom;
  uint princessisinroom;
  uint keyinroom;
  uint treasurey;
  uint keyy;
  uint healthpacky;
  uint princessy;
  uint playerdied;
  uint keepPlaying;
  uint maxHP;
  uint playerHasKey;
  uint playerAttackFlag;
  // Blue and Red
  uint plotshapeColourValue0110;
  // White
  uint plotshapeColourValue11;

  //   0
  // 3   1
  //   2
  uint door0;
  uint door1;
  uint door2;
  uint door3;

  uint textColour;
  inc( textColour );
  
  word nDoor = 0x0000;
  word expPts;
  word playerGold;
  word sDoor;
  word general16bit;
  word clock;
  word plotNum;
  word treasurex;
  word healthpackx;
  word keyx;
  word princessx;
  word hpTimer;
  word wordToPrint;
  
  // start in room #1
  inc( currentRoom );

  // number of remaining lives;
  uint lives = 0x03;

  word playerx = 0x0020;
  //uint playery = 0x40;
  uint playery = 0x80;
  
  word monster0x = 0x0064;
  uint monster0y = 0xC8;

  // create and init the torch locations
  uint torchlocation[5];
  for( general8bit = 0; general8bit < 5; inc(general8bit) )
    {
      torchlocation[general8bit] = 0;
    }
  general8bit = 0x00;

  //seed();
  //shortcls();
  //printf( "\n        PRESS ANY KEY TO BEGIN" );
  //while( general8bit == 0 )
  //  {
  //    sDoor=rnd(1);
  //    general8bit = getchar();
  // }

  uint playerHP = rnd(1) & 0x03;
  uint playerAC = rnd(1) & 0x03;
  uint monsterHP = rnd(1) & 0x03;
  uint monsterAC = rnd(1) & 0x03;
  playerHP = playerHP + 13;
  playerAC = playerAC + 13;

  bank( 2 );
  // multicolour bitmap mode
  poke( 0xD011, 0x38 );
  poke( 0xD016, 0x18 );
  poke( 0xD018, 0x18 );

  romout(6);
    
  word bmpaddr = getbmp_addr();
  word bmpaddrX = bmpaddr + 0x1FF8;
  word scraddr = getscr_addr();
  word scraddrX = scraddr + 0x03EF;

  screen(0);

  asmcomment( "LOAD THE SPLASH SCREEN INTO MEMORY" );
  setfilename( "SPLASH,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  for( word i = 0xA000; i < 0xBF40; i = i + 0x0001 )
    {
      poke( i, fchrin() );
    }
  for( i = 0x8400; i < 0x87E8; i = i + 0x0001 )
    {
      poke( i, fchrin() );
    }
  for( i = 0xD800; i < 0xDBE8; i = i + 0x0001 )
    {
      poke( i, fchrin() );
    }
  fclose(3);
  fclrchn();

  wordToPrint = pakText;
  wordSize = 25;
  plotDigitX = 8;
  plotDigitY = 24;
  printWord();

  
  screen(1);

  
  asmcomment("seed the RNG by repeatedly calling rnd until player presses a key" );
  seed();
  while( general8bit == 0 )
    {
      sDoor=rnd(1);
      general8bit = getchar();
      buttonpress =  peek(0xDC00) & 0x10;
      if( buttonpress == 0x00 )
	{
	  inc( general8bit );
	}
    }
  if( general8bit == 0x01 )
    {
      joystickenabled = 0x01;
    }
  else
    {
      joystickenabled = 0x00;
    }
  
  mySeed();

  // setup music
  asmcomment("load the SID data into memory from disk" );
  setfilename( "2VOICES,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );
  
  for( general8bit = 0; general8bit < 0x7E; inc(general8bit) )
    {
      // reuse uint dieRoll because it's not
      // being used for anything yet
      dieRoll = fchrin();
    }
  
  //read in the SID data
  for( general16bit = 0xC000; general16bit < 0xC873; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, fchrin() );
    }

  asmcomment( "close the file" );
  fclose(3);
  fclrchn();

  asmcomment( "init SID play" );
  //jsr( 0xC000 );

  asmcomment( "shift the screen back down a pixel" );

  // setup background colours  
  irq( ptr(irqfunc1), 0x00, 1 );
  screen(0);
  //clearhires();
  poke( 0xD011, 0x3B );
  
  word sprptr0 = scraddr + 0x03F8;
  word sprptr1 = scraddr + 0x03F9;
  word sprptr2 = scraddr + 0x03FA;
  word sprptr3 = scraddr + 0x03FB;
  word sprptr4 = scraddr + 0x03FC;
  word sprptr5 = scraddr + 0x03FD;
  word sprptr6 = scraddr + 0x03FE;
  //word sprptr7 = scraddr + 0x03FF;


  asmcomment( "WORLD DEFINITION" );
  // N, E, S, W,   Wall0, Wall1, Wall2, Wall3, Wall4,     Wall5 (front 1-5),
  //
  // 1 - haven't visited yet (0x80)
  // 1 - monster is in room
  // 1 - treasure
  // 1 - healthpack
  // 1 - key
  // 1 - 
  // 1 - 
  // 1 - princess (0x01)


  // 0 = nothing
  // 1 = door
  // 2 = armour
  // 3 = torches
  // 4 = window
  // 5 = 
  // 6 = steal your face
  // 7 = painting
  // 11 - painting 2


  
  data world =
    {
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
      
    };

  initWorld();  
    
  asmcomment( "LOAD MOBS INTO MEMORY" );
  setfilename( "SPRITES1,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  for( word saddr = 0x8800; saddr < 0x9000; saddr = saddr + 0x0001 )
    {
      poke( saddr, fchrin() );
    }
  // read the "KEY" sprite in for sprite pointer value of 1
  for( saddr = 0x8000; saddr < 0x8040; saddr = saddr + 0x0001 )
    {
      poke( saddr, fchrin() );
    }
  fclose(3);
  fclrchn();


  // Sprite Memory starts at 0x8040
 
  // multicolour for sprites 00110111
  poke( 0xD01C, 0x37 );
 
  // colours for all sprites (Light grey)
  poke( 0xD025, 0x0F );

  // Black for all sprites
  poke( 0xD026, 0x00 );

  // Brown for sprite 1
  spritecolour( 0x01, 0x09 );

  // Brown for sprite 0 and 2 (the monster)
  spritecolour( 0x00, 0x09 );
  spritecolour( 0x02, 0x09 );

  // Yellow for sprite 3 (the coins)
  spritecolour( 0x03, 0x07 );

  // Red for sprite 4 (the healthpack)
  spritecolour( 0x04, 0x02 );

  // Pink for sprite 5 (the princess)
  spritecolour( 0x05, 0x0A );

  // Grey for sprite 6 (the key)
  spritecolour( 0x06, 0x0C );


  // turn on sprites   (b11111111 = 0xFF = all)
  spriteon( 0xFF );

  positionMOBS();

  
  uint walkupframe[6];
  walkupframe[0] = 33;
  walkupframe[1] = 34;
  walkupframe[2] = 35;
  walkupframe[3] = 36;
  walkupframe[4] = 35;
  walkupframe[5] = 34;

  uint walkdownframe[6];
  walkdownframe[0] = 37;
  walkdownframe[1] = 38;
  walkdownframe[2] = 39;
  walkdownframe[3] = 40;
  walkdownframe[4] = 39;
  walkdownframe[5] = 38;

  uint walklframe[4];
  walklframe[0] = 41;
  walklframe[1] = 42;
  walklframe[2] = 43;
  walklframe[3] = 42;
  
  uint walkrframe[4];
  walkrframe[0] = 44;
  walkrframe[1] = 45;
  walkrframe[2] = 46;
  walkrframe[3] = 45;



  uint Awalkingrightframe[4];
  Awalkingrightframe[0] = 49;
  Awalkingrightframe[1] = 50;
  Awalkingrightframe[2] = 51;
  Awalkingrightframe[3] = 50;
  

  uint Awalkingleftframe[4];
  Awalkingleftframe[0] = 52;
  Awalkingleftframe[1] = 53;
  Awalkingleftframe[2] = 54;
  Awalkingleftframe[3] = 53;

  uint Awalkupframe[2];
  Awalkupframe[0] = 55;
  Awalkupframe[1] = 56;

  uint Awalkdownframe[2];
  Awalkdownframe[0] = 57;
  Awalkdownframe[1] = 58;

  

 
  //clearhires();
  // create scenery
  
  // treasure
  poke( sprptr3, 61 );
  // healthpack
  poke( sprptr4, 62 );
  // princess
  poke( sprptr5, 63 );
  // key
  poke( sprptr6, 0 );
  
  putStuffOnTheScreen();

  
  //pause();
  
  uint c = getin();

  // ==========
  
  while( keepPlaying != 0x01 )
    {

      if( c == 60 )
	{
	  playerAttackFlag = 0x01;
	}
      
      if( clock == 0x0000 )
	{
	  getJS();

	  if( c == 60 )
	    {
	      JSbtnPressA = 0x00;
	    }
	  //asmcomment( "ifif" );
	  if( c == 33 )
	    {
	      // UP
	      JSnorth = 0x00;
	    }
	  //asmcomment( "ifif" );
	  if( c == 37 )
	    {
	      // DOWN
	      JSsouth = 0x00;
	    }
	  //asmcomment( "ifif" );
	  if( c == 30 )
	    {
	      // LEFT
	      JSwest = 0x00;
	    }
	  //asmcomment( "ifif" );
	  if( c == 38 )
	    {
	      // RIGHT
	      JSeast = 0x00;
	    }
	  asmcomment( "HELLO!" );
	  direction = 0x05;


	  if( JSbtnPressA == 0x00 )
	    {
	      // spacebar
	      if( prevdirection == 3 )
		{
		  direction = 6;
		}
	      else
		{
		  direction = 7;
		}
	      JSnorth = 0x01;
	      JSsouth = 0x01;
	      JSeast = 0x01;
	      JSwest = 0x01;
	    }

	  if( JSwest == 0x00 )
	    {
	      // left
	      direction = 3;
	      prevdirection = 3;
	      if( playerx > 0x0017 )
		{
		  playerx = playerx - 0x0003;
		}
	    }
	  if( playerx < 0x0018 )
	    {
	      if( goW != 0 )
		{
		  // MOVE TO NEXT ROOM
		  currentRoom = goW;
		  playerx = 0x0140;
		  putStuffOnTheScreen();
		}
	    }
	  if( playerx > 0x0142 )
	    {
	      if( goE != 0 )
		{
		  asmcomment( "MOVE TO EAST ROOM" );
		  currentRoom = goE;
		  playerx = 0x0020;
		  putStuffOnTheScreen();
		}
	    }

	  //asmcomment( "ifif" );
	  if( JSeast == 0x00 )
	    {
	      // right
	      prevdirection = 1;
	      if( playerx < 0x0143 )
		{
		  playerx = playerx + 0x0003;
		}
	      direction = 1;
	    }
	  
	  //asmcomment( "ifif" );
	  if( JSnorth == 0x00 )
	    {
	      // NORTH
	      direction = 0;
		      
	      if( playery > 113 )
		{
		  dec(playery);
		  dec(playery);
		  dec(playery);

		  if( playery < 114 )
		    {
		      if( goN != 0 )
			{
			  if( playerx > nDoor )
			    {
			      if( playerx < nDoor + 0x0040 )
				{
				  // MOVE TO NEXT ROOM
				  currentRoom = goN;
				  playery = 202;
				  putStuffOnTheScreen();
				}
			    }
			}
		    }			    
		}
	    }
	  //asmcomment( "ifif" );
	  if( JSsouth == 0x00 )
	    {
	      // SOUTH
	      direction = 2;
	      if( playery < 204 )
		{
		  inc(playery);
		  inc(playery);
		  inc(playery);
		}
	      if( playery > 204 )
		{
		  if( goS != 0 )
		    {
		      if( playerx > sDoor )
			{
			  if( playerx < sDoor + 0x0020 )
			    {
			      // MOVE TO NEXT ROOM
			      currentRoom = goS;
			      playery = 116;
			      putStuffOnTheScreen();
			    }
			}
		    }
		}
	    }
	  //asmcomment( "ifif" );
	  
	  if( c == 62 )
	    {
	      pauseGameSequence();
	    }
	  //else
	  // {
	      // standing
	  //  direction = 5;
	  //}

	  //asmcomment( "ifif" );

	  if( princessisinroom != 0x00 )
	    {
	      if( playerHasKey == 0x01 )
		{
		  uint tmpProx1 = proximity( princessx, princessy, 0x000A );
		  if( tmpProx1 != 0x00 )
		    {

		      // This should make the player go to the next level
		      //  in the next level the healthpack should increase
		      // hit points by more than the previous level.
		      // monsters should have more hitpoints (and should be faster)
		      // there should be something like spells or shields or some new item
		      
		      princessisinroom = 0x00;

		      //princess
		      clearSpecialBit( 0x00 );
		      // key bit
		      clearSpecialBit( 0x08 );
		      
		      spriteoff( 0x20 );
		      expPts = expPts + 0x0100;
		      updateScore();
		      playerHasKey = 0x00;
		      putThing( 0xA0, 0x00 );
		      
		    }
		}

	    }
	  //asmcomment( "ifif" );	  
	  if( monsterisinroom != 0x00 )
	    {
	      tmpProx1 = proximity( monster0x, monster0y, 0x000A );
	      if( tmpProx1 != 0x00 )
		{
		  if( c == 60 )
		    {
		      playerAttack();
		      if( monsterHP > 0x00 )
			{
			  monsterAttack();
			}
		    }
		  else
		    {
		      monsterAttack();
		    }
		  tmpProx1 = 0x00;
		}
	    }
	  // if monster is within proximity of player
	  // monster can attack
	  // ... not ALWAYS, but maybe, if rand() <= 0x20
	  // there could also be a "currently-in-a-fight" flag
	  // so if the player has started attacking, then
	  // the monster goes on the offensive
	}
      poke( 0xD01E, 0 );
      poke( 0xD019, 0 );
      animate();
      clock = clock + 0x0001;
      hpTimer = hpTimer + 0x0001;
      if( hpTimer == 0x0000 )
	{
	  inc(playerHP);
	  updateHealth();
	}
      //if( clock > 0x007F )
      //{
      //  clock = 0x0000;
      //}
      clock = clock & 0x003F;

      c = getin();
      
    }
  //sidoff(0x0000);

  clearkb();
  asmcomment( "turn off all sprites" );
  spriteset(0x00);
  asmcomment( "restore rom settings" );
  romin();
  asmcomment( "go back to vic bank 0" );
  bank(0);  
  asmcomment( "Restore $0314/$0315 IRQ Vector" );
  irq( ptr(irqrestore), 0x00, 1 );
  
  restoreregs();
  shortcls();
  printf( "GAME OVER\n\nSTATS:\n" );
  printf( "EXP: " );
  printf( expPts );
  cr();
  printf( "GOLD: " );
  printf( playerGold );
  cr();
  printf( "HEALTH: " );
  printf( playerHP );
  cr();
  return;
}


void animate()
{
  // later on, when the memory bank configuration is finalised,
  // use the immediate value of sprptr0 (which is a WordID).
  // that will make the animate function execute a little bit faster.
  if( clock == 0x0000 )
    {

      if( monsterisinroom != 0 )
	{
	  calcMonster0Position();
	  if( Adirection == 0)
	    {
	      poke( sprptr0, Awalkupframe[Acurrentupframe] );
	      poke( sprptr2, Awalkupframe[Acurrentupframe] );
	      inc(Acurrentupframe);
	      Acurrentupframe = Acurrentupframe & 0x01;
	    }
	  if( Adirection == 2 )
	    {
	      poke( sprptr0, Awalkdownframe[Acurrentdownframe] );
	      poke( sprptr2, Awalkdownframe[Acurrentdownframe] );
	      inc(Acurrentdownframe);
	      Acurrentdownframe = Acurrentdownframe & 0x01;
	    }

	  if( Adirection == 1 )
	    {
	      poke( sprptr0, Awalkingrightframe[Acurrentrightframe] );
	      poke( sprptr2, Awalkingrightframe[Acurrentrightframe] );
	      inc(Acurrentrightframe);
	      Acurrentrightframe = Acurrentrightframe & 0x03;
	    }

	  if( Adirection == 3 )
	    {
	      poke( sprptr0, Awalkingleftframe[Acurrentleftframe] );
	      poke( sprptr2, Awalkingleftframe[Acurrentleftframe] );
	      inc(Acurrentleftframe);
	      Acurrentleftframe = Acurrentleftframe & 0x03;
	    }
	}
      
      if( direction == 0 )
	{
	  // NORTH
	  poke( sprptr1, walkupframe[currentupframe] );
	  inc(currentupframe);
	  if( currentupframe == 6 )
	    {
	      currentupframe = 0;
	    }
	}
      else
	{
	  // EAST
	  if( direction == 1 )
	    {
	      poke( sprptr1, walkrframe[currentrightframe] );
	      inc(currentrightframe);
	      currentrightframe = currentrightframe & 0x03;
	    }
	  else
	    {
	      // SOUTH
	      if( direction == 2 )
		{
		  poke( sprptr1, walkdownframe[currentdownframe] );
		  inc(currentdownframe);
		  if( currentdownframe ==  6)
		    {
		      currentdownframe = 0;
		    }
		}
	      else
		{
		  // WEST
		  if( direction == 3 )
		    {
		      poke( sprptr1, walklframe[currentleftframe] );
		      inc(currentleftframe);
		      currentleftframe = currentleftframe & 0x03;
		    }
		  else
		    {
		      if( direction == 5 )
			{
			  // standing
			  poke( sprptr1, 32 );
			}
		      else
			{
			  if( direction == 6 )
			    {
			      // lunge left
			      poke( sprptr1, 48 );
			    }
			  else
			    {
			      if( direction == 7 )
				{
				  // lunge right
				  poke( sprptr1, 47 );
				}
			    }
			}
		    }
		}
	    }
	}
      
      
      positionMOBS();

      asmcomment( "animate the torches by changing their colours" );		 
      for( general8bit = 0x00; general8bit < 5; inc(general8bit) )
	{	  
	  if( torchlocation[general8bit] == 0x01 )
	    {
	      word ad = scraddr + 0x00F1 + general8bit * 8;
	      uint ad1 = peek( ad );
	      if( ad1 == 0x72 )
		{
		  ad1 = 0x27;
		}
	      else
		{
		  ad1 = 0x72;
		}
	      poke( ad, ad1 );
	      inc( ad );
	      poke( ad, ad1 );
	      inc( ad );
	      inc( ad );
	      poke( ad, ad1 );
	      inc( ad );
	      poke( ad, ad1 );
	    }
	}
    }
  return;
}

void clearhires()
{
  //                                           Colours
  // 0 - Black  1 - White   2 - Red   3 - Cyan  4 - Purple  5 - Green  6 - Dark Blue
  // 7 - Yellow 8 - Orange  9 - Brown A - Pink  B - Drk Gry C - Grey   D - Bright Green
  //                        E - Light Blue                   F - Light Grey

  //screen(0);
  // this is for the single colour (11) -- this is ALWAYS at 0xD800 - 0x3FF
  for( general16bit = 0xD800; general16bit < 0xDBFF; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, 0x06 );
    }
  
  //for( general16bit = scraddr; general16bit < scraddrX; general16bit = general16bit + 0x0001 )
  //  {
  //    poke( general16bit, 0x26 );
  //  }

  for( general16bit = bmpaddr; general16bit < bmpaddrX; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, 0x00 );
    }
  //screen(1);
  return;
}


void putStuffOnTheScreen()
{
  screen(0);


  clearhires();

    
  // Top Wall
  // Drk Grey and Grey
  asmcomment( "Draw the brick wall" );
  plotshapeColourValue0110 = 0xBC;
  // Black
  plotshapeColourValue11 = 0x00;
  for( uint myY = 3; myY < 10; inc(myY) )
    {
      for( uint myX = 0; myX < 40; inc(myX) )
	{
	  plotshape(wall2, myX, myY, 2);
	  inc(myX);
      	}
    }
  //pause();
  asmcomment( "Draw the line at base of the brick wall" );
  for( general8bit = 0; general8bit < 160; inc(general8bit))
    {
      plot( general8bit, 78, 0xBC );
    }
  //pause();
  // 0 = nothing
  // 1 = NORTH DOor
  // 2 = armour
  // 3 = torches
  // 4 = window
  // 5 - SOUTH DOOR
  // 6 = steal your face
  // 7 = painting
  // 8 EAST DOOR
  // 9 WEST DOOR
  // 0x0A = Player-Has-Key Icon
  // ...    0xA0 removes the player-has-key icon
  // 0x0C = Fleur-de-lis
  // 0x0D = Shield
  // 0x0E = Handcuffs
  
  // find room definition
  dec( currentRoom );
  roomIndex = currentRoom * 11;
  inc( currentRoom );


  
  goN = (world)[roomIndex];
 
  inc( roomIndex );
  goE = (world)[roomIndex];
  if( goE == 0x00 )
    {
      putThing( 0x08, 0x00 );
    }

  
  inc( roomIndex );
  goS = (world)[roomIndex];
  
  inc( roomIndex );
  goW = (world)[roomIndex];  
  if( goW == 0x00 )
    {
      putThing( 0x09, 0x00 );
    }
  
  inc( roomIndex );  
  for( uint jj = 0x00; jj<0x05; inc( jj ) )
    {
      thing = (world)[roomIndex];
      putThing( thing, jj );
      if( thing == 0x01 )
	{
	  nDoor = jj * 64;
	}
      if( thing == 0x03 )
	{
	  // save the spot where the torches are going
	  // so that we can rol the colour byte of that
	  // location to make them flicker
	  torchlocation[jj] = 0x01;
	}
      else
	{
	  torchlocation[jj] = 0x00;
	}
      
      inc( roomIndex );
    }

  if( goS != 0 )
    {
      thing = (world)[roomIndex];
      dec( thing );
      putThing( 5, thing );
      sDoor = thing * 64;
      sDoor = sDoor + 16;
      inc( thing );
    }

  // also on or about line #201
  // bits of last byte
  // 1 - haven't visited (0x80)
  // 1 - monster is in room (0x40...)
  // 1 - treasure (0x20)
  // 1 - health pack (0x10)
  // 1 - key (0x08)
  // 1 - 
  // 1 - 
  // 1 - princess

  asmcomment( "test each bit of last byte of room data" );
  inc( roomIndex );
  thing = (world)[roomIndex];


  // VISITED ALREADY?
  thing2 = thing & 0x80;
  // if this is the first time they've entered the room
  // give them some exp points.
  if( thing2 != 0 )
    {
      inc( expPts );
      asmcomment( "turn off the 'visited' bit" );
      clearSpecialBit( 7 );
    }

  thing2 = thing & 0x40;
  // MONSTER
  if( thing2 != 0 )
    {
      monster0x = myRand();
      monster0x = monster0x + 0x0021;

      // the y value needs to be from 123 - 160 or so.
      monster0y = myRand();
      lsr(monster0y);
      lsr(monster0y);
      monster0y = monster0y + 143;

      monsterisinroom = 0x01;
      spriteon( 5 );
      //monsterHP = myRand() & 0x03;
      monsterHP = monsterHP & 0x03;
      monsterHP = monsterHP + 7;
      updateMonsterHealth();
    }
  else
    {
      monsterisinroom = 0x00;
      spriteoff( 5 );
    }

  // TREASURE
  thing2 = thing & 0x20;
  if( thing2 != 0 )
    {
      treasurex = myRand();
      treasurex = treasurex + 0x0021;


      // the y value needs to be from 123 - 160 or so.
      treasurey = myRand();
      lsr(treasurey);
      lsr(treasurey);
      treasurey = treasurey + 140;

      treasureinroom = 0x01;
      spriteon( 0x08 );
    }
  else
    {
      treasureinroom = 0x00;
      spriteoff( 0x08 );
    }

  // HEALTH PACK
  thing2 = thing & 0x10;
  if( thing2 != 0 )
    {
      healthpackx = myRand();
      healthpackx = healthpackx + 0x0021;


      // the y value needs to be from 123 - 160 or so.
      healthpacky = myRand();
      lsr(healthpacky);
      lsr(healthpacky);
      healthpacky = healthpacky + 140;

      healthpackinroom = 0x01;
      spriteon( 0x10 );
    }
  else
    {
      healthpackinroom = 0x00;
      spriteoff( 0x10 );
    }

  // KEY
  // if the items that are in a room and their sprite #'s were the same
  // we could just use "thing" to turn on sprites for each room
  // spriteon( thing )  or something like that
  thing2 = thing & 0x08;
  if( thing2 != 0 )
    {
      keyx = myRand();
      keyx = keyx + 0x0021;


      // the y value needs to be from 123 - 160 or so.
      keyy = myRand();
      lsr(keyy);
      lsr(keyy);
      keyy = keyy + 143;

      keyinroom = 0x01;
      //spritex( 0x06, keyx );
      //spritey( 0x06, keyy );

      spriteon( 0x40 );
    }
  else
    {
      keyinroom = 0x00;
      spriteoff( 0x40);
    }

  thing2 = thing & 0x04;
  if( thing2 != 0 )
    {
      nop();
    }

  thing2 = thing & 0x02;
  if( thing2 != 0 )
    {
      nop();
    }

  // PRINCESS!!!
  thing2 = thing & 0x01;
  if( thing2 != 0 )
    {
      princessisinroom = 0x01;
      
      // the x should be the same as the CUFFS
      princessy = 0x70;
      spritex( 0x05, princessx );
      spritey( 0x05, princessy );
      spriteon( 0x20 );
    }
  else
    {
      princessisinroom = 0x00;
      spriteoff( 0x20 );
    }


  asmcomment( "reset the number of expPts the player gets for entering the room that they enter" );
  general16bit = world + roomIndex;

  wordToPrint = scoreText;
  wordSize = 4;
  plotDigitX = 1;
  plotDigitY = 1;
  printWord();
  
  updateScore();

  wordToPrint = goldText;
  wordSize = 5;
  plotDigitX = 14;
  plotDigitY = 23;
  printWord();
  
  updateGold();

  wordToPrint = healthText;
  wordSize = 7;
  plotDigitX = 29;
  plotDigitY = 1;
  printWord();
  updateHealth();
  
  wordToPrint = livesText;
  wordSize = 6;
  plotDigitX = 31;
  plotDigitY = 23;
  printWord();

  wordToPrint = monsterHealthText;
  wordSize = 6;
  plotDigitX = 1;
  plotDigitY = 23;
  inc(textColour);
  printWord();
  dec(textColour);

  updateLives();

  if( playerHasKey == 0x01 )
    {
      putThing( 0x0A, 0x00 );
    }

  screen(1);
  return;
}

void putThing( uint whatThing, uint whereThing )
{
  uint ptStartX = whereThing * 8;

  // RIGHT WALL
  if( whatThing == 0x08 )
    {
      plotshapeColourValue11 = 0x00;
      plotshape(rightWallTop, 39, 10, 1);
      for(general8bit = 0x0B; general8bit < 21; inc(general8bit))
	{
	  plotshape(rightWallMid, 39, general8bit, 1);  
	}
      plotshape(rightWallBot, 39, 21, 1);
      plot(159,79,0xFF);
    }

  // LEFT WALL
  if( whatThing == 0x09 )
    {
      plotshapeColourValue11 = 0x00;
      plotshape(leftWallTop, 0, 10, 1);
      for(general8bit = 0x0B; general8bit < 21; inc(general8bit))
	{
	  plotshape(leftWallMid, 0, general8bit, 1);  
	}
      plotshape(leftWallBot, 0, 21, 1);
      plot(0,79,0xFF);
    }

  // PAINTING
  if( whatThing == 0x07 )
    {
      // Brown & Yellow
      plotshapeColourValue0110 = 0x79;
      // black
      plotshapeColourValue11 = 0x00;
      plotshape(paintingtop, ptStartX+2, 5, 4);  
      plotshape(paintingbot, ptStartX+2, 6, 4);
    }

  // PAINTING2
  if( whatThing == 11 )
    {
      // Brown & Yellow
      plotshapeColourValue0110 = 0x79;
      // black
      plotshapeColourValue11 = 0x00;
      plotshape(painting2top, ptStartX+2, 5, 4);  
      plotshape(painting2bot, ptStartX+2, 6, 4);
    }
  
  // STEAL YOUR FACE
  if( whatThing == 0x06 )
    {
      // Blue and Red
      plotshapeColourValue0110 = 0x62;
      // White
      plotshapeColourValue11 = 0x01;

      plotshape(steal1, ptStartX+2, 4, 4);  
      plotshape(steal3, ptStartX+2, 5, 4);
      plotshape(steal5, ptStartX+2, 6, 4);
      plotshape(steal7, ptStartX+2, 7, 4);
    }
  
  // NORTH DOOR
  if( whatThing == 0x01 )
    {
      plotshapeColourValue0110 = 0xBB; 
      plotshapeColourValue11 = 0x00;
      
      plotshape(window0, ptStartX+2, 6, 4);

      for( general8bit = 0x07; general8bit < 0x0A; inc(general8bit) )
	{
	  plotshape(window1L, ptStartX+2, general8bit, 1);  
	  plotshape(empty2, ptStartX+3, general8bit, 1);  
	  plotshape(empty2, ptStartX+4, general8bit, 1);  
	  plotshape(window1R, ptStartX+5, general8bit, 1);  
	}    
    }

  // SOUTH DOOR
  if( whatThing == 0x05 )
    {
      plotshapeColourValue0110 = 0xBB; 
      plotshapeColourValue11 = 0x00;
      plotshape(sdoor, ptStartX+2, 22, 4);
    }

  // SUIT OF ARMOUR
  if( whatThing == 0x02 )
    {
      plotshapeColourValue0110 = 0xBC;
      plotshapeColourValue11 = 0x00;
      plotshape(armour0, ptStartX+2, 5, 4);  
      plotshape(armour1, ptStartX+2, 6, 4);
      plotshape(armour2, ptStartX+2, 7, 4);
      plotshape(armour3, ptStartX+2, 8, 4);
      plotshape(armour4, ptStartX+2, 9, 4);
    }

  // 2 TORCHES
  if( whatThing == 0x03 )
    {
      // yellow/red
      plotshapeColourValue0110 = 0x72; 
      plotshapeColourValue11 = 0x00;
      
      plotshape(torch0, ptStartX+1, 6, 2);  
      plotshape(torch1, ptStartX+1, 7, 1);  

      plotshape(torch0, ptStartX+4, 6, 2);  
      plotshape(torch1, ptStartX+4, 7, 1);  
    }

  // WINDOW
  if( whatThing == 0x04 )
    {
      plotshapeColourValue0110 = 0xBB; 
      plotshapeColourValue11 = 0x00;
      
      plotshape(window0, ptStartX+2, 4, 4);
      plotshape(window1L, ptStartX+2, 5, 1);  
      plotshape(empty2, ptStartX+3, 5, 1);  
      plotshape(empty2, ptStartX+4, 5, 1);  
      plotshape(window1R, ptStartX+5, 5, 1);  

      plotshape(window1L, ptStartX+2, 6, 1);  
      plotshape(empty2, ptStartX+3, 6, 1);  
      plotshape(empty2, ptStartX+4, 6, 1);  
      plotshape(window1R, ptStartX+5, 6, 1);

      plotshape(window3L, ptStartX+2, 7, 1 );
      plotshape(window3M, ptStartX+3, 7, 1 );
      plotshape(window3M, ptStartX+4, 7, 1 );
      plotshape(window3R, ptStartX+5, 7, 1 );
    }

  // KEY ON WALL
  if( whatThing == 0x0A )
    {
      plotshapeColourValue0110 = 0x77; 
      plotshapeColourValue11 = 0x07;
      plotshape(keyonwall, 149, 20, 1 );
    }

  // Lose Key
  if( whatThing == 0xA0 )
    {
      plotshapeColourValue0110 = 0x00; 
      plotshapeColourValue11 = 0x00;
      plotshape(keyonwall, 149, 20, 1 );
    }
  
  // Fleur-de-lis
  if( whatThing == 0x0C )
    {
      plotshapeColourValue0110 = 0x72; 
      plotshapeColourValue11 = 0x00;
      plotshape(fleurdelistop, ptStartX+2, 4, 3 );
      plotshape(fleurdelisbot, ptStartX+2, 5, 3 );
    }

  // Shield
  if( whatThing == 0x0D )
    {
      plotshapeColourValue0110 = 0xB2; 
      plotshapeColourValue11 = 0x00;
      plotshape(shieldtop, ptStartX+2, 6, 3 );
      plotshape(shieldbot, ptStartX+2, 7, 3 );
    }

  // CUFFS
  if( whatThing == 0x0E )
    {
      plotshapeColourValue0110 = 0x9B; 
      plotshapeColourValue11 = 0x00;
      plotshape(cuff0, ptStartX+2, 6, 3 );
      plotshape(cuff1, ptStartX+2, 7, 3 );
      princessx = ptStartX + 0x0005;      
      princessx = princessx * 0x08;
      princessx = princessx + 0x0001;
    }
    
  return;
}

void plotshape(word plotshapeAddr, uint plotshapeX, uint plotshapeY, uint plotshapeSize)
{
  uint plotshapeBindex = 0;
  word plotshapeOffset = plotshapeX + plotshapeY * 40;
  word plotshapeColor1 = plotshapeOffset + 0xD800;
  word plotshapeColors2And3 = plotshapeOffset + scraddr;
  asl( plotshapeOffset );
  asl( plotshapeOffset );
  asl( plotshapeOffset );
  word plotshapePixels = plotshapeOffset + bmpaddr;
  
  for( uint plotshapeJ = 0; plotshapeJ < plotshapeSize; inc(plotshapeJ) )
    {
      poke( plotshapeColor1, plotshapeColourValue11 );
      poke( plotshapeColors2And3, plotshapeColourValue0110 );
      plotshapeColor1 = plotshapeColor1 + 1;
      plotshapeColors2And3 = plotshapeColors2And3 + 1;
      for( uint plotshapeI = 0; plotshapeI < 8; inc( plotshapeI ) )
	{
	  poke( plotshapePixels, (plotshapeAddr)[plotshapeBindex] );
	  plotshapePixels = plotshapePixels + 1;
	  inc( plotshapeBindex );
	}
    }
  return;
}

void calcMonster0Position()
{
  if( monster0y < playery )
    {
      Adirection = 0x02;
      inc( monster0y );
    }
  else
    {
      Adirection = 0x00;
      dec( monster0y );
    }

  if( monster0x < playerx )
    {
      Adirection = 1;
      monster0x = monster0x + 0x0001;
    }
  else
    {
      Adirection = 3;
      monster0x = monster0x - 0x0001;
    }
  
  if( monster0y > playery )
    {
      spriteon( 0x01 );
      spriteoff( 0x04 );
    }
  else
    {
      spriteon( 0x04 );
      spriteoff( 0x01 );
    }

  return;
}

void positionMOBS()
{
  if( monsterisinroom != 0 )
    {
      spritex( 0, monster0x );
      spritey( 0, monster0y );
      spritex( 2, monster0x );
      spritey( 2, monster0y );
    }
  
  spritex( 1, playerx );
  spritey( 1, playery );

  
  //plotDigitX = 10;
  //plotDigitY = 2;
  //plotNum = playerx;
  //textColour = 0x08;
  //plotNumber();
  // white
  //textColour = 0x01;

  
  if( treasureinroom == 0x01 )
    {
      // treasure
      spritex( 3, treasurex );
      spritey( 3, treasurey );

      //uint treasurecontact = playerWithinTen(150, 150);
      uint treasurecontact = proximity( treasurex, treasurey, 0x000A );
      if( treasurecontact == 0x01 )
	{
	  spriteoff( 0x08 );
	  general16bit = rnd(1);
	  playerGold = playerGold + general16bit; 
	  inc(expPts);
	  asmcomment( "turn off the treasure in current room" );
	  clearSpecialBit( 5 );
	  updateGold();
	  updateScore();
	  treasureinroom = 0x00;
	}
    }
  

  if( healthpackinroom == 0x01 )
    {
      spritex( 4, healthpackx );
      spritey( 4, healthpacky );

      uint healthpackcontact = proximity( healthpackx, healthpacky, 0x000A );
      if( healthpackcontact == 0x01 )
	{
	  spriteoff( 0x10 );
	  inc(playerHP);
	  inc(playerHP);
	  inc(playerHP);
	  inc(playerHP);
	  inc(playerHP);
	  asmcomment( "turn off the healthpacks in current room" );
	  clearSpecialBit( 4 );
	  updateHealth();
	  healthpackinroom = 0x00;
	}
    }

  if( keyinroom == 0x01 )
    {
      spritex( 6, keyx );
      spritey( 6, keyy );

      uint keycontact = proximity( keyx, keyy, 0x000A );

      if( keycontact == 0x01 )
	{
	  spriteoff( 0x40 );
	  inc(expPts);
	  inc(expPts);
	  inc(expPts);
	  inc(expPts);
	  inc(expPts);
	  asmcomment( "turn off the key in current room" );

	  clearSpecialBit( 3 );
	  updateScore();
	  keyinroom = 0x00;
	  playerHasKey = 0x01;
	  putThing( 0x0A, 0x00 );
	}
    }

  return;
}


void irqfunc1()
{

  // SKY BACKGROUND COLOUR (Black)
  poke( 0xD021, 0x00 );
  irq( ptr(irqfunc2), 73, 0 );
  asl( 0xD019 );
  jmp( 0xEA7E );
  return;
}

void irqfunc2()
{
  // WALL BACKGROUND COLOUR (GREY)
  poke( 0xD021, 0x0C );

  //asmcomment( "call the SID player routine" );
  //jsr( 0xC006 );
  if( playerAttackFlag > 0x00 )
    {
      asmcomment("player attack sound effect");
      // voice 2
      poke( 0xD40B, 0x81 );
      //poke( 0xD412, 0x81 );
      // AD
      poke( 0xD40C, 0x11 );
      //poke( 0xD413, 0x00 );
      // SR
      poke( 0xD40D, 0xF1 );
      //poke( 0xD414, 0xF0 );
      // Frequency
      // Voice 2
      poke( 0xD408, 0x0F );
      poke( 0xD407, 0x43 );

      // Voice 3
      //poke( 0xD40F, 0x22 );
      //poke( 0xD40E, 0x4B );

      dec( playerAttackFlag );
      //      inc( 0xD020 );

    }
  irq( ptr(irqfunc3), 129, 0 );

  asl( 0xD019 );
  jmp( 0xEA7E );
  return;
}

void irqfunc3()
{
  // FLOOR BG COLOUR (DARK GREY)
  poke( 0xD021, 0x0B );
  irq( ptr(irqfunc4), 226, 0 );

  asl( 0xD019 );

  jmp( 0xEA7E );
  return;
}

void irqfunc4()
{
  // BOTTOM BACKGROUND COLOUR (BLACK)
  poke( 0xD021, 0x00 );
  
  irq( ptr(irqfunc1), 0x00, 0 );
  asl( 0xD019 );

  //poke( 0xD019, 0x01 );
  jmp( 0xEA31 );
  return;
}

void irqrestore()
{
  asl( 0xD019 );
  jmp( 0xEA31 );
  return;
}

void plotDigit()
{
  //word plotDigitOffset = plotDigitX + plotDigitY * 40;
  word plotDigitOffset = plotDigitY * 40;
  plotDigitOffset = plotDigitOffset + plotDigitX;
  
  word plotDigitColor1 = plotDigitOffset + 0xD800;
  word plotDigitColors2And3 = plotDigitOffset + scraddr;
  //poke( plotDigitColor1, 0x01 );
  poke( plotDigitColor1, textColour );
  poke( plotDigitColors2And3, 0x00 );

  word plotDigitPixels = asl(asl(asl(plotDigitOffset))) + bmpaddr;

  for( uint plotDigitI = 0; plotDigitI < 8; inc( plotDigitI ) )
    {
      poke( plotDigitPixels, (plotDigitAddr)[plotDigitBindex] );
      plotDigitPixels = plotDigitPixels + 1;
      inc( plotDigitBindex );
    }
  return;
}

void printWord()
{
  asmcomment( "void printWord()" );
  plotDigitAddr= letters;
  for( uint printWordI = 0x00; printWordI < wordSize; inc(printWordI) )
    {
      uint currentChar = (wordToPrint)[printWordI];
      if( currentChar == 58 )
	{
	  currentChar = 27;
	}
      else
	{
	  if( currentChar == 32 )
	    {
	      currentChar = 26;
	    }
	  else
	    {
	      currentChar = currentChar - 65;
	    }
	}
      plotDigitBindex = asl(asl(asl(currentChar)));
      plotDigit();
      
      inc(plotDigitX);
    }
  plotDigitAddr= digits;
  return;
}


void plotNumber()
{
  if( plotNum == 0x0000 )
    {
      wordToPrint = zeroText;
      wordSize = 0x01;
      printWord();
      dec( plotDigitX );
      plotDigitBindex = 0;
      plotDigit();
    }
  else
    {
      while( plotNum > 0x0000 )
	{
	  plotNum = plotNum / 0x0A;
	  plotDigitBindex = asl(asl(asl(peek(0x02))));
	  plotDigit();
	  dec(plotDigitX);
	}
    }
  return;
}

void updateScore()
{
  plotDigitX = 9;
  plotDigitY = 1;
  plotNum = expPts;
  plotNumber();

  if( expPts >= 0x0019 )
    {
      maxHP = 25;
    }
  if( expPts >= 0x001E )
    {
      maxHP = 30;
    }
  if( expPts >= 0x0032 )
    {
      maxHP = 35;
    }
  
  return;
}

void updateLives()
{
  plotDigitX = 38;
  plotDigitY = 23;
  plotNum = lives;
  plotNumber();
  return;
}

void updateHealth()
{
  wordToPrint = spacesText;
  wordSize = 3;
  plotDigitX = 37;
  plotDigitY = 1;
  printWord();

  if( playerHP > maxHP )
    {
      playerHP = maxHP;
    }
  
  // green
  textColour = 0x05;
  if( playerHP < 0x0A )
    {
      // yellow
      textColour = 0x07;
    }
  if( playerHP < 0x07 )
    {
      // red
      textColour = 0x02;
    }
  if( playerHP == maxHP )
    {
      // Bright Green
      textColour = 0x0D;
    }
  
  plotDigitX = 38;
  plotDigitY = 1;
  plotNum = playerHP;
  plotNumber();
  // white
  textColour = 0x01;

  return;
}

void updateGold()
{
  plotDigitX = 23;
  plotDigitY = 23;
  plotNum = playerGold;
  plotNumber();
  return;
}


void updateMonsterHealth()
{

  wordToPrint = spacesText;
  wordSize = 5;
  plotDigitX = 7;
  plotDigitY = 23;
  printWord();

  plotDigitX = 8;
  plotDigitY = 23;  
  plotNum = monsterHP;
  inc(textColour);
  plotNumber();
  dec(textColour);
  return;
}

void setSpecialBit( uint specialBit )
{
  // arg: 0 -> 7
  specialBitFlag = 0x01;
  for( general8bit = 0x00; general8bit < specialBit; inc( general8bit) )
    {
      asl( specialBitFlag );
    }
  dec( currentRoom );
  roomIndex = currentRoom * 11;
  inc( currentRoom );
  general16bit = world + roomIndex;
  general16bit = general16bit + 0x000A;
  general8bit = peek( general16bit );
  poke( general16bit, general8bit | specialBitFlag  );
  return;
}

void clearSpecialBit( uint specialBit2 )
{
  // arg: 0 -> 7
  specialBitFlag = 0xFE;
  for( general8bit = 0x00; general8bit < specialBit2; inc( general8bit) )
    {
      rol( specialBitFlag );
    }
  dec( currentRoom );
  roomIndex = currentRoom * 11;
  inc( currentRoom );
  general16bit = world + roomIndex;
  general16bit = general16bit + 0x000A;
  general8bit = peek( general16bit );
  poke( general16bit, general8bit & specialBitFlag  );
  return;
}

uint proximity(word proxX, uint proxY, word proxLimit)
{
  uint proximityReturn = 0x00;
  word xdist;
  uint ydist;
  
  if( playerx < proxX  )
    {
      xdist = proxX - playerx;
    }
  else
    {
      xdist = playerx - proxX;
    }


  if( playery < proxY )
    {
      ydist = proxY - playery;
    }
  else
    {
      ydist = playery - proxY;
    }

  if( xdist < proxLimit )
    {
      if( ydist < touint(proxLimit) )
	{
	  inc( proximityReturn );
	}
    }
  
  return proximityReturn;
}

void monsterAttack()
{
  // do the whole battle/attack thing here
  general8bit = myRand();
  if( general8bit > 200 )
    {
      if( Adirection < 0x03 )
	{
	  
	  poke( sprptr0, 60 );
	  poke( sprptr2, 60 );
	}
      else
	{
	  poke( sprptr0, 59 );
	  poke( sprptr2, 59 );
	}
      general8bit = general8bit & 0x07;
      playerHP = playerHP - general8bit;
      if( playerHP > 0x40 )
	{
	  playerHP = 0x00;
	}

      
      if( playerHP == 0x00 )
	{
	  dec( lives );
	  if( lives != 0x00 )
	    {
	      deathSequence();
	    }
	  else
	    {
	      gameOverSequence();
	    }
	}
      updateHealth();
    }
  return;
}


void playerAttack()
{
  // do the whole battle/attack thing here
  general8bit = myRand();

  /// for debugging purposes only
  /// display the "dice-roll"
  //inc(textColour);
  //inc(textColour);
  //plotDigitX = 12;
  //plotDigitY = 1;
  //plotNum = general8bit;
  //plotNumber();
  //dec(textColour);
  //dec(textColour);

  
  if( general8bit > 100 )
    {
      general8bit = general8bit & 0x07;
      monsterHP = monsterHP - general8bit;
      
      if( monsterHP > 0x40 )
	{
	  monsterHP = 0x00;
	}

      if( monsterHP == 0x00 )
	{
	  inc( expPts );
	  inc( expPts );
	  clearSpecialBit( 6 );
	  // 0x05 = b00000101
	  spriteoff( 0x05 );
	  monsterisinroom = 0x00;
	}
      inc( expPts );
      updateScore();
      updateMonsterHealth();
    }
  return;
}


void deathSequence()
{
  uint D01B = peek( 0xD01B );
  poke( 0xD01B, 0xFF );
  playerx = 0x0020;
  playery = 0x80;
  hpTimer = 0x0001;  
  currentRoom = 0x01;
  //playerHP = myRand() & 0x03;
  playerHP = playerHP & 0x03;
  playerHP = playerHP + 13;


  wordToPrint = youDiedText;
  wordSize = 17;
  plotDigitX = 12;
  plotDigitY = 11;
  printWord();

  delay();
  
  wordToPrint = pakText;
  wordSize = 25;
  plotDigitX = 8;
  plotDigitY = 13;
  printWord();

  clearkb();
  uint qsq = getchar();
  
  while( qsq == 0 )
    {
      qsq = getchar();
      getJS();
      if( buttonpress == 0x00 )
	{
	  qsq = 0x01;
	}
    }

  poke( 0xD01B, D01B );
  putStuffOnTheScreen();

  return;
}


void pauseGameSequence()
{

  wordToPrint = quitText;
  wordSize = 15;
  plotDigitX = 12;
  plotDigitY = 13;
  printWord();


  clearkb();
  qsq = getchar();
  
  while( qsq == 0 )
    {
      qsq = getchar();
      getJS();
      if( buttonpress == 0x00 )
	{
	  qsq = 0x01;
	}      
    }
  
  if( qsq == 'Q' )
    {
      keepPlaying = 0x01;
    }
  else
    {
      wordToPrint = spacesText;
      wordSize = 15;
      plotDigitX = 12;
      plotDigitY = 13;
      printWord();
    }
  return;
}

void gameOverSequence()
{
  updateLives();
  updateHealth();
  
  wordToPrint = youDiedText;
  wordSize = 17;
  plotDigitX = 12;
  plotDigitY = 11;
  printWord();

  wordToPrint = lastTimeText;
  wordSize = 17;
  plotDigitX = 12;
  plotDigitY = 13;
  printWord();

  delay();
  
  
  wordToPrint = pressyText;
  wordSize = 21;
  plotDigitX = 10;
  plotDigitY = 15;
  printWord();
  
  spriteoff( 0x02 );

  clearkb();
  qsq = getchar();
  
  while( qsq == 0 )
    {
      qsq = getchar();
      getJS();
      if( buttonpress == 0x00 )
	{
	  qsq = 0x01;
	}
    }
  
  if( qsq == 'Y' )
    {
      wordToPrint = spacesText;
      wordSize = 17;
      plotDigitX = 12;
      plotDigitY = 11;
      printWord();
      
      wordToPrint = spacesText;
      wordSize = 21;
      plotDigitX = 10;
      plotDigitY = 13;
      printWord();
      
      initWorld();
      
      spriteon( 0x02 );
      putStuffOnTheScreen();   
    }
  else 
    {
      keepPlaying = 0x01;
    }
  


  return;
}

void initWorld()
{ 
  setfilename( "WORLD1,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  word addr = world;
  for(  uint initWorldi = 0; initWorldi < 253; inc( initWorldi ) )
    {
      poke( addr, fchrin() );
      addr = addr + 1;
    }
  
  fclose(3);
  fclrchn();

  currentRoom = 0x01;
  playerHP = myRand();
  playerHP = playerHP & 0x03;

  //playerHP = playerHP & 0x03;
  playerHP = playerHP + 13;
    
  lives = 0x03;
  expPts = 0x00;
  playerGold = 0x0000;
  playerx = 0x0020;
  playery = 0x80;

  maxHP = 0x14;

  return;
}

void mySeed()
{
  if( rndinit == 0 )
    {
      // this must be called before SID music
      // is setup because the rnd() function
      // uses the SID chip
      uint rvIndex = 0;
      data randomValues =
	{
	  0, 0, 0, 0, 0, 0, 0, 0, 
	  0, 0, 0, 0, 0, 0, 0, 0, 
	  0, 0, 0, 0, 0, 0, 0, 0, 
	  0, 0, 0, 0, 0, 0, 0, 0, 
	  0, 0, 0, 0, 0, 0, 0, 0, 
	  0, 0, 0, 0, 0, 0, 0, 0, 
	  0, 0, 0, 0, 0, 0, 0, 0, 
	  0, 0, 0, 0, 0, 0, 0, 0
	};
      word mySeedAddr = randomValues;
  
      for( uint mySeedi = 0x00; mySeedi < 0x40; inc( mySeedi ) )
	{
	  poke( mySeedAddr, rnd() );
	  mySeedAddr = mySeedAddr + 0x0001;
	}
      rndinit = 0x01;
    }
  return;
}

// return a value from one of the 64 random values pre-determined at
// the start of the program.
uint myRand()
{
  uint myRandReturnValue = randomValues[rvIndex];
  inc(rvIndex);
  if( rvIndex > 0x40 )
    {
      rvIndex = 0x00;
    }
  return myRandReturnValue;
}

void getJS()
{
  joystickdata = peek( 0xDC00 ) & 0x0F;
  buttonpress = peek( 0xDC00 ) & 0x10;

  JSportA = peek(0xDC00);
  JSbtnPressA = JSportA & 0x10;
  JSnorth = JSportA & 0x01;
  JSsouth = JSportA & 0x02;
  JSwest = JSportA & 0x04;
  JSeast = JSportA & 0x08;

  return;
}

void delay()
{
  for( word delayW = 0; delayW < 0x3FFF; delayW = delayW + 0x0001 )
    {
      nop();
    }
  return;
}

