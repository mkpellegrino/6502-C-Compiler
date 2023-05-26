void main()
{
  uint g8bit = 0x00;
  uint rNumber;

  word tally = 0x0000;
  
  // seed the random number generator
  // generate random numbers until the
  // use presses a key
  seed();
  printf( "SEEDING RANDOM NUMBER GENERATOR\nPRESS A KEY\n" );
  while( g8bit == 0 )
    {
      rNumber=rnd(1);
      g8bit = getchar();
    }

  for( word i = 0x0000; i < 400; i=i+0x0001 )
    {
      tally = tally + rand(100);
    }

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
