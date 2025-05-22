void main()
{
  uint general8bit = NULL;
  uint bytesread = 0x00; 
  uint filestatus = 0x00;
  uint lnL = NULL;
  uint lnH = NULL;
  word ln = NULL;
  setlfs(0x02, 0x08, 0x00);
  setfilename( "$" );
  fopen();
  fchkin(2);
  
  // skip 1st 2 bytes
  asmcomment( "OPTIMISE general8bit OUT" );
  asmcomment( "skip first 2 bytes" );
  general8bit = fchrin();
  general8bit = fchrin();
  
  while( filestatus == 0x00 )
    {
      asmcomment( "OPTIMISE general8bit OUT" );
      asmcomment( "also skip 2 bytes of each" );
      asmcomment( "line in the directory" );
      general8bit = fchrin();
      general8bit = fchrin();

      filestatus = peek( 0x90 );
      
      if( filestatus == 0x00 )
	{
	  lnL = fchrin();
	  lnH = fchrin();
	  ln = lnL + lnH * 256;
	}
      filestatus = peek( 0x90 );
      if( filestatus == 0x00 )
	{
	  printf( ln );
	  inline( "lda #$20", 2 );
	  inline( "jsr $FFD2", 3 );
	  general8bit = fchrin();
	  filestatus = peek( 0x90 );
	  while( filestatus == 0x00 )
	    {
	      inline( "lda general8bit", 2 );
	      inline( "jsr $FFD2", 3 );

	      general8bit = fchrin();
	      filestatus = peek( 0x90 );
	      if( general8bit == 0x00 )
		{
		  filestatus = 0x01;
		}
	    }
	}
      inline( "lda #$0D", 2 );
      inline( "jsr $FFD2", 3 );

      filestatus = peek( 0x90 );
    }
  fclrchn();
  // derror();
  fclose(2);
  return;
}
