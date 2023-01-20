; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; word : jt : $0336 (822)
; uint : midjump : $0338 (824)
; uint : p1 : $0339 (825)
; uint : p2 : $033A (826)
; uint : p3 : $033B (827)
; uint : p4 : $033C (828)
; uint : p5 : $033D (829)
; uint : spriteI : $033E (830)
; uint : lastdirectiontaken : $033F (831)
; uint : standing : $0340 (832)
; uint : whichsprite : $0341 (833)
; word : delay : $0342 (834)
; word : x : $0344 (836)
; uint : y : $0346 (838)
; uint : timer : $0347 (839)
; uint : c : $0348 (840)
; word : mem1 : $0349 (841)
; uint : pausev : $034B (843)
; word : ldx : $034C (844)
; word : myX : $034E (846)
; uint : myY : $0350 (848)
; uint : XXX : $0351 (849)
; uint : oldD011 : $0352 (850)
; uint : oldD016 : $0353 (851)
; uint : oldD018 : $0354 (852)
; uint : oldD020 : $0355 (853)
; uint : oldD021 : $0356 (854)
; uint : oldChar : $0357 (855)
; uint : rx : $0358 (856)
; uint : ry : $0359 (857)
; RULE: datatype: void
.org $0834
; =========================================================
;                         main()
; =========================================================
; =========================================================
;                         cls()
; =========================================================
	JSR CLS; cls(); 0834
; =========================================================
;                         printf("O  :  MOVE RIGHT\nU  :  MOVE LEFT\nSPACE  :  JUMP");
; =========================================================
	LDA #$12; 0837
	STA $03; 0839
	LDA #$4E; 083B
	STA $02; 083D
	JSR PRN; 083F
	JSR LBL0L3; pause(); 0842
; Switch out the ROM
	SEI; 0845
	LDA $01; 0846
	AND #$FE; 0848
	STA $01; 084A
	CLI; 084C
; ------------------
	JSR LBL0L12; saveregs(); 084D
; RULE: value: NUM: (0xF8)
; RULE: value: NUM: (0xF8)->(u248)
; RULE: value: NUM: (0xF9)
; RULE: value: NUM: (0xF9)->(u249)
; RULE: value: NUM: (0xF9)
; RULE: value: NUM: (0xF9)->(u249)
; RULE: value: NUM: (0xFA)
; RULE: value: NUM: (0xFA)->(u250)
; RULE: value: NUM: (0xFB)
; RULE: value: NUM: (0xFB)->(u251)
; RULE: value: NUM: (0xFC)
; RULE: value: NUM: (0xFC)->(u252)
; RULE: value: NUM: (0xFC)
; RULE: value: NUM: (0xFC)->(u252)
; RULE: value: NUM: (0xFD)
; RULE: value: NUM: (0xFD)->(u253)
; RULE: value: NUM: (0xFD)
; RULE: value: NUM: (0xFD)->(u253)
; RULE: value: NUM: (0xFD)
; RULE: value: NUM: (0xFD)->(u253)
; RULE: value: NUM: (0xFE)
; RULE: value: NUM: (0xFE)->(u254)
; RULE: value: NUM: (0xFF)
; RULE: value: NUM: (0xFF)->(u255)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
	LDA #<LBL1L0; 0850
	STA $0336; 0852
	LDA #>LBL1L0; 0855
	STA $0337; 0857
	JMP !+; 085A
LBL1L0:
	.BYTE #$F8; 085D
	.BYTE #$F9; 085E
	.BYTE #$F9; 085F
	.BYTE #$FA; 0860
	.BYTE #$FB; 0861
	.BYTE #$FC; 0862
	.BYTE #$FC; 0863
	.BYTE #$FD; 0864
	.BYTE #$FD; 0865
	.BYTE #$FD; 0866
	.BYTE #$FE; 0867
	.BYTE #$FF; 0868
	.BYTE #$00; 0869
	.BYTE #$00; 086A
	.BYTE #$00; 086B
	.BYTE #$00; 086C
	.BYTE #$00; 086D
	.BYTE #$00; 086E
	.BYTE #$00; 086F
	.BYTE #$02; 0870
	.BYTE #$02; 0871
	.BYTE #$02; 0872
	.BYTE #$02; 0873
	.BYTE #$02; 0874
	.BYTE #$01; 0875
	.BYTE #$00; 0876
	.BYTE #$00; 0877
!
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; midjump
; u0
	LDA #$00; 0878
; RULE: statement: datatype ID init
; UINT midjump=A datatype#: 00
; UINT UintID A
	STA $0338; 087A
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p1=A datatype#: 00
; UINT UintID A
	STA $0339; 087D
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p2=A datatype#: 00
; UINT UintID A
	STA $033A; 0880
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p3=A datatype#: 00
; UINT UintID A
	STA $033B; 0883
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p4=A datatype#: 00
; UINT UintID A
	STA $033C; 0886
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p5=A datatype#: 00
; UINT UintID A
	STA $033D; 0889
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT spriteI=A datatype#: 00
; UINT UintID A
	STA $033E; 088C
; =========================================================
	LDA #$09; 088F
	STA $D020; 0891
	LDA #$0C; 0894
	STA $D021; 0896
; RULE: value: NUMBER: (1)
; bank( IMM );
	LDA #$03; 0899
	ORA $DD02; 089B
	STA $DD02; 089E
	LDA #$01; 08A1
	EOR #$FF; 08A3
	AND #$03; 08A5
	STA $02; 08A7
	LDA #$FC; 08A9
	AND $DD00; 08AB
	ORA $02; 08AE
	STA $DD00; 08B0
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; lastdirectiontaken
; u0
	LDA #$00; 08B3
; RULE: statement: datatype ID init
; UINT lastdirectiontaken=A datatype#: 00
; UINT UintID A
	STA $033F; 08B5
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; standing
; u0
	LDA #$00; 08B8
; RULE: statement: datatype ID init
; UINT standing=A datatype#: 00
; UINT UintID A
	STA $0340; 08BA
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01; 08BD
; RULE: statement: datatype ID init
; UINT whichsprite=A datatype#: 00
; UINT UintID A
	STA $0341; 08BF
; =========================================================
; RULE: datatype: word
; RULE: value: NUM: (0x00CC)
; RULE: value: NUM: (0x00CC)->(w204)
; RULE: init: '=' expression
; delay
; w204
; unknown type
; w204
; RULE: statement: datatype ID init
; WORD delay=w204 datatype#: 02
	LDA #$CC; 08C2
	LDX #$00; 08C4
	STA $0342; 08C6
	STX $0343; 08C9
; =========================================================
; RULE: datatype: word
; RULE: value: NUM: (0x0020)
; RULE: value: NUM: (0x0020)->(w32)
; RULE: init: '=' expression
; x
; w32
; unknown type
; w32
; RULE: statement: datatype ID init
; WORD x=w32 datatype#: 02
	LDA #$20; 08CC
	LDX #$00; 08CE
	STA $0344; 08D0
	STX $0345; 08D3
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (100)
; RULE: init: '=' expression
; y
; u100
	LDA #$64; 08D6
; RULE: statement: datatype ID init
; UINT y=A datatype#: 00
; UINT UintID A
	STA $0346; 08D8
; =========================================================
	LDA #$3B; 08DB
	STA $D011; 08DD
	LDA #$18; 08E0
	STA $D016; 08E2
	LDA #$18; 08E5
	STA $D018; 08E7
	JSR LBL0L2; clearhires(); 08EA
	JSR LBL0L15; createplatforms(); 08ED
; RULE: datatype: mob
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (255)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (3)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (176)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (251)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (186)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (186)
; RULE: value: NUMBER: (187)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (175)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (188)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (186)
; RULE: value: NUMBER: (176)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (190)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (195)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (59)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: init: '=' expression
; blueguy1
; m
; MOB
; RULE: statement: datatype ID init
; MOB blueguy1=m datatype#: 00
; MOB Detected
	LDA #$F7; 08F0
	STA LBL1L1; 08F2
	LDA #$03; 08F5
	STA LBL1L1+1; 08F7
	LDA #$00; <- Sprite #; 08FA
	ADC LBL1L1; 08FC
	STA LBL1L1; 08FF
	JSR SCRMEM; 0902
	PLA; 0905
	ADC LBL1L1+1; 0906
	STA LBL1L1+1; 0909
	JSR BNKMEM; 090C
	PLA; 090F
	ADC LBL1L1+1; 0910
	STA LBL1L1+1; 0913
	LDA #$01; 0916
	.BYTE #$8D; 0918
LBL1L1:
	.BYTE #$00, #$00; 0919
	JSR LBL1L2; 091B
blueguy1:
	.BYTE #$00, #$FF, #$00, #$03, #$AA, #$C0, #$0E, #$AA, #$B0, #$0E, #$AA, #$AC, #$0E, #$AA, #$AC, #$0E, #$AA, #$AC, #$3A, #$FB, #$EB, #$3A, #$BA, #$EB, #$3A, #$AA, #$AB, #$3A, #$AB, #$AB, #$3A, #$AA, #$AB, #$3A, #$BA, #$BB, #$3A, #$AF, #$EB, #$0E, #$AA, #$AB, #$0F, #$AA, #$AC, #$0E, #$EA, #$BC, #$0E, #$BA, #$B0, #$3A, #$BE, #$AC, #$3A, #$C3, #$AB, #$3B, #$00, #$EB, #$3F, #$00, #$3F
LBL1L2:
	PLA; 095D
	STA $FB; 095E
	PLA; 0960
	STA $FC; 0961
	LDA #$40; 0963
	STA $FD; 0965
	LDA #$00; 0967
	STA $FE; 0969
	JSR BNKMEM; 096B
	PLA; 096E
	CLC; 096F
	ADC $FE; 0970
	STA $FE; 0972
	JSR MOBCPY; 0974
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (255)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (3)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (176)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (251)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (186)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (186)
; RULE: value: NUMBER: (187)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (175)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (188)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (175)
; RULE: value: NUMBER: (240)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (179)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (195)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (59)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: init: '=' expression
; blueguy2
; m
; MOB
; RULE: statement: datatype ID init
; MOB blueguy2=m datatype#: 00
; MOB Detected
	LDA #$F7; 0977
	STA LBL1L3; 0979
	LDA #$03; 097C
	STA LBL1L3+1; 097E
	LDA #$01; <- Sprite #; 0981
	ADC LBL1L3; 0983
	STA LBL1L3; 0986
	JSR SCRMEM; 0989
	PLA; 098C
	ADC LBL1L3+1; 098D
	STA LBL1L3+1; 0990
	JSR BNKMEM; 0993
	PLA; 0996
	ADC LBL1L3+1; 0997
	STA LBL1L3+1; 099A
	LDA #$02; 099D
	.BYTE #$8D; 099F
LBL1L3:
	.BYTE #$00, #$00; 09A0
	JSR LBL1L4; 09A2
blueguy2:
	.BYTE #$00, #$FF, #$00, #$03, #$AA, #$C0, #$0E, #$AA, #$B0, #$0E, #$AA, #$AC, #$0E, #$AA, #$AC, #$0E, #$AA, #$AC, #$3A, #$FB, #$EB, #$3A, #$BA, #$EB, #$3A, #$AA, #$AB, #$3A, #$AB, #$AB, #$3A, #$AA, #$AB, #$3A, #$BA, #$BB, #$3A, #$AF, #$EB, #$0E, #$AA, #$AB, #$0F, #$AA, #$AC, #$0E, #$AA, #$BC, #$3A, #$AF, #$F0, #$3A, #$B3, #$AC, #$3A, #$C3, #$AB, #$3B, #$00, #$EB, #$3F, #$00, #$3F
LBL1L4:
	PLA; 09E4
	STA $FB; 09E5
	PLA; 09E7
	STA $FC; 09E8
	LDA #$80; 09EA
	STA $FD; 09EC
	LDA #$00; 09EE
	STA $FE; 09F0
	JSR BNKMEM; 09F2
	PLA; 09F5
	CLC; 09F6
	ADC $FE; 09F7
	STA $FE; 09F9
	JSR MOBCPY; 09FB
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (3)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (3)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (176)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (3)
; RULE: value: NUMBER: (170)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (14)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (186)
; RULE: value: NUMBER: (175)
; RULE: value: NUMBER: (58)
; RULE: value: NUMBER: (186)
; RULE: value: NUMBER: (187)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (175)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (187)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (235)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (171)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (172)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (176)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (174)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (255)
; RULE: value: NUMBER: (255)
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; treasurechest
; m
; MOB
; RULE: statement: datatype ID init
; MOB treasurechest=m datatype#: 00
; MOB Detected
	LDA #$F7; 09FE
	STA LBL1L5; 0A00
	LDA #$03; 0A03
	STA LBL1L5+1; 0A05
	LDA #$02; <- Sprite #; 0A08
	ADC LBL1L5; 0A0A
	STA LBL1L5; 0A0D
	JSR SCRMEM; 0A10
	PLA; 0A13
	ADC LBL1L5+1; 0A14
	STA LBL1L5+1; 0A17
	JSR BNKMEM; 0A1A
	PLA; 0A1D
	ADC LBL1L5+1; 0A1E
	STA LBL1L5+1; 0A21
	LDA #$03; 0A24
	.BYTE #$8D; 0A26
LBL1L5:
	.BYTE #$00, #$00; 0A27
	JSR LBL1L6; 0A29
treasurechest:
	.BYTE #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$03, #$C0, #$00, #$0E, #$B0, #$00, #$3A, #$AC, #$00, #$EA, #$AC, #$03, #$AA, #$AB, #$0E, #$EA, #$AB, #$3A, #$BA, #$AF, #$3A, #$BA, #$BB, #$EA, #$AE, #$EB, #$EA, #$AF, #$AB, #$EA, #$AE, #$BB, #$EA, #$AE, #$EB, #$EA, #$AE, #$AB, #$EA, #$AE, #$AB, #$EA, #$AE, #$AC, #$EA, #$AE, #$B0, #$EA, #$AE, #$C0, #$FF, #$FF, #$00
LBL1L6:
	PLA; 0A6B
	STA $FB; 0A6C
	PLA; 0A6E
	STA $FC; 0A6F
	LDA #$C0; 0A71
	STA $FD; 0A73
	LDA #$00; 0A75
	STA $FE; 0A77
	JSR BNKMEM; 0A79
	PLA; 0A7C
	CLC; 0A7D
	ADC $FE; 0A7E
	STA $FE; 0A80
	JSR MOBCPY; 0A82
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $0344 );
; spritex( IMM, WORDID );
	LDA $0344; 0A85
	STA $D000; 0A88
	LDA $0345; 0A8B
	STA $2A; 0A8E
	LDA #$01; 0A90
	EOR #$FF; 0A92
	AND $D010; 0A94
	STA $A7; 0A97
	LDA $2A; 0A99
	CLC; 0A9B
	ADC $A7; 0A9C
	STA $D010; 0A9E
; RULE: value: NUMBER: (0)
; spritey( u0, $0346 );
	LDA $0346; 0AA1
	STA $D001; 0AA4
; RULE: value: NUMBER: (1)
; spritex( u1, $0344 );
; spritex( IMM, WORDID );
	LDA $0344; 0AA7
	STA $D002; 0AAA
	LDA $0345; 0AAD
	STA $2A; 0AB0
	LDA #$01; 0AB2
	ASL; 0AB4
	ASL $2A; 0AB5
	EOR #$FF; 0AB7
	AND $D010; 0AB9
	STA $A7; 0ABC
	LDA $2A; 0ABE
	CLC; 0AC0
	ADC $A7; 0AC1
	STA $D010; 0AC3
; RULE: value: NUMBER: (1)
; spritey( u1, $0346 );
	LDA $0346; 0AC6
	STA $D003; 0AC9
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (210)
; RULE: value: NUMBER: (175)
; spritexy( u2, u210, u175 );
	LDA #$D2; 0ACC
	STA $D004; 0ACE
	LDA #$AF; 0AD1
	STA $D005; 0AD3
	LDA #$07; 0AD6
	STA $D01C; 0AD8
; RULE: value: NUMBER: (5)
	LDA #$05; 0ADB
	ORA $D015; 0ADD
	STA $D015; 0AE0
	LDA #$01; 0AE3
	STA $D025; 0AE5
	LDA #$00; 0AE8
	STA $D026; 0AEA
	LDA #$03; 0AED
	STA $D027; 0AEF
	LDA #$03; 0AF2
	STA $D028; 0AF4
	LDA #$09; 0AF7
	STA $D029; 0AF9
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; timer
; u0
	LDA #$00; 0AFC
; RULE: statement: datatype ID init
; UINT timer=A datatype#: 00
; UINT UintID A
	STA $0347; 0AFE
; =========================================================
; RULE: datatype: uint
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0B01
; RULE: init: '=' expression
; c
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT c=A datatype#: 00
; UINT UintID A
	STA $0348; 0B03
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0B06
LBL1L7:
; ---------------------------------------------------------
; RULE: value: NUMBER: (62)
; UintID
; $0348
;  vs. 
; UintIMM
; u62
LBL1L8:			; Top of WHILE Loop
	LDA $0348; 0B07
	CMP #$3E; 0B0A
	.BYTE #$D0, #$03; 0B0C
	JMP LBL1L10; if z==1 jump to ELSE; 0B0E
; =========================================================
LBL1L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L0:
; RULE: value: NUMBER: (0)
; UintID
; $0347
;  vs. 
; UintIMM
; u0
LBL2L1:			; Top of IF statement
	LDA $0347; 0B11
	CMP #$00; 0B14
	.BYTE #$F0, #$03; BEQ +3; 0B16
	JMP LBL2L3; jump to ELSE; 0B18
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L2:
	JSR LBL0L9; checkIfStanding(); 0B1B
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L0:
; RULE: value: NUMBER: (0)
; UintID
; $0340
;  vs. 
; UintIMM
; u0
LBL3L1:			; Top of IF statement
	LDA $0340; 0B1E
	CMP #$00; 0B21
	.BYTE #$F0, #$03; BEQ +3; 0B23
	JMP LBL3L3; jump to ELSE; 0B25
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L2:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L0:
; RULE: value: NUMBER: (0)
; UintID
; $0338
;  vs. 
; UintIMM
; u0
LBL4L1:			; Top of IF statement
	LDA $0338; 0B28
	CMP #$00; 0B2B
	.BYTE #$D0, #$03; 0B2D
	JMP LBL4L3; if z==1 jump to ELSE; 0B2F
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L2:
	JSR LBL0L14; calculatejump(); 0B32
	JMP LBL4L4; 0B35
LBL4L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L4:
; RULE: value: NUMBER: (1)
; $0346 (0) + u1 (-1)
; UintID arith UintIMM
	LDA $0346; 0B38
	CLC; 0B3B
	ADC #$01; 0B3C
; RULE: init: '=' expression
; y
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0346; 0B3E
; =========================================================
	JMP LBL3L4; 0B41
LBL3L3:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L5:
; RULE: value: NUMBER: (0)
; UintID
; $0338
;  vs. 
; UintIMM
; u0
LBL4L6:			; Top of IF statement
	LDA $0338; 0B44
	CMP #$00; 0B47
	.BYTE #$D0, #$03; 0B49
	JMP LBL4L8; if z==1 jump to ELSE; 0B4B
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L7:
	JSR LBL0L14; calculatejump(); 0B4E
	JMP LBL4L9; 0B51
LBL4L8:
; ---------------------------------------------------------
;                       ELSE:
	JSR LBL0L4; checkLeft(); 0B54
	JSR LBL0L5; checkRight(); 0B57
	JSR LBL0L6; checkJump(); 0B5A
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L9:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L4:
	JSR LBL0L0; positionplayer(); 0B5D
	JMP LBL2L4; 0B60
LBL2L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L4:
; inc(ID)
	INC $0347; 0B63
; =========================================================
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0B66
; RULE: init: '=' expression
; c
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0348; 0B68
; =========================================================
	JMP LBL1L8; jump to top of WHILE loop; 0B6B
LBL1L10:
	PLA; 0B6E
	JSR LBL0L1; clearkb(); 0B6F
	JSR LBL0L13; restoreregs(); 0B72
; RULE: value: NUMBER: (0)
; bank( IMM );
	LDA #$03; 0B75
	ORA $DD02; 0B77
	STA $DD02; 0B7A
	LDA #$00; 0B7D
	EOR #$FF; 0B7F
	AND #$03; 0B81
	STA $02; 0B83
	LDA #$FC; 0B85
	AND $DD00; 0B87
	ORA $02; 0B8A
	STA $DD00; 0B8C
; Switch the ROM back in
	SEI; 0B8F
	LDA $01; 0B90
	ORA #$01; 0B92
	STA $01; 0B94
	CLI; 0B96
; ------------------
	RTS; 0B97
; RULE: datatype: void
; ======================== positionplayer ========================
LBL0L0:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L11:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $0344
;  vs. 
; WordIMM
; w23
LBL1L12:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0344 v. w23
	LDA $0345; 0B98
	CMP #$00; 0B9B
	.BYTE #$D0, #$05; 0B9D
	LDA $0344; 0B9F
	CMP #$17; 0BA2
	.BYTE #$90, #$03; BCC +3; 0BA4
	JMP LBL1L14; jump to ELSE; 0BA6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L13:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; RULE: init: '=' expression
; x
; w23
	LDA #$17; 0BA9
	LDX #$00; 0BAB
; RULE: statement: ID init
	STA $0344; 0BAD
	STX $0345; 0BB0
; =========================================================
	JMP LBL1L15; 0BB3
LBL1L14:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L15:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L16:
; RULE: value: NUMBER: (320)
; WordID
; $0344
;  vs. 
; WordIMM
; w320
LBL1L17:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0344 v. w320
	LDA $0345; 0BB6
	CMP #$01; 0BB9
	.BYTE #$D0, #$05; 0BBB
	LDA $0344; 0BBD
	CMP #$40; 0BC0
	.BYTE #$B0, #$03; BCS +3; 0BC2
	JMP LBL1L19; if c==0 jump to ELSE; 0BC4
	.BYTE #$D0, #$03; 0BC7
	JMP LBL1L19; if z==1 jump to ELSE; 0BC9
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L18:
; RULE: value: NUMBER: (320)
; RULE: init: '=' expression
; x
; w320
	LDA #$40; 0BCC
	LDX #$01; 0BCE
; RULE: statement: ID init
	STA $0344; 0BD0
	STX $0345; 0BD3
; =========================================================
	JMP LBL1L20; 0BD6
LBL1L19:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L20:
; RULE: value: NUMBER: (0)
; spritey( u0, $0346 );
	LDA $0346; 0BD9
	STA $D001; 0BDC
; RULE: value: NUMBER: (1)
; spritey( u1, $0346 );
	LDA $0346; 0BDF
	STA $D003; 0BE2
; RULE: value: NUMBER: (0)
; spritex( u0, $0344 );
; spritex( IMM, WORDID );
	LDA $0344; 0BE5
	STA $D000; 0BE8
	LDA $0345; 0BEB
	STA $2A; 0BEE
	LDA #$01; 0BF0
	EOR #$FF; 0BF2
	AND $D010; 0BF4
	STA $A7; 0BF7
	LDA $2A; 0BF9
	CLC; 0BFB
	ADC $A7; 0BFC
	STA $D010; 0BFE
; RULE: value: NUMBER: (1)
; spritex( u1, $0344 );
; spritex( IMM, WORDID );
	LDA $0344; 0C01
	STA $D002; 0C04
	LDA $0345; 0C07
	STA $2A; 0C0A
	LDA #$01; 0C0C
	ASL; 0C0E
	ASL $2A; 0C0F
	EOR #$FF; 0C11
	AND $D010; 0C13
	STA $A7; 0C16
	LDA $2A; 0C18
	CLC; 0C1A
	ADC $A7; 0C1B
	STA $D010; 0C1D
	RTS; 0C20
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L1:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00; 0C21
	STA $C6; ; 0C23
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 0C25
	RTS; 0C28
; RULE: datatype: void
; ======================== clearhires ========================
LBL0L2:
; RULE: datatype: word
; RULE: value: NUM: (0x0000)
; RULE: value: NUM: (0x0000)->(w0)
; RULE: init: '=' expression
; mem1
; w0
; unknown type
; w0
; RULE: statement: datatype ID init
; WORD mem1=w0 datatype#: 02
	LDA #$00; 0C29
	LDX #$00; 0C2B
	STA $0349; 0C2D
	STX $034A; 0C30
; =========================================================
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L21:
	PHA; 0C33
; ---------------------------------------------------------
; RULE: value: NUM: (0xD800)
; RULE: value: NUM: (0xD800)->(w55296)
; RULE: init: '=' expression
; mem1
; w55296
	LDA #$00; 0C34
	LDX #$D8; 0C36
; RULE: statement: ID init
	STA $0349; 0C38
	STX $034A; 0C3B
; ---------------------------------------------------------
; RULE: value: NUM: (0xDBFF)
; RULE: value: NUM: (0xDBFF)->(w56319)
; WordID
; $0349
;  vs. 
; WordIMM
; w56319
LBL1L22:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0349 v. w56319
	LDA $034A; 0C3E
	CMP #$DB; 0C41
	.BYTE #$D0, #$05; 0C43
	LDA $0349; 0C45
	CMP #$FF; 0C48
	.BYTE #$B0, #$03; BCS +3; 0C4A
	JMP LBL1L24; if c==0 jump to BODY; 0C4C
	JMP LBL1L25; jump out of FOR; 0C4F
; =========================================================
; ---------------------------------------------------------
LBL1L23:
; RULE: value: NUMBER: (1)
; $0349 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0C52
	LDA #$01; 0C53
	ADC $0349; 0C55
	PHA; 0C58
	LDA #$00; 0C59
	ADC $034A; 0C5B
	TAX; 0C5E
	PLA; 0C5F
; RULE: init: '=' expression
; mem1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0349; 0C60
	STX $034A; 0C63
	JMP LBL1L22; jump to top of FOR loop; 0C66
; ---------------------------------------------------------
LBL1L24:
; =========================================================
;                         poke mem1, 8
; =========================================================
	LDA $0349; 0C69
	STA LBL2L5; 0C6C
	LDA $034A; 0C6F
	STA LBL2L6; 0C72
	LDA #$08; 0C75
	.BYTE #$8D;	  <-- STA absolute; 0C77
LBL2L5:			; <-- low byte
	.BYTE #$00; 0C78
LBL2L6:			; <-- hi byte
	.BYTE #$00; 0C79
; ---------------------------------------------------------
	JMP LBL1L23; jump to iterator; 0C7A
LBL1L25:
	PLA; 0C7D
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L26:
	PHA; 0C7E
; ---------------------------------------------------------
; RULE: value: NUM: (0x4400)
; RULE: value: NUM: (0x4400)->(w17408)
; RULE: init: '=' expression
; mem1
; w17408
	LDA #$00; 0C7F
	LDX #$44; 0C81
; RULE: statement: ID init
	STA $0349; 0C83
	STX $034A; 0C86
; ---------------------------------------------------------
; RULE: value: NUM: (0x47C0)
; RULE: value: NUM: (0x47C0)->(w18368)
; WordID
; $0349
;  vs. 
; WordIMM
; w18368
LBL1L27:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0349 v. w18368
	LDA $034A; 0C89
	CMP #$47; 0C8C
	.BYTE #$D0, #$05; 0C8E
	LDA $0349; 0C90
	CMP #$C0; 0C93
	.BYTE #$B0, #$03; BCS +3; 0C95
	JMP LBL1L29; if c==0 jump to BODY; 0C97
	JMP LBL1L30; jump out of FOR; 0C9A
; =========================================================
; ---------------------------------------------------------
LBL1L28:
; RULE: value: NUMBER: (1)
; $0349 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0C9D
	LDA #$01; 0C9E
	ADC $0349; 0CA0
	PHA; 0CA3
	LDA #$00; 0CA4
	ADC $034A; 0CA6
	TAX; 0CA9
	PLA; 0CAA
; RULE: init: '=' expression
; mem1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0349; 0CAB
	STX $034A; 0CAE
	JMP LBL1L27; jump to top of FOR loop; 0CB1
; ---------------------------------------------------------
LBL1L29:
; =========================================================
;                         poke mem1, 35
; =========================================================
	LDA $0349; 0CB4
	STA LBL2L7; 0CB7
	LDA $034A; 0CBA
	STA LBL2L8; 0CBD
	LDA #$23; 0CC0
	.BYTE #$8D;	  <-- STA absolute; 0CC2
LBL2L7:			; <-- low byte
	.BYTE #$00; 0CC3
LBL2L8:			; <-- hi byte
	.BYTE #$00; 0CC4
; ---------------------------------------------------------
	JMP LBL1L28; jump to iterator; 0CC5
LBL1L30:
	PLA; 0CC8
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L31:
	PHA; 0CC9
; ---------------------------------------------------------
; RULE: value: NUM: (0x47C0)
; RULE: value: NUM: (0x47C0)->(w18368)
; RULE: init: '=' expression
; mem1
; w18368
	LDA #$C0; 0CCA
	LDX #$47; 0CCC
; RULE: statement: ID init
	STA $0349; 0CCE
	STX $034A; 0CD1
; ---------------------------------------------------------
; RULE: value: NUM: (0x47FF)
; RULE: value: NUM: (0x47FF)->(w18431)
; WordID
; $0349
;  vs. 
; WordIMM
; w18431
LBL1L32:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0349 v. w18431
	LDA $034A; 0CD4
	CMP #$47; 0CD7
	.BYTE #$D0, #$05; 0CD9
	LDA $0349; 0CDB
	CMP #$FF; 0CDE
	.BYTE #$B0, #$03; BCS +3; 0CE0
	JMP LBL1L34; if c==0 jump to BODY; 0CE2
	JMP LBL1L35; jump out of FOR; 0CE5
; =========================================================
; ---------------------------------------------------------
LBL1L33:
; RULE: value: NUMBER: (1)
; $0349 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0CE8
	LDA #$01; 0CE9
	ADC $0349; 0CEB
	PHA; 0CEE
	LDA #$00; 0CEF
	ADC $034A; 0CF1
	TAX; 0CF4
	PLA; 0CF5
; RULE: init: '=' expression
; mem1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0349; 0CF6
	STX $034A; 0CF9
	JMP LBL1L32; jump to top of FOR loop; 0CFC
; ---------------------------------------------------------
LBL1L34:
; =========================================================
;                         poke mem1, 97
; =========================================================
	LDA $0349; 0CFF
	STA LBL2L9; 0D02
	LDA $034A; 0D05
	STA LBL2L10; 0D08
	LDA #$61; 0D0B
	.BYTE #$8D;	  <-- STA absolute; 0D0D
LBL2L9:			; <-- low byte
	.BYTE #$00; 0D0E
LBL2L10:			; <-- hi byte
	.BYTE #$00; 0D0F
; ---------------------------------------------------------
	JMP LBL1L33; jump to iterator; 0D10
LBL1L35:
	PLA; 0D13
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L36:
	PHA; 0D14
; ---------------------------------------------------------
; RULE: value: NUM: (0x6000)
; RULE: value: NUM: (0x6000)->(w24576)
; RULE: init: '=' expression
; mem1
; w24576
	LDA #$00; 0D15
	LDX #$60; 0D17
; RULE: statement: ID init
	STA $0349; 0D19
	STX $034A; 0D1C
; ---------------------------------------------------------
; RULE: value: NUM: (0x7FF8)
; RULE: value: NUM: (0x7FF8)->(w32760)
; WordID
; $0349
;  vs. 
; WordIMM
; w32760
LBL1L37:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0349 v. w32760
	LDA $034A; 0D1F
	CMP #$7F; 0D22
	.BYTE #$D0, #$05; 0D24
	LDA $0349; 0D26
	CMP #$F8; 0D29
	.BYTE #$B0, #$03; BCS +3; 0D2B
	JMP LBL1L39; if c==0 jump to BODY; 0D2D
	JMP LBL1L40; jump out of FOR; 0D30
; =========================================================
; ---------------------------------------------------------
LBL1L38:
; RULE: value: NUMBER: (1)
; $0349 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0D33
	LDA #$01; 0D34
	ADC $0349; 0D36
	PHA; 0D39
	LDA #$00; 0D3A
	ADC $034A; 0D3C
	TAX; 0D3F
	PLA; 0D40
; RULE: init: '=' expression
; mem1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0349; 0D41
	STX $034A; 0D44
	JMP LBL1L37; jump to top of FOR loop; 0D47
; ---------------------------------------------------------
LBL1L39:
; =========================================================
;                         poke mem1, 0
; =========================================================
	LDA $0349; 0D4A
	STA LBL2L11; 0D4D
	LDA $034A; 0D50
	STA LBL2L12; 0D53
	LDA #$00; 0D56
	.BYTE #$8D;	  <-- STA absolute; 0D58
LBL2L11:			; <-- low byte
	.BYTE #$00; 0D59
LBL2L12:			; <-- hi byte
	.BYTE #$00; 0D5A
; ---------------------------------------------------------
	JMP LBL1L38; jump to iterator; 0D5B
LBL1L40:
	PLA; 0D5E
; ---------------------------------------------------------
	LDA #$28; 0D5F
	STA $6148; 0D61
	LDA #$AA; 0D64
	STA $6149; 0D66
	LDA #$AA; 0D69
	STA $614A; 0D6B
	LDA #$28; 0D6E
	STA $614B; 0D70
	LDA #$7D; 0D73
	STA $4429; 0D75
	RTS; 0D78
; RULE: datatype: void
; ======================== pause ========================
LBL0L3:
	LDA #$00; 0D79
	STA $00C6; 0D7B
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFE4; 0D7D
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0D80
; RULE: init: '=' expression
; pausev
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $034B; 0D83
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0D86
LBL1L41:
; ---------------------------------------------------------
; RULE: value: NUMBER: (0)
; UintID
; $034B
;  vs. 
; UintIMM
; u0
LBL1L42:			; Top of WHILE Loop
	LDA $034B; 0D87
	CMP #$00; 0D8A
	.BYTE #$F0, #$03; BEQ +3; 0D8C
	JMP LBL1L44; jump to ELSE; 0D8E
; =========================================================
LBL1L43:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0D91
; RULE: init: '=' expression
; pausev
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $034B; 0D94
; =========================================================
	JMP LBL1L42; jump to top of WHILE loop; 0D97
LBL1L44:
	PLA; 0D9A
	RTS; 0D9B
; RULE: datatype: void
; ======================== checkLeft ========================
LBL0L4:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L45:
; RULE: value: NUMBER: (30)
; UintID
; $0348
;  vs. 
; UintIMM
; u30
LBL1L46:			; Top of IF statement
	LDA $0348; 0D9C
	CMP #$1E; 0D9F
	.BYTE #$F0, #$03; BEQ +3; 0DA1
	JMP LBL1L48; jump to ELSE; 0DA3
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L47:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; lastdirectiontaken
; u1
	LDA #$01; 0DA6
; RULE: statement: ID init
	STA $033F; 0DA8
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L13:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $0344
;  vs. 
; WordIMM
; w23
LBL2L14:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0344 v. w23
	LDA $0345; 0DAB
	CMP #$00; 0DAE
	.BYTE #$D0, #$05; 0DB0
	LDA $0344; 0DB2
	CMP #$17; 0DB5
	.BYTE #$B0, #$03; BCS +3; 0DB7
	JMP LBL2L16; if c==0 jump to ELSE; 0DB9
	.BYTE #$D0, #$03; 0DBC
	JMP LBL2L16; if z==1 jump to ELSE; 0DBE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L15:
; RULE: value: NUMBER: (1)
; $0344 (2) - u1 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 0DC1
	LDA $0344; 0DC2
	SBC #$01; 0DC5
	PHA; 0DC7
	LDA $0345; 0DC8
	SBC #$00; 0DCB
	TAX; 0DCD
	PLA; 0DCE
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0344; 0DCF
	STX $0345; 0DD2
; =========================================================
	JSR LBL0L7; moveLegs(); 0DD5
	JMP LBL2L17; 0DD8
LBL2L16:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L17:
	JMP LBL1L49; 0DDB
LBL1L48:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L49:
	RTS; 0DDE
; RULE: datatype: void
; ======================== checkRight ========================
LBL0L5:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L50:
; RULE: value: NUMBER: (38)
; UintID
; $0348
;  vs. 
; UintIMM
; u38
LBL1L51:			; Top of IF statement
	LDA $0348; 0DDF
	CMP #$26; 0DE2
	.BYTE #$F0, #$03; BEQ +3; 0DE4
	JMP LBL1L53; jump to ELSE; 0DE6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L52:
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; lastdirectiontaken
; u2
	LDA #$02; 0DE9
; RULE: statement: ID init
	STA $033F; 0DEB
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L18:
; RULE: value: NUMBER: (320)
; WordID
; $0344
;  vs. 
; WordIMM
; w320
LBL2L19:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0344 v. w320
	LDA $0345; 0DEE
	CMP #$01; 0DF1
	.BYTE #$D0, #$05; 0DF3
	LDA $0344; 0DF5
	CMP #$40; 0DF8
	.BYTE #$90, #$03; BCC +3; 0DFA
	JMP LBL2L21; jump to ELSE; 0DFC
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L20:
; RULE: value: NUMBER: (1)
; $0344 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0DFF
	LDA #$01; 0E00
	ADC $0344; 0E02
	PHA; 0E05
	LDA #$00; 0E06
	ADC $0345; 0E08
	TAX; 0E0B
	PLA; 0E0C
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0344; 0E0D
	STX $0345; 0E10
; =========================================================
	JSR LBL0L7; moveLegs(); 0E13
	JMP LBL2L22; 0E16
LBL2L21:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L22:
	JMP LBL1L54; 0E19
LBL1L53:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L54:
	RTS; 0E1C
; RULE: datatype: void
; ======================== checkJump ========================
LBL0L6:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L55:
; RULE: value: NUMBER: (60)
; UintID
; $0348
;  vs. 
; UintIMM
; u60
LBL1L56:			; Top of IF statement
	LDA $0348; 0E1D
	CMP #$3C; 0E20
	.BYTE #$F0, #$03; BEQ +3; 0E22
	JMP LBL1L58; jump to ELSE; 0E24
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L57:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L23:
; RULE: value: NUMBER: (0)
; UintID
; $0338
;  vs. 
; UintIMM
; u0
LBL2L24:			; Top of IF statement
	LDA $0338; 0E27
	CMP #$00; 0E2A
	.BYTE #$F0, #$03; BEQ +3; 0E2C
	JMP LBL2L26; jump to ELSE; 0E2E
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L25:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; midjump
; u1
	LDA #$01; 0E31
; RULE: statement: ID init
	STA $0338; 0E33
; =========================================================
	JMP LBL2L27; 0E36
LBL2L26:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L27:
	JMP LBL1L59; 0E39
LBL1L58:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L59:
	RTS; 0E3C
; RULE: datatype: void
; ======================== moveLegs ========================
LBL0L7:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L60:
; RULE: value: NUMBER: (1)
; UintID
; $0341
;  vs. 
; UintIMM
; u1
LBL1L61:			; Top of IF statement
	LDA $0341; 0E3D
	CMP #$01; 0E40
	.BYTE #$F0, #$03; BEQ +3; 0E42
	JMP LBL1L63; jump to ELSE; 0E44
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L62:
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; whichsprite
; u2
	LDA #$02; 0E47
; RULE: statement: ID init
	STA $0341; 0E49
; =========================================================
; RULE: value: NUMBER: (1)
	LDA #$01; 0E4C
	EOR #$FF; 0E4E
	AND $D015; 0E50
	STA $D015; 0E53
; RULE: value: NUMBER: (2)
	LDA #$02; 0E56
	ORA $D015; 0E58
	STA $D015; 0E5B
	JMP LBL1L64; 0E5E
LBL1L63:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01; 0E61
; RULE: statement: ID init
	STA $0341; 0E63
; =========================================================
; RULE: value: NUMBER: (2)
	LDA #$02; 0E66
	EOR #$FF; 0E68
	AND $D015; 0E6A
	STA $D015; 0E6D
; RULE: value: NUMBER: (1)
	LDA #$01; 0E70
	ORA $D015; 0E72
	STA $D015; 0E75
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L64:
	RTS; 0E78
; RULE: datatype: void
; ======================== delayfunction ========================
LBL0L8:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L65:
	PHA; 0E79
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; ldx
; u0
	LDA #$00; 0E7A
; RULE: statement: datatype ID init
; WORD ldx=A datatype#: 00
	LDX #$00; 0E7C
	STA $034C; 0E7E
	STX $034D; 0E81
; ---------------------------------------------------------
; WordID
; $034C
;  vs. 
; WordID
; $0342
LBL1L66:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD ID
; =========================================================
	LDA $034D; 0E84
	CMP $0343; 0E87
	.BYTE #$D0, #$06; 0E8A
	LDA $034C; 0E8C
	CMP $0342; 0E8F
	.BYTE #$B0, #$03; BCS +3; 0E92
	JMP LBL1L68; if c==0 jump to BODY; 0E94
	JMP LBL1L69; jump out of FOR; 0E97
; =========================================================
; ---------------------------------------------------------
LBL1L67:
; RULE: value: NUMBER: (1)
; $034C (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0E9A
	LDA #$01; 0E9B
	ADC $034C; 0E9D
	PHA; 0EA0
	LDA #$00; 0EA1
	ADC $034D; 0EA3
	TAX; 0EA6
	PLA; 0EA7
; RULE: init: '=' expression
; ldx
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034C; 0EA8
	STX $034D; 0EAB
	JMP LBL1L66; jump to top of FOR loop; 0EAE
; ---------------------------------------------------------
LBL1L68:
	NOP; 0EB1
; ---------------------------------------------------------
	JMP LBL1L67; jump to iterator; 0EB2
LBL1L69:
	PLA; 0EB5
; ---------------------------------------------------------
	RTS; 0EB6
; RULE: datatype: void
; ======================== checkIfStanding ========================
LBL0L9:
; RULE: datatype: word
; RULE: init: '=' expression
; myX
; $0344
; RULE: statement: datatype ID init
; WORD myX=$0344 datatype#: 02
	LDA $0344; 0EB7
	LDX $0345; 0EBA
	STA $034E; 0EBD
	STX $034F; 0EC0
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; myY
; $0346
; RULE: statement: datatype ID init
; UINT myY=$0346 datatype#: 00
; UINT UintID UintID
	LDA $0346; 0EC3
	STA $0350; 0EC6
; =========================================================
; =========================================================
;                         lsr(ID) [word]
; =========================================================
	LSR $034F; 0EC9
	ROR $034E; 0ECC
; =========================================================
; RULE: datatype: uint
	LDA $034E; 0ECF
; RULE: init: '=' expression
; XXX
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT XXX=A datatype#: 00
; UINT UintID A
	STA $0351; 0ED2
; =========================================================
; RULE: value: NUMBER: (6)
; $0351 (0) - u6 (-1)
; UintID arith UintIMM
	LDA $0351; 0ED5
	SEC; 0ED8
	SBC #$06; 0ED9
; RULE: init: '=' expression
; XXX
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0351; 0EDB
; =========================================================
; RULE: value: NUMBER: (29)
; $0350 (0) - u29 (-1)
; UintID arith UintIMM
	LDA $0350; 0EDE
	SEC; 0EE1
	SBC #$1D; 0EE2
; RULE: init: '=' expression
; myY
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0350; 0EE4
; =========================================================
	LDA $0351; 0EE7
	STA $FA; 0EEA
	LDA #$00; 0EEC
	STA $FB; 0EEE
	LDA $0350; 0EF0
	STA $FC; 0EF3
	JSR GETPLOT; 0EF5
	LDY #$00; 0EF8
	LDA ($02),Y; 0EFA
; RULE: init: '=' expression
; standing
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0340; 0EFC
; =========================================================
; RULE: value: NUM: (0x3C)
; RULE: value: NUM: (0x3C)->(u60)
	LDA #$3C; 0EFF
	AND $0340; 0F01
; RULE: init: '=' expression
; standing
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0340; 0F04
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L70:
; RULE: value: NUMBER: (20)
; UintID
; $0340
;  vs. 
; UintIMM
; u20
LBL1L71:			; Top of IF statement
	LDA $0340; 0F07
	CMP #$14; 0F0A
	.BYTE #$D0, #$03; 0F0C
	JMP LBL1L73; if z==1 jump to ELSE; 0F0E
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L72:
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; standing
; u0
	LDA #$00; 0F11
; RULE: statement: ID init
	STA $0340; 0F13
; =========================================================
	JMP LBL1L74; 0F16
LBL1L73:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L74:
	RTS; 0F19
; RULE: datatype: void
; ======================== cr ========================
LBL0L10:
; RULE: value: NUM: (0x0D)
; RULE: value: NUM: (0x0D)->(u13)
	LDA #$0D; 0F1A
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 0F1C
	RTS; 0F1F
; RULE: datatype: void
; ======================== sp ========================
LBL0L11:
; RULE: value: NUM: (0x20)
; RULE: value: NUM: (0x20)->(u32)
	LDA #$20; 0F20
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 0F22
	RTS; 0F25
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L12:
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D011; 0F26
; RULE: init: '=' expression
; oldD011
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $0352; 0F29
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D016; 0F2C
; RULE: init: '=' expression
; oldD016
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $0353; 0F2F
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D018; 0F32
; RULE: init: '=' expression
; oldD018
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $0354; 0F35
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D020; 0F38
; RULE: init: '=' expression
; oldD020
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $0355; 0F3B
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D021; 0F3E
; RULE: init: '=' expression
; oldD021
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $0356; 0F41
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $0286; 0F44
; RULE: init: '=' expression
; oldChar
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $0357; 0F47
; =========================================================
	RTS; 0F4A
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L13:
	LDA $0352; oldD011; 0F4B
	STA $D011; 0F4E
	LDA $0353; oldD016; 0F51
	STA $D016; 0F54
	LDA $0354; oldD018; 0F57
	STA $D018; 0F5A
	LDA $0355; oldD020; 0F5D
	STA $D020; 0F60
	LDA $0356; oldD021; 0F63
	STA $D021; 0F66
	LDA $0357; oldChar; 0F69
	STA $0286; 0F6C
	RTS; 0F6F
; RULE: datatype: void
; ======================== calculatejump ========================
LBL0L14:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L75:
; RULE: value: NUMBER: (2)
; UintID
; $033F
;  vs. 
; UintIMM
; u2
LBL1L76:			; Top of IF statement
	LDA $033F; 0F70
	CMP #$02; 0F73
	.BYTE #$F0, #$03; BEQ +3; 0F75
	JMP LBL1L78; jump to ELSE; 0F77
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L77:
; RULE: value: NUMBER: (2)
; $0344 (2) + u2 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0F7A
	LDA #$02; 0F7B
	ADC $0344; 0F7D
	PHA; 0F80
	LDA #$00; 0F81
	ADC $0345; 0F83
	TAX; 0F86
	PLA; 0F87
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0344; 0F88
	STX $0345; 0F8B
; =========================================================
	JMP LBL1L79; 0F8E
LBL1L78:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (2)
; $0344 (2) - u2 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 0F91
	LDA $0344; 0F92
	SBC #$02; 0F95
	PHA; 0F97
	LDA $0345; 0F98
	SBC #$00; 0F9B
	TAX; 0F9D
	PLA; 0F9E
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0344; 0F9F
	STX $0345; 0FA2
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L79:
; Dereference: jt
	LDA $0336; 0FA5
	STA LBL1L80; 0FA8
	LDA $0337; 0FAB
	STA LBL1L80+1; 0FAE
	LDX $0338; 0FB1
	.BYTE #$BD; 0FB4
LBL1L80:
	.BYTE #$00; 0FB5
	.BYTE #$00; 0FB6
; $0346 (0) + A (-1)
	CLC; 0FB7
	ADC $0346; 0FB8
; RULE: init: '=' expression
; y
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0346; 0FBB
; =========================================================
	JSR LBL0L9; checkIfStanding(); 0FBE
	; VOID functions do NOT return a value; 0FC1
; inc(ID)
	INC $0338; 0FC1
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L81:
; RULE: value: NUMBER: (0)
; UintID
; $0340
;  vs. 
; UintIMM
; u0
LBL1L82:			; Top of IF statement
	LDA $0340; 0FC4
	CMP #$00; 0FC7
	.BYTE #$D0, #$03; 0FC9
	JMP LBL1L84; if z==1 jump to ELSE; 0FCB
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L83:
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; midjump
; u0
	LDA #$00; 0FCE
; RULE: statement: ID init
	STA $0338; 0FD0
; =========================================================
	JMP LBL1L85; 0FD3
LBL1L84:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L85:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L86:
; RULE: value: NUMBER: (25)
; UintID
; $0338
;  vs. 
; UintIMM
; u25
LBL1L87:			; Top of IF statement
	LDA $0338; 0FD6
	CMP #$19; 0FD9
	.BYTE #$F0, #$03; BEQ +3; 0FDB
	JMP LBL1L89; jump to ELSE; 0FDD
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L88:
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; midjump
; u0
	LDA #$00; 0FE0
; RULE: statement: ID init
	STA $0338; 0FE2
; =========================================================
	JMP LBL1L90; 0FE5
LBL1L89:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L90:
	RTS; 0FE8
; RULE: datatype: void
; ======================== createplatforms ========================
LBL0L15:
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; p1
; u0
	LDA #$00; 0FE9
; RULE: statement: ID init
	STA $0339; 0FEB
; =========================================================
; RULE: value: NUMBER: (190)
; RULE: init: '=' expression
; p2
; u190
	LDA #$BE; 0FEE
; RULE: statement: ID init
	STA $033A; 0FF0
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; p3
; u160
	LDA #$A0; 0FF3
; RULE: statement: ID init
	STA $033B; 0FF5
; =========================================================
; RULE: value: NUMBER: (200)
; RULE: init: '=' expression
; p4
; u200
	LDA #$C8; 0FF8
; RULE: statement: ID init
	STA $033C; 0FFA
; =========================================================
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; p5
; u1
	LDA #$01; 0FFD
; RULE: statement: ID init
	STA $033D; 0FFF
; =========================================================
	JSR LBL0L16; rect(); 1002
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; p1
; u0
	LDA #$00; 1005
; RULE: statement: ID init
	STA $0339; 1007
; =========================================================
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; p2
; u0
	LDA #$00; 100A
; RULE: statement: ID init
	STA $033A; 100C
; =========================================================
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; p3
; u1
	LDA #$01; 100F
; RULE: statement: ID init
	STA $033B; 1011
; =========================================================
; RULE: value: NUMBER: (200)
; RULE: init: '=' expression
; p4
; u200
	LDA #$C8; 1014
; RULE: statement: ID init
	STA $033C; 1016
; =========================================================
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; p5
; u1
	LDA #$01; 1019
; RULE: statement: ID init
	STA $033D; 101B
; =========================================================
	JSR LBL0L16; rect(); 101E
; RULE: value: NUMBER: (159)
; RULE: init: '=' expression
; p1
; u159
	LDA #$9F; 1021
; RULE: statement: ID init
	STA $0339; 1023
; =========================================================
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; p2
; u0
	LDA #$00; 1026
; RULE: statement: ID init
	STA $033A; 1028
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; p3
; u160
	LDA #$A0; 102B
; RULE: statement: ID init
	STA $033B; 102D
; =========================================================
; RULE: value: NUMBER: (200)
; RULE: init: '=' expression
; p4
; u200
	LDA #$C8; 1030
; RULE: statement: ID init
	STA $033C; 1032
; =========================================================
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; p5
; u1
	LDA #$01; 1035
; RULE: statement: ID init
	STA $033D; 1037
; =========================================================
	JSR LBL0L16; rect(); 103A
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; p1
; u0
	LDA #$00; 103D
; RULE: statement: ID init
	STA $0339; 103F
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; p2
; u160
	LDA #$A0; 1042
; RULE: statement: ID init
	STA $033A; 1044
; =========================================================
; RULE: value: NUMBER: (40)
; RULE: init: '=' expression
; p3
; u40
	LDA #$28; 1047
; RULE: statement: ID init
	STA $033B; 1049
; =========================================================
; RULE: value: NUMBER: (161)
; RULE: init: '=' expression
; p4
; u161
	LDA #$A1; 104C
; RULE: statement: ID init
	STA $033C; 104E
; =========================================================
	JSR LBL0L16; rect(); 1051
; RULE: value: NUMBER: (40)
; RULE: init: '=' expression
; p1
; u40
	LDA #$28; 1054
; RULE: statement: ID init
	STA $0339; 1056
; =========================================================
; RULE: value: NUMBER: (150)
; RULE: init: '=' expression
; p2
; u150
	LDA #$96; 1059
; RULE: statement: ID init
	STA $033A; 105B
; =========================================================
; RULE: value: NUMBER: (41)
; RULE: init: '=' expression
; p3
; u41
	LDA #$29; 105E
; RULE: statement: ID init
	STA $033B; 1060
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; p4
; u160
	LDA #$A0; 1063
; RULE: statement: ID init
	STA $033C; 1065
; =========================================================
	JSR LBL0L16; rect(); 1068
; RULE: value: NUMBER: (150)
; RULE: init: '=' expression
; p2
; u150
	LDA #$96; 106B
; RULE: statement: ID init
	STA $033A; 106D
; =========================================================
; RULE: value: NUMBER: (80)
; RULE: init: '=' expression
; p3
; u80
	LDA #$50; 1070
; RULE: statement: ID init
	STA $033B; 1072
; =========================================================
; RULE: value: NUMBER: (151)
; RULE: init: '=' expression
; p4
; u151
	LDA #$97; 1075
; RULE: statement: ID init
	STA $033C; 1077
; =========================================================
	JSR LBL0L16; rect(); 107A
; RULE: value: NUMBER: (90)
; RULE: init: '=' expression
; p1
; u90
	LDA #$5A; 107D
; RULE: statement: ID init
	STA $0339; 107F
; =========================================================
; RULE: value: NUMBER: (150)
; RULE: init: '=' expression
; p2
; u150
	LDA #$96; 1082
; RULE: statement: ID init
	STA $033A; 1084
; =========================================================
; RULE: value: NUMBER: (120)
; RULE: init: '=' expression
; p3
; u120
	LDA #$78; 1087
; RULE: statement: ID init
	STA $033B; 1089
; =========================================================
; RULE: value: NUMBER: (151)
; RULE: init: '=' expression
; p4
; u151
	LDA #$97; 108C
; RULE: statement: ID init
	STA $033C; 108E
; =========================================================
	JSR LBL0L16; rect(); 1091
	RTS; 1094
; RULE: datatype: void
; ======================== rect ========================
LBL0L16:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L91:
	PHA; 1095
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; rx
; $0339
; RULE: statement: datatype ID init
; UINT rx=$0339 datatype#: 00
; UINT UintID UintID
	LDA $0339; 1096
	STA $0358; 1099
; ---------------------------------------------------------
; UintID
; $0358
;  vs. 
; UintID
; $033B
LBL1L92:			; Top of FOR Loop
	LDA $0358; 109C
	CMP $033B; 109F
	.BYTE #$B0, #$03; BCS +3; 10A2
	JMP LBL1L94; if c==0 jump to BODY; 10A4
	JMP LBL1L95; jump out of FOR; 10A7
; =========================================================
; ---------------------------------------------------------
LBL1L93:
; inc(ID)
	INC $0358; 10AA
	JMP LBL1L92; jump to top of FOR loop; 10AD
; ---------------------------------------------------------
LBL1L94:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL2L28:
	PHA; 10B0
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; ry
; $033A
; RULE: statement: datatype ID init
; UINT ry=$033A datatype#: 00
; UINT UintID UintID
	LDA $033A; 10B1
	STA $0359; 10B4
; ---------------------------------------------------------
; UintID
; $0359
;  vs. 
; UintID
; $033C
LBL2L29:			; Top of FOR Loop
	LDA $0359; 10B7
	CMP $033C; 10BA
	.BYTE #$B0, #$03; BCS +3; 10BD
	JMP LBL2L31; if c==0 jump to BODY; 10BF
	JMP LBL2L32; jump out of FOR; 10C2
; =========================================================
; ---------------------------------------------------------
LBL2L30:
; inc(ID)
	INC $0359; 10C5
	JMP LBL2L29; jump to top of FOR loop; 10C8
; ---------------------------------------------------------
LBL2L31:
; MCPLOT [uint   word|uint   uintT
	LDA $0358; 10CB
	STA $FA; 10CE
	LDA $0359; 10D0
	STA $FC; 10D3
	JSR MCPLOT; 10D5
	LDA $033D; 10D8
	STA $FD; 10DB
; =========================================================
; ---------------------------------------------------------
	JMP LBL2L30; jump to iterator; 10DD
LBL2L32:
	PLA; 10E0
; ---------------------------------------------------------
; ---------------------------------------------------------
	JMP LBL1L93; jump to iterator; 10E1
LBL1L95:
	PLA; 10E4
; ---------------------------------------------------------
	RTS; 10E5
; vvv------------------------------------vvv
; vvv from p164 of Advanced Machine Code vvv
; vvv  Programming for the Commodore 64  vvv
; vvv w/ some changes to deal with banks vvv
; vvv------------------------------------vvv
;
; x = $FA, y = $FC, colour = $FD
; STORE is at $FE(l), $FF(h)
; LOC is at $02(l), $03(h)
MCPLOT:
	SEI; 10E6
	LDA $FA; xcoord; 10E7
	AND #$03; 10E9
	STA $FE; store; 10EB
	LDA #$00; 10ED
	STA $02; loc; 10EF
	STA $FF; store + 1; 10F1
	LDA $FD; colcode; 10F3
	CLC; 10F5
	ROR; 10F6
	ROR; 10F7
	ROR; 10F8
	DEC $FE; store; 10F9
	.BYTE #$10, #$FA; 10FB
	STA $50; mask; 10FD
	LDA $FA; xcoord; 10FF
	AND #$FC; 1101
	ASL; 1103
	ROL $FF; store + 1; 1104
	STA $FE; store; 1106
	LDA $FC; ycoord; 1108
	LSR; 110A
	LSR; 110B
	LSR; 110C
	STA $03; loc + 1; 110D
	LSR; 110F
	ROR $02; loc; 1110
	LSR; 1112
	ROR $02; loc; 1113
	CLC; 1115
	ADC $03; loc + 1; 1116
	STA $03; loc + 1; 1118
	LDA $FC; ycoord; 111A
	AND #$07; 111C
	ADC $02; loc; 111E
	ADC $FE; store ; 1120
	STA $02; loc; 1122
	LDA $03; loc + 1; 1124
	ADC $FF; store + 1; 1126
	STA $22; tmpstore; 1128
; These subroutines I added to calculate the addresses based on VICII settings
	JSR BNKMEM; 112A
	PLA; 112D
	CLC; 112E
	ADC $22;; 112F
	STA $22; tmpstore; 1131
	JSR BMPMEM; 1133
	PLA; 1136
	CLC; 1137
	ADC $22; tmpstore; 1138
	STA $03; loc + 1; 113A
	LDY #$00; 113C
	LDA ($02),Y; 113E
	ORA $50; mask; 1140
	STA ($02),Y; 1142
	CLI; 1144
	RTS; 1145
; ^^^------------------------------------^^^
; ^^^ from p164 of Advanced Machine Code ^^^
; ^^^  Programming for the Commodore 64  ^^^
; ^^^ w/ some changes to deal with banks ^^^
; ^^^------------------------------------^^^
; vvv------------------------------------vvv
; vvv from p164 of Advanced Machine Code vvv
; vvv  Programming for the Commodore 64  vvv
; vvv w/ some changes to deal with banks vvv
; vvv------------------------------------vvv
;       L    H
; x = ($FA, $FB), y = $FC
GETPLOT:
	SEI; 1146
	LDA $FA; 1147
	AND #$03; 1149
	STA $5C; 114B
	LDA #$00; 114D
	STA $02; 114F
	STA $5D; 1151
	LDA $FD; 1153
	CLC; 1155
	ROR; 1156
	ROR; 1157
	ROR; 1158
	DEC $5C; 1159
	.BYTE #$10, #$FA; 115B
	STA $50; 115D
	LDA $FA; 115F
	AND #$FC; 1161
	ASL; 1163
	ROL $5D; 1164
	STA $5C; 1166
	LDA $FC; 1168
	LSR; 116A
	LSR; 116B
	LSR; 116C
	STA $03; 116D
	LSR; 116F
	ROR $02; 1170
	LSR; 1172
	ROR $02; 1173
	CLC; 1175
	ADC $03; 1176
	STA $03; 1178
	LDA $FC; 117A
	AND #$07; 117C
	ADC $02; 117E
	ADC $5C; 1180
	STA $02; 1182
	LDA $03; 1184
	ADC $5D; 1186
	STA $03; 1188
	JSR BNKMEM; 118A
	PLA; 118D
	CLC; 118E
	ADC $03; 118F
	STA $03; 1191
	JSR BMPMEM; 1193
	PLA; 1196
	CLC; 1197
	ADC $03; 1198
	STA $03; 119A
	CLI; 119C
	RTS; 119D
; ^^^------------------------------------^^^
; ^^^ from p164 of Advanced Machine Code ^^^
; ^^^  Programming for the Commodore 64  ^^^
; ^^^ w/ some changes to deal with banks ^^^
; ^^^------------------------------------^^^
BMPMEM:		; Get the bitmap mem location from the vic II
	PLA; 119E
	STA $0334; 119F
	PLA; 11A2
	STA $0335; 11A3
	LDA $D018; 11A6
	AND #$08; 11A9
	CLC; 11AB
	ASL; 11AC
	ASL; 11AD
	PHA; 11AE
	LDA $0335; 11AF
	PHA; 11B2
	LDA $0334; 11B3
	PHA; 11B6
	RTS; 11B7
CHRMEM:		; Get the character mem location from the vic II
	PLA; 11B8
	STA $0334; 11B9
	PLA; 11BC
	STA $0335; 11BD
	LDA $D018; 11C0
	AND #$0E; 11C3
	CLC; 11C5
	ASL; 11C6
	ASL; 11C7
	PHA; 11C8
	LDA $0335; 11C9
	PHA; 11CC
	LDA $0334; 11CD
	PHA; 11D0
	RTS; 11D1
SCRMEM:		; Get the screen mem location from the vic II
	PLA; 11D2
	STA $0334; 11D3
	PLA; 11D6
	STA $0335; 11D7
	LDA $D018; 11DA
	AND #$F0; 11DD
	CLC; 11DF
	LSR; 11E0
	LSR; 11E1
	PHA; 11E2
	LDA $0335; 11E3
	PHA; 11E6
	LDA $0334; 11E7
	PHA; 11EA
	RTS; 11EB
BNKMEM:		; Get the bank memory from the vic II
	PLA; 11EC
	STA $0334; 11ED
	PLA; 11F0
	STA $0335; 11F1
	LDA $DD00; 11F4
	EOR #$FF; 11F7
	AND #$03; 11F9
	CLC; 11FB
	ASL; 11FC
	ASL; 11FD
	ASL; 11FE
	ASL; 11FF
	ASL; 1200
	ASL; 1201
	PHA; 1202
	LDA $0335; 1203
	PHA; 1206
	LDA $0334; 1207
	PHA; 120A
	RTS; 120B
CLS:		; Clear Screen Routine
	LDA #$20; 120C
	LDX #$00; 120E
; top-of-loop
	STA $0400,X; 1210
	STA $0500,X; 1213
	STA $0600,X; 1216
	STA $06E8,X; 1219
	DEX; 121C
	.BYTE #$D0, #$F1; 121D
	RTS; 121F
MOBCPY:		; Copy 63 bytes from $FB/$FC to $FD/$FE
	SEI; 1220
	CLC; 1221
	LDA #$01; 1222
	ADC $FB; 1224
	STA $FB; 1226
	LDA #$00; 1228
	ADC $FC; 122A
	STA $FC; 122C
	LDY #$3F; 122E
; top-of-loop
MOBCPTOP:
	CPY #$FF; 1230
	.BYTE #$F0, #$08; BEQ +8; 1232
	LDA ($FB),Y; 1234
	STA ($FD),Y; 1236
	DEY; 1238
	JMP MOBCPTOP; 1239
; bottom-of-loop
	CLI; 123C
	RTS; 123D
PRN:
	LDY #$00; 123E
PRN_LOOP:
	LDA ($02),Y; 1240
	CMP #$00; 1242
	BEQ PRN_END; 1244
	JSR $FFD2; 1246
	INY; 1249
	JMP PRN_LOOP; 124A
PRN_END:
	RTS; 124D
; $124e			"O  :  MOVE RIGHT\nU  :  MOVE LEFT\nSPACE  :  JUMP"
STRLBL0:
	.BYTE #$4F, #$20, #$20, #$3A, #$20, #$20, #$4D, #$4F, #$56, #$45, #$20, #$52, #$49, #$47, #$48, #$54, #$0D, #$55, #$20, #$20, #$3A, #$20, #$20, #$4D, #$4F, #$56, #$45, #$20, #$4C, #$45, #$46, #$54, #$0D, #$53, #$50, #$41, #$43, #$45, #$20, #$20, #$3A, #$20, #$20, #$4A, #$55, #$4D, #$50, #$00
