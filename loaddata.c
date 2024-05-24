void main()
{
  //data filename = {'D','A','T','A',',','S',',','R',0x00};
  //data filename = {'R','A','S','T','E','R',',','P',',','R',0x00};
  uint Q = 0x00;
  uint ctr;
  uint status;
  uint line;
  uint LB;
  uint HB;

  word addr;
  uint buffer[32];
  uint buffer2[5];

  //word pBuffer=ptr(buffer[0]);

  printf( "ENTER FILENAME: " );
  scanf( buffer );
  dispByte( 0x0D );
  printf( "(P)ROGRAM OR (S)EQUENTIAL?: " );
  scanf( buffer2 );
  
  
  uint len = 0x00;
  for( uint i = 0; i < 32; i++ )
    {
      if( buffer[i] == 0x00 )
	{
	  len = i;
	}
    }

  buffer[len] = ',';
  inc( len );
  uint L = buffer2[0];
  buffer[len] = L;
  inc( len );
  buffer[len] = ',';
  inc(len);
  buffer[len] = 'R';
  inc(len);
  buffer[len] = 0x00;
  
 
  // setfilename( ptr(buffer) );
  setfilename( buffer );
  setlfs( 3, 8, 3 );
  fopen();
  fchkin( 3 );
  
  dispByte( 0x0D );
    
  if( L == 'P' )
    {
      printf( "*=$" );
      LB = fchrin();
      HB = fchrin();
      addr =  LB + HB*256;
      byte2hex( HB );
      byte2hex( LB );
      dispByte( 0x0D );
      status = peek( 0x0090 );
    }
  else
    {
      addr = 0x0000;
    }
  printAddr( addr );
  dispByte( ':' );
  dispByte( ' ' );
  status = 0x00;
  //for( uint i = 0; i < 179; inc(i) )
  while( status == 0x00 )
  {
      inc(ctr);
      uint in = fchrin();
      byte2hex(in);
      if( ctr == 0x0B )
	{
	  ctr=0x00;
	  dispByte( 0x0D );
	  
	  inc(line);
	  if( line == 0x15 )
	    {
	      line = 0x00;
	      pause();
	    }
	  
	  addr = addr + 0x000B;
	  printAddr( addr );
	  dispByte( ':' );
	  dispByte( ' ' );
	}
      else
	{
	  dispByte( ' ' );
	}
      status = peek( 0x0090 );
      if( Q == 1 )
	{
	  status = 1;
	}
  }
  
  fclose(3);
  fclrchn();
  poke( 198, 0 );
  jsr( 65508 );

  return;
}

void printAddr( word printAddrP0 )
{
  uint l = printAddrP0;
  uint h = printAddrP0 / 256;
  dispByte( 0x24 );
  byte2hex( h );
  byte2hex( l );
  return;
}

void dispByte( uint dispByteP0 )
{
  lda( dispByteP0 );
  jsr( 0xFFD2 );
  return;
}

void pause()
{
  uint c = getin();
  Q = 0x00;
  while( c == 0x40 )
    {
      c = getin();
      if( c == 62 )
	{
	  Q = 1;
	}
    }

  return;
}
