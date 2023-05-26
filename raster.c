

void main()
{
  int bg = NULL;
  int bd = NULL;
  int newbd = NULL;
  irq( int1, 0x32, 1);

  return;
}

void int1()
{

  nop();
  nop();
  nop();
  nop();
  nop();
  nop();
  nop();
  bg = peek( 0xD021 );
  poke( 0xD021, 0x02 );

  bd = peek( 0xD020 );  
  poke( 0xD020, newbd );
  inc( newbd);

  irq( int2, 0x52, 0 );
  poke( 0xD019, 0xFF );
  jmp( 0xEA7E );
}

void int2()
{
  nop();
  nop();
  nop();
  nop();
  nop();
  nop();
  nop();
  poke( 0xD021, 0x01 );
  irq( int3, 0x72, 0 );
  poke( 0xD020, bd );

  poke( 0xD019, 0xFF );
  jmp( 0xEA7E );
}

void int3()
{
    nop();
  nop();
  nop();
  nop();
  nop();
  nop();
  nop();

  poke( 0xD021, bg );
  irq( int1, 0x32, 0 );

  poke( 0xD019, 0xFF );
  jmp( 0xEA31 );

}
