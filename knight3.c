int main()
{

  saveregs();
  poke( 0xD021, 5 );
  // directions
  //   0
  // 3   1
  //   2
  
  uint direction = 0;
  uint prevdirection = 0;
  uint currentupframe = 0;
  uint currentdownframe = 0;

  uint currentleftframe = 0;
  uint currentrightframe = 0;

  word clock = 0x0000;
  word playerx = 0x0040;
  uint playery = 0x40;


  //word plotshapeAddr;
  // Blue and Red
  uint plotshapeColourValue1001;
  // White
  uint plotshapeColourValue11;
  //uint plotshapeX; 
  //uint plotshapeY;


  word general16bit;


  bank( 1 );

  // multicolour bitmap mode
  poke( 0xD011, 0x3B );
  poke( 0xD016, 0x18 );
  poke( 0xD018, 24 );
  //poke( 0xD018, 0x30 | peek(0xD018) );


  
  romout(6);
  
  //setscr_addr( 2 );
  
  word bmpaddr = getbmp_addr();
  word bmpaddrX = bmpaddr + 0x1FF8;
  word scraddr = getscr_addr();
  word scraddrX = scraddr + 0x03EF;

 
  word sprptr0 = scraddr + 0x03F8;

  
  mob standing = { 0, 1, 0, 136, 128, 192, 170, 128, 192, 149, 128, 192, 153, 128, 192, 170, 128, 192, 42, 0, 48, 42, 0, 48, 8, 0, 48, 85, 64, 37, 123, 80, 48, 110, 68, 12, 25, 4, 12, 29, 4, 12, 25, 144, 12, 21, 0, 12, 38, 0, 3, 34, 0, 3, 34, 0, 3, 34, 0, 3, 34, 0, 3, 81, 64 };
  mob walkingup0 = { 0, 2, 0, 136, 131, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 42, 3, 0, 42, 3, 0, 8, 3, 0, 85, 67, 1, 85, 86, 1, 85, 67, 1, 21, 3, 1, 21, 3, 1, 21, 3, 1, 21, 3, 2, 38, 3, 0, 34, 3, 0, 34, 3, 0, 32, 3, 0, 32, 3, 0, 16, 3}; 
  mob walkingup1 = { 0, 3, 0, 136, 128, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 42, 3, 0, 42, 3, 0, 8, 3, 0, 85, 67, 1, 85, 86, 1, 85, 67, 1, 21, 3, 1, 21, 3, 2, 21, 3, 0, 21, 3, 0, 38, 3, 0, 34, 3, 0, 34, 3, 0, 34, 3, 0, 32, 0, 0, 16, 0}; 


  mob walkingup2 = { 0, 4, 0, 0, 0, 0, 136, 128, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 42, 3, 0, 42, 3, 0, 8, 3, 0, 85, 67, 1, 85, 86, 1, 85, 67, 1, 21, 3, 0, 21, 3, 0, 21, 3, 0, 21, 3, 0, 38, 3, 0, 34, 3, 0, 2, 3, 0, 2, 0, 0, 2, 0, 0, 1, 0}; 
  mob walkingup3 = { 0, 5, 0, 0, 0, 0, 136, 128, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 42, 3, 0, 42, 3, 0, 8, 3, 0, 85, 67, 1, 85, 86, 1, 85, 67, 1, 21, 3, 1, 21, 3, 2, 21, 3, 0, 21, 3, 0, 38, 3, 0, 34, 3, 0, 34, 3, 0, 34, 0, 0, 2, 0, 0, 1, 0}; 


  mob walkingup4 = { 0, 6, 0, 136, 128, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 170, 131, 0, 42, 3, 0, 42, 3, 0, 8, 3, 0, 85, 67, 1, 85, 86, 1, 85, 67, 1, 21, 3, 1, 21, 3, 1, 21, 3, 1, 21, 3, 2, 38, 3, 0, 34, 3, 0, 34, 3, 0, 34, 3, 0, 34, 3, 0, 1, 0}; 
  mob walkingdown0 = { 0, 7, 48, 136, 128, 48, 170, 128, 48, 149, 128, 48, 153, 128, 48, 170, 128, 48, 42, 0, 48, 42, 0, 48, 8, 0, 48, 85, 64, 37, 123, 80, 48, 110, 80, 48, 25, 16, 48, 29, 16, 48, 25, 16, 48, 21, 16, 48, 38, 32, 48, 34, 0, 48, 34, 0, 48, 2, 0, 48, 2, 0, 48, 1, 0}; 
  mob walkingdown1 = { 0, 8, 0, 136, 128, 48, 170, 128, 48, 149, 128, 48, 153, 128, 48, 170, 128, 48, 42, 0, 48, 42, 0, 48, 8, 0, 48, 85, 64, 37, 123, 80, 48, 110, 80, 48, 25, 16, 48, 29, 16, 48, 25, 32, 48, 21, 0, 48, 38, 0, 48, 34, 0, 48, 34, 0, 48, 34, 0, 0, 2, 0, 0, 1, 0}; 
  mob walkingdown2 = { 0, 9, 0, 0, 0, 0, 136, 128, 48, 170, 128, 48, 149, 128, 48, 153, 128, 48, 42, 0, 48, 42, 0, 48, 8, 0, 48, 85, 64, 37, 123, 80, 48, 110, 80, 48, 25, 16, 48, 29, 0, 48, 25, 0, 48, 21, 0, 48, 38, 0, 48, 34, 0, 48, 32, 0, 0, 32, 0, 0, 32, 0, 0, 16, 0}; 
  mob walkingdown3 = { 0, 10, 0, 0, 0, 0, 136, 128, 48, 170, 128, 48, 149, 128, 48, 153, 128, 48, 42, 0, 48, 42, 0, 48, 8, 0, 48, 85, 64, 37, 123, 80, 48, 110, 80, 48, 25, 16, 48, 29, 16, 48, 25, 32, 48, 21, 0, 48, 38, 0, 48, 34, 0, 48, 34, 0, 0, 34, 0, 0, 32, 0, 0, 16, 0}; 
  mob walkingdown4 = { 0, 11, 0, 136, 128, 48, 170, 128, 48, 149, 128, 48, 153, 128, 48, 170, 128, 48, 42, 0, 48, 42, 0, 48, 8, 0, 48, 85, 64, 37, 123, 80, 48, 110, 80, 48, 25, 16, 48, 29, 16, 48, 25, 16, 48, 21, 16, 48, 38, 32, 48, 34, 0, 48, 34, 0, 48, 34, 0, 48, 32, 0, 0, 16, 0};


  mob left0 = {0, 12, 0, 136, 0, 0, 168, 0, 0, 104, 0, 0, 168, 0, 0, 168, 0, 192, 40, 0, 192, 160, 0, 192, 16, 0, 48, 84, 0, 48, 84, 0, 50, 100, 0, 8, 88, 0, 12, 86, 0, 12, 84, 128, 12, 84, 0, 3, 96, 0, 3, 104, 0, 3, 72, 0, 1, 74, 0, 5, 194, 0, 1, 200, 0};
  mob left1 = {0, 13, 0, 0, 0, 0, 136, 0, 0, 168, 0, 0, 104, 0, 0, 168, 0, 0, 168, 0, 0, 40, 0, 0, 160, 0, 12, 84, 0, 12, 100, 0, 3, 100, 0, 3, 100, 0, 0, 100, 0, 0, 148, 0, 2, 84, 0, 0, 112, 0, 0, 108, 0, 0, 108, 0, 0, 75, 0, 1, 11, 0, 5, 40, 192};
  mob left2 = {0, 14, 0, 136, 0, 0, 168, 0, 0, 104, 0, 0, 168, 0, 0, 168, 0, 0, 40, 0, 0, 160, 0, 0, 16, 0, 0, 84, 0, 0, 84, 0, 0, 100, 0, 2, 148, 3, 8, 86, 60, 0, 87, 128, 0, 84, 0, 3, 224, 0, 0, 164, 0, 0, 132, 0, 2, 133, 0, 10, 1, 0, 2, 4, 0};
  

  mob right0 = {0, 15, 0, 34, 0, 0, 42, 0, 0, 41, 0, 0, 42, 48, 0, 42, 48, 0, 40, 48, 0, 10, 48, 0, 4, 32, 0, 21, 176, 0, 22, 12, 0, 25, 12, 0, 21, 12, 0, 149, 12, 2, 21, 12, 0, 21, 12, 0, 8, 3, 0, 26, 3, 0, 18, 3, 0, 82, 131, 0, 64, 163, 0, 16, 131};
  mob right1 = {0, 50, 0, 0, 0, 0, 34, 0, 0, 42, 0, 0, 41, 0, 0, 42, 0, 0, 42, 0, 0, 40, 0, 0, 10, 0, 0, 21, 48, 0, 25, 48, 0, 25, 192, 0, 25, 192, 0, 27, 0, 0, 22, 0, 0, 29, 0, 0, 13, 0, 0, 57, 0, 0, 57, 0, 0, 225, 0, 0, 224, 64, 3, 40, 80};
  mob right2 = {0, 51, 0, 34, 0, 0, 42, 0, 0, 41, 0, 0, 42, 0, 0, 42, 0, 0, 40, 0, 0, 10, 0, 0, 4, 0, 0, 21, 0, 0, 21, 0, 0, 25, 128, 192, 37, 32, 60, 149, 0, 2, 213, 0, 0, 61, 0, 0, 11, 192, 0, 41, 0, 0, 33, 0, 0, 161, 64, 0, 128, 80, 0, 32, 64};
 

  mob attackr = { 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 34, 0, 0, 42, 0, 0, 41, 0, 0, 42, 0, 0, 40, 0, 0, 10, 0, 0, 20, 47, 0, 107, 224, 63, 246, 128, 9, 21, 0, 0, 21, 0, 0, 21, 0, 0, 26, 0, 0, 18, 0, 0, 18, 0, 0, 64, 128, 0, 64, 128, 0, 80, 160}; 
  mob attackl = { 0, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 0, 0, 168, 0, 0, 104, 0, 0, 168, 0, 0, 40, 0, 0, 160, 0, 224, 20, 0, 11, 104, 0, 2, 86, 252, 0, 84, 160, 0, 84, 0, 0, 84, 0, 0, 84, 0, 0, 132, 0, 0, 132, 0, 2, 1, 0, 2, 1, 0, 10, 5, 0}; 


  // multicolour for sprite 0
  poke( 0xD01C, 0x01 );

  
  
  // colours for all sprites (dark grey)
  poke( 0xD025, 0x0B );

  // Brown for all sprites
  poke( 0xD026, 0x09 );

  // black for sprite 0
  spritecolour( 0x00, 0x00 );

  //spritecolour( 0, 15 );
  spriteset( 0x01 );

  positionKnight();

  uint walkupframe[8];
  walkupframe[0] = walkingup0;
  walkupframe[1] = walkingup1;
  walkupframe[2] = walkingup2;
  walkupframe[3] = walkingup3;
  walkupframe[4] = walkingup4;
  walkupframe[5] = walkingup3;
  walkupframe[6] = walkingup2;
  walkupframe[7] = walkingup1;

  uint walkdownframe[8];
  walkdownframe[0] = walkingdown0;
  walkdownframe[1] = walkingdown1;
  walkdownframe[2] = walkingdown2;
  walkdownframe[3] = walkingdown3;
  walkdownframe[4] = walkingdown4;
  walkdownframe[5] = walkingdown3;
  walkdownframe[6] = walkingdown2;
  walkdownframe[7] = walkingdown1;

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
 
  clearhires();

  // create scenery
  putStuffOnTheScreen();

  
  uint c = getin();

  while( c != 62 )
    {
      if( clock == 0x0000 )
	{
	  if(  mobbkgcollision(1) > 0 )
	    {
	      inc( 0xD020 );
	    }
	  
	  if( c == 30 )
	    {
	      // left
	      direction = 3;
	      prevdirection = 3;
	      if( playerx > 0x0017 )
		{
		  playerx = playerx - 0x0003;
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
		    }
		  direction = 1;
		}
	      else
		{
		  if( c == 33 )
		    {
		      // up
		      direction = 0;
		      if( playery > 51 )
			{
			  dec(playery);
			  dec(playery);
			  dec(playery);
			}
		    }
		  else
		    {
		      if( c == 37 )
			{
			  // down
			  direction = 2;
			  if( playery < 229 )
			    {
			      inc( playery );
			      inc( playery );
			      inc( playery );
			    }
			}
		      else
			{
			  if( c == 60 )
			    {
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
			      // standing
			      direction = 5;
			    }
			}
		    }
		}
	    }
	}
      animate();
      c = getin();
    }

  uint sm = peek( 0xD018 );
  sm = sm / 16;
  

  //spriteset( 0 );
  clearkb();
  spriteset(0x00);
  romin();
  bank(0);
  setscr_addr( 1 );

  restoreregs();

  printf( standing );
  return;
}


void animate()
{
  // later on, when the memory bank configuration is finalised,
  // use the immediate value of sprptr0 (which is a WordID).
  // that will make the animate function execute a little bit faster.
  if( clock == 0x0000 )
    {
      if( direction == 0 )
	{
	  poke( sprptr0, walkupframe[currentupframe] );
	  inc(currentupframe);
	  currentupframe = currentupframe & 0x07;
	}
      if( direction == 1 )
	{
	  poke( sprptr0, walkrframe[currentrightframe] );
	  inc(currentrightframe);
	  currentrightframe = currentrightframe & 0x03;
	}
      if( direction == 2 )
	{
	  poke( sprptr0, walkdownframe[currentdownframe] );
	  inc(currentdownframe);
	  currentdownframe = currentdownframe & 0x07;
	}
      if( direction == 3 )
	{
	  poke( sprptr0, walklframe[currentleftframe] );
	  inc(currentleftframe);
	  currentleftframe = currentleftframe & 0x03;
	}
      if( direction == 5 )
	{
	  poke( sprptr0, standing );
	}
      if( direction == 6 )
	{
	  // attack left
	  poke( sprptr0, attackl );
	}
      if( direction == 7 )
	{
	  // attack right
	  poke( sprptr0, attackr );
	}
      positionKnight();
    }
  clock = clock + 0x0001;
  clock = clock & 0x01FF;
  return;
}

void clearhires()
{
  screen(0);
  // this is for the single colour (11) -- this is ALWAYS at 0xD800 - 0x3FF
  for( general16bit = 0xD800; general16bit < 0xDBFF; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, 0x06 );
    }
  
  for( general16bit = scraddr; general16bit < scraddrX; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, 0x26 );
    }

  for( general16bit = bmpaddr; general16bit < bmpaddrX; general16bit = general16bit + 0x0001 )
    {
      poke( general16bit, 0x00 );
    }
  screen(1);
  return;
}


void putTree( uint treeX, uint treeY )
{
  // top of tree
  data tree0 =
    {
      0, 3, 15, 63, 255, 255, 63, 15,
      255, 255, 255, 255, 255, 255, 255, 255,
      255, 255, 255, 255, 255, 255, 255, 255,
      0, 192, 240, 240, 240, 240, 192, 0
    };

  // middle of tree
  data tree1 =
    {
      3, 0, 0, 0, 0, 0, 0, 0,
      255, 255, 32, 40, 10, 10, 8, 8,
      252, 240, 160, 128, 0, 0, 0, 0
    };

  // trunk of tree
  data tree2 =
    {
      8, 32, 32, 32, 32, 40, 40, 170
    };

  // Tree
  //plotshapeAddr = tree0;
  //plotshapeSize = 4;
  plotshapeColourValue1001 = 0x09;
  plotshapeColourValue11 = 0x0D;
  //plotshapeX = treeX;
  //plotshapeY = treeY;
  plotshape(tree0, treeX, treeY, 4);
  
  //plotshapeAddr = tree1;
  //plotshapeSize = 3;
  //plotshapeX = treeX;
  //plotshapeY = treeY + 0x01;
  plotshape(tree1, treeX, treeY + 0x01, 3);

  //plotshapeAddr = tree2;
  //plotshapeSize = 1;
  //plotshapeX = treeX + 0x01;
  //plotshapeY = treeY + 0x02;
  plotshape(tree2, treeX + 0x01, treeY + 0x02, 1);

  return;
}


void putShape( word shapexy )
{
  word shapeX0 = shapexy & 0xFF00;
  uint shapeX = shapeX0 / 128;
  uint shapeY = shapexy & 0x00FF;

  // top of tree
  data wall0 =
    {
      42, 170, 170, 170, 170, 170, 170, 255,
      168, 171, 171, 171, 171, 171, 171, 255
    };

  data shape0 =
    {
      0, 3, 15, 63, 255, 255, 63, 15,
      255, 255, 255, 255, 255, 255, 255, 255,
      255, 255, 255, 255, 255, 255, 255, 255,
      0, 192, 240, 240, 240, 240, 192, 0
    };

  // middle of tree
  data shape1 =
    {
      3, 0, 0, 0, 0, 0, 0, 0,
      255, 255, 32, 40, 10, 10, 8, 8,
      252, 240, 160, 128, 0, 0, 0, 0
    };

  // trunk of tree
  data shape2 =
    {
      8, 32, 32, 32, 32, 40, 40, 170
    };

  // Tree
  //plotshapeAddr = shape0;
  //plotshapeSize = 4;
  plotshapeColourValue1001 = 0x09;
  plotshapeColourValue11 = 0x0D;
  //plotshapeX = shapeX;
  //plotshapeY = shapeY;
  plotshape(shape0, shapeX, shapeY, 4);
  
  //plotshapeAddr = shape1;
  //plotshapeSize = 3;
  //plotshapeX = shapeX;
  //plotshapeY = shapeY + 0x01;
  plotshape(shape1, shapeX, shapeY + 0x01, 3);

  //plotshapeAddr = shape2;
  //plotshapeSize = 1;
  //plotshapeX = shapeX + 0x01;
  //plotshapeY = shapeY + 0x02;
  plotshape(shape2, shapeX + 0x01, shapeY + 0x02, 1);

  return;
}



void putStuffOnTheScreen()
{
 data steal1 = {0, 0, 0, 1, 1, 7, 7, 23,     0, 63, 122, 234, 234, 170, 170, 170,     0, 252, 174, 151, 183, 181, 253, 245,    0, 0, 0, 128, 128, 224, 224, 232};
  data steal3 = {30, 30, 94, 94, 94, 94, 94, 94, 171, 171, 171, 171, 175, 191, 175, 191, 253, 245, 245, 245, 245, 213, 245, 213, 120, 122, 122, 122, 122, 122, 122, 122 };
  data steal5 = {95, 87, 87, 87, 87, 87, 23, 23, 175, 175, 173, 253, 213, 245, 255, 235, 85, 85, 85, 87, 87, 95, 255, 235, 250, 234, 234, 234, 234, 234, 232, 232 };
  data steal7 = {21, 5, 5, 1, 1, 0, 0, 0, 255, 255, 127, 95, 95, 95, 23, 0, 255, 255, 254, 250, 250, 250, 232, 0, 168, 160, 160, 128, 128, 0, 0, 0 };

  // steal your face  
  //plotshapeAddr = steal1;
  //plotshapeSize = 4;
  // Blue and Red
  plotshapeColourValue1001 = 0x62;
  // White
  plotshapeColourValue11 = 0x01;
  //plotshapeX = 18; 
  //plotshapeY = 0;
  plotshape(steal1, 18, 0, 4);
  
  //inc( plotshapeY );
  //plotshapeY = 1;
  //  plotshapeAddr = steal3;
  plotshape(steal3, 18, 1, 4);
  
  //inc( plotshapeY );
  //plotshapeY = 2;
  //plotshapeAddr = steal5;
  plotshape(steal5, 18, 2, 4);

  //inc( plotshapeY );
  //plotshapeY = 3;
  //plotshapeAddr = steal7;
  plotshape(steal7, 18, 3, 4);


  // BLOCKS
  // plotshapeAddr = wall0;
  //plotshapeSize = 2;
  // Blue and Red
  plotshapeColourValue1001 = 0x0C;
  // Black
  plotshapeColourValue11 = 0x0B;

  //plotshapeX = 20;
  for( uint myY = 5; myY < 10; inc(myY) )
    {
      for( uint myX = 20; myX < 30; inc(myX) )
	{
	  plotshape(wall0, myX, myY, 2);
	  inc(myX);
      	}
    }
  // plotshape();

  for( uint tmpI = 0x00; tmpI < 10; inc(tmpI) )
    {
      uint rndTreeX = rnd();
      while( rndTreeX > 40 )
	{
	  rndTreeX = rnd();
	}
      
      uint rndTreeY = rnd();
      while( rndTreeY > 20 )
	{
	  rndTreeY = rnd();
	}
      putTree( rndTreeX, rndTreeY );
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

void positionKnight()
{
  spritex( 0, playerx );
  spritey( 0, playery );
  return;
}

uint positSpr( word positSprX, uint positSprY )
{
  spritex( 0, positSprX );
  spritey( 0, positSprY );  

  return 1;
}
