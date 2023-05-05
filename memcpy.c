void main()
{
  cls();

  uint l = 0;
  for( word top = 0x0400; top < 0x040A; top = top + 1 )
    {
      poke( top, l );
      inc(l);
    }

  cursorxy( 10, 10 );
  
  printf( "PRESS KEY TO MEMCPY L->R" );
  pause();

  memcpy( 0x0401, 0x0451, 0x08 );
  

  return;
}
