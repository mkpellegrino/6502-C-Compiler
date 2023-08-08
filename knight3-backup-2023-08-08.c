int main()
{

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

  //import( "bin", "knight03-splash-pixel-data.bin", 0xA000 );
  //import( "bin", "knight03-splash-colour-data.bin", 0x8400 );


  
  // the background colour should be controlled by a raster int
  // from 0-32 bg should be blue
  // from 33 - 120 bg should be grey
  // from 121 - bottom of floor it should be brown
  // and then i don't care ... black maybe

  // setup background colours
  //irq( ptr(irqfunc1), 0x00, 1 );

  saveregs();

  //import( "sid", "mymusic.sid", 0x0000 );
  //sidirq( 0x0000, 0x0000 );
  
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
  
  uint thing;
  uint thing2;
  uint currentRoom;
  uint currentleftframe;
  uint currentrightframe;
  uint specialBitFlag;
  uint monsterisinroom;
  uint treasureinroom;
  uint healthpackinroom;
  uint treasurey;
  uint healthpacky;
  uint playerdied;
  uint keepPlaying;
  uint maxHP;
  
  // Blue and Red
  uint plotshapeColourValue1001;
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

  seed();
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
  //pause();
  bank( 2 );


  asmcomment( "shift the screen up a pixel & hires mode" );

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

  setfilename( "SPLASH,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  word addr = 0xA000;
  for( word i = 0x0000; i < 0x1F40; i = i + 0x0001 )
    {
      poke( addr, fchrin() );
      addr = addr + 0x0001;
    }


  addr = 0x8400;
  for( i = 0x0000; i < 0x03E8; i = i + 0x0001 )
    {
      poke( addr, fchrin() );
      addr = addr + 0x0001;
    }

  addr = 0xD800;
  for( i = 0x0000; i < 0x03E8; i = i + 0x0001 )
    {
      poke( addr, fchrin() );
      addr = addr + 0x0001;
    }
  fclose(3);
  fclrchn();
  asmcomment( "don't forget to write more text on the screen here!");

  wordToPrint = pakText;
  wordSize = 25;
  plotDigitX = 8;
  plotDigitY = 24;
  printWord();

  
  screen(1);

  asmcomment("seed the RNG" );
  while( general8bit == 0 )
    {
      sDoor=rnd(1);
      general8bit = getchar();
    }

  asmcomment( "shift the screen back down a pixel" );
  poke( 0xD011, 0x3B );

  
  // setup background colours
  irq( ptr(irqfunc1), 0x00, 1 );

  clearhires();
  
  word sprptr0 = scraddr + 0x03F8;
  word sprptr1 = scraddr + 0x03F9;
  word sprptr2 = scraddr + 0x03FA;
  word sprptr3 = scraddr + 0x03FB;
  word sprptr4 = scraddr + 0x03FC;
  word sprptr5 = scraddr + 0x03FD;


  asmcomment( "WORLD DEFINITION" );
  // N, E, S, W,   Wall0, Wall1, Wall2, Wall3, Wall4,     Wall5 (front 1-5),
  //
  // 1 - haven't visited
  // 1 - monster is in room
  // 1 - treasure
  // 1 - healthpack
  // 1 - 
  // 1 - 
  // 1 - 
  // 1 - 


  // 0 = nothing
  // 1 = door
  // 2 = armour
  // 3 = torches
  // 4 = window
  // 5 = 
  // 6 = steal your face
  // 7 = painting



  
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
  
  //save( "WORLD,S,W", world, 253 );

  //load( "WORLD,S,R", world, 253 );
  
    
  
  asmcomment( "Bad Guy MOBs" );
 
  mob Astanding = { 0, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 252, 16, 3, 255, 16, 3, 255, 16, 2, 238, 16, 2, 170, 16, 0, 168, 16, 3, 87, 16, 11, 119, 144, 11, 87, 84, 41, 117, 176, 33, 85, 32, 35, 255, 48, 3, 207, 0, 3, 207, 0, 3, 207, 0, 3, 207, 0, 3, 207, 0 };

  mob Aright0 = { 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 63, 0, 0, 63, 0, 0, 59, 0, 0, 58, 0, 0, 58, 0, 0, 56, 0, 0, 223, 0, 0, 219, 0, 48, 214, 0, 14, 213, 128, 9, 21, 32, 0, 127, 0, 0, 63, 0, 0, 255, 192, 0, 243, 192, 3, 192, 240, 3, 240, 252 };
  
  mob Aright1 = { 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 63, 0, 0, 63, 0, 0, 59, 0, 0, 58, 0, 0, 58, 0, 0, 56, 0, 0, 223, 0, 0, 219, 4, 0, 217, 16, 0, 217, 64, 0, 25, 0, 0, 59, 0, 0, 255, 0, 0, 63, 0, 0, 63, 0, 0, 63, 0, 0, 63, 192 };

  mob Aright2 = { 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 63, 16, 0, 63, 16, 0, 59, 16, 0, 58, 16, 0, 58, 16, 0, 56, 16, 0, 223, 16, 0, 219, 16, 0, 229, 16, 0, 149, 148, 2, 21, 32, 0, 63, 48, 0, 63, 0, 0, 255, 192, 0, 243, 192, 3, 192, 240, 3, 240, 252 };

  mob Aleft0 = { 0, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 0, 0, 252, 0, 0, 252, 0, 0, 236, 0, 0, 172, 0, 0, 172, 0, 0, 44, 0, 0, 247, 0, 0, 231, 0, 0, 91, 0, 2, 86, 112, 8, 84, 176, 0, 253, 64, 0, 245, 0, 3, 215, 0, 3, 95, 0, 13, 67, 192, 63, 15, 192 };
  
  mob Aleft1 = { 0, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 0, 0, 252, 0, 0, 252, 0, 0, 236, 0, 0, 172, 0, 0, 172, 0, 0, 44, 0, 0, 247, 0, 16, 231, 0, 4, 103, 0, 1, 103, 0, 0, 100, 0, 0, 236, 0, 0, 255, 0, 0, 252, 0, 0, 252, 0, 0, 252, 0, 3, 252, 0 };

  mob Aleft2 = { 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 0, 4, 252, 0, 4, 252, 0, 4, 236, 0, 4, 172, 0, 4, 172, 0, 4, 44, 0, 4, 247, 0, 4, 231, 0, 4, 151, 0, 22, 86, 0, 8, 84, 128, 12, 252, 0, 0, 252, 0, 3, 255, 0, 15, 207, 0, 15, 3, 192, 63, 15, 192 };

  mob Awalkup0 = { 0, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 4, 255, 192, 4, 255, 192, 4, 255, 192, 4, 191, 128, 4, 46, 0, 4, 221, 192, 4, 221, 192, 6, 93, 96, 6, 93, 96, 10, 85, 104, 8, 255, 200, 12, 255, 200, 0, 243, 192, 0, 243, 192, 0, 243, 192, 0, 240, 0, 0, 240, 0 };
  
  mob Awalkup1 = { 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 0, 255, 192, 0, 255, 192, 0, 255, 192, 0, 191, 128, 0, 46, 0, 0, 221, 192, 0, 221, 192, 6, 93, 96, 6, 93, 96, 10, 85, 96, 4, 255, 192, 12, 255, 192, 0, 243, 192, 0, 243, 192, 0, 243, 192, 0, 3, 192, 0, 3, 192 };

  mob Awalkdown0 = { 0, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 252, 0, 3, 255, 0, 3, 255, 0, 2, 238, 0, 2, 170, 16, 0, 168, 16, 3, 87, 16, 3, 119, 16, 11, 87, 144, 9, 117, 144, 9, 85, 144, 35, 255, 32, 35, 255, 16, 3, 207, 48, 3, 207, 0, 3, 207, 0, 3, 192, 0, 3, 192, 0 };
  
  mob Awalkdown1 = { 0, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 252, 0, 3, 255, 0, 3, 255, 0, 2, 238, 0, 2, 170, 0, 0, 168, 0, 3, 87, 0, 3, 119, 0, 11, 87, 128, 9, 117, 144, 9, 85, 32, 3, 255, 32, 3, 255, 16, 3, 207, 48, 3, 207, 0, 3, 207, 0, 0, 15, 0, 0, 15, 0 };

  
  mob Alungel = { 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 15, 192, 0, 14, 192, 0, 10, 192, 0, 10, 192, 0, 7, 192, 0, 77, 192, 85, 106, 64, 0, 69, 64, 0, 63, 192, 0, 63, 192, 0, 60, 252, 0, 252, 252 };
  
  mob Alunger = { 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 192, 0, 3, 240, 0, 3, 176, 0, 3, 160, 0, 3, 160, 0, 3, 208, 0, 3, 113, 0, 1, 185, 85, 1, 177, 0, 2, 252, 0, 2, 252, 0, 63, 60, 0, 63, 63, 0 };

  
  asmcomment( "Player MOBs" );
  
  mob standing = { 1, 1, 0, 204, 192, 128, 255, 192, 128, 213, 192, 128, 221, 192, 128, 255, 192, 128, 63, 0, 32, 63, 0, 32, 12, 0, 32, 85, 64, 53, 110, 80, 32, 123, 68, 8, 29, 4, 8, 25, 4, 8, 29, 208, 8, 21, 0, 8, 55, 0, 2, 51, 0, 2, 51, 0, 2, 51, 0, 2, 51, 0, 2, 81, 64 };

  mob walkup0 = { 1, 2, 0, 204, 194, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 63, 2, 0, 63, 2, 0, 12, 2, 0, 85, 66, 1, 85, 87, 1, 85, 66, 1, 21, 2, 1, 21, 2, 1, 21, 2, 1, 21, 2, 3, 55, 2, 0, 51, 2, 0, 51, 2, 0, 48, 2, 0, 48, 2, 0, 16, 2 };

  mob walkup1 = { 1, 3, 0, 204, 192, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 63, 2, 0, 63, 2, 0, 12, 2, 0, 85, 66, 1, 85, 87, 1, 85, 66, 1, 21, 2, 1, 21, 2, 3, 21, 2, 0, 21, 2, 0, 55, 2, 0, 51, 2, 0, 51, 2, 0, 51, 2, 0, 48, 0, 0, 16, 0 };
  
  mob walkup2 = { 1, 4, 0, 0, 0, 0, 204, 192, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 63, 2, 0, 63, 2, 0, 12, 2, 0, 85, 66, 1, 85, 87, 1, 85, 66, 1, 21, 2, 0, 21, 2, 0, 21, 2, 0, 21, 2, 0, 55, 2, 0, 51, 2, 0, 3, 2, 0, 3, 0, 0, 3, 0, 0, 1, 0 };

  mob walkup3 = { 1, 5, 0, 0, 0, 0, 204, 192, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 63, 2, 0, 63, 2, 0, 12, 2, 0, 85, 66, 1, 85, 87, 1, 85, 66, 1, 21, 2, 1, 21, 2, 3, 21, 2, 0, 21, 2, 0, 55, 2, 0, 51, 2, 0, 51, 2, 0, 51, 0, 0, 3, 0, 0, 1, 0 };
    
  mob walkup4 = { 1, 6, 0, 204, 192, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 255, 194, 0, 63, 2, 0, 63, 2, 0, 12, 2, 0, 85, 66, 1, 85, 87, 1, 85, 66, 1, 21, 2, 1, 21, 2, 1, 21, 2, 1, 21, 2, 3, 55, 2, 0, 51, 2, 0, 51, 2, 0, 51, 2, 0, 51, 2, 0, 1, 0 };

  mob walkdown0 = { 1, 7, 32, 204, 192, 32, 255, 192, 32, 213, 192, 32, 221, 192, 32, 255, 192, 32, 63, 0, 32, 63, 0, 32, 12, 0, 32, 85, 64, 53, 110, 80, 32, 123, 80, 32, 29, 16, 32, 25, 16, 32, 29, 16, 32, 21, 16, 32, 55, 48, 32, 51, 0, 32, 51, 0, 32, 3, 0, 32, 3, 0, 32, 1, 0 };
  
  mob walkdown1 = { 1, 8, 0, 204, 192, 32, 255, 192, 32, 213, 192, 32, 221, 192, 32, 255, 192, 32, 63, 0, 32, 63, 0, 32, 12, 0, 32, 85, 64, 53, 110, 80, 32, 123, 80, 32, 29, 16, 32, 25, 16, 32, 29, 48, 32, 21, 0, 32, 55, 0, 32, 51, 0, 32, 51, 0, 32, 51, 0, 0, 3, 0, 0, 1, 0 };
  
  mob walkdown2 = { 1, 9, 0, 0, 0, 0, 204, 192, 32, 255, 192, 32, 213, 192, 32, 221, 192, 32, 63, 0, 32, 63, 0, 32, 12, 0, 32, 85, 64, 53, 110, 80, 32, 123, 80, 32, 29, 16, 32, 25, 0, 32, 29, 0, 32, 21, 0, 32, 55, 0, 32, 51, 0, 32, 48, 0, 0, 48, 0, 0, 48, 0, 0, 16, 0 };
  
  mob walkdown3 = { 1, 10, 0, 0, 0, 0, 204, 192, 32, 255, 192, 32, 213, 192, 32, 221, 192, 32, 63, 0, 32, 63, 0, 32, 12, 0, 32, 85, 64, 53, 110, 80, 32, 123, 80, 32, 29, 16, 32, 25, 16, 32, 29, 48, 32, 21, 0, 32, 55, 0, 32, 51, 0, 32, 51, 0, 0, 51, 0, 0, 48, 0, 0, 16, 0 };
  
  mob walkdown4 = { 1, 11, 0, 204, 192, 32, 255, 192, 32, 213, 192, 32, 221, 192, 32, 255, 192, 32, 63, 0, 32, 63, 0, 32, 12, 0, 32, 85, 64, 53, 110, 80, 32, 123, 80, 32, 29, 16, 32, 25, 16, 32, 29, 16, 32, 21, 16, 32, 55, 48, 32, 51, 0, 32, 51, 0, 32, 51, 0, 32, 48, 0, 0, 16, 0 };
  
  mob left0 = { 1, 12, 0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 252, 0, 128, 60, 0, 128, 240, 0, 128, 16, 0, 32, 84, 0, 32, 84, 0, 35, 116, 0, 12, 92, 0, 8, 87, 0, 8, 84, 192, 8, 84, 0, 2, 112, 0, 2, 124, 0, 2, 76, 0, 1, 79, 0, 5, 131, 0, 1, 140, 0 };
  
  mob left1 = { 1, 13, 0, 0, 0, 0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 252, 0, 0, 60, 0, 0, 240, 0, 8, 84, 0, 8, 116, 0, 2, 116, 0, 2, 116, 0, 0, 116, 0, 0, 212, 0, 3, 84, 0, 0, 96, 0, 0, 120, 0, 0, 120, 0, 0, 78, 0, 1, 14, 0, 5, 60, 128 };
  
  mob left2 = { 1, 14, 0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 252, 0, 0, 60, 0, 0, 240, 0, 0, 16, 0, 0, 84, 0, 0, 84, 0, 0, 116, 0, 3, 212, 2, 12, 87, 40, 0, 86, 192, 0, 84, 0, 2, 176, 0, 0, 244, 0, 0, 196, 0, 3, 197, 0, 15, 1, 0, 3, 4, 0 };

  mob right0 = { 1, 15, 0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 32, 0, 63, 32, 0, 60, 32, 0, 15, 32, 0, 4, 48, 0, 21, 224, 0, 23, 8, 0, 29, 8, 0, 21, 8, 0, 213, 8, 3, 21, 8, 0, 21, 8, 0, 12, 2, 0, 31, 2, 0, 19, 2, 0, 83, 194, 0, 64, 242, 0, 16, 194 };
  
  mob right1 = { 1, 50, 0, 0, 0, 0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 0, 0, 63, 0, 0, 60, 0, 0, 15, 0, 0, 21, 32, 0, 29, 32, 0, 29, 128, 0, 29, 128, 0, 30, 0, 0, 23, 0, 0, 25, 0, 0, 9, 0, 0, 45, 0, 0, 45, 0, 0, 177, 0, 0, 176, 64, 2, 60, 80 };
  
  mob right2 = { 1, 51, 0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 0, 0, 63, 0, 0, 60, 0, 0, 15, 0, 0, 4, 0, 0, 21, 0, 0, 21, 0, 0, 29, 192, 128, 53, 48, 40, 213, 0, 3, 149, 0, 0, 41, 0, 0, 14, 128, 0, 61, 0, 0, 49, 0, 0, 241, 64, 0, 192, 80, 0, 48, 64 };
  
  mob lunger = { 1, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 0, 0, 60, 0, 0, 15, 0, 0, 20, 58, 0, 126, 176, 42, 167, 192, 13, 21, 0, 0, 21, 0, 0, 21, 0, 0, 31, 0, 0, 19, 0, 0, 19, 0, 0, 64, 192, 0, 64, 192, 0, 80, 240 };
  
  mob lungel = { 1, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 60, 0, 0, 240, 0, 176, 20, 0, 14, 124, 0, 3, 87, 168, 0, 84, 240, 0, 84, 0, 0, 84, 0, 0, 84, 0, 0, 196, 0, 0, 196, 0, 3, 1, 0, 3, 1, 0, 15, 5, 0 };

  asmcomment( "Items in Room MOBs" );

  mob treasure = { 2, 55, 96, 0, 0, 240, 48, 0, 240, 120, 0, 96, 120, 48, 0, 48, 120, 0, 0, 120, 12, 0, 48, 30, 48, 0, 30, 120, 0, 12, 120, 0, 0, 48, 96, 24, 0, 240, 60, 6, 240, 60, 15, 96, 24, 15, 0, 0, 6, 0, 0, 192, 0, 49, 227, 6, 121, 231, 143, 120, 199, 143, 48, 3, 6 };

  
  mob healthPack = { 3, 56, 63, 255, 252, 213, 85, 87, 213, 85, 87, 213, 85, 87, 213, 85, 87, 213, 105, 87, 213, 105, 87, 213, 105, 87, 213, 105, 87, 214, 170, 151, 214, 170, 151, 214, 170, 151, 213, 105, 87, 213, 105, 87, 213, 105, 87, 213, 105, 87, 213, 85, 87, 213, 85, 87, 213, 85, 87, 213, 85, 87, 63, 255, 252};


mob princess = { 4, 57, 192, 0, 12, 131, 51, 8, 131, 255, 8, 131, 87, 8, 131, 119, 8, 35, 255, 32, 8, 252, 128, 2, 254, 0, 0, 152, 0, 0, 168, 0, 0, 168, 0, 0, 252, 0, 0, 168, 0, 10, 170, 128, 42, 170, 160, 42, 170, 160, 170, 170, 168, 170, 170, 168, 0, 68, 0, 0, 68, 0, 3, 207, 0};




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

  // turn on sprites   (b11111111 = 0xFF = all)
  spriteon( 0xFF );

  positionMOBS();

  uint walkupframe[8];
  walkupframe[0] = walkup0;
  walkupframe[1] = walkup1;
  walkupframe[2] = walkup2;
  walkupframe[3] = walkup3;
  walkupframe[4] = walkup4;
  walkupframe[5] = walkup3;
  walkupframe[6] = walkup2;
  walkupframe[7] = walkup1;

  uint Awalkupframe[2];
  Awalkupframe[0] = Awalkup0;
  Awalkupframe[1] = Awalkup1;

  uint Awalkdownframe[2];
  Awalkdownframe[0] = Awalkdown0;
  Awalkdownframe[1] = Awalkdown1;

  uint Awalkingleftframe[4];
  Awalkingleftframe[0] = Aleft0;
  Awalkingleftframe[1] = Aleft1;
  Awalkingleftframe[2] = Aleft2;
  Awalkingleftframe[3] = Aleft1;

  uint Awalkingrightframe[4];
  Awalkingrightframe[0] = Aright0;
  Awalkingrightframe[1] = Aright1;
  Awalkingrightframe[2] = Aright2;
  Awalkingrightframe[3] = Aright1;
  
  uint walkdownframe[8];
  walkdownframe[0] = walkdown0;
  walkdownframe[1] = walkdown1;
  walkdownframe[2] = walkdown2;
  walkdownframe[3] = walkdown3;
  walkdownframe[4] = walkdown4;
  walkdownframe[5] = walkdown3;
  walkdownframe[6] = walkdown2;
  walkdownframe[7] = walkdown1;

  uint walklframe[4];
  walklframe[0] = left0;
  walklframe[1] = left1;
  walklframe[2] = left2;
  walklframe[3] = left1;
  
  uint walkrframe[4];
  walkrframe[0] = right0;
  walkrframe[1] = right1;
  walkrframe[2] = right2;
  walkrframe[3] = right1;
 
  //clearhires();
  // create scenery
  putStuffOnTheScreen();


  //poke( sprptr0, Astanding );
  //poke( sprptr1, standing );
  //poke( sprptr2, Astanding );
  poke( sprptr3, treasure );
  poke( sprptr4, healthPack );
  poke( sprptr5, princess );
  
  //pause();
  
  uint c = getin();

  while( keepPlaying != 0x01 )
    {
      if( clock == 0x0000 )
	{
	  if( c == 30 )
	    {
	      // left
	      direction = 3;
	      prevdirection = 3;
	      if( playerx > 0x0017 )
		{
		  playerx = playerx - 0x0003;
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
		}
	    }
	  else
	    {
	      if( c == 38 )
		{
		  // right
		  prevdirection = 1;
		  if( playerx < 0x0143 )
		    {
		      playerx = playerx + 0x0003;
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
		    }
		  direction = 1;
		}
	      else
		{
		  if( c == 33 )
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
		  else
		    {
		      if( c == 37 )
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
		      else
			{
			  if( c == 60 )
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
			    }
			  else
			    {
			      if( c == 62 )
				{
				  pauseGameSequence();
				}
			      else
				{
				  // standing
				  direction = 5;
				}
			    }
			}
		    }
		}
	    }

	  if( monsterisinroom != 0x00 )
	    {
	      uint tmpProx1 = proximity( monster0x, monster0y, 0x000A );
	      if( tmpProx1 != 0x00 )
		{
		  if( c == 60 )
		    {
		      playerAttack();
		      monsterAttack();
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
      if( clock > 0x009F )
	{
	  clock = 0x0000;
	}
      //clock = clock & 0x007F;

      //if( c != 62 )
      //{
      c = getin();
      //	}
    }
  //sidoff(0x0000);

  clearkb();
  spriteset(0x00);
  romin();
  bank(0);  
  restoreregs();
  asmcomment( "Restore $0314/$0315 IRQ Vector" );
  irq( ptr(irqrestore), 0x00, 1 );
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
	  currentupframe = currentupframe & 0x07;
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
		  currentdownframe = currentdownframe & 0x07;
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
			  poke( sprptr1, standing );
			}
		      else
			{
			  if( direction == 6 )
			    {
			      // attack left
			      poke( sprptr1, lungel );
			    }
			  else
			    {
			      if( direction == 7 )
				{
				  // attack right
				  poke( sprptr1, lunger );
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

  monster0x = 0x0064;
  monster0y = 0xC8;

  clearhires();

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

  data window0 = { 64, 64, 64, 67, 78, 78, 122, 122, 0, 0, 255, 170, 170, 170, 170, 170, 64, 64, 255, 170, 170, 170, 170, 170, 0, 0, 192, 176, 172, 172, 171, 171 };
  data window1L = { 122, 122, 122, 122, 122, 122, 122, 122 };
  data window1R = { 171, 171, 171, 171, 171, 171, 171, 171 };
  data window3L = { 122, 122, 122, 122, 122, 122, 122, 127 };
  data window3M = { 170, 170, 170, 170, 170, 170, 170, 255 };
  data window3R = { 171, 171, 171, 171, 171, 171, 171, 255 };

  data paintingtop = { 10, 8, 8, 8, 11, 8, 10, 10, 170, 255, 255, 255, 255, 165, 151, 149, 170, 0, 0, 0, 240, 0, 64, 80, 160, 32, 32, 32, 32, 32, 32, 32 };

  data paintingbot = { 8, 8, 8, 11, 11, 11, 11, 10, 93, 23, 253, 255, 255, 255, 255, 170, 1, 1, 67, 255, 252, 192, 192, 170, 96, 96, 224, 224, 32, 32, 32, 160 };

  data leftWallTop = { 252, 240, 192, 192, 192, 192, 192, 192 };
  //data leftWallTop = { 255, 240, 192, 192, 192, 192, 192, 192 };
  data leftWallMid = { 192, 192, 192, 192, 192, 192, 192, 192 };
  data leftWallBot = { 192, 192, 192, 192, 192, 192, 240, 252 };

  data rightWallTop = { 63, 15, 3, 3, 3, 3, 3, 3 };
  data rightWallMid = { 3, 3, 3, 3, 3, 3, 3, 3 };
  data rightWallBot = { 3, 3, 3, 3, 3, 3, 15, 63 };

  // 01 = gold/yellow
  //data treasure = { 16, 84, 16, 0, 0, 4, 21, 4, 16, 84, 16, 4, 21, 4, 0, 0 };

  // Top Wall
  // Drk Grey and Grey
  asmcomment( "Draw the brick wall" );
  plotshapeColourValue1001 = 0xBC;
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
  // 1 = door
  // 2 = armour
  // 3 = torches
  // 4 = window
  // 6 = steal your face
  // 7 = painting
  
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
      //pause();
    }
  inc( roomIndex );
  goS = (world)[roomIndex];
  inc( roomIndex );
  goW = (world)[roomIndex];
  inc( roomIndex );
  
  if( goW == 0x00 )
    {
      putThing( 0x09, 0x00 );
      //pause();
    }
  
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
  // 1 - treasure
  // 1 - health pack
  // 1 - 
  // 1 - 
  // 1 - 
  // 1 - 

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
      monsterisinroom = 0x01;
      spriteon( 5 );
      monsterHP = rnd() & 0x03;
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
      treasurex = rnd();
      treasurex = treasurex + 0x0021;


      // the y value needs to be from 123 - 160 or so.
      treasurey = rnd();
      lsr(treasurey);
      lsr(treasurey);
      treasurey = treasurey + 143;

      treasureinroom = 0x01;
      spriteon( 0x08 );
      //putThing( 0x0A, 0x00 );
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
      healthpackx = rnd();
      healthpackx = healthpackx + 0x0021;


      // the y value needs to be from 123 - 160 or so.
      healthpacky = rnd();
      lsr(healthpacky);
      lsr(healthpacky);
      healthpacky = healthpacky + 143;

      healthpackinroom = 0x01;
      spriteon( 0x10 );
    }
  else
    {
      healthpackinroom = 0x00;
      spriteoff( 0x10 );
    }

  thing2 = thing & 0x08;
  if( thing2 != 0 )
    {
      nop();
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
      spritex( 0x05, 0x0103 );
      spritey( 0x05, 0x71 );
      spriteon( 0x20 );
    }
  else
    {
      spriteoff( 0x20 );
    }


  asmcomment( "reset the number of expPts the player gets for entering the room that they enter" );

  //world[roomIndex] = 0;
  general16bit = world + roomIndex;
  //general16bit = general16bit + roomIndex;
  //general16bit = general16bit + roomIndex;
  //(world)[roomIndex] = 0;

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
  
  screen(1);
  return;
}

void putThing( uint whatThing, uint whereThing )
{
  uint ptStartX = whereThing * 8;

  //if( whatThing == 0x00 )
  //  {
  //    nop();
  //  }

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
      plotshapeColourValue1001 = 0x79;
      // White
      plotshapeColourValue11 = 0x00;
      plotshape(paintingtop, ptStartX+2, 5, 4);  
      plotshape(paintingbot, ptStartX+2, 6, 4);
    }
  
  // STEAL YOUR FACE
  if( whatThing == 0x06 )
    {
      // Blue and Red
      plotshapeColourValue1001 = 0x62;
      // White
      plotshapeColourValue11 = 0x01;

      plotshape(steal1, ptStartX+2, 4, 4);  
      plotshape(steal3, ptStartX+2, 5, 4);
      plotshape(steal5, ptStartX+2, 6, 4);
      plotshape(steal7, ptStartX+2, 7, 4);
    }
  
  // DOOR
  if( whatThing == 0x01 )
    {
      plotshapeColourValue1001 = 0xBB; 
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

  // ???
  if( whatThing == 0x05 )
    {
      plotshapeColourValue1001 = 0xBB; 
      plotshapeColourValue11 = 0x00;
      plotshape(sdoor, ptStartX+2, 22, 4);
    }

  // SUIT OF ARMOUR
  if( whatThing == 0x02 )
    {
      plotshapeColourValue1001 = 0xBC;
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
      plotshapeColourValue1001 = 0x72; 
      plotshapeColourValue11 = 0x00;
      
      plotshape(torch0, ptStartX+1, 6, 2);  
      plotshape(torch1, ptStartX+1, 7, 1);  

      plotshape(torch0, ptStartX+4, 6, 2);  
      plotshape(torch1, ptStartX+4, 7, 1);  
    }

  // WINDOW
  if( whatThing == 0x04 )
    {
      plotshapeColourValue1001 = 0xBB; 
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

  if( whatThing == 0x0A )
    {
      // TREASURE
      plotshapeColourValue1001 = 0x77; 
      plotshapeColourValue11 = 0x00;
      //      plotshape(treasure, 150, 11, 2 );
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
      poke( plotshapeColors2And3, plotshapeColourValue1001 );
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

  if( treasureinroom == 0x01 )
    {
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
  
  // treasure
  spritex( 3, treasurex );
  spritey( 3, treasurey );


  if( healthpackinroom == 0x01 )
    {
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
  spritex( 4, healthpackx );
  spritey( 4, healthpacky );

  return;
}


void irqfunc1()
{

  // SKY BACKGROUND COLOUR (DARK BLUE)
  poke( 0xD021, 0x06 );
  //irq( ptr(irqfunc2), 65, 0 );
  irq( ptr(irqfunc2), 73, 0 );
  poke( 0xD019, 0x01 );
  jmp( 0xEA7E );
  return;
}

void irqfunc2()
{
  // WALL BACKGROUND COLOUR (GREY)
  poke( 0xD021, 0x0C );
  irq( ptr(irqfunc3), 129, 0 );
  poke( 0xD019, 0x01 );
  jmp( 0xEA7E );
  return;
}

void irqfunc3()
{
  // FLOOR BG COLOUR (DARK GREY)
  poke( 0xD021, 0x0B );
  irq( ptr(irqfunc4), 226, 0 );
  poke( 0xD019, 0x01 );
  jmp( 0xEA7E );
  return;
}


void irqfunc4()
{
  // BOTTOM BACKGROUND COLOUR (BLACK)
  poke( 0xD021, 0x00 );
  
  irq( ptr(irqfunc1), 0x00, 0 );
  
  poke( 0xD019, 0x01 );
  jmp( 0xEA31 );
  return;
}

void irqrestore()
{
  poke( 0xD019, 0x01 );
  jmp( 0xEA31 );
  return;
}

void plotDigit()
{
  word plotDigitOffset = plotDigitX + plotDigitY * 40;
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
  //param printWordAddr
  
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
  general8bit = rnd();
  if( general8bit > 200 )
    {
      if( Adirection < 0x03 )
	{
	  poke( sprptr0, Alunger );
	  poke( sprptr2, Alunger );
	}
      else
	{
	  poke( sprptr0, Alungel );
	  poke( sprptr2, Alungel );
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
  general8bit = rnd();

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
  playerHP = rnd() & 0x03;
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
  data world2 =
    {
      0, 2, 0, 0,   0, 3, 4, 7, 0,   0,   0x71,
      0, 3, 0, 1,   3, 4, 2, 3, 2,   0,   0xE0,
      0, 4, 7, 2,   0, 0, 6, 0, 0,   2,   0xD0,
      0, 0, 8, 3,   2, 3, 2, 3, 3,   5,   0xE0,
      0, 6, 9, 0,   3, 2, 3, 2, 2,   3,   0xD0,
      0, 0, 10, 5,  2, 2, 3, 3, 2,   1,   0xE0,
      3, 8, 11, 0,  3, 1, 2, 3, 4,   5,   0xD0,
      4, 0, 12, 7,  3, 0, 3, 0, 1,   2,   0xE0,
      5, 0, 13, 0,  2, 2, 1, 2, 2,   5,   0xD0,
      6, 11, 0, 0,  1, 3, 3, 2, 3,   0,   0xE0,
      7, 0, 0, 10,  0, 3, 0, 3, 1,   0,   0xD0,
      8, 0, 0, 0,   2, 1, 2, 3, 3,   0,   0xE0,
      9, 0, 17, 0,  3, 3, 3, 2, 1,   1,   0xD0,
      0, 15, 0, 0,  2, 2, 2, 2, 3,   0,   0xE0,
      0, 16, 19, 14,3, 3, 3, 3, 2,   4,   0xD0,
      0, 0, 20, 15, 2, 3, 3, 2, 3,   3,   0xE0,
      13, 18, 0, 0, 1, 3, 2, 2, 3,   0,   0xD0,
      0, 19, 21, 17,2, 2, 4, 4, 3,   2,   0xE0,
      15, 0, 0, 18, 2, 2, 2, 1, 3,   0,   0xD0,
      16, 0, 0, 0,  3, 2, 1, 3, 2,   0,   0xE0,
      18, 23, 0, 0, 2, 1, 2, 0, 0,   0,   0xD0,
      0, 23, 0, 21, 2, 3, 2, 3, 2,   0,   0xE0,
      0, 0, 0, 22,  3, 2, 3, 2, 3,   0,   0xFF
    };

  for(  uint initWorldi = 0; initWorldi < 253; inc( initWorldi ) )
    {
      word a = world + initWorldi;
      word b = world2 + initWorldi;
      poke( a, peek( b ) );
    }

  currentRoom = 0x01;
  playerHP = rnd() & 0x03;
  playerHP = playerHP + 13;
    
  lives = 0x03;
  expPts = 0x00;
  playerGold = 0x0000;
  playerx = 0x0020;
  playery = 0x80;

  maxHP = 0x14;

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
