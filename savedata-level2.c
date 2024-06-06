void main()
{
  uint status = 0x00;
  asmcomment( "LEVEL 2 SPRITES" );

  data spritedata =
    {
      // Which sprites are Multicoloured (0xD01C)
      // Universal Colours (0xD025)
      //                   (0xD026)
      // Individual COLOURS 0-7
      0x37, 0x0F, 0x00,      0x09, 0x09, 0x09, 0x07, 0x02, 0x0A, 0x0C, 0x00, 

      // PLAYER
      // STANDING 32
      0, 204, 192, 128, 255, 192, 128, 213, 192, 128, 221, 192, 128, 255, 192, 128,  63,   0,  32,  63,   0,
     32,  12,   0,  32,  85,  64,  53, 110,  80,  32, 123,  68,   8,  29,   4,   8,  25,   4,   8,  29, 208,
      8,  21,   0,   8,  55,   0,   2,  51,   0,   2,  51,   0,   2,  51,   0,   2,  51,   0,   2,  81,  64, 0,

      // WALKINGUP0 33
      0, 204, 194,   0, 255, 194,   0, 255, 194,   0, 255, 194,   0, 255, 194,   0,  63,   2,   0,  63,   2,
      0,  12,   2,   0,  85,  66,   1,  85,  87,   1,  85,  66,   1,  21,   2,   1,  21,   2,   1,  21,   2,
      1,  21,   2,   3,  55,   2,   0,  51,   2,   0,  51,   2,   0,  48,   2,   0,  48,   2,   0,  16,   2, 0,
      
      // WALKINGUP1 34
      0, 204, 192,   0, 255, 194,   0, 255, 194,   0, 255, 194,   0, 255, 194,   0,  63,   2,   0,  63,   2,
      0,  12,   2,   0,  85,  66,   1,  85,  87,   1,  85,  66,   1,  21,   2,   1,  21,   2,   3,  21,   2,
      0,  21,   2,   0,  55,   2,   0,  51,   2,   0,  51,   2,   0,  51,   2,   0,  48,   0,   0,  16,   0, 0,
      // WALKINGUP2 35
      0,   0,   0,   0, 204, 192,   0, 255, 194,   0, 255, 194,   0, 255, 194,   0,  63,   2,   0,  63,   2,
      0,  12,   2,   0,  85,  66,   1,  85,  87,   1,  85,  66,   1,  21,   2,   0,  21,   2,   0,  21,   2,
      0,  21,   2,   0,  55,   2,   0,  51,   2,   0,   3,   2,   0,   3,   0,   0,   3,   0,   0,   1,   0, 0,

      // WALKINGUP3 36

      0,   0,   0,   0, 204, 192,   0, 255, 194,   0, 255, 194,   0, 255, 194,   0,  63,   2,   0,  63,   2,
      0,  12,   2,   0,  85,  66,   1,  85,  87,   1,  85,  66,   1,  21,   2,   1,  21,   2,   3,  21,   2,
      0,  21,   2,   0,  55,   2,   0,  51,   2,   0,  51,   2,   0,  51,   0,   0,   3,   0,   0,   1,   0, 0,



      // WALKINGDOWN0 37
     32, 204, 192,  32, 255, 192,  32, 213, 192,  32, 221, 192,  32, 255, 192,  32,  63,   0,  32,  63,   0,
     32,  12,   0,  32,  85,  64,  53, 110,  80,  32, 123,  80,  32,  29,  16,  32,  25,  16,  32,  29,  16,
     32,  21,  16,  32,  55,  48,  32,  51,   0,  32,  51,   0,  32,   3,   0,  32,   3,   0,  32,   1,   0, 0,
     

      // WALKINGDOWN1 38
     0, 204, 192,  32, 255, 192,  32, 213, 192,  32, 221, 192,  32, 255, 192,  32,  63,   0,  32,  63,   0,
     32,  12,   0,  32,  85,  64,  53, 110,  80,  32, 123,  80,  32,  29,  16,  32,  25,  16,  32,  29,  48,
     32,  21,   0,  32,  55,   0,  32,  51,   0,  32,  51,   0,  32,  51,   0,   0,   3,   0,   0,   1,   0, 0,

     // WALKINGDOWN2 39
      0,   0,   0,   0, 204, 192,  32, 255, 192,  32, 213, 192,  32, 221, 192,  32,  63,   0,  32,  63,   0,
     32,  12,   0,  32,  85,  64,  53, 110,  80,  32, 123,  80,  32,  29,  16,  32,  25,   0,  32,  29,   0,
     32,  21,   0,  32,  55,   0,  32,  51,   0,  32,  48,   0,   0,  48,   0,   0,  48,   0,   0,  16,   0, 0,

     // WALKINGDOWN3 40
     0, 0, 0, 0, 204, 192, 32, 255, 192, 32, 213, 192, 32, 221, 192, 32, 63, 0, 32, 63, 0, 32, 12, 0, 32, 85, 64, 53, 110, 80, 32, 123, 80, 32, 29, 16, 32, 25, 16, 32, 29, 48, 32, 21, 0, 32, 55, 0, 32, 51, 0, 32, 51, 0, 0, 51, 0, 0, 48, 0, 0, 16, 0, 0,

     // WALKINGLEFT 0 41
     0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 252, 0, 128, 60, 0, 128, 240, 0, 128, 16, 0, 32, 84, 0, 32, 84, 0, 35, 116, 0, 12, 92, 0, 8, 87, 0, 8, 84, 192, 8, 84, 0, 2, 112, 0, 2, 124, 0, 2, 76, 0, 1, 79, 0, 5, 131, 0, 1, 140, 0, 0,

     // WALKINGLEFT 1 42
     0, 0, 0, 0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 252, 0, 0, 60, 0, 0, 240, 0, 8, 84, 0, 8, 116, 0, 2, 116, 0, 2, 116, 0, 0, 116, 0, 0, 212, 0, 3, 84, 0, 0, 96, 0, 0, 120, 0, 0, 120, 0, 0, 78, 0, 1, 14, 0, 5, 60, 128, 0,
     
     // WALKINGLEFT 2 43
     0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 252, 0, 0, 60, 0, 0, 240, 0, 0, 16, 0, 0, 84, 0, 0, 84, 0, 0, 116, 0, 3, 212, 2, 12, 87, 40, 0, 86, 192, 0, 84, 0, 2, 176, 0, 0, 244, 0, 0, 196, 0, 3, 197, 0, 15, 1, 0, 3, 4, 0, 0,


     // WALKINGRIGHT 0 44
     0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 32, 0, 63, 32, 0, 60, 32, 0, 15, 32, 0, 4, 48, 0, 21, 224, 0, 23, 8, 0, 29, 8, 0, 21, 8, 0, 213, 8, 3, 21, 8, 0, 21, 8, 0, 12, 2, 0, 31, 2, 0, 19, 2, 0, 83, 194, 0, 64, 242, 0, 16, 194, 0,

     // WALKINGRIGHT 1 45
     0, 0, 0, 0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 0, 0, 63, 0, 0, 60, 0, 0, 15, 0, 0, 21, 32, 0, 29, 32, 0, 29, 128, 0, 29, 128, 0, 30, 0, 0, 23, 0, 0, 25, 0, 0, 9, 0, 0, 45, 0, 0, 45, 0, 0, 177, 0, 0, 176, 64, 2, 60, 80, 0,

     // WALKINGRIGHT 2 46
     0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 0, 0, 63, 0, 0, 60, 0, 0, 15, 0, 0, 4, 0, 0, 21, 0, 0, 21, 0, 0, 29, 192, 128, 53, 48, 40, 213, 0, 3, 149, 0, 0, 41, 0, 0, 14, 128, 0, 61, 0, 0, 49, 0, 0, 241, 64, 0, 192, 80, 0, 48, 64, 0,

     // LUNGER 47
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 0, 0, 63, 0, 0, 61, 0, 0, 63, 0, 0, 60, 0, 0, 15, 0, 0, 20, 58, 0, 126, 176, 42, 167, 192, 13, 21, 0, 0, 21, 0, 0, 21, 0, 0, 31, 0, 0, 19, 0, 0, 19, 0, 0, 64, 192, 0, 64, 192, 0, 80, 240, 0,

     // LUNGEL 48
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 204, 0, 0, 252, 0, 0, 124, 0, 0, 252, 0, 0, 60, 0, 0, 240, 0, 176, 20, 0, 14, 124, 0, 3, 87, 168, 0, 84, 240, 0, 84, 0, 0, 84, 0, 0, 84, 0, 0, 196, 0, 0, 196, 0, 3, 1, 0, 3, 1, 0, 15, 5, 0, 0,


     // MONSTER (LEVEL 2 GHOST )
     // MOVE LEFT 
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 100, 0, 1, 169, 0, 1, 169, 0, 0, 32, 0, 1, 69, 0, 4, 84, 64, 16, 84, 16, 128, 252, 8, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 12, 48, 48, 48, 48, 192, 0, 12, 0, 0,

          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,

     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 100, 0, 1, 169, 0, 1, 169, 0, 0, 32, 0, 1, 69, 0, 4, 84, 64, 16, 84, 16, 128, 252, 8, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 48, 195, 0, 12, 204, 0, 48, 3, 0, 0,

     
     // MONSTER (LEVEL 2 GHOST )
     // MOVE RIGHT
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 100, 0, 1, 169, 0, 1, 169, 0, 0, 32, 0, 1, 69, 0, 4, 84, 64, 16, 84, 16, 128, 252, 8, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 12, 48, 48, 48, 48, 192, 0, 12, 0, 0,

          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,

     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 100, 0, 1, 169, 0, 1, 169, 0, 0, 32, 0, 1, 69, 0, 4, 84, 64, 16, 84, 16, 128, 252, 8, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 48, 195, 0, 12, 204, 0, 48, 3, 0, 0,

     // MOVE UP
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 100, 0, 1, 169, 0, 1, 169, 0, 0, 32, 0, 1, 69, 0, 4, 84, 64, 16, 84, 16, 128, 252, 8, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 12, 48, 48, 48, 48, 192, 0, 12, 0, 0,

          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,

	  // GHOST DOWN 57
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 100, 0, 1, 169, 0, 1, 169, 0, 0, 32, 0, 1, 69, 0, 4, 84, 64, 16, 84, 16, 128, 252, 8, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 12, 48, 48, 48, 48, 192, 0, 12, 0, 0,

          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,
          0, 0, 0, 0,   0, 0, 0, 0,


	  // ATTACK L & R 
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 16, 32, 16, 100, 16, 17, 169, 16, 17, 169, 16, 16, 32, 16, 5, 69, 64, 0, 84, 0, 0, 84, 0, 0, 252, 0, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 48, 195, 0, 12, 204, 0, 48, 3, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 16, 32, 16, 100, 16, 17, 169, 16, 17, 169, 16, 16, 32, 16, 5, 69, 64, 0, 84, 0, 0, 84, 0, 0, 252, 0, 1, 85, 0, 5, 85, 64, 5, 85, 64, 21, 85, 80, 0, 0, 0, 48, 192, 192, 48, 195, 0, 12, 204, 0, 48, 3, 0, 0,
	  
  
  // TREASURE 61
  96, 0, 0, 240, 48, 0, 240, 120, 0, 96, 120, 48, 0, 48, 120, 0, 0, 120, 12, 0, 48, 30, 48, 0, 30, 120, 0, 12, 120, 0, 0, 48, 96, 24, 0, 240, 60, 6, 240, 60, 15, 96, 24, 15, 0, 0, 6, 0, 0, 192, 0, 49, 227, 6, 121, 231, 143, 120, 199, 143, 48, 3, 6, 0,

  // HEALTHPACK 62
  63, 255, 252, 213, 85, 87, 213, 85, 87, 213, 85, 87, 213, 85, 87, 213, 105, 87, 213, 105, 87, 213, 105, 87, 213, 105, 87, 214, 170, 151, 214, 170, 151, 214, 170, 151, 213, 105, 87, 213, 105, 87, 213, 105, 87, 213, 105, 87, 213, 85, 87, 213, 85, 87, 213, 85, 87, 213, 85, 87, 63, 255, 252, 0,

  // THE ORB

  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 0, 6, 149, 160, 21, 101, 148, 45, 93, 124, 117, 90, 121, 107, 106, 149, 109, 106, 85, 122, 89, 117, 47, 235, 236, 42, 235, 184, 10, 235, 240, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,


  // the key (mono)
  48, 0, 0,72, 0, 0,135, 255, 128,133, 85, 0,72, 81, 0,49, 219, 128,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0, 0 };


  
  printf( "WRITING SPRITES2\n");
  setfilename( "SPRITES2,S,W" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkout( 3 );

  word writeaddr = spritedata;

  for( word i = 0x0000; i < 0x0840; i = i + 0x0001 )
    {
      fchrout( peek( writeaddr + i ) );
    }
  
  fclose(3);
  fclrchn();



  asmcomment( "LEVEL 2 WORLD" );

  // N E S W

  // 0 = nothing           9 =         
  // 1 = door             10 =
  // 2 = armour           11 = painting 2
  // 3 = torches          12 = Fleur-de-lis
  // 4 = window           13 = Shield
  // 6 = steal your face  14 = Chains
  // 7 = painting         15 = Closed Door
  // 8 = taken            17 = Shop

  // 18 = Objective
  // 19 = Cursed
  // 20 = Not Cursed
  
  // 1 - haven't visited yet (0x80)
  // 1 - monster is in room (0x40...)
  // 1 - treasure (0x20)
  // 1 - health pack (0x10)
  // 1 - key (0x08)
  // 1 - 
  // 1 - 
  // 1 - princess (0x01)
 data level2world =
    {
      // E  S  W       1  2     3  4  5    SD    BITS
      0, 2, 0, 4,      3, 11,0x0F, 7, 3,    0,   0x08,  // 1
      0, 3, 0, 1,      0, 4,    0, 2, 18,    0,   0x41, // 2
      0, 4, 0, 6,      0, 3,    3, 3, 0,    0,   0x40, // 3
      0, 1, 0, 3,      0, 0,    2, 0, 0,    0,   0x40, // 4

      0, 6, 0, 8,      3, 7, 0x0F,11, 3,    0,   0x00,  // 5
      0, 7, 0, 5,      0, 4,    2, 0, 0,    0,   0x40, // 6
      0, 8, 0, 6,      0, 3,    0, 3, 0,    0,   0x48, // 7
      0, 5, 0, 11,     0, 0,    2, 0, 0,    0,   0x40, // 8

      0, 2, 13, 12,    0, 11,0x0F, 7, 0,    3,   0x00,  // 9
      0, 11, 0, 9,     0, 2,    0, 4, 0,    0,   0x40, // 10
      0, 12, 0, 10,    3, 0,    3, 0, 3,    0,   0x40, // 11
     20, 9, 0, 11,     0, 0,    2, 0, 0,    0,   0x40, // 12

     9, 0, 0, 16,      12, 3, 0x01, 3, 12,    0,   0x40,  // 13
      0, 0, 18, 0,      14, 14,    14, 14, 14,    1, 0x41, // 14
      
      0, 14, 19, 0,      0, 0,    0, 0, 0,    0, 0x40, // 15
      0, 1, 0, 3,      0, 0,    0, 0, 0,    0,   0x40, // 16
      
      0, 0, 0, 20,     0, 0,    0, 0, 0,    0,   0xC0,  // 17
      14, 19, 0, 0,    2, 2, 0x0F, 2, 2,    0,   0x40, // 18
      15, 20, 0, 18,   0, 0,    0, 0, 0,    0,   0x40, // 19
      0, 17, 13, 19,   0, 0,    0, 0, 0,    0,   0x40, // 20

      // currently unused rooms
      0, 23, 0, 0, 2, 1, 2, 0, 0,   0,   0xD0, // 21
      0, 23, 0, 21, 2, 3, 2, 3, 2,   0,   0xE0, // 22
      0, 0, 0, 22,  3, 2, 3, 2, 3,   0,   0xFF // 23
    };


  printf("WRITING WORLD2 LAYOUT\n");
  setfilename( "WORLD2,S,W" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkout( 3 );

   writeaddr = level2world;

  for(  i = 0x0000; i < 0x00FD; i = i + 0x0001 )
    {
      fchrout( peek( writeaddr + i ) );
    }
  
  fclose(3);
  fclrchn();

  printf( "DONE WRITING.\nNOW VERIFYING\n" );

  status = 0x00;
  setfilename( "SPRITES2,S,R" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );

  poke( 0xD01C, fchrin() );
  poke( 0xD025, fchrin() );
  poke( 0xD026, fchrin() );
  for( uint general8bit = 0x00; general8bit < 0x08; inc( general8bit ))
    {
      spritecolour(general8bit, fchrin() );
    }
  word saddr = 0x3000;
  
  while( status == 0x00 )
    {    
      poke( saddr, fchrin() );
      saddr = saddr + 0x0001;
      status = peek( 0x0090 );
    }
  fclose(3);
  fclrchn();

  spriteset( 0xFF );
  spritexy( 0x00, 0x0040, 0x40 );
  spritexy( 0x01, 0x0040, 0x80 );
  spritexy( 0x02, 0x0080, 0x40 );
  spritexy( 0x03, 0x0080, 0x80 );
  spritexy( 0x04, 0x00C0, 0x40 );
  spritexy( 0x05, 0x00C0, 0x80 );
  spritexy( 0x06, 0x0100, 0x40 );
  spritexy( 0x07, 0x0100, 0x80 );
  
  poke( 2041, 192 );
  poke( 2042, 209 );
  poke( 2043, 221 );
  poke( 2044, 222 );
  poke( 2045, 223 );
  poke( 2046, 224 );
  poke( 2047, 225 );
  poke( 2040, 226 );
  printf( "DONE.\n" );
  return;
}
