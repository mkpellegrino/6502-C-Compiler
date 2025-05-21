void main()
{
  uint general8bit = NULL;
  uint userinput = ' ';
  uint filestatus = NULL;
  data renameText = { "R0:HAROLD=MYFILE" };
  data copyText = { "C0:MAUDE=HAROLD" };
  data deleteText0 = { "S0:MYFILE" };
  data deleteText1 = { "S0:HAROLD" };
  
  data text0 = { "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG." };

  data menu0 = { "1) CREATE FILE (MYFILE)\n" };
  data menu1 = { "2) DELETE FILES (MYFILE & HAROLD)\n" };
  data menu2 = { "3) DISPLAY FILE (MYFILE)\n" };
  data menu3 = { "4) COPY FILE (HAROLD -> MAUDE)\n" };
  data menu4 = { "5) RENAME FILE (MYFILE -> HAROLD)\n" };
  data menu5 = { "6) VALIDATE DISK\n" };
  data menu6 = { "7) READ DISK STATUS\n" };
  data menu7 = { "8) FORMAT DISK\n" };
  data menu8 = { "9) DISPLAY DIRECTORY\n" };
  data menu9 = { "0) INITIALISE DRIVE\n" };
  data menuQ = { "Q) EXIT\n" };

  while( userinput != 'Q' )
    {
      if( userinput == '0' )
	{
	  initdrive();
	}

      if( userinput == '1' )
	{
	  createfile();
	}
      if( userinput == '2' )
	{
	  deletefile();
	}
      if( userinput == '3' )
	{
	  displayfile();
	}
      if( userinput == '4' )
	{
	  copyfile();
	}
      if( userinput == '5' )
	{
	  renamefile();
	}
      if( userinput == '6' )
	{
	  validate();
	}
      if( userinput == '7' )
	{
	  derror();
	}
      if( userinput == '8' )
	{
	  format();

	}
      if( userinput == '9' )
	{
	  directory();
	}

      //derror();
      
      closeall();
      
      menu();

      getuserinput();
      prchar( 0x0D );
      prchar( 0x0D );
    }
  return;
}

void displayfile()
{
  asmcomment( "setfilename( ''MYFILE,S,R'' );" );  
  setfilename( "MYFILE,S,R" );
  asmcomment( "setlfs(3,8,3);" );
  setlfs( 0x03, 0x08, 0x03 );
  asmcomment( "fopen()" );
  fopen();
  asmcomment( "fchkin(1);" );
  fchkin( 0x03 );
  asmcomment( "read and display file" );
  
  filestatus = peek( 0x90 );
  while( filestatus == 0x00 )
    {
      prchar( fchrin() );
      filestatus = peek( 0x90 );
    }
  prchar( 0x0D );
  asmcomment( "fclrchn();" );
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(1);" );
  fclose(1);
  return;
}

void initdrive()
{
  setfilename( "I0" );
  setlfs( 1,8,15 );
  fopen();
  fclrchn();
  derror();
  fclose(1);
  return;
}

void copyfile()
{
  setlfs( 0x0F, 0x08, 0x0F );
  fopen();  
  fchkout( 0x0F );
  writeuntil0( copyText );
  fclrchn();
  derror();
  fclose( 0x0F );
  fclrchn();
  return;
}

void renamefile()
{
  asmcomment( "setlfs(15,8,15);" );
  setlfs( 0x0F, 0x08, 0x0F );
  asmcomment( "fopen()" );
  fopen();
  asmcomment( "fchkout(15);" );
  fchkout( 0x0F );
  asmcomment( "send the string to the device" );
  writeuntil0( renameText );
  asmcomment( "fclrchn();");
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(15);" );
  fclose( 0x0F );
  return;
}

void deletefile()
{
  asmcomment( "setlfs(15,8,15);" );
  setlfs( 0x0F, 0x08, 0x0F );
  asmcomment( "fopen()" );
  fopen();
  asmcomment( "fchkout(15);" );
  fchkout( 0x0F );
  asmcomment( "send the string to the device" );
  writeuntil0( deleteText0 );
  asmcomment( "fclrchn();");
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(15);" );
  fclose( 0x0F );

  asmcomment( "do it again with" );
  asmcomment( "the other string" );
  setlfs( 0x0F, 0x08, 0x0F );
  fopen();  
  fchkout( 0x0F );
  writeuntil0( deleteText1 );
  fclrchn();
  derror();
  fclose( 0x0F );
  return;
}

void createfile()
{
  asmcomment( "setfilename( ''0:MYFILE,S,W'' );" );
  setfilename( "0:MYFILE,S,W" );
  asmcomment( "setlfs( 1, 8, 2 );" );
  setlfs( 0x01, 0x08, 0x02 );
  asmcomment( "fopen();" );
  fopen();
  asmcomment( "fchkout(1);" );
  fchkout( 0x01 );
  asmcomment( "write the data from the file" );
  word writeaddr = text0;
  general8bit = peek(writeaddr);
  while( general8bit != 0 )
    {
      fchrout( general8bit );
      inc( writeaddr );
      general8bit = peek(writeaddr);
    }
  asmcomment( "fclrchn();" );
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(1);" );
  fclose( 0x01 );  
  return;
}

void derror()
{
  poke( 0x90, 0x00 );
  poke( 0xBA, 0x08 );
  jsr( 0xFFB4 );
  poke( 0xB9, 0x6F );
  jsr( 0xFF96 );
  
  inline( "!:", 0 );
  inline( "ldy $90", 2 );
  inline( "bne !+", 2 );
  jsr( 0xFFA5 );
  jsr( 0xFFD2 );
  inline( "cmp #$0D", 2 );
  inline( "bne !-", 2 );
  inline( "!:", 0 );
  jsr( 0xFFAB );
  prchar( 0x0D );
  return;
}

void directory()
{
  setlfs(0x02, 0x08, 0x00);
  setfilename( "$" );
  fopen();
  fchkin(2);
  uint bytesread = 0x00; 
  
  filestatus = 0x00;

  // skip 1st 2 bytes
  uint b = fchrin();
  b = fchrin();

  while( filestatus == 0x00 )
    {
      // skip 2 bytes of each line
      b = fchrin();
      b = fchrin();
      filestatus = peek( 0x90 );
      
      if( filestatus == 0x00 )
	{
	  // read line #
	  uint lnL = fchrin();
	  uint lnH = fchrin();
	  // convert to an actual line number
	  word ln = lnL + lnH * 256;
	}
      filestatus = peek( 0x90 );
      if( filestatus == 0x00 )
	{
	  printf( ln );
	  prchar( 0x20 );
	  readuntil0();
	}

      prchar( 0x0D );
      
      filestatus = peek( 0x90 );
    }
  fclrchn();
  derror();
  fclose(2);
  
  return;
}

void prchar( uint prcharARG0 )
{
  lda( prcharARG0 );
  jsr( 0xFFD2 );
  return;
}

void format()
{
  setlfs( 0x01, 0x08, 0x0F );
  setfilename( "NEW:BLANK DISK,60" );
  fopen();
  fclrchn();
  derror();
  fclose(1);
  return;
}

void closeall()
{
  inline( "ldx #$0F", 2 );
  inline( "!:", 0 );
  inline( "txa", 1 );
  inline( "jsr $FFC3", 3 );
  inline( "dex",1 );
  inline( "beq !-", 2 );
  inline( "jsr $FFCC", 3 );
  return;  
}

void writeuntil0( word writeuntil0ARG0 )
{
  general8bit = peek(writeuntil0ARG0);
  while( general8bit != 0 )
    {
      fchrout( general8bit );
      inc( writeuntil0ARG0 );
      general8bit = peek(writeuntil0ARG0);
    }

  return;
}

void readuntil0()
{
  uint keepreading = 0x01;
  filestatus = peek( 0x90 );
  general8bit = 0x00;
  while( keepreading == 0x01 )
    {
      general8bit = fchrin();      
      filestatus = peek( 0x90 );
      
      if( filestatus != 0x00 || general8bit == 0x00 )
	{
	  dec( keepreading );
	}
      else
	{
	  prchar( general8bit );
	  //lda( general8bit );
	  //jsr( 0xFFD2 );
	}
    }
  return;
}

void validate()
{
  setlfs( 1, 8, 15 );
  setfilename( "V0" );
  fopen();
  fclrchn();
  derror();
  fclose(1);
  return;
}

void getuserinput()
{
  poke( 0xC6, 0x00 );
  userinput = 0x00;
  while( userinput == 0x00 )
    {
      userinput = getchar();
    }
  return;
}

void menu()
{
  prints( menu0 );
  prints( menu1 );
  prints( menu2 );
  prints( menu3 );
  prints( menu4 );
  prints( menu5 );
  prints( menu6 );
  prints( menu7 );
  prints( menu8 );
  prints( menu9 );
  prints( menuQ );

  return;
}
