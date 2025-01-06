// lda $5351 is a problem
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

  data mapfn = {'M','A','P','?',',','S',',','R' };

  asmcomment( "Bitmap Graphics Definitions" );  
  data sdoor = { 213, 213, 253, 255, 255, 255, 255, 255, 85, 85, 85, 245, 255, 255, 255, 255, 85, 85, 85, 95, 255, 255, 255, 255, 87, 87, 127, 255, 255, 255, 255, 255 };
  data empty2 = { 170, 170, 170, 170, 170, 170, 170, 170 };
  data steal1 = {0, 0, 0, 1, 1, 7, 7, 23,     0, 63, 122, 234, 234, 170, 170, 170,     0, 252, 174, 151, 183, 181, 253, 245,    0, 0, 0, 128, 128, 224, 224, 232};
  data steal3 = {30, 30, 94, 94, 94, 94, 94, 94, 171, 171, 171, 171, 175, 191, 175, 191, 253, 245, 245, 245, 245, 213, 245, 213, 120, 122, 122, 122, 122, 122, 122, 122 };
  data steal5 = {95, 87, 87, 87, 87, 87, 23, 23, 175, 175, 173, 253, 213, 245, 255, 235, 85, 85, 85, 87, 87, 95, 255, 235, 250, 234, 234, 234, 234, 234, 232, 232 };
  data steal7 = {21, 5, 5, 1, 1, 0, 0, 0, 255, 255, 127, 95, 95, 95, 23, 0, 255, 255, 254, 250, 250, 250, 232, 0, 168, 160, 160, 128, 128, 0, 0, 0 };
  data wall2 = { 106, 106, 106, 106, 106, 106, 106, 85, 170, 170, 170, 170, 170, 170, 170, 85 };
  // uses window definition (just slightly altered in length)
  //data door1to4 = { 255, 255, 255, 255, 255, 255, 255, 255 };
  //data door0topL = { 3, 3, 15, 15, 63, 63, 255, 255 };
  //data door0topR = { 192, 192, 240, 240, 252, 252, 255, 255 };
  data armour0 = { 0, 0, 0, 0, 3, 3, 3, 3, 63, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
  data armour1 = { 3, 3, 3, 3, 3, 3, 3, 3, 255, 255, 255, 255, 255, 255, 255, 255, 192, 0, 0, 0, 0, 0, 0, 255, 3, 3, 3, 3, 3, 3, 3, 255 };
  data armour2 = { 63, 255, 195, 195, 195, 195, 195, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3 };
  data armour3 = { 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 192, 192, 192, 192, 192, 192, 192, 192, 3, 3, 3, 3, 3, 3, 3, 3 };
  data armour4 = { 3, 3, 3, 3, 3, 3, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 192, 192, 192, 192, 192, 192, 255, 255, 3, 3, 3, 3, 3, 3, 3, 3 };
  data torch0 = { 1, 5, 26, 25, 6, 6, 63, 15, 0, 128, 144, 96, 64, 128, 240, 192 };
  data torch1 = { 3, 3, 3, 3, 3, 3, 3, 3 };
  data allThrees = { 255, 255, 255, 255, 255, 255, 255, 255 };

  data maponWallTop = {
    255, 192, 197, 198, 205, 205, 205, 205, 
    255, 0, 85, 170, 151, 151, 191, 93, 
    255, 0, 85, 170, 93, 93, 255, 117, 
    255, 3, 87, 167, 103, 83, 147, 167 };
  data maponWallBot = { 
    198, 198, 198, 218, 213, 192, 192, 255, 
    93, 181, 181, 170, 85, 0, 15, 255, 
    117, 255, 215, 150, 85, 0, 240, 255, 
    167, 167, 167, 167, 83, 3, 3, 255
  };

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

  data closedDoor00 = {
    64, 64, 64, 67, 78, 122, 122, 122,
    0, 0, 63, 234, 170, 170, 255, 204,
    64, 64, 255, 170, 170, 170, 255, 204,
    0, 0, 0, 240, 172, 171, 235, 235
  };
  
  data closedDoor01 = {
    122, 122, 122, 122, 122, 122, 122, 122,
    204, 204, 204, 204, 204, 255, 170, 170,
    204, 204, 204, 204, 204, 255, 170, 170,
    235, 235, 235, 235, 235, 235, 171, 171 };
  
  data closedDoor02 = {
    122, 122, 122, 122, 122, 122, 122, 122,
    170, 170, 170, 170, 170, 170, 170, 170,
    170, 170, 170, 170, 170, 170, 170, 170,
    171, 171, 171, 171, 75, 27, 171, 171 };
  data closedDoor03 = { 
    122, 122, 122, 122, 122, 122, 122, 127,
    170, 170, 170, 170, 170, 170, 170, 255,
    170, 170, 170, 170, 170, 170, 170, 255,
    171, 171, 171, 171, 171, 171, 171, 255
  };

  data shop01 = { 67, 76, 112, 192, 192, 192, 192, 192 };
  data shop02 = { 255, 0, 15, 63, 61, 55, 53, 2,   255, 0, 192, 240, 240, 112, 112, 0,   192, 48, 12, 3, 3, 3, 3, 3 };
  data shop03 = { 192, 192, 255, 79, 79, 79, 64, 85,   42, 170, 191, 191, 239, 250, 0, 85,   160, 168, 251, 251, 175, 255, 64, 85,   3, 3, 255, 240, 240, 240, 0, 85 };

  
  //data leftWallTop = { 252, 240, 192, 192, 192, 192, 192, 192 };
  data leftWallTop = { 253, 245, 213, 213, 213, 213, 213, 213 };
  data leftWallMid = { 213, 213, 213, 213, 213, 213, 213, 213 };
  data leftWallBot = { 213, 213, 213, 213, 213, 213, 245, 253 };

  data rightWallTop = { 127, 95, 87, 87, 87, 87, 87, 87 };
  data rightWallMid = { 87, 87, 87, 87, 87, 87, 87, 87 };
  data rightWallBot = { 87, 87, 87, 87, 87, 87, 95, 127 };


  data fleurdelistop = { 255, 234, 234, 234, 234, 214, 214, 213, 255, 150, 150, 85, 85, 85, 85, 150, 255, 171, 171, 171, 171, 151, 151, 87 };
  data fleurdelisbot = { 217, 218, 234, 234, 234, 234, 234, 255, 85, 85, 150, 150, 150, 105, 170, 255, 103, 167, 171, 171, 171, 171, 171, 255 };


  data shieldtop = { 192, 255, 192, 192, 200, 194, 200, 192, 48, 207, 168, 32, 32, 170, 32, 32, 76, 252, 12, 12, 140, 12, 140, 12 };
    
  data shieldbot = { 112, 112, 112, 76, 76, 67, 64, 85, 32, 32, 32, 32, 168, 3, 204, 117, 48, 48, 48, 192, 192, 64, 64, 85 };

  data keyonwall = { 215, 125, 125, 215, 247, 215, 247, 215 };

  data treeA0 = {
    0, 0, 0, 0, 3, 51, 221, 213,
    0, 0, 15, 245, 85, 85, 85, 85,
    3, 13, 53, 213, 85, 85, 85, 85,
    192, 112, 92, 92, 87, 87, 87, 92
  };
  data treeA1 = { 213, 213, 213, 213, 53, 53, 53, 13, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 92, 87, 92, 87, 87, 87, 92, 92 };
  data treeA2 = { 13, 13, 3, 3, 13, 13, 13, 3, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 93, 123, 92, 112, 112, 92, 92, 92, 92, 92 };
  data treeA3 = { 0,0,0,0,0,0,0,0,255, 32, 10, 0, 2, 2, 10, 10, 232, 168, 186, 168, 160, 160, 160, 168, 240, 128, 0, 0, 0, 0, 0, 0 };


  //data shortPine0 = { 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 13, 13, 13, 53, 0, 0, 192, 112, 112, 112, 92, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  //data shortPine1 = { 0, 0, 0, 0, 3, 0, 0, 3, 61, 13, 53, 213, 253, 53, 213, 85, 95, 92, 87, 85, 87, 85, 85, 85, 0, 0, 0, 192, 240, 192, 112, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  //data shortPine2 = { 13, 15, 3, 13, 53, 255, 0, 0, 85, 245, 85, 85, 125, 195, 2, 2, 85, 85, 85, 85, 85, 255, 160, 160, 92, 240, 192, 112, 92, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};


  asmcomment( "Text Definitions" );

  data levelText = {'L','E','V','E','L',':',0x00 };
  data shopText = {'S', 'H', 'O', 'P', 0x00 };
  data scoreText = {'E', 'X', 'P', ':', 0x20, 0x00 };
  data healthText = {'H', 'E', 'A', 'L', 'T', 'H', ':', 0x20, 0x00 };
  data monsterHealthText = {'E', 'N', 'E', 'M', 'Y', ':' };
  data livesText = {'L', 'I', 'V', 'E', 'S', ':' };
  data spacesText = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
  data zeroText = {'0'};
  data goldText = {'G', 'O', 'L', 'D', ':', 0x20, 0x00 };
  data youDiedText = {'Y', 'O', 'U', ' ', 'H', 'A', 'V', 'E', ' ', 'P', 'E', 'R', 'I', 'S', 'H', 'E', 'D' };
  //               1    2    3    4    5    6    7    8    9    0    1    2    3    4    5    6    7    8    9    0    1    2    3    4    5
  data pakText = {'P', 'R', 'E', 'S', 'S', ' ', 'A', 'N', 'Y', ' ', 'K', 'E', 'Y', ' ', 'T', 'O', ' ', 'C', 'O', 'N', 'T', 'I', 'N', 'U', 'E' };
  // 17 chars
  data lastTimeText = { 'F', 'O', 'R', ' ', 'T', 'H', 'E', ' ', 'L', 'A', 'S', 'T', ' ', 'T', 'I', 'M', 'E' };
  
  data pressyText = {'P', 'R', 'E', 'S', 'S', ' ', 'Y', ' ', 'T', 'O', ' ', 'P', 'L', 'A', 'Y', ' ', 'A', 'G', 'A', 'I', 'N' };
  data quitText = {'P', 'R', 'E', 'S', 'S', ' ', 'Q', ' ', 'T', 'O', ' ', 'Q', 'U', 'I', 'T' };

  data levelUpText0 = { 'C', 'O', 'N', 'G', 'R', 'A', 'T', 'U', 'L', 'A', 'T', 'I', 'O', 'N', 'S', 0x00 };
  //data levelUpText1 = { 'Y', 'O', 'U', ' ', 'H', 'A', 'V', 'E', ' ', 'S', 'A', 'V', 'E', 'D', ' ', 'T', 'H', 'E', ' ', 'P', 'R', 'I', 'N', 'C', 'E', 'S', 'S', 0x00 }; 
  data levelUpText1 = { 'Y', 'O', 'U', ' ', 'H', 'A', 'V', 'E', ' ', 'C', 'O', 'M', 'P', 'L', 'E', 'T', 'E', 'D', ' ', 'T', 'H', 'E', ' ', 'L', 'E', 'V', 'E', 'L',  0x00 }; 
  
  asmcomment( "LETTER/DIGIT DEFINITIONS" );
  // digits
  data digits =
    {

      255, 223, 119, 119, 119, 119, 119, 223, 
      255, 223, 223, 223, 223, 223, 223, 223, 
      255, 223, 119, 247, 223, 127, 127, 87, 
      255, 223, 119, 247, 223, 247, 119, 223, 
      255, 247, 119, 119, 87, 247, 247, 247, 
      255, 87, 127, 127, 95, 247, 119, 223, 
      255, 223, 119, 127, 95, 119, 119, 223, 
      255, 87, 247, 247, 247, 223, 223, 223, 
      255, 223, 119, 119, 223, 119, 119, 223, 
      255, 223, 119, 119, 215, 247, 247, 247,
      // space
      255, 255, 255, 255, 255, 255, 255, 255
    };
  // letters
  data letters =
    {
      255, 223, 119, 119, 87, 119, 119, 119, 
      255, 95, 119, 119, 95, 119, 119, 95, 
      255, 223, 119, 127, 127, 127, 119, 223, 
      255, 95, 119, 119, 119, 119, 119, 95, 
      255, 87, 127, 127, 95, 127, 127, 87, 
      255, 87, 127, 127, 95, 127, 127, 127, 
      255, 223, 119, 127, 87, 119, 119, 223, 
      255, 119, 119, 119, 87, 119, 119, 119, 
      255, 87, 223, 223, 223, 223, 223, 87,
      255, 247, 247, 247, 119, 119, 119, 223, 
      255, 119, 119, 95, 119, 119, 119, 119,
      
      255, 127, 127, 127, 127, 127, 127, 87, 
      255, 119, 87, 87, 119, 119, 119, 119, 
      255, 255, 255, 127, 87, 119, 119, 119, 
      255, 223, 119, 119, 119, 119, 119, 223, 
      255, 95, 119, 119, 95, 127, 127, 127, 
      255, 223, 119, 119, 119, 119, 119, 221, 
      255, 95, 119, 119, 95, 119, 119, 119, 
      255, 223, 119, 127, 223, 247, 119, 223, 
      255, 87, 223, 223, 223, 223, 223, 223, 
      255, 119, 119, 119, 119, 119, 119, 223,
      255, 119, 119, 119, 119, 119, 223, 223,
      
      255, 119, 119, 119, 87, 87, 119, 119, 
      255, 119, 119, 119, 223, 119, 119, 119,
      255, 119, 119, 119, 223, 223, 223, 223, 
      255, 87, 247, 247, 223, 127, 127, 87,
      // space
      255, 255, 255, 255, 255, 255, 255, 255, 
      // colon
      255, 255, 223, 223, 255, 223, 223, 255,
      // period
      255, 255, 255, 255, 255, 255, 127, 127, 
      // (
      247, 223, 223, 223, 223, 223, 223, 247, 
      // )
      223, 247, 247, 247, 247, 247, 247, 223, 
      // , comma
      255, 255, 255, 255, 255, 255, 223, 127
    };

  
  word plotDigitAddr = digits;


  
  // the background colour could be controlled by a raster int
  // from 0-32 bg should be blue
  // from 33 - 120 bg should be grey
  // from 121 - bottom of floor it should be brown
  // and then i don't care ... black maybe

  // setup background colours
  //irq( ptr(irqfunc1), 0x00, 1 );

  saveregs();
  
  poke( 0xD020, 0x0B );
  poke( 0xD021, 0x0B );
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
  uint myTextBG;
  uint readyToLevelUp;
  uint isCursed;
  //uint escapeDoorIsInRoom;
  
  uint thing;
  uint thing2;
  uint whichsprites;
  uint currentRoom;
  uint currentleftframe;
  uint currentrightframe;
  uint specialBitFlag;
  uint monsterisinroom;
  uint treasureinroom;
  uint mapinroom;
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
  uint doorLocked;
  uint status;
  // Blue and Red
  uint plotshapeColourValue0110;
  // White
  uint plotshapeColourValue11;

  uint textColour = 0x01;
  uint homeRoom;
  // start at this level
  uint level = 0x01;
  //   0
  // 3   1
  //   2
  uint door0=NULL;
  uint door1=NULL;
  uint door2=NULL;
  uint door3=NULL;
  
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
  word mapx;
  word uncursetimer;
  
  // start in room #1
  //inc( currentRoom );
  currentRoom = homeRoom;
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

  uint playerHP = myRand();
  playerHP = playerHP & 0x03;
  uint playerAC = myRand();
  playerAC = playerAC & 0x03;
  uint monsterHP = myRand();
  monsterHP = monsterHP & 0x03;
  uint monsterAC = myRand();
  monsterAC = monsterAC & 0x03;
  playerHP = playerHP + 13;
  playerAC = playerAC + 13;

  bank( 2 );
  // multicolour bitmap mode
  uint currentD011 = peek( 0xD011 );
  poke( 0xD011, currentD011 | 0x30 );

  //poke( 0xD011, 0x38 );
  poke( 0xD016, 0x18 );
  poke( 0xD018, 0x18 );

  romout(6);
    
  word bmpaddr = getbmp_addr();
  word bmpaddrX = bmpaddr + 0x1FF8;
  word scraddr = getscr_addr();
  word scraddrX = scraddr + 0x03EF;

  screen(0x00);
  poke( 0xD021, 0x00 );
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


  
  myTextBG = 0x00;
  wordToPrint = pakText;
  wordSize = 25;
  plotDigitX = 8;
  plotDigitY = 24;
  printWord();  
  screen(0x01);
  uint override = 0x01;
  
  asmcomment("seed the RNG by repeatedly calling rnd until player presses a key" );
  seed();
  while( general8bit == 0 )
    {
      // it doesn't matter that this is sDoor...
      // it's just an unused (at the moment)
      // memory location to put the new random value
      sDoor=rnd(1);
      general8bit = getchar();
      
      if( general8bit > 0x30 )
	{
	  if( general8bit <= 0x34 )
	    {
	      override  = general8bit - 0x30;
	    }
	}
      buttonpress =  peek(0xDC00) & 0x10;
      if( buttonpress == 0x00 )
	{
	  inc( general8bit );
	}
    }
  mySeed();

 
  // 2024 04 19 - mkpellegrino
  //asmcomment( "shift the screen back down a pixel" );
  //poke( 0xD011, 0x3B );
 
  screen(0x00);

  poke( 0xD021, 0x0C );

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
  jsr( 0xC000 );


  // setup sound
  irq( ptr(irqfunc1), 0x00, 1 );


  // 2024 04 19 - mkpellegrino
  //asmcomment( "shift the screen back down a pixel" );
  //poke( 0xD011, 0x3B );
  
  word sprptr0 = scraddr + 0x03F8;
  word sprptr1 = scraddr + 0x03F9;
  word sprptr2 = scraddr + 0x03FA;
  word sprptr3 = scraddr + 0x03FB;
  word sprptr4 = scraddr + 0x03FC;
  word sprptr5 = scraddr + 0x03FD;
  word sprptr6 = scraddr + 0x03FE;
  word sprptr7 = scraddr + 0x03FF;


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

  //level = override;
  initGame();
  loadWorld();
  //  initGame();
  loadSprites();

  // Sprite Memory starts at 0x8040
 
  // multicolour for sprites 00110111
  //poke( 0xD01C, 0x37 );
 
  // colours for all sprites (Light grey)
  // poke( 0xD025, 0x0F );

  // Black for all sprites
  //poke( 0xD026, 0x00 );

  // Brown for sprite 1
  //spritecolour( 0x01, 0x09 );

  // Brown for sprite 0 and 2 (the monster)
  //spritecolour( 0x00, 0x09 );
  //spritecolour( 0x02, 0x09 );

  // Yellow for sprite 3 (the coins)
  //spritecolour( 0x03, 0x07 );

  // Red for sprite 4 (the healthpack)
  //spritecolour( 0x04, 0x02 );

  // Pink for sprite 5 (the princess)
  //spritecolour( 0x05, 0x0A );

  // Grey for sprite 6 (the key)
  //spritecolour( 0x06, 0x0C );


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
  asmcomment("create scenery");
  
  // treasure
  poke( sprptr3, 61 );
  // healthpack
  poke( sprptr4, 62 );
  // princess
  poke( sprptr5, 63 );
  // key
  //poke( sprptr6, 64 );
  poke( sprptr6, 0 );
  
  putStuffOnTheScreen();
  // after this screen should be back on
  
  //pause();
  
  uint c = getin();

  // ==========
  
  while( keepPlaying != 0x01 )
    {

      if( clock == 0x0000 )
	{
	  //debug( 0x0003, 0x08, playerx, 0x08 );
	  animate();
	  getJS();
	  asmcomment( "convert keypresses into joystick button-presses");
	  if( c == 60 )
	    {
	      JSbtnPressA = 0x00;
	    }
	  if( c == 33 )
	    {
	      // UP
	      JSnorth = 0x00;
	    }
	  if( c == 37 )
	    {
	      // DOWN
	      JSsouth = 0x00;
	    }
	  if( c == 30 )
	    {
	      // LEFT
	      JSwest = 0x00;
	    }
	  if( c == 38 )
	    {
	      // RIGHT
	      JSeast = 0x00;
	    }

	  if( c == 12 )
	    {
	      // LEVEL UP
	      levelUp();
	      loadSprites();
	      putStuffOnTheScreen();
	    }

	  direction = 0x05;

	  if( JSbtnPressA == 0x00 )
	    {
	      // spacebar
	      playerAttackFlag = 0x01;

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

	  // if the player is cursed then
	  //    if they have NOT eaten ORASTY root
	  //       make the moves backward and buzz the border (and reset bkgnd)
	  //    else
	  //       decrease the timer for the ORASTY root and buzz the bkgnd
	  //       and reset the border colour
	  if( isCursed == 0x01 )
	    {
	      if( uncursetimer == 0x0000 )
		{
		  uint tmpCurse = JSwest;
		  JSwest = JSeast;
		  JSeast = tmpCurse;
		  tmpCurse = JSnorth;
		  JSnorth = JSsouth;
		  JSsouth = tmpCurse;
		  inc( 0xD020 );
		  poke( 0xD021, 0x0C );
		}
	      else
		{
		  uncursetimer = uncursetimer - 0x0001;
		  uint uncursetimerB = uncursetimer & 0x000F;
		  if( uncursetimerB == 0x00 )
		    {
		      inc( 0xD021 );
		      poke( 0xD020, 0x0C );
		    }
		}
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
		  currentRoom = goE;
		  playerx = 0x0020;
		  putStuffOnTheScreen();
		}
	    }

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
	  
	  if( JSnorth == 0x00 )
	    {
	      // updateY();
	      // NORTH
	      direction = 0;
		      
	      // 2024 04 20 - mkpellegrino
	      if( playery >= 113 )
		{
		  dec(playery);
		  dec(playery);
		  dec(playery);
		}
	      if( playery < 113 )
		{
		  if( goN != 0 )
		    {
		      if( playerx > nDoor )
			{
			  //if( playerx < nDoor + 0x0040 ) swapped for efficiency
			  if( nDoor + 0x0040 >= playerx )
			    {
			      if( doorLocked == 0x01 )
				{
				  if( playerHasKey != 0x00 )
				    {
				      dec( playerHasKey );
				      unlockDoor();
				      currentRoom = goN;
				      playery = 202;
				      doorLocked = 0x00;
				      putStuffOnTheScreen();
				    }
				}
			      else
				{
				  
				  // MOVE TO NEXT ROOM
				  currentRoom = goN;
				  playery = 202;
				  putStuffOnTheScreen();
				}
			    }
			}
		    }
		  if( mapx != 0x0000 )
		    {
		      if( playerx > mapx )
			{
			  if( playerx < mapx + 40 )
			    {
			      //plotDigitX = 2;
			      //plotDigitY = 10;
			      //plotNum = playerx;
			      //plotNumber();
			  
			      //plotDigitX = 2;
			      //plotDigitY = 11;
			      //plotNum = mapx;
			      //plotNumber();
			      // this is where we can display the map
			      loadMap();
			      //noMonsters();
			      putStuffOnTheScreen();
			    }
			  
			}
		    }
		}
	    }
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
	      if( playery >= 204 )
		{
		  if( goS != 0 )
		    {
		      if( playerx > sDoor )
			{
			  //if( playerx < sDoor + 0x0020 ) // swapping for efficiency
			  if( sDoor + 0x0020 >= playerx )
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
	  if( c == 62 )
	    {
	      pauseGameSequence();
	    }
	  if( princessisinroom != 0x00 )
	    {
	      if( playerHasKey != 0x00 )
		{
		  uint tmpProx1 = proximity( princessx, princessy, 0x000A );
		  if( tmpProx1 != 0x00 )
		    {

		      // This should make the player go to the next level
		      // in the next level the healthpack should increase
		      // hit points by more than the previous level.
		      // monsters should have more hitpoints (and should be faster)
		      // there should be something like spells or shields or some new item
		      
		      princessisinroom = 0x00;

		      //princess
		      clearSpecialBit( 0x00 );
		      // key bit
		      // 2024 04 19 - mkpellegrino
		      clearSpecialBit( 0x07 );
		      //clearSpecialBit( 0x08 );
		      
		      spriteoff( 0x20 );
		      expPts = expPts + 0x0100;
		      updateScore();
		      dec( playerHasKey );
		      //playerHasKey = 0x00;
		      putThing( 0xA0, 0x00 );

		      // NOW ESCAPE!
		      escapePhase();
		    }
		}
	    }
	  if( monsterisinroom != 0x00 )
	    {
	      tmpProx1 = proximity( monster0x, monster0y, 0x000A );
	      if( tmpProx1 != 0x00 )
		{
		  //if( c == 60 )
		  if( JSbtnPressA == 0x00 )
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
      //animate();
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
      //clock = clock & 0x003F;
      clock = clock & 0x007F;

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
  //irq( ptr(irqrestore), 0x00, 1 );
  
  restoreregs();
  shortcls();
  printf( "GAME OVER\n\nSTATS:\n" );
  prints( levelText );
  printf( level );
  cr();
  prints( scoreText  );
  printf( expPts );
  cr();
  prints( goldText );
  printf( playerGold );
  cr();
  prints( healthText );
  printf( playerHP );
  cr();
  return;
}


void animate()
{
  // later on, when the memory bank configuration is finalised,
  // use the immediate value of sprptr0 (which is a WordID).
  // that will make the animate function execute a little bit faster.
  //if( clock == 0x0000 )
  //  {

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
  //}
  return;
}

void clearhires()
{
  //                                           Colours
  // 0 - Black  1 - White   2 - Red   3 - Cyan  4 - Purple  5 - Green  6 - Dark Blue
  // 7 - Yellow 8 - Orange  9 - Brown A - Pink  B - Drk Gry C - Grey   D - Bright Green
  //                        E - Light Blue                   F - Light Grey

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
  return;
}


void putStuffOnTheScreen()
{
  if( currentRoom == 0xFF )
    {
      levelUp();
    }
  
  screen(0x00);

  clearhires();


  // Put Down the Ceiling
  for( uint general8bitA = 0x00; general8bitA < 0x28; general8bitA++ )
    {
      for( uint general8bitB = 0x00; general8bitB < 0x04; general8bitB++ )
	{
	  plotshapeColourValue11 = 0x00;
	  plotshapeColourValue0110 = 0x12;
	  plotshape( allThrees, general8bitA, general8bitB, 1 );
	}
    }
  // Put Down the Floor
  for( general8bitA = 0x00; general8bitA < 0x28; general8bitA++ )
    {
      for( general8bitB = 0x0A; general8bitB < 22; general8bitB++ )
	{
	  plotshapeColourValue11 = 0x0B;
	  plotshapeColourValue0110 = 0x12;
	  plotshape( allThrees, general8bitA, general8bitB, 1 );
	}
    }

  // Put Down the Bottom
  for( general8bitA = 0x00; general8bitA < 0x28; general8bitA++ )
    {
      for( general8bitB = 22; general8bitB < 25; general8bitB++ )
	{
	  plotshapeColourValue11 = 0x00;
	  plotshapeColourValue0110 = 0x12;
	  plotshape( allThrees, general8bitA, general8bitB, 1 );
	}
    }

  mapx = 0x0000;
  mapinroom = 0x00;
  doorLocked = 0x00;
    
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
  // 0x0F = Closed Door
  // 0x11 = Shop
  // 0x12 = Objective
  // 0x13 = Curse On
  // 0x14 = Curse Off
  
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
  doorLocked = 0x00;
  for( uint jj = 0x00; jj<0x05; inc( jj ) )
    {
      thing = (world)[roomIndex];
      putThing( thing, jj );
      if( thing == 0x01 )
	{
	  doorLocked = 0x00;
	  nDoor = jj * 64;
	}
      if( thing == 0x0F )
	{
	  doorLocked = 0x01;
	  nDoor = jj * 64;
	}
      if( thing == 0x13 )
	{
	  isCursed = 0x01;
	}
      if( thing == 0x14 )
	{
	  poke( 0xD020, 0x0C );
	  isCursed = 0x00;
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
      monster0y = lsr(lsr(monster0y)) + 143;
      //lsr(monster0y);
      //lsr(monster0y);
      //monster0y = monster0y + 143;

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
      treasurey = lsr(lsr( treasurey )) + 140;
      //lsr(treasurey);
      //lsr(treasurey);
      //treasurey = treasurey + 140;

      treasureinroom = 0x01;
      spriteon( 0x08 );
    }
  else
    {
      treasureinroom = 0x00;
      spriteoff( 0x08 );
    }

  // PLACE HEALTH PACK IN ROOM
  thing2 = thing & 0x10;
  if( thing2 != 0 )
    {
      healthpackx = myRand();
      healthpackx = healthpackx + 0x0021;


      // the y value needs to be from 123 - 160 or so.
      healthpacky = myRand();
      healthpacky = lsr(lsr( healthpacky )) + 140;
      //lsr(healthpacky);
      //lsr(healthpacky);
      //healthpacky = healthpacky + 140;

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
      keyy = lsr(lsr(keyy)) + 143;
      //lsr(keyy);
      //lsr(keyy);
      //keyy = keyy + 143;

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
      spritexy( 0x05, princessx, princessy );
      spriteon( 0x20 );
    }
  else
    {
      princessisinroom = 0x00;
      spriteoff( 0x20 );
    }

  asmcomment( "reset the number of expPts the player gets for entering the room that they enter" );
  general16bit = world + roomIndex;

  myTextBG = 0x00;
  textColour = 0x01;
  wordToPrint = scoreText;
  wordSize = 4;
  plotDigitX = 1;
  plotDigitY = 1;
  printWord();
  
  updateScore();

  myTextBG = 0x00;
  wordToPrint = goldText;
  wordSize = 5;
  plotDigitX = 14;
  plotDigitY = 23;
  printWord();
  
  updateGold();

  myTextBG = 0x00;
  wordToPrint = healthText;
  wordSize = 7;
  plotDigitX = 29;
  plotDigitY = 1;
  printWord();
  updateHealth();
  
  myTextBG = 0x00;
  wordToPrint = livesText;
  wordSize = 6;
  plotDigitX = 31;
  plotDigitY = 23;
  printWord();

  myTextBG = 0x00;
  wordToPrint = monsterHealthText;
  wordSize = 6;
  plotDigitX = 1;
  plotDigitY = 23;
  inc(textColour);
  printWord();
  dec(textColour);

  updateLives();

  if( playerHasKey != 0x00 )
    {
      putThing( 0x0A, 0x00 );
    }

      
  
  screen(0x01);
  return;
}

void putThing( uint whatThing, uint whereThing )
{
  //uint ptStartX = whereThing * 8;
  uint ptStartX = asl(asl(asl(whereThing)));

  // RIGHT WALL
  if( whatThing == 0x08 )
    {
      plotshapeColourValue11 = 0x00;
      plotshapeColourValue0110 = 0xBB;

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
      plotshapeColourValue0110 = 0xBB;
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
  if( whatThing == 0x0B )
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
      plotshapeColourValue11 = 0x00;
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
      //princessx = princessx * 0x08;
      princessx = asl(asl(asl(princessx)));
      princessx = princessx + 0x0001;
    }


  // Objective
  if( whatThing == 0x12 )
    {
      princessx = ptStartX + 0x0005;
      princessx = asl(asl(asl(princessx)));
      princessx = princessx + 0x0001;
    }


  //  if( whatThing == 0x0F )
  //  {
  //    plotshapeColourValue0110 = 0xB2; 
  //    plotshapeColourValue11 = 0x00;
  //    plotshape(shieldtop, ptStartX+2, 6, 3 );
  //    plotshape(shieldbot, ptStartX+2, 7, 3 );
      //escapeDoorIsInRoom = 0x01;
  //  }

  // Closed Door
  if( whatThing == 0x0F )
    {
      // Dark Grey (B) & Brown (9)
      plotshapeColourValue0110 = 0xB9;
      // black
      plotshapeColourValue11 = 0x00;

      plotshape(closedDoor00, ptStartX+2, 6, 4);
      plotshape(closedDoor01, ptStartX+2, 7, 4);
      plotshape(closedDoor02, ptStartX+2, 8, 4);
      plotshape(closedDoor03, ptStartX+2, 9, 4);

    }

  // Shop
  if( whatThing == 0x11 )
    {
      // Dark Grey (B) & Brown (9)
      plotshapeColourValue0110 = 0xB9;
      // black
      plotshapeColourValue11 = 0x00;
      plotshape(shop01, ptStartX+2, 7, 1);

      // yellow and brown
      plotshapeColourValue0110 = 0x79;
      plotshape(shop02, ptStartX+3, 7, 3);
      plotshapeColourValue0110 = 0xB9;
      plotshape(shop03, ptStartX+2, 8, 4);


      textColour = 0x02;
      wordToPrint = shopText;
      wordSize = 4;
      plotDigitX = ptStartX+2;
      plotDigitY = 6;
      printWord();
    }


  
  // Map On Wall
  if( whatThing == 0x10 )
    {
      // black
      plotshapeColourValue11 = 0x00;
      // yellow and brown
      plotshapeColourValue0110 = 0xFB;

      plotshape(maponWallTop, ptStartX+2, 7, 4);
      plotshape(maponWallBot, ptStartX+2, 8, 4);
      mapinroom=1;

      // TO DO: The value of mapx needs to be more accurate as
      // to where on the wall the map is hung
      mapx=ptStartX * 9;
      //mapx=ptStartX * 8;
    }

  // Tree
  if( whatThing == 0x15 )
    {
      // black
      plotshapeColourValue11 = 0x00;
      // yellow and brown
      plotshapeColourValue0110 = 0x59;
      plotshape(treeA0, ptStartX+2, 6, 4);
      plotshape(treeA1, ptStartX+2, 7, 4);
      plotshape(treeA2, ptStartX+2, 8, 4);
      //plotshape(treeA3, ptStartX+2, 8, 4);
      plotshape(treeA3, ptStartX+2, 9, 4);
      mapinroom=1;
      // TO DO: The value of mapx needs to be more accurate as
      // to where on the wall the map is hung
      mapx=ptStartX * 9;
      //mapx=ptStartX * 8;
    }

  
  return;
}

void plotshape(word plotshapeAddr, uint plotshapeX, uint plotshapeY, uint plotshapeSize)
{
  uint plotshapeBindex = 0;
  word plotshapeOffset = plotshapeX + plotshapeY * 40;
  word plotshapeColor1 = plotshapeOffset + 0xD800;
  word plotshapeColors2And3 = plotshapeOffset + scraddr;
  word plotshapePixels = asl(asl(asl(plotshapeOffset))) + bmpaddr;
  
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

void debug( word debugX, uint debugY, word debugN, uint debugTC )
{
  plotDigitX = debugX;
  plotDigitY = debugY;
  plotNum = debugN;
  textColour = debugTC;
  plotNumber();
  //white
  textColour = 0x01;
  return;
}

void positionMOBS()
{
  if( monsterisinroom != 0 )
    {
      spritexy( 0x00, monster0x, monster0y );
      spritexy( 0x02, monster0x, monster0y );
    }

  spritexy( 0x01, playerx, playery );

  if( treasureinroom == 0x01 )
    {
      // treasure
      spritexy( 0x03, treasurex, treasurey );
      //spritex( 3, treasurex );
      //spritey( 3, treasurey );

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
      spritexy( 0x04, healthpackx, healthpacky );
      //spritex( 4, healthpackx );
      //spritey( 4, healthpacky );

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


	  // 2025 01 05 - If a healthpack is picked up AND this is a cursed level...
	  // set an "uncurse" timer.  When the timer runs out - the curse is back on.
	  uncursetimer = 0x00FF;
	}
    }

  if( keyinroom == 0x01 )
    {
      spritexy( 0x06, keyx, keyy );
      //spritex( 6, keyx );
      //spritey( 6, keyy );

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
	  inc(playerHasKey);
	  putThing( 0x0A, 0x00 );
	}
    }

  return;
}

void irqfunc1()
{
  asmcomment( "the sid routine" );
  jsr( 0xC006 );
  asmcomment("player attack sound effect");
  if( playerAttackFlag > 0x00 )
    {
      // SOUND EFFECT
      // voice 2
      poke( 0xD40B, 0x81 );
      // AD
      poke( 0xD40C, 0x11 );
      // SR
      poke( 0xD40D, 0xF1 );
      // Frequency
      // Voice 2
      poke( 0xD408, 0x0F );
      poke( 0xD407, 0x43 );
      dec( playerAttackFlag );
    }
  asmcomment( "acknowledge interrupt" );
  asl( 0xD019 );
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
  word plotDigitOffset = plotDigitY * 40;
  plotDigitOffset = plotDigitOffset + plotDigitX;
  
  word plotDigitColor1 = plotDigitOffset + 0xD800;
  word plotDigitColors2And3 = plotDigitOffset + scraddr;
  poke( plotDigitColor1, myTextBG );
  uint myDigitColour = asl(asl(asl(asl(textColour))));
  poke( plotDigitColors2And3, myDigitColour );

  word plotDigitPixels = asl(asl(asl(plotDigitOffset))) + bmpaddr;

  for( uint plotDigitI = 0; plotDigitI < 8; inc( plotDigitI ) )
    {
      poke( plotDigitPixels, (plotDigitAddr)[plotDigitBindex] );
      plotDigitPixels = plotDigitPixels + 1;
      inc( plotDigitBindex );
    }
  //if( myTextBG != 0x00 )
  //  {
  //    myTextBG = 0x00;
  //  }
  return;
}

void printWord()
{
  plotDigitAddr= letters;
  for( uint printWordI = 0x00; printWordI < wordSize; inc(printWordI) )
    {
      
      uint currentChar = (wordToPrint)[printWordI];

      if( currentChar == ',' )
	{
	  currentChar = 31;
	}
      else
	{
	  if( currentChar == ')' )
	    {
	      currentChar = 30;
	    }
	  else
	    {
	      if( currentChar == '(' )
		{
		  currentChar = 29;
		}
	      else
		{
		  if( currentChar == '.' )
		    {
		      currentChar = 28;
		    }
		  else
		    {
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
		    }
		}
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
  myTextBG = 0x00;
  textColour = 0x01;
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
  myTextBG = 0x00;
  textColour = 0x01;

  plotDigitX = 38;
  plotDigitY = 23;
  plotNum = lives;
  plotNumber();
  return;
}

void updateHealth()
{
  myTextBG = 0x00;
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
  
  myTextBG = 0x00;
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
  myTextBG = 0x00;
  plotDigitX = 23;
  plotDigitY = 23;
  plotNum = playerGold;
  plotNumber();
  return;
}


void updateMonsterHealth()
{
  myTextBG = 0x00;

  wordToPrint = spacesText;
  wordSize = 5;
  plotDigitX = 7;
  plotDigitY = 23;
  printWord();

  myTextBG = 0x00;
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
  for( general8bit = 0x00; general8bit < specialBit; inc(general8bit) )
    {
      asl( specialBitFlag );
    }
  dec( currentRoom );
  roomIndex = currentRoom * 11;
  inc( currentRoom );
  general16bit = world + roomIndex;
  general16bit = general16bit + 0x000A;
  
  general8bit = peek(general16bit) | specialBitFlag;
  poke( general16bit, general8bit );
  return;
}

void clearSpecialBit( uint specialBit2 )
{
  // arg: 0 -> 7
  specialBitFlag = 0xFE;
  for( general8bit = 0x00; general8bit < specialBit2; inc(general8bit))
    {
      rol( specialBitFlag );
    }
  dec( currentRoom );
  roomIndex = currentRoom * 11;
  inc( currentRoom );
  general16bit = world + roomIndex;
  general16bit = general16bit + 0x000A;
  general8bit = peek( general16bit ) & specialBitFlag;
  poke( general16bit, general8bit  );
  return;
}

uint proximity(word proxX, uint proxY, word proxLimit)
{
  uint proximityReturn = 0x00;
  word xdist=NULL;
  uint ydist=NULL;
  
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
  currentRoom = homeRoom;
  //playerHP = myRand() & 0x03;
  playerHP = playerHP & 0x03;
  playerHP = playerHP + 13;

  myTextBG = 0xBB;
  wordToPrint = youDiedText;
  wordSize = 17;
  plotDigitX = 12;
  plotDigitY = 11;
  printWord();

  delay();

  myTextBG = 0xBB;
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
  whichsprites = peek( 0xD015 );
  poke( 0xD015, 0x00 );

  myTextBG = 0xBB;
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
      myTextBG = 0xBB;
      wordToPrint = spacesText;
      wordSize = 15;
      plotDigitX = 12;
      plotDigitY = 13;
      myTextBG = 0xBB;
      printWord();
      poke( 0xD015, whichsprites );
    }
  
  return;
}

void gameOverSequence()
{
  //whichsprites = peek( 0xD015 );
  poke( 0xD015, 0x00 );
  updateLives();
  updateHealth();

  myTextBG = 0xBB;
  wordToPrint = youDiedText;
  wordSize = 17;
  plotDigitX = 12;
  plotDigitY = 11;
  printWord();

  myTextBG = 0xBB;
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
  myTextBG = 0xBB;

  printWord();
  
  //spriteoff( 0x02 );

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
      myTextBG = 0xBB;

      wordToPrint = spacesText;
      wordSize = 17;
      plotDigitX = 12;
      plotDigitY = 11;
      printWord();

      myTextBG = 0xBB;

      wordToPrint = spacesText;
      wordSize = 21;
      plotDigitX = 10;
      plotDigitY = 13;
      printWord();
      
      initGame();
      
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
  isCursed = 0x00;
  currentRoom = homeRoom;
  playerHP = playerHP + level * 0x02;    
  playerx = 0x0020;
  playery = 0x80;
  return;
}

void initGame()
{
  homeRoom = 0x01;
  //loadWorld();
  currentRoom = homeRoom;
  playerHP = playerHP + myRand();
  playerHP = playerHP + level * 0x02;
  //playerHP = playerHP + level;
  playerHP = playerHP & 0x03;

  level = 0x01;
  level = override;
  
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
	  shortDelay();
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
  uint myRandReturnValue = (randomValues)[rvIndex];
  inc(rvIndex);
  if( rvIndex == 0x40 )
    {
      rvIndex = 0x00;
    }
  
  //rvIndex = rvIndex & 0x7F;
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

void shortDelay()
{
  for( delayW = 0; delayW < 0x01FF; delayW = delayW + 0x0001 )
    {
      nop();
    }
  return;
}

void loadMap()
{
  asmcomment( "blank the screen" );
  screen(0x00);

  asmcomment( "preserve which sprites were on before we displayed the map" );
  whichsprites = peek( 0xD015 );
  asmcomment( "turn all sprites off" );
  poke( 0xD015, 0x00 );

  asmcomment( "LOAD THE MAP SCREEN INTO MEMORY FOR THE CURRENT LEVEL" );
  //data mapfn = {'M','A','P','?',',','S',',','R' };
  poke( mapfn + 0x0003, level + 0x30);
  
  setfilename( mapfn );
  //setfilename( "MAP1,S,R" );
  setlfs( 3, 8, 3 );


  fopen();
  fchkin( 3 );

  
  
  for( i = 0xA000; i < 0xBF40; i = i + 0x0001 )
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

 
  myTextBG = 0xCC;
  textColour = 0x0B;
  wordToPrint = pakText;
  wordSize = 25;
  plotDigitX = 8;
  plotDigitY = 24;
  printWord();

  asmcomment( "UN-blank the screen" );
  screen(0x01);


  asmcomment( "pause routine ");
  poke( 0x00C6, 0x00 );
  jsr( 0xFFE4 );
  
  general8bit = 0;
  while( general8bit == 0 )
    {
      general8bit = getchar();
      buttonpress =  peek(0xDC00) & 0x10;
      if( buttonpress == 0x00 )
	{
	  inc( general8bit );
	}
    }
  
  asmcomment( "turn the sprites back on" );
  poke( 0xD015, whichsprites );

  return;
}

void escapePhase()
{
  // set the North Door in Room 1 to be an Level Upper
  poke( world, 0xFF );
  poke( world + 0x0006, 0x01 );
  
  homeRoom = currentRoom;
  for( general8bit = 0x00; general8bit < 0x14; general8bit++ )
    {
      
      general16bit = general8bit*11;
      general16bit = general16bit + 10;
      // add monsters to every room
      uint b = peek( world + general16bit ) | 0x40;
      // take out all the health packs
      b = b & 0xEF;
      
      poke( world + general16bit, b );
    }
  
  //readyToLevelUp = 0x01;
  //noMonsters();
  
  return;
}

void levelUp()
{
  whichsprites = peek( 0xD015 );
  poke( 0xD015, 0x00 );
  homeRoom = 0x01;
  currentRoom = 0x01;
  inc( level );
  // add HP
  // SHOW LEVEL UP SCREEN!
  levelUpScreen();
  // load new graphics from disk
  loadWorld();
  initWorld();

  // 2025 01 05 - mkpellegrino
  loadSprites();
  
  lives = lives + 0x01;
  poke( 0xD015, whichsprites );
  // make monsters stronger
  return;
}

void levelUpScreen()
{
  screen(0x00);
  clearhires();

  textColour = 0x01;
  
  myTextBG = 0xCC;
  wordToPrint = levelUpText0;
  wordSize = 15;
  plotDigitX = 12;
  plotDigitY = 2;
  printWord();

  textColour = 0x01;

  myTextBG = 0xCC;
  wordToPrint = levelUpText1;
  wordSize = 28;
  plotDigitX = 6;
  plotDigitY = 4;
  printWord();

  textColour = 0x0B;

  myTextBG = 0xCC;
  wordToPrint = pakText;
  wordSize = 25;
  plotDigitX = 8;
  plotDigitY = 24;
  printWord();
  
  screen( 0x01 );
  
  poke( 0x00C6, 0x00 );
  jsr( 0xFFE4 );
  
  general8bit = 0;
  while( general8bit == 0 )
    {
      general8bit = getchar();
      buttonpress =  peek(0xDC00) & 0x10;
      if( buttonpress == 0x00 )
	{
	  inc( general8bit );
	}
    }
  return;
}

//void noMonsters()
//{
//  asmcomment( "vvv----- Take this out after testing and debugging ----vvv" );
//  for( general8bit = 0x00; general8bit < 0x14; general8bit++ )
//    {      
//      general16bit = general8bit*11;
//      general16bit = general16bit + 10;
//      uint a = peek( world + general16bit ) & 0xBF;      
//      poke( world + general16bit, a );
//    }
//  return;
//  asmcomment( "^^^----- ---- ----- ----- ---- ---- ---- ---- ---- ----^^^" );
//}


void loadSprites()
{
  asmcomment( "LOAD MOBS INTO MEMORY FOR THE CURRENT LEVEL" );
  data spritesfn = {'S','P','R','I','T','E','S','?',',','S',',','R' };
  poke( spritesfn + 0x0007, level + 0x30 );
  setfilename( spritesfn );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  // which sprites are MC
  poke( 0xD01C, fchrin() );
  // Universal Sprite Colours
  poke( 0xD025, fchrin() );
  poke( 0xD026, fchrin() );
  // the first 8 bytes of SPRITE FILE are the colours for Sprites 0-7
  for( general8bit = 0x00; general8bit < 0x08; inc( general8bit ))
    {
      spritecolour(general8bit, fchrin() );
    }

  status = 0x00;
  word saddr = 0x8800;
  while( status == 0x00 )
    {
      poke( saddr, fchrin() );
      saddr = saddr + 0x0001;
      status = peek( 0x0090 );
    }
  //for( word saddr = 0x8800; saddr < 0x9000; saddr = saddr + 0x0001 )
  //  {
  //    poke( saddr, fchrin() );
  //  }
  // read the "KEY" sprite in for sprite pointer value of 1
  //for( saddr = 0x8000; saddr < 0x8040; saddr = saddr + 0x0001 )
  //  {
  //    poke( saddr, fchrin() );
  //  }
  // copy the key to location 0?
  memcpy( 0x9000, 0x8000, 64 );
      
  fclose(3);
  fclrchn();
  return;
}

void loadWorld()
{
  asmcomment( "LOAD AND DISPLAY THE SYNOPSIS" );

  screen(0x00);
  // clearhires();
  myTextBG = 0x0C;
  poke( 0xD020, 0x0C );
  poke( 0xD021, 0x0C );
  //poke( 0xD022, 0x0C );
  //poke( 0xD023, 0x0B );
  data synopsisfn = {'S','Y','N','O','P','S','I','S','?',',','S',',','R' };
  poke( synopsisfn + 0x0008, level + 0x30 );
  setfilename( synopsisfn );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );
  textScreen();
  fclose(3);
  fclrchn();
  screen(0x01);
  myPause();
  
  asmcomment( "LOAD THE WORLD INTO MEMORY FOR THE CURRENT LEVEL" );
  data worldfn = {'W','O','R','L','D','?',',','S',',','R' };
  poke( worldfn + 0x0005, level + 0x30 );
  setfilename( worldfn );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  general16bit = world;
  for( general8bit = 0; general8bit < 253; inc( general8bit ) )
    {
      poke( general16bit, fchrin() );
      general16bit = general16bit + 0x01;
    }
  
  fclose(3);
  fclrchn();
  return;
}

void unlockDoor()
{
  dec( currentRoom );
  word unlockDooraddr = world + currentRoom * 11;
  inc( currentRoom );
  unlockDooraddr = unlockDooraddr + 0x0004;
  
  for( general8bit = 0x00; general8bit < 0x05; inc( general8bit ) )
    {
      uint aaa = peek( unlockDooraddr );
      if( aaa == 0x0F )
	{
	  poke( unlockDooraddr, 0x01 );
	}
      unlockDooraddr = unlockDooraddr + 0x0001;
    }
  inc(expPts);
  inc(expPts);
  return;
}

void textScreen()
{
  uint YY = 0x00;
  uint XX = 0x00;
  status = 0x00;
  textColour = 1;

  data buffer = { 0x00 };
  while( status == 0x00 )
    {
      uint in = fchrin();
      poke( buffer, in );

      if( in < 16 )
	{
	  textColour = in;
	}
      else
	{
	  if( in < 0x3A )
	    {
	      if( in > 0x2F )
		{
		  // then its a digit
		  plotNum = in - 0x30;
		  plotDigitX = XX;
		  plotDigitY = YY;
		  plotNumber();
		}
	      else
		{
		  wordToPrint = buffer;
		  wordSize = 1;
		  plotDigitX = XX;
		  plotDigitY = YY;
		  printWord();
		}
	    }
	  else
	    {
	      wordToPrint = buffer;
	      wordSize = 1;
	      plotDigitX = XX;
	      plotDigitY = YY;
	      printWord();
	    }

	  if( XX == 0x28 )
	    {
	      XX = 0x00;
	      inc( YY );
	    }
	  inc( XX );
	}
      status = peek( 0x0090 );
    }

  return;
}

void myPause()
{
  general8bit = 0x00;
  while( general8bit == 0 )
    {
      general8bit = getchar();
      buttonpress =  peek(0xDC00) & 0x10;
      if( buttonpress == 0x00 )
	{
	  inc( general8bit );
	}
    }
  return;
}
