void main()
{
  data world =
    {
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
      12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
      0, 4, 7, 2,   0, 0, 6, 0, 0,   2,   0xD0,
      0, 0, 8, 3,   2, 3, 2, 3, 3,   5,   0xF0,
      0, 6, 9, 0,   3, 2, 3, 2, 2,   3,   0xF0,
      0, 0, 10, 5,  2, 2, 3, 3, 2,   1,   0xE0,
      3, 8, 11, 0,  3, 1, 2, 3, 4,   5,   0xC0,
      4, 0, 12, 7,  3, 0, 3, 0, 1,   2,   0xE0,
      5, 0, 13, 0,  2, 2, 1, 2, 2,   5,   0xC0,
      6, 11, 0, 0,  1, 3, 3, 2, 3,   0,   0xE0,
      7, 0, 0, 10,  0, 3, 0, 3, 1,   0,   0xA0,
      8, 0, 0, 0,   2, 1, 2, 3, 3,   0,   0xA0,
      9, 0, 17, 0,  3, 3, 3, 2, 1,   1,   0xA0,
      0, 15, 0, 0,  2, 2, 2, 2, 3,   0,   0xA0,
      0, 16, 19, 14,3, 3, 3, 3, 2,   4,   0xA0,
      0, 0, 20, 15, 2, 3, 3, 2, 3,   3,   0xA0,
      13, 18, 0, 0, 1, 3, 2, 2, 3,   0,   0xA0,
      0, 19, 21, 17,2, 2, 4, 4, 3,   2,   0xA0,
      15, 0, 0, 18, 2, 2, 2, 1, 3,   0,   0xA0,
      16, 0, 0, 0,  3, 2, 1, 3, 2,   0,   0xA0,
      18, 23, 0, 0, 2, 1, 2, 0, 0,   0,   0xA0,
      0, 23, 0, 21, 2, 3, 2, 3, 2,   0,   0x80,
      0, 0, 0, 22,  3, 2, 3, 2, 3,   0,   0x80,
      0, 0, 0, 22,  3, 2, 3, 2, 3,   0,   0x80
    };
  save( "WORLD,S,W", world, 264 );
  return;
}
