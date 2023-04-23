void main()
{
  uint general8bit = 0x00;
  uint randomNumber;

  word tally = 0x0000;
  
  // seed the random number generator
  // generate random numbers until the
  // use presses a key
  seed();
  printf( "SEEDING RANDOM NUMBER GENERATOR\nPRESS A KEY\n" );
  while( general8bit == 0 )
    {
      randomNumber=rnd(1);
      general8bit = getchar();
    }

  for( word i = 0x0000; i < 400; inc(i) )
    {
      tally = tally + rand(100);
      
      //printf( rand( 100 ) );
      //sp();
    }

  //word x = 400;
  tally = tally / 400;

  printf( tally );
  cr();
  return;
}

uint rand( uint rNarg )
{
  uint rNret = NULL;

  float f0 = tofloat( rnd() );
  f0 = f0 / 255.0;

  float f1 = tofloat( rNarg );
  f0 = f1 * f0;
  rNret = touint( f0);

  return rNret;
}
