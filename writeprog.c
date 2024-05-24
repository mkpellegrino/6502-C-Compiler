void main()
{
  word pc=0x0801;
  data program = { 0x01, 0x08, 0xFF, 0xFF, 0x0A, 0x00, 0x99, 0xAA };
  setfilename( "PROG,P,W" );
  setlfs( 3, 8, 3 );
  fopen();
  fchkout( 3 );
  fchrout( 0x01 ); // 0801
  fchrout( 0x08 ); // 0802

  // next line
  fchrout( 0x2F ); // 0801    <<---- points to line below
  fchrout( 0x08 ); // 0802

  // line 11
  fchrout( 0x0B ); // 0803
  fchrout( 0x00 ); // 0804

  // rem
  fchrout( 0x8F ); // 0805
  // embedded assembler
  fchrout( 0xA9 ); // 0806
  fchrout( 0x46 ); // 0807
  
  fchrout( 0xA2 ); // 0808
  fchrout( 0x08 ); // 0809

  fchrout( 0x48 ); // 080a

  fchrout( 0x8A ); // 080b

  fchrout( 0x48 ); // 080c

  fchrout( 0x78 ); // 080d

  fchrout( 0xA9 ); // 080e
  fchrout( 0x7F ); // 080f

  fchrout( 0x8D ); // 0810
  fchrout( 0x0D ); // 0811
  fchrout( 0xDC ); // 0812
  
  fchrout( 0x8D ); // 0813
  fchrout( 0x0D ); // 0814
  fchrout( 0xDD ); // 0815
  
  fchrout( 0xAD ); // 0816
  fchrout( 0x0D ); // 0817
  fchrout( 0xDC ); // 0818
  
  fchrout( 0xAD ); // 0819
  fchrout( 0x0D ); // 081a
  fchrout( 0xDD ); // 081b
  
  fchrout( 0xA9 ); // 081c
  fchrout( 0x01 ); // 081d
  
  fchrout( 0x8D ); // 081e
  fchrout( 0x1A ); // 081f
  fchrout( 0xD0 ); // 0820

  fchrout( 0xA9 ); // 0821
  fchrout( 0x40 ); // 0822

  fchrout( 0x8D ); // 0823
  fchrout( 0x12 ); // 0824
  fchrout( 0xD0 ); // 0825

  fchrout( 0xAD ); // 0826
  fchrout( 0x11 ); // 0827
  fchrout( 0xD0 ); // 0828
  
  fchrout( 0x29 ); // 0829
  fchrout( 0x7F ); // 082a
  
  
  fchrout( 0x4C ); // 082b
  fchrout( 0x34 ); // 082c
  fchrout( 0x08 ); // 082d

  fchrout( 0x00 ); // 082e
  
  // next line
  fchrout( 0x52 ); // 082f <<----- pointed to above  (points to line below)
  fchrout( 0x08 ); // 0830

  // line #12
  fchrout( 0x0C ); // 0831
  fchrout( 0x00 ); // 0832

  // REM
  fchrout( 0x8F ); // 0833

  fchrout( 0x8D ); // 0834
  fchrout( 0x11 ); // 0835
  fchrout( 0xD0 ); // 0836
  
  fchrout( 0x29 ); // 0837
  fchrout( 0x7F ); // 0838
  
  fchrout( 0x8D ); // 0839
  fchrout( 0x11 ); // 083a  
  fchrout( 0xD0 ); // 083b
  
  fchrout( 0x68 ); // 083c
  fchrout( 0x8D ); // 083d
  fchrout( 0x15 ); // 083e
  fchrout( 0x03 ); // 083f

  fchrout( 0x68 ); // 0840
  
  fchrout( 0x8D ); // 0841
  fchrout( 0x14 ); // 0842
  fchrout( 0x03 ); // 0843

  fchrout( 0x58 ); // 0844

  fchrout( 0x60 ); // 0845

  // the routine
  fchrout( 0xEE ); // 0846
  fchrout( 0x20 ); // 0847
  fchrout( 0xD0 ); // 0848
  fchrout( 0x0E ); // 0849
  fchrout( 0x19 ); // 084a
  fchrout( 0xD0 ); // 084b
  fchrout( 0x4C ); // 084c
  fchrout( 0x31 ); // 084d
  fchrout( 0xEA ); // 084e
  fchrout( 0x00 ); // 084f

  // next line
  fchrout( 0x5A ); // 0850
  fchrout( 0x08 ); // 0851

  // line #12
  fchrout( 0x0D ); // 0852
  fchrout( 0x00 ); // 0853

  // SYS
  fchrout( 0x9E ); // 0854
  fchrout( 0x32 ); // 0855
  fchrout( 0x30 ); // 0856
  fchrout( 0x35 ); // 0857
  fchrout( 0x34 ); // 0858
  
  fchrout( 0x00 ); // 0859
  
  fchrout( 0x00 ); // 085a
  fchrout( 0x00 ); // 085b
  
  
  fclose(3);
  fclrchn();
  return;
}
