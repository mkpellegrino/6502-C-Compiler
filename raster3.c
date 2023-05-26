void main()
{

  word f = ptr( int1 );
  uint g = 0x32;
  irq( ptr(int1), 0x32, 1 );
  printf( f );
  
  return;
}

void int1()
{

  uint x = peek( 0x00C5 );
  uint L = x & 0x0F;
  uint H = lsr(lsr(lsr(lsr(x) )));
  H = H & 0x0F;


  if( H < 0x0A )
    {
      H = H + 0x30;
    }
  else
    {
      H = H - 0x09;
    }
  
  if( L < 0x0A )
    {
      L = L + 0x30;
    }
  else
    {
      L = L - 0x09;
    }
  
  // $
  poke( 0x0400, 0x24 );
  poke( 0x0401, H );
  poke( 0x0402, L );
  
  
  // ack the int
  poke( 0xD019, 0x01 );

  // partially return control to the CPU
  //jmp( 0xEA7E );

  // return control to the CPU
  jmp( 0xEA31 );
  return;
}

void turnoff()
{
  //  irq( int1, 0x00, -1 );
  irq( int1, 0x32, 255 );
  irq( 0xEA31, 0x32, 255 );
  return;
}

