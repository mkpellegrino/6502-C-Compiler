void main()
{
  //irq( 0xFFD2, 0x31, -1 );
  uint rl = 0x15;
  irq( ptr(func1), asl(rl), 1 );
  return;
}

void func1()
{

  poke( 0xD021, 0x00 );

  
  irq( ptr(func2), 0x51, 0 );

  poke( 0xD019, 0x01 );
  jmp( 0xEA7E );
  return;
}

void func2()
{

  poke( 0xD021, 0x01 );

  irq( ptr(func1), rl, 0 );
  
  poke( 0xD019, 0x01 );
  jmp( 0xEA31 );
  return;
}
