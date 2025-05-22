void main()
{
  uint general8bit = NULL;
  uint userinput = ' ';
  uint filestatus = NULL;
  uint bytesread = NULL;
  uint lnL = NULL;
  uint lnH = NULL;
  word ln = NULL;
  uint proceed = NULL;
  data renameText = { "R0:HAROLD=MYFILE" };
  data copyText = { "C0:MAUDE=HAROLD" };
  data deleteText0 = { "S0:MYFILE" };
  data deleteText1 = { "S0:HAROLD" };
  
  data text0 = { "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG." };

  data menu0 = { "1) CREATE FILE      (MYFILE)\n" };
  data menu1 = { "2) DELETE FILES     (MYFILE & HAROLD)\n" };
  data menu2 = { "3) DISPLAY FILE     (MYFILE)\n" };
  data menu3 = { "4) COPY FILE        (HAROLD -> MAUDE)\n" };
  data menu4 = { "5) RENAME FILE      (MYFILE -> HAROLD)\n" };
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

      asmcomment( "close all channels" );
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
  asmcomment( "setfilename( ''MYFILE'' );" );  
  setfilename( "MYFILE" );
  asmcomment( "setlfs(3,8,3);" );
  setlfs( 0x03, 0x08, 0x03 );
  asmcomment( "fopen()" );
  fopen();
  asmcomment( "fchkin(3);" );
  fchkin( 0x03 );
  asmcomment( "read and display file" );

  general8bit = fchrin();
  filestatus = peek( 0x90 );
  while( filestatus == 0x00 )
    {
      prchar( general8bit );
      general8bit = fchrin();
      filestatus = peek( 0x90 );
    }
  
  prchar( 0x0D );
  asmcomment( "fclrchn();" );
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(3);" );
  fclose(3);
  return;
}

void initdrive()
{
  asmcomment( "for a command like this, filename" );
  asmcomment( "IS the command (I0 for INITIALISE" );
  setfilename( "I0" );
  asmcomment( "setlfs(1,8,15);" );
  setlfs( 1,8,15 );
  asmcomment( "fopen();" );
  fopen();
  asmcomment( "fclrchn();");
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(1);" );
  fclose(1);
  return;
}

void copyfile()
{
  asmcomment( "for a command like this, filename" );
  asmcomment( "should NOT be set... so set it with zeroes" );
  clearfilename();
  asmcomment( "setlfs(15,8,15);" );
  setlfs( 0x0F, 0x08, 0x0F );
  asmcomment( "fopen();" );
  fopen();
  asmcomment( "fchkout(15);" );
  fchkout( 0x0F );
  asmcomment( "send the string to the device" );
  writeuntil0( copyText );
  asmcomment( "fclrchn();");
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(15);" );
  fclose( 0x0F );
  //fclrchn();
  return;
}

void renamefile()
{
  asmcomment( "for a command like this, filename" );
  asmcomment( "should NOT be set... so set it with zeroes" );
  clearfilename();
  asmcomment( "setlfs(15,8,15);" );
  setlfs( 0x0F, 0x08, 0x0F );
  asmcomment( "fopen();" );
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

void clearfilename()
{
  asmcomment( "clear filename" );
  inline( "lax #$00", 2 );
  inline( "tay", 1 );
  inline( "jsr $FDF9", 3 );
  return;
}

void deletefile()
{
  asmcomment( "for a command like this, filename" );
  asmcomment( "should NOT be set... so set it with zeroes" );
  clearfilename();
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

  asmcomment( "do it all again with" );
  asmcomment( "the other string" );
  asmcomment( "vvvvvvvvvvvvvvvv" );
  setlfs( 0x0F, 0x08, 0x0F );
  fopen();  
  fchkout( 0x0F );
  writeuntil0( deleteText1 );
  fclrchn();
  derror();
  fclose( 0x0F );
  asmcomment( "^^^^^^^^^^^^^^^^" );
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
  asmcomment( "Send TALK command to serial bus" );
  poke( 0x90, 0x00 );
  poke( 0xBA, 0x08 );
  jsr( 0xFFB4 );
  asmcomment( "Send TALK secondary address to serial bus" );
  poke( 0xB9, 0x6F );
  jsr( 0xFF96 );
  
  inline( "!:", 0 );
  inline( "ldy $90", 2 );
  inline( "bne !+", 2 );
  asmcomment( "Read byte from serial bus" );
  jsr( 0xFFA5 );
  jsr( 0xFFD2 );
  inline( "cmp #$0D", 2 );
  inline( "bne !-", 2 );
  inline( "!:", 0 );
  asmcomment( "Send UNTALK command to serial bus" );
  jsr( 0xFFAB );
  prchar( 0x0D );
  return;
}

void directory()
{
  asmcomment( "zero out the # of bytes read and filestatus" );
  bytesread = 0x00; 
  filestatus = 0x00;

  asmcomment( "setlfs(2,8,0);" );
  setlfs(0x02, 0x08, 0x00);
  asmcomment( "set the filename to '$' for" );
  asmcomment( "directory" );
  setfilename( "$" );
  asmcomment( "fopen();" );
  fopen();

  asmcomment( "fchkin(2);" );
  fchkin(2);
  
  // skip 1st 2 bytes
  asmcomment( "OPTIMISE general8bit OUT" );

  asmcomment( "skip first 2 bytes" );
  general8bit = fchrin();
  general8bit = fchrin();

  
  while( filestatus == 0x00 )
    {
      asmcomment( "also skip 2 bytes of each" );
      asmcomment( "line in the directory" );
      general8bit = fchrin();
      general8bit = fchrin();

      asmcomment( "get filestatus" );
      filestatus = peek( 0x90 );
      
      if( filestatus == 0x00 )
	{
	  asmcomment( "read the low and high bytes" );
	  asmcomment( "of the line number" );
	  lnL = fchrin();
	  lnH = fchrin();
	  asmcomment( "put them together to form the" );
	  asmcomment( "actual line number" );
	  ln = lnL + lnH * 256;
	}

      asmcomment( "get filestatus" );
      filestatus = peek( 0x90 );
      if( filestatus == 0x00 )
	{
	  asmcomment( "display the line #" );
	  printf( ln );
	  asmcomment( "display a space" );
	  prchar( 0x20 );
	  asmcomment( "read and display the" );
	  asmcomment( "zero-terminated line" );
	  readuntil0();
	}

      asmcomment( "display a newline" );
      prchar( 0x0D );

      asmcomment( "get the filestatus (again)" );
      filestatus = peek( 0x90 );
      asmcomment( "get next line of directory" );
    }

  asmcomment( "fclrchn();" );
  fclrchn();
  asmcomment( "read the error string" );
  derror();
  asmcomment( "fclose(2);" );
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

  asmcomment( "setlfs(1,8,15);" );
  setlfs( 0x01, 0x08, 0x0F );
  asmcomment( "setfilename( ''NEW:BLANK DISK,60''" );
  setfilename( "NEW:BLANK DISK,60" );
  asmcomment( "fopen();" );
  fopen();
  asmcomment( "fclrchn();" );
  fclrchn();
  asmcomment( "derror();" );
  derror();
  asmcomment( "fclose(1);" );
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
  general8bit = fchrin();
  filestatus = peek( 0x90 );
  while( filestatus == 0x00 )
    {
      prchar( general8bit );      
      general8bit = fchrin();
      filestatus = peek( 0x90 );
      if( general8bit == 0x00 )
	{
	  filestatus = 0x01;
	}
    }
  return;
}

void validate()
{
  asmcomment( "setlfs( 1, 8, 15 );" );
  setlfs( 1, 8, 15 );
  asmcomment( "setfilename( ''V0'' );" );
  setfilename( "V0" );
  asmcomment( "fopen();" );
  fopen();
  asmcomment( "fclrchn();" );
  fclrchn();
  asmcomment( "derror();" );
  derror();
  asmcomment( "fclose(1);" );
  fclose(1);
  return;
}

void getuserinput()
{
  asmcomment( "zero out keyboard buffer" );
  poke( 0xC6, 0x00 );
  userinput = 0x00;
  asmcomment( "call getchar() repeatedly until" );
  asmcomment( "it returns something other than 0" );
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
