; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; uint : lastdirectiontaken : $0336 (822)
; uint : recentjump : $0337 (823)
; uint : standing : $0338 (824)
; uint : whichsprite : $0339 (825)
; word : delay : $033A (826)
; word : x : $033C (828)
; uint : y : $033E (830)
; word : mem : $033F (831)
; word : cmem : $0341 (833)
; uint : j : $0343 (835)
; uint : i : $0344 (836)
; uint : oldD011 : $0345 (837)
; uint : oldD016 : $0346 (838)
; uint : oldD018 : $0347 (839)
; uint : oldD020 : $0348 (840)
; uint : oldD021 : $0349 (841)
; uint : oldChar : $034A (842)
; uint : dfSTART : $034B (843)
; uint : dfEND : $034C (844)
; uint : dfCOLOR : $034D (845)
; uint : dfY : $034E (846)
; uint : timer : $034F (847)
; uint : c : $0350 (848)
; uint : r : $0351 (849)
; uint : r1 : $0352 (850)
; uint : r2 : $0353 (851)
; word : mem1 : $0354 (852)
; uint : pausev : $0356 (854)
; uint : jumpclock : $0357 (855)
; word : ldx : $0358 (856)
; word : myX : $035A (858)
; uint : myY : $035C (860)
; uint : streturn : $035D (861)
; uint : dfIT : $035E (862)
; RULE: datatype: void
.org $0834
; =========================================================
;                         main()
; =========================================================
; =========================================================
;                         cls()
; =========================================================
	JSR CLS; cls(); 0834
	JSR LBL0L6; clearhires(); 0837
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; lastdirectiontaken
; u0
	LDA #$00; 083A
; UINT lastdirectiontaken=A datatype#: 00
; UINT UintID A
	STA $0336; 083C
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; recentjump
; u0
	LDA #$00; 083F
; UINT recentjump=A datatype#: 00
; UINT UintID A
	STA $0337; 0841
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; standing
; u0
	LDA #$00; 0844
; UINT standing=A datatype#: 00
; UINT UintID A
	STA $0338; 0846
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01; 0849
; UINT whichsprite=A datatype#: 00
; UINT UintID A
	STA $0339; 084B
; =========================================================
; RULE: datatype: word
; RULE: value: NUM: (0x00CC)
; RULE: value: NUM: (0x00CC)->(w204)
; RULE: init: '=' expression
; delay
; w204
; unknown type
; w204
; WORD delay=w204 datatype#: 02
	LDA #$CC; 084E
	LDX #$00; 0850
	STA $033A; 0852
	STX $033B; 0855
; =========================================================
; RULE: datatype: word
; RULE: value: NUM: (0x0020)
; RULE: value: NUM: (0x0020)->(w32)
; RULE: init: '=' expression
; x
; w32
; unknown type
; w32
; WORD x=w32 datatype#: 02
	LDA #$20; 0858
	LDX #$00; 085A
	STA $033C; 085C
	STX $033D; 085F
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (100)
; RULE: init: '=' expression
; y
; u100
	LDA #$64; 0862
; UINT y=A datatype#: 00
; UINT UintID A
	STA $033E; 0864
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (240)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (10)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (8)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (64)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (93)
; RULE: value: NUMBER: (80)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (20)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (29)
; RULE: value: NUMBER: (6)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (162)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (162)
; RULE: value: NUMBER: (128)
; RULE: init: '=' expression
; sprite1
; m
; MOB
; MOB sprite1=m datatype#: 00
	LDA #$C0; 0867
	STA $07F8; 0869
	JSR LBL1L0; 086C
sprite1:
	.BYTE #$00, #$00, #$00, #$00, #$0F, #$00, #$00, #$3F, #$F0, #$00, #$3F, #$00, #$00, #$EA, #$00, #$00, #$0A, #$00, #$00, #$08, #$00, #$00, #$15, #$00, #$00, #$55, #$40, #$01, #$5D, #$50, #$01, #$55, #$14, #$01, #$1D, #$06, #$01, #$15, #$00, #$01, #$2A, #$00, #$02, #$2A, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$A2, #$80, #$00, #$A2, #$80
LBL1L0:
	PLA; 08AE
	STA $FB; 08AF
	PLA; 08B1
	STA $FC; 08B2
	INC $FB; 08B4
	LDA #$00; 08B6
	STA $FD; 08B8
	LDA #$30; 08BA
	STA $FE; 08BC
	JSR MOBCPY; 08BE
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (193)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (240)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (10)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (8)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (64)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (93)
; RULE: value: NUMBER: (80)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (20)
; RULE: value: NUMBER: (5)
; RULE: value: NUMBER: (29)
; RULE: value: NUMBER: (6)
; RULE: value: NUMBER: (4)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (4)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (8)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (40)
; RULE: value: NUMBER: (160)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (40)
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; sprite2
; m
; MOB
; MOB sprite2=m datatype#: 00
	LDA #$C2; 08C1
	STA $07F9; 08C3
	JSR LBL1L1; 08C6
sprite2:
	.BYTE #$00, #$00, #$00, #$00, #$0F, #$00, #$00, #$3F, #$F0, #$00, #$3F, #$00, #$00, #$EA, #$00, #$00, #$0A, #$00, #$00, #$08, #$00, #$00, #$15, #$00, #$00, #$55, #$40, #$01, #$5D, #$50, #$01, #$55, #$14, #$05, #$1D, #$06, #$04, #$15, #$00, #$04, #$2A, #$00, #$08, #$2A, #$00, #$00, #$22, #$00, #$00, #$20, #$80, #$00, #$20, #$80, #$00, #$20, #$80, #$00, #$28, #$A0, #$00, #$28, #$A0
LBL1L1:
	PLA; 0908
	STA $FB; 0909
	PLA; 090B
	STA $FC; 090C
	INC $FB; 090E
	LDA #$80; 0910
	STA $FD; 0912
	LDA #$30; 0914
	STA $FE; 0916
	JSR MOBCPY; 0918
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $033C );
	LDA $033C; 091B
	STA $D000; 091E
	LDA $033D; 0921
	STA $2A; 0924
	LDA #$01; 0926
	EOR #$FF; 0928
	AND $D010; 092A
	STA $A7; 092D
	LDA $2A; 092F
	CLC; 0931
	ADC $A7; 0932
	STA $D010; 0934
; RULE: value: NUMBER: (0)
; spritey( u0, $033E );
	LDA $033E; 0937
	STA $D001; 093A
; RULE: value: NUMBER: (1)
; spritex( u1, $033C );
	LDA $033C; 093D
	STA $D002; 0940
	LDA $033D; 0943
	STA $2A; 0946
	LDA #$01; 0948
	ASL; 094A
	ASL $2A; 094B
	EOR #$FF; 094D
	AND $D010; 094F
	STA $A7; 0952
	LDA $2A; 0954
	CLC; 0956
	ADC $A7; 0957
	STA $D010; 0959
; RULE: value: NUMBER: (1)
; spritey( u1, $033E );
	LDA $033E; 095C
	STA $D003; 095F
	LDA #$07; 0962
	STA $D01C; 0964
; RULE: value: NUMBER: (1)
	LDA #$01; 0967
	ORA $D015; 0969
	STA $D015; 096C
	LDA #$06; 096F
	STA $D025; 0971
	LDA #$04; 0974
	STA $D026; 0976
	LDA #$07; 0979
	STA $D027; 097B
	LDA #$07; 097E
	STA $D028; 0980
; RULE: datatype: word
; RULE: value: NUM: (0x3E00)
; RULE: value: NUM: (0x3E00)->(w15872)
; RULE: init: '=' expression
; mem
; w15872
; unknown type
; w15872
; WORD mem=w15872 datatype#: 02
	LDA #$00; 0983
	LDX #$3E; 0985
	STA $033F; 0987
	STX $0340; 098A
; =========================================================
; RULE: datatype: word
; RULE: value: NUM: (0x07C0)
; RULE: value: NUM: (0x07C0)->(w1984)
; RULE: init: '=' expression
; cmem
; w1984
; unknown type
; w1984
; WORD cmem=w1984 datatype#: 02
	LDA #$C0; 098D
	LDX #$07; 098F
	STA $0341; 0991
	STX $0342; 0994
; =========================================================
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L2:
	PHA; 0997
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; j
; u0
	LDA #$00; 0998
; UINT j=A datatype#: 00
; UINT UintID A
	STA $0343; 099A
; ---------------------------------------------------------
; RULE: value: NUMBER: (40)
; UintID
; $0343
;  vs. 
; UintIMM
; u40
LBL1L3:			; Top of FOR Loop
	LDA $0343; 099D
	CMP #$28; 09A0
	.BYTE #$B0, #$03; 09A2
	JMP LBL1L5; if c==0 jump to BODY; 09A4
	JMP LBL1L6; jump out of FOR; 09A7
; =========================================================
; ---------------------------------------------------------
LBL1L4:
; inc(ID)
	INC $0343; 09AA
	JMP LBL1L3; jump to top of FOR loop; 09AD
; ---------------------------------------------------------
LBL1L5:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL2L0:
	PHA; 09B0
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; i
; u0
	LDA #$00; 09B1
; UINT i=A datatype#: 00
; UINT UintID A
	STA $0344; 09B3
; ---------------------------------------------------------
; RULE: value: NUMBER: (7)
; UintID
; $0344
;  vs. 
; UintIMM
; u7
LBL2L1:			; Top of FOR Loop
	LDA $0344; 09B6
	CMP #$07; 09B9
	.BYTE #$B0, #$03; 09BB
	JMP LBL2L3; if c==0 jump to BODY; 09BD
	JMP LBL2L4; jump out of FOR; 09C0
; =========================================================
; ---------------------------------------------------------
LBL2L2:
; inc(ID)
	INC $0344; 09C3
	JMP LBL2L1; jump to top of FOR loop; 09C6
; ---------------------------------------------------------
LBL2L3:
	JSR LBL0L3; generateLand(); 09C9
	JSR LBL0L1; incMem(); 09CC
; ---------------------------------------------------------
	JMP LBL2L2; jump to iterator; 09CF
LBL2L4:
	PLA; 09D2
; ---------------------------------------------------------
	JSR LBL0L4; generateBottom(); 09D3
	JSR LBL0L1; incMem(); 09D6
	JSR LBL0L5; generateColours(); 09D9
	JSR LBL0L2; incCmem(); 09DC
; ---------------------------------------------------------
	JMP LBL1L4; jump to iterator; 09DF
LBL1L6:
	PLA; 09E2
; ---------------------------------------------------------
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D011; 09E3
; RULE: init: '=' expression
; oldD011
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $0345; 09E6
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D016; 09E9
; RULE: init: '=' expression
; oldD016
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $0346; 09EC
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D018; 09EF
; RULE: init: '=' expression
; oldD018
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $0347; 09F2
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D020; 09F5
; RULE: init: '=' expression
; oldD020
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $0348; 09F8
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D021; 09FB
; RULE: init: '=' expression
; oldD021
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $0349; 09FE
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $0286; 0A01
; RULE: init: '=' expression
; oldChar
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $034A; 0A04
; =========================================================
	LDA #$3B; 0A07
	STA $D011; 0A09
	LDA #$18; 0A0C
	STA $D016; 0A0E
	LDA #$18; 0A11
	STA $D018; 0A13
	LDA #$00; 0A16
	STA $D020; 0A18
	LDA #$00; 0A1B
	STA $D021; 0A1D
; RULE: datatype: uint
; RULE: value: NUMBER: (20)
; RULE: init: '=' expression
; dfSTART
; u20
	LDA #$14; 0A20
; UINT dfSTART=A datatype#: 00
; UINT UintID A
	STA $034B; 0A22
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (70)
; RULE: init: '=' expression
; dfEND
; u70
	LDA #$46; 0A25
; UINT dfEND=A datatype#: 00
; UINT UintID A
	STA $034C; 0A27
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (3)
; RULE: init: '=' expression
; dfCOLOR
; u3
	LDA #$03; 0A2A
; UINT dfCOLOR=A datatype#: 00
; UINT UintID A
	STA $034D; 0A2C
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (130)
; RULE: init: '=' expression
; dfY
; u130
	LDA #$82; 0A2F
; UINT dfY=A datatype#: 00
; UINT UintID A
	STA $034E; 0A31
; =========================================================
	JSR LBL0L14; drawFloor(); 0A34
; RULE: value: NUMBER: (60)
; RULE: init: '=' expression
; dfSTART
; u60
	LDA #$3C; 0A37
; RULE: statement: ID init
	STA $034B; 0A39
; =========================================================
; RULE: value: NUMBER: (120)
; RULE: init: '=' expression
; dfEND
; u120
	LDA #$78; 0A3C
; RULE: statement: ID init
	STA $034C; 0A3E
; =========================================================
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; dfCOLOR
; u2
	LDA #$02; 0A41
; RULE: statement: ID init
	STA $034D; 0A43
; =========================================================
; RULE: value: NUMBER: (150)
; RULE: init: '=' expression
; dfY
; u150
	LDA #$96; 0A46
; RULE: statement: ID init
	STA $034E; 0A48
; =========================================================
	JSR LBL0L14; drawFloor(); 0A4B
; RULE: value: NUMBER: (80)
; RULE: init: '=' expression
; dfSTART
; u80
	LDA #$50; 0A4E
; RULE: statement: ID init
	STA $034B; 0A50
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; dfEND
; u160
	LDA #$A0; 0A53
; RULE: statement: ID init
	STA $034C; 0A55
; =========================================================
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; dfCOLOR
; u1
	LDA #$01; 0A58
; RULE: statement: ID init
	STA $034D; 0A5A
; =========================================================
; RULE: value: NUMBER: (170)
; RULE: init: '=' expression
; dfY
; u170
	LDA #$AA; 0A5D
; RULE: statement: ID init
	STA $034E; 0A5F
; =========================================================
	JSR LBL0L14; drawFloor(); 0A62
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; dfSTART
; u0
	LDA #$00; 0A65
; RULE: statement: ID init
	STA $034B; 0A67
; =========================================================
; RULE: value: NUMBER: (70)
; RULE: init: '=' expression
; dfEND
; u70
	LDA #$46; 0A6A
; RULE: statement: ID init
	STA $034C; 0A6C
; =========================================================
; RULE: value: NUMBER: (3)
; RULE: init: '=' expression
; dfCOLOR
; u3
	LDA #$03; 0A6F
; RULE: statement: ID init
	STA $034D; 0A71
; =========================================================
; RULE: value: NUMBER: (110)
; RULE: init: '=' expression
; dfY
; u110
	LDA #$6E; 0A74
; RULE: statement: ID init
	STA $034E; 0A76
; =========================================================
	JSR LBL0L14; drawFloor(); 0A79
; RULE: value: NUMBER: (60)
; RULE: init: '=' expression
; dfSTART
; u60
	LDA #$3C; 0A7C
; RULE: statement: ID init
	STA $034B; 0A7E
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; dfEND
; u160
	LDA #$A0; 0A81
; RULE: statement: ID init
	STA $034C; 0A83
; =========================================================
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; dfCOLOR
; u1
	LDA #$01; 0A86
; RULE: statement: ID init
	STA $034D; 0A88
; =========================================================
; RULE: value: NUMBER: (90)
; RULE: init: '=' expression
; dfY
; u90
	LDA #$5A; 0A8B
; RULE: statement: ID init
	STA $034E; 0A8D
; =========================================================
	JSR LBL0L14; drawFloor(); 0A90
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; timer
; u0
	LDA #$00; 0A93
; UINT timer=A datatype#: 00
; UINT UintID A
	STA $034F; 0A95
; =========================================================
; RULE: datatype: uint
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0A98
; RULE: init: '=' expression
; c
; A
; initializing an unknown with A
; unknown type
; A
; UINT c=A datatype#: 00
; UINT UintID A
	STA $0350; 0A9A
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0A9D
LBL1L7:
; ---------------------------------------------------------
; RULE: value: NUMBER: (62)
; UintID
; $0350
;  vs. 
; UintIMM
; u62
LBL1L8:			; Top of WHILE Loop
	LDA $0350; 0A9E
	CMP #$3E; 0AA1
	.BYTE #$D0, #$03; 0AA3
	JMP LBL1L10; if z==1 jump to ELSE; 0AA5
; =========================================================
LBL1L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L5:
; RULE: value: NUMBER: (0)
; UintID
; $034F
;  vs. 
; UintIMM
; u0
LBL2L6:			; Top of IF statement
	LDA $034F; 0AA8
	CMP #$00; 0AAB
	.BYTE #$F0, #$03; 0AAD
	JMP LBL2L8; jump to ELSE; 0AAF
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L7:
	JSR LBL0L13; checkIfStanding(); 0AB2
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L0:
; RULE: value: NUMBER: (0)
; UintID
; $0338
;  vs. 
; UintIMM
; u0
LBL3L1:			; Top of IF statement
	LDA $0338; 0AB5
	CMP #$00; 0AB8
	.BYTE #$F0, #$03; 0ABA
	JMP LBL3L3; jump to ELSE; 0ABC
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L2:
; RULE: value: NUMBER: (1)
; $033E (0) + u1 (-1)
; UintID arith UintIMM
	LDA $033E; 0ABF
	CLC; 0AC2
	ADC #$01; 0AC3
; RULE: init: '=' expression
; y
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $033E; 0AC5
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L0:
; RULE: value: NUMBER: (1)
; UintID
; $0337
;  vs. 
; UintIMM
; u1
LBL4L1:			; Top of IF statement
	LDA $0337; 0AC8
	CMP #$01; 0ACB
	.BYTE #$F0, #$03; 0ACD
	JMP LBL4L3; jump to ELSE; 0ACF
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L2:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L0:
; RULE: value: NUMBER: (2)
; UintID
; $0336
;  vs. 
; UintIMM
; u2
LBL5L1:			; Top of IF statement
	LDA $0336; 0AD2
	CMP #$02; 0AD5
	.BYTE #$F0, #$03; 0AD7
	JMP LBL5L3; jump to ELSE; 0AD9
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L2:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL6L0:
; RULE: value: NUMBER: (320)
; WordID
; $033C
;  vs. 
; WordIMM
; w320
LBL6L1:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $033C v. w320
	LDA $033D; 0ADC
	CMP #$01; 0ADF
	.BYTE #$D0, #$05; 0AE1
	LDA $033C; 0AE3
	CMP #$40; 0AE6
	.BYTE #$90, #$03; 0AE8
	JMP LBL6L3; jump to ELSE; 0AEA
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL6L2:
; RULE: value: NUMBER: (1)
; $033C (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0AED
	LDA #$01; 0AEE
	ADC $033C; 0AF0
	PHA; 0AF3
	LDA #$00; 0AF4
	ADC $033D; 0AF6
	TAX; 0AF9
	PLA; 0AFA
; RULE: init: '=' expression
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033C; 0AFB
	STX $033D; 0AFE
; =========================================================
	JMP LBL6L4; 0B01
LBL6L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL6L4:
	JMP LBL5L4; 0B04
LBL5L3:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL6L5:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $033C
;  vs. 
; WordIMM
; w23
LBL6L6:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $033C v. w23
	LDA $033D; 0B07
	CMP #$00; 0B0A
	.BYTE #$D0, #$05; 0B0C
	LDA $033C; 0B0E
	CMP #$17; 0B11
	.BYTE #$B0, #$03; 0B13
	JMP LBL6L8; if c==0 jump to ELSE; 0B15
	.BYTE #$D0, #$03; 0B18
	JMP LBL6L8; if z==1 jump to ELSE; 0B1A
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL6L7:
; RULE: value: NUMBER: (1)
; $033C (2) - u1 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 0B1D
	LDA $033C; 0B1E
	SBC #$01; 0B21
	PHA; 0B23
	LDA $033D; 0B24
	SBC #$00; 0B27
	TAX; 0B29
	PLA; 0B2A
; RULE: init: '=' expression
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033C; 0B2B
	STX $033D; 0B2E
; =========================================================
	JMP LBL6L9; 0B31
LBL6L8:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL6L9:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L4:
; RULE: value: NUMBER: (0)
; spritex( u0, $033C );
	LDA $033C; 0B34
	STA $D000; 0B37
	LDA $033D; 0B3A
	STA $2A; 0B3D
	LDA #$01; 0B3F
	EOR #$FF; 0B41
	AND $D010; 0B43
	STA $A7; 0B46
	LDA $2A; 0B48
	CLC; 0B4A
	ADC $A7; 0B4B
	STA $D010; 0B4D
; RULE: value: NUMBER: (1)
; spritex( u1, $033C );
	LDA $033C; 0B50
	STA $D002; 0B53
	LDA $033D; 0B56
	STA $2A; 0B59
	LDA #$01; 0B5B
	ASL; 0B5D
	ASL $2A; 0B5E
	EOR #$FF; 0B60
	AND $D010; 0B62
	STA $A7; 0B65
	LDA $2A; 0B67
	CLC; 0B69
	ADC $A7; 0B6A
	STA $D010; 0B6C
	JMP LBL4L4; 0B6F
LBL4L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L4:
; RULE: value: NUMBER: (0)
; spritey( u0, $033E );
	LDA $033E; 0B72
	STA $D001; 0B75
; RULE: value: NUMBER: (1)
; spritey( u1, $033E );
	LDA $033E; 0B78
	STA $D003; 0B7B
	JMP LBL3L4; 0B7E
LBL3L3:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; recentjump
; u0
	LDA #$00; 0B81
; RULE: statement: ID init
	STA $0337; 0B83
; =========================================================
	JSR LBL0L8; checkLeft(); 0B86
	JSR LBL0L9; checkRight(); 0B89
	JSR LBL0L10; checkJump(); 0B8C
	JSR LBL0L13; checkIfStanding(); 0B8F
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L4:
	JMP LBL2L9; 0B92
LBL2L8:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L9:
; inc(ID)
	INC $034F; 0B95
; =========================================================
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0B98
; RULE: init: '=' expression
; c
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0350; 0B9A
; =========================================================
	JMP LBL1L8; jump to top of WHILE loop; 0B9D
LBL1L10:
	PLA; 0BA0
	JSR LBL0L0; clearkb(); 0BA1
	LDA $0345; oldD011; 0BA4
	STA $D011; 0BA7
	LDA $0346; oldD016; 0BAA
	STA $D016; 0BAD
	LDA $0347; oldD018; 0BB0
	STA $D018; 0BB3
	LDA $0348; oldD020; 0BB6
	STA $D020; 0BB9
	LDA $0349; oldD021; 0BBC
	STA $D021; 0BBF
	LDA $034A; oldChar; 0BC2
	STA $0286; 0BC5
	RTS; 0BC8
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L0:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00; 0BC9
	STA $C6; ; 0BCB
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 0BCD
	RTS; 0BD0
; RULE: datatype: void
; ======================== incMem ========================
LBL0L1:
; RULE: value: NUMBER: (1)
; $033F (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0BD1
	LDA #$01; 0BD2
	ADC $033F; 0BD4
	PHA; 0BD7
	LDA #$00; 0BD8
	ADC $0340; 0BDA
	TAX; 0BDD
	PLA; 0BDE
; RULE: init: '=' expression
; mem
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033F; 0BDF
	STX $0340; 0BE2
; =========================================================
	RTS; 0BE5
; RULE: datatype: void
; ======================== incCmem ========================
LBL0L2:
; RULE: value: NUMBER: (1)
; $0341 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0BE6
	LDA #$01; 0BE7
	ADC $0341; 0BE9
	PHA; 0BEC
	LDA #$00; 0BED
	ADC $0342; 0BEF
	TAX; 0BF2
	PLA; 0BF3
; RULE: init: '=' expression
; cmem
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0341; 0BF4
	STX $0342; 0BF7
; =========================================================
	RTS; 0BFA
; RULE: datatype: void
; ======================== generateLand ========================
LBL0L3:
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; =========================================================
;            rnd(u1);
; =========================================================
	JSR SIDRND; initialize random number generator; 0BFB
	LDA $D41B; 0BFE
; RULE: init: '=' expression
; r
; A
; initializing an unknown with A
; unknown type
; A
; UINT r=A datatype#: 00
; UINT UintID A
	STA $0351; 0C01
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L11:
; RULE: value: NUMBER: (65)
; UintID
; $0351
;  vs. 
; UintIMM
; u65
LBL1L12:			; Top of IF statement
	LDA $0351; 0C04
	CMP #$41; 0C07
	.BYTE #$90, #$03; 0C09
	JMP LBL1L14; jump to ELSE; 0C0B
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L13:
; =========================================================
;                         poke mem, 170
; =========================================================
	LDA $033F; 0C0E
	STA LBL2L10; 0C11
	LDA $0340; 0C14
	STA LBL2L11; 0C17
	LDA #$AA; 0C1A
	.BYTE #$8D;	  <-- STA absolute; 0C1C
LBL2L10:			; <-- low byte
	.BYTE #$00; 0C1D
LBL2L11:			; <-- hi byte
	.BYTE #$00; 0C1E
	JMP LBL1L15; 0C1F
LBL1L14:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L12:
; RULE: value: NUMBER: (128)
; UintID
; $0351
;  vs. 
; UintIMM
; u128
LBL2L13:			; Top of IF statement
	LDA $0351; 0C22
	CMP #$80; 0C25
	.BYTE #$90, #$03; 0C27
	JMP LBL2L15; jump to ELSE; 0C29
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L14:
; =========================================================
;                         poke mem, 166
; =========================================================
	LDA $033F; 0C2C
	STA LBL3L5; 0C2F
	LDA $0340; 0C32
	STA LBL3L6; 0C35
	LDA #$A6; 0C38
	.BYTE #$8D;	  <-- STA absolute; 0C3A
LBL3L5:			; <-- low byte
	.BYTE #$00; 0C3B
LBL3L6:			; <-- hi byte
	.BYTE #$00; 0C3C
	JMP LBL2L16; 0C3D
LBL2L15:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L7:
; RULE: value: NUMBER: (196)
; UintID
; $0351
;  vs. 
; UintIMM
; u196
LBL3L8:			; Top of IF statement
	LDA $0351; 0C40
	CMP #$C4; 0C43
	.BYTE #$90, #$03; 0C45
	JMP LBL3L10; jump to ELSE; 0C47
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L9:
; =========================================================
;                         poke mem, 149
; =========================================================
	LDA $033F; 0C4A
	STA LBL4L5; 0C4D
	LDA $0340; 0C50
	STA LBL4L6; 0C53
	LDA #$95; 0C56
	.BYTE #$8D;	  <-- STA absolute; 0C58
LBL4L5:			; <-- low byte
	.BYTE #$00; 0C59
LBL4L6:			; <-- hi byte
	.BYTE #$00; 0C5A
	JMP LBL3L11; 0C5B
LBL3L10:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         poke mem, 90
; =========================================================
	LDA $033F; 0C5E
	STA LBL4L7; 0C61
	LDA $0340; 0C64
	STA LBL4L8; 0C67
	LDA #$5A; 0C6A
	.BYTE #$8D;	  <-- STA absolute; 0C6C
LBL4L7:			; <-- low byte
	.BYTE #$00; 0C6D
LBL4L8:			; <-- hi byte
	.BYTE #$00; 0C6E
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L11:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L16:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L15:
	RTS; 0C6F
; RULE: datatype: void
; ======================== generateBottom ========================
LBL0L4:
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; =========================================================
;            rnd(u1);
; =========================================================
	LDA $D41B; 0C70
; RULE: init: '=' expression
; r1
; A
; initializing an unknown with A
; unknown type
; A
; UINT r1=A datatype#: 00
; UINT UintID A
	STA $0352; 0C73
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L16:
; RULE: value: NUMBER: (65)
; UintID
; $0352
;  vs. 
; UintIMM
; u65
LBL1L17:			; Top of IF statement
	LDA $0352; 0C76
	CMP #$41; 0C79
	.BYTE #$90, #$03; 0C7B
	JMP LBL1L19; jump to ELSE; 0C7D
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L18:
; =========================================================
;                         poke mem, 24
; =========================================================
	LDA $033F; 0C80
	STA LBL2L17; 0C83
	LDA $0340; 0C86
	STA LBL2L18; 0C89
	LDA #$18; 0C8C
	.BYTE #$8D;	  <-- STA absolute; 0C8E
LBL2L17:			; <-- low byte
	.BYTE #$00; 0C8F
LBL2L18:			; <-- hi byte
	.BYTE #$00; 0C90
	JMP LBL1L20; 0C91
LBL1L19:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L19:
; RULE: value: NUMBER: (128)
; UintID
; $0352
;  vs. 
; UintIMM
; u128
LBL2L20:			; Top of IF statement
	LDA $0352; 0C94
	CMP #$80; 0C97
	.BYTE #$90, #$03; 0C99
	JMP LBL2L22; jump to ELSE; 0C9B
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L21:
; =========================================================
;                         poke mem, 8
; =========================================================
	LDA $033F; 0C9E
	STA LBL3L12; 0CA1
	LDA $0340; 0CA4
	STA LBL3L13; 0CA7
	LDA #$08; 0CAA
	.BYTE #$8D;	  <-- STA absolute; 0CAC
LBL3L12:			; <-- low byte
	.BYTE #$00; 0CAD
LBL3L13:			; <-- hi byte
	.BYTE #$00; 0CAE
	JMP LBL2L23; 0CAF
LBL2L22:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L14:
; RULE: value: NUMBER: (196)
; UintID
; $0352
;  vs. 
; UintIMM
; u196
LBL3L15:			; Top of IF statement
	LDA $0352; 0CB2
	CMP #$C4; 0CB5
	.BYTE #$90, #$03; 0CB7
	JMP LBL3L17; jump to ELSE; 0CB9
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L16:
; =========================================================
;                         poke mem, 0
; =========================================================
	LDA $033F; 0CBC
	STA LBL4L9; 0CBF
	LDA $0340; 0CC2
	STA LBL4L10; 0CC5
	LDA #$00; 0CC8
	.BYTE #$8D;	  <-- STA absolute; 0CCA
LBL4L9:			; <-- low byte
	.BYTE #$00; 0CCB
LBL4L10:			; <-- hi byte
	.BYTE #$00; 0CCC
	JMP LBL3L18; 0CCD
LBL3L17:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         poke mem, 32
; =========================================================
	LDA $033F; 0CD0
	STA LBL4L11; 0CD3
	LDA $0340; 0CD6
	STA LBL4L12; 0CD9
	LDA #$20; 0CDC
	.BYTE #$8D;	  <-- STA absolute; 0CDE
LBL4L11:			; <-- low byte
	.BYTE #$00; 0CDF
LBL4L12:			; <-- hi byte
	.BYTE #$00; 0CE0
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L18:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L23:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L20:
	RTS; 0CE1
; RULE: datatype: void
; ======================== generateColours ========================
LBL0L5:
; RULE: datatype: uint
; RULE: value: NUMBER: (2)
; =========================================================
;            rnd(u2);
; =========================================================
	LDA $D41B; 0CE2
; RULE: init: '=' expression
; r2
; A
; initializing an unknown with A
; unknown type
; A
; UINT r2=A datatype#: 00
; UINT UintID A
	STA $0353; 0CE5
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L21:
; RULE: value: NUMBER: (128)
; UintID
; $0353
;  vs. 
; UintIMM
; u128
LBL1L22:			; Top of IF statement
	LDA $0353; 0CE8
	CMP #$80; 0CEB
	.BYTE #$90, #$03; 0CED
	JMP LBL1L24; jump to ELSE; 0CEF
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L23:
; =========================================================
;                         poke cmem, 89
; =========================================================
	LDA $0341; 0CF2
	STA LBL2L24; 0CF5
	LDA $0342; 0CF8
	STA LBL2L25; 0CFB
	LDA #$59; 0CFE
	.BYTE #$8D;	  <-- STA absolute; 0D00
LBL2L24:			; <-- low byte
	.BYTE #$00; 0D01
LBL2L25:			; <-- hi byte
	.BYTE #$00; 0D02
	JMP LBL1L25; 0D03
LBL1L24:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         poke cmem, 149
; =========================================================
	LDA $0341; 0D06
	STA LBL2L26; 0D09
	LDA $0342; 0D0C
	STA LBL2L27; 0D0F
	LDA #$95; 0D12
	.BYTE #$8D;	  <-- STA absolute; 0D14
LBL2L26:			; <-- low byte
	.BYTE #$00; 0D15
LBL2L27:			; <-- hi byte
	.BYTE #$00; 0D16
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L25:
	RTS; 0D17
; RULE: datatype: void
; ======================== clearhires ========================
LBL0L6:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L26:
	PHA; 0D18
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: value: NUM: (0x2000)
; RULE: value: NUM: (0x2000)->(w8192)
; RULE: init: '=' expression
; mem1
; w8192
; unknown type
; w8192
; WORD mem1=w8192 datatype#: 02
	LDA #$00; 0D19
	LDX #$20; 0D1B
	STA $0354; 0D1D
	STX $0355; 0D20
; ---------------------------------------------------------
; RULE: value: NUM: (0x3FFF)
; RULE: value: NUM: (0x3FFF)->(w16383)
; WordID
; $0354
;  vs. 
; WordIMM
; w16383
LBL1L27:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0354 v. w16383
	LDA $0355; 0D23
	CMP #$3F; 0D26
	.BYTE #$D0, #$05; 0D28
	LDA $0354; 0D2A
	CMP #$FF; 0D2D
	.BYTE #$B0, #$03; 0D2F
	JMP LBL1L29; if c==0 jump to BODY; 0D31
	JMP LBL1L30; jump out of FOR; 0D34
; =========================================================
; ---------------------------------------------------------
LBL1L28:
; RULE: value: NUMBER: (1)
; $0354 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0D37
	LDA #$01; 0D38
	ADC $0354; 0D3A
	PHA; 0D3D
	LDA #$00; 0D3E
	ADC $0355; 0D40
	TAX; 0D43
	PLA; 0D44
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0354; 0D45
	STX $0355; 0D48
	JMP LBL1L27; jump to top of FOR loop; 0D4B
; ---------------------------------------------------------
LBL1L29:
; =========================================================
;                         poke mem1, 0
; =========================================================
	LDA $0354; 0D4E
	STA LBL2L28; 0D51
	LDA $0355; 0D54
	STA LBL2L29; 0D57
	LDA #$00; 0D5A
	.BYTE #$8D;	  <-- STA absolute; 0D5C
LBL2L28:			; <-- low byte
	.BYTE #$00; 0D5D
LBL2L29:			; <-- hi byte
	.BYTE #$00; 0D5E
; ---------------------------------------------------------
	JMP LBL1L28; jump to iterator; 0D5F
LBL1L30:
	PLA; 0D62
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L31:
	PHA; 0D63
; ---------------------------------------------------------
; RULE: value: NUM: (0xD800)
; RULE: value: NUM: (0xD800)->(w55296)
; RULE: init: '=' expression
; mem1
; w55296
	LDA #$00; 0D64
	LDX #$D8; 0D66
; RULE: statement: ID init
	STA $0354; 0D68
	STX $0355; 0D6B
; ---------------------------------------------------------
; RULE: value: NUM: (0xDBFF)
; RULE: value: NUM: (0xDBFF)->(w56319)
; WordID
; $0354
;  vs. 
; WordIMM
; w56319
LBL1L32:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0354 v. w56319
	LDA $0355; 0D6E
	CMP #$DB; 0D71
	.BYTE #$D0, #$05; 0D73
	LDA $0354; 0D75
	CMP #$FF; 0D78
	.BYTE #$B0, #$03; 0D7A
	JMP LBL1L34; if c==0 jump to BODY; 0D7C
	JMP LBL1L35; jump out of FOR; 0D7F
; =========================================================
; ---------------------------------------------------------
LBL1L33:
; RULE: value: NUMBER: (1)
; $0354 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0D82
	LDA #$01; 0D83
	ADC $0354; 0D85
	PHA; 0D88
	LDA #$00; 0D89
	ADC $0355; 0D8B
	TAX; 0D8E
	PLA; 0D8F
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0354; 0D90
	STX $0355; 0D93
	JMP LBL1L32; jump to top of FOR loop; 0D96
; ---------------------------------------------------------
LBL1L34:
; =========================================================
;                         poke mem1, 14
; =========================================================
	LDA $0354; 0D99
	STA LBL2L30; 0D9C
	LDA $0355; 0D9F
	STA LBL2L31; 0DA2
	LDA #$0E; 0DA5
	.BYTE #$8D;	  <-- STA absolute; 0DA7
LBL2L30:			; <-- low byte
	.BYTE #$00; 0DA8
LBL2L31:			; <-- hi byte
	.BYTE #$00; 0DA9
; ---------------------------------------------------------
	JMP LBL1L33; jump to iterator; 0DAA
LBL1L35:
	PLA; 0DAD
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L36:
	PHA; 0DAE
; ---------------------------------------------------------
; RULE: value: NUM: (0x0400)
; RULE: value: NUM: (0x0400)->(w1024)
; RULE: init: '=' expression
; mem1
; w1024
	LDA #$00; 0DAF
	LDX #$04; 0DB1
; RULE: statement: ID init
	STA $0354; 0DB3
	STX $0355; 0DB6
; ---------------------------------------------------------
; RULE: value: NUM: (0x07FF)
; RULE: value: NUM: (0x07FF)->(w2047)
; WordID
; $0354
;  vs. 
; WordIMM
; w2047
LBL1L37:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0354 v. w2047
	LDA $0355; 0DB9
	CMP #$07; 0DBC
	.BYTE #$D0, #$05; 0DBE
	LDA $0354; 0DC0
	CMP #$FF; 0DC3
	.BYTE #$B0, #$03; 0DC5
	JMP LBL1L39; if c==0 jump to BODY; 0DC7
	JMP LBL1L40; jump out of FOR; 0DCA
; =========================================================
; ---------------------------------------------------------
LBL1L38:
; RULE: value: NUMBER: (1)
; $0354 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0DCD
	LDA #$01; 0DCE
	ADC $0354; 0DD0
	PHA; 0DD3
	LDA #$00; 0DD4
	ADC $0355; 0DD6
	TAX; 0DD9
	PLA; 0DDA
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0354; 0DDB
	STX $0355; 0DDE
	JMP LBL1L37; jump to top of FOR loop; 0DE1
; ---------------------------------------------------------
LBL1L39:
; =========================================================
;                         poke mem1, 89
; =========================================================
	LDA $0354; 0DE4
	STA LBL2L32; 0DE7
	LDA $0355; 0DEA
	STA LBL2L33; 0DED
	LDA #$59; 0DF0
	.BYTE #$8D;	  <-- STA absolute; 0DF2
LBL2L32:			; <-- low byte
	.BYTE #$00; 0DF3
LBL2L33:			; <-- hi byte
	.BYTE #$00; 0DF4
; RULE: value: NUMBER: (1)
; $0354 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0DF5
	LDA #$01; 0DF6
	ADC $0354; 0DF8
	PHA; 0DFB
	LDA #$00; 0DFC
	ADC $0355; 0DFE
	TAX; 0E01
	PLA; 0E02
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0354; 0E03
	STX $0355; 0E06
; =========================================================
; =========================================================
;                         poke mem1, 134
; =========================================================
	LDA $0354; 0E09
	STA LBL2L34; 0E0C
	LDA $0355; 0E0F
	STA LBL2L35; 0E12
	LDA #$86; 0E15
	.BYTE #$8D;	  <-- STA absolute; 0E17
LBL2L34:			; <-- low byte
	.BYTE #$00; 0E18
LBL2L35:			; <-- hi byte
	.BYTE #$00; 0E19
; ---------------------------------------------------------
	JMP LBL1L38; jump to iterator; 0E1A
LBL1L40:
	PLA; 0E1D
; ---------------------------------------------------------
	RTS; 0E1E
; RULE: datatype: void
; ======================== pause ========================
LBL0L7:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00; 0E1F
	STA $C6; ; 0E21
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 0E23
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0E26
; RULE: init: '=' expression
; pausev
; A
; initializing an unknown with A
; unknown type
; A
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $0356; 0E29
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0E2C
LBL1L41:
; ---------------------------------------------------------
; RULE: value: NUMBER: (0)
; UintID
; $0356
;  vs. 
; UintIMM
; u0
LBL1L42:			; Top of WHILE Loop
	LDA $0356; 0E2D
	CMP #$00; 0E30
	.BYTE #$F0, #$03; 0E32
	JMP LBL1L44; jump to ELSE; 0E34
; =========================================================
LBL1L43:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0E37
; RULE: init: '=' expression
; pausev
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0356; 0E3A
; =========================================================
	JMP LBL1L42; jump to top of WHILE loop; 0E3D
LBL1L44:
	PLA; 0E40
	RTS; 0E41
; RULE: datatype: void
; ======================== checkLeft ========================
LBL0L8:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L45:
; RULE: value: NUMBER: (30)
; UintID
; $0350
;  vs. 
; UintIMM
; u30
LBL1L46:			; Top of IF statement
	LDA $0350; 0E42
	CMP #$1E; 0E45
	.BYTE #$F0, #$03; 0E47
	JMP LBL1L48; jump to ELSE; 0E49
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L47:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; lastdirectiontaken
; u1
	LDA #$01; 0E4C
; RULE: statement: ID init
	STA $0336; 0E4E
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L36:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $033C
;  vs. 
; WordIMM
; w23
LBL2L37:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $033C v. w23
	LDA $033D; 0E51
	CMP #$00; 0E54
	.BYTE #$D0, #$05; 0E56
	LDA $033C; 0E58
	CMP #$17; 0E5B
	.BYTE #$B0, #$03; 0E5D
	JMP LBL2L39; if c==0 jump to ELSE; 0E5F
	.BYTE #$D0, #$03; 0E62
	JMP LBL2L39; if z==1 jump to ELSE; 0E64
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L38:
; RULE: value: NUMBER: (1)
; $033C (2) - u1 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 0E67
	LDA $033C; 0E68
	SBC #$01; 0E6B
	PHA; 0E6D
	LDA $033D; 0E6E
	SBC #$00; 0E71
	TAX; 0E73
	PLA; 0E74
; RULE: init: '=' expression
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033C; 0E75
	STX $033D; 0E78
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $033C );
	LDA $033C; 0E7B
	STA $D000; 0E7E
	LDA $033D; 0E81
	STA $2A; 0E84
	LDA #$01; 0E86
	EOR #$FF; 0E88
	AND $D010; 0E8A
	STA $A7; 0E8D
	LDA $2A; 0E8F
	CLC; 0E91
	ADC $A7; 0E92
	STA $D010; 0E94
; RULE: value: NUMBER: (1)
; spritex( u1, $033C );
	LDA $033C; 0E97
	STA $D002; 0E9A
	LDA $033D; 0E9D
	STA $2A; 0EA0
	LDA #$01; 0EA2
	ASL; 0EA4
	ASL $2A; 0EA5
	EOR #$FF; 0EA7
	AND $D010; 0EA9
	STA $A7; 0EAC
	LDA $2A; 0EAE
	CLC; 0EB0
	ADC $A7; 0EB1
	STA $D010; 0EB3
	JSR LBL0L11; moveLegs(); 0EB6
	JMP LBL2L40; 0EB9
LBL2L39:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L40:
	JMP LBL1L49; 0EBC
LBL1L48:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L49:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L50:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $033C
;  vs. 
; WordIMM
; w23
LBL1L51:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $033C v. w23
	LDA $033D; 0EBF
	CMP #$00; 0EC2
	.BYTE #$D0, #$05; 0EC4
	LDA $033C; 0EC6
	CMP #$17; 0EC9
	.BYTE #$90, #$03; 0ECB
	JMP LBL1L53; jump to ELSE; 0ECD
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L52:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; RULE: init: '=' expression
; x
; w23
	LDA #$17; 0ED0
	LDX #$00; 0ED2
; RULE: statement: ID init
	STA $033C; 0ED4
	STX $033D; 0ED7
; =========================================================
	JMP LBL1L54; 0EDA
LBL1L53:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L54:
	RTS; 0EDD
; RULE: datatype: void
; ======================== checkRight ========================
LBL0L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L55:
; RULE: value: NUMBER: (38)
; UintID
; $0350
;  vs. 
; UintIMM
; u38
LBL1L56:			; Top of IF statement
	LDA $0350; 0EDE
	CMP #$26; 0EE1
	.BYTE #$F0, #$03; 0EE3
	JMP LBL1L58; jump to ELSE; 0EE5
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L57:
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; lastdirectiontaken
; u2
	LDA #$02; 0EE8
; RULE: statement: ID init
	STA $0336; 0EEA
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L41:
; RULE: value: NUMBER: (320)
; WordID
; $033C
;  vs. 
; WordIMM
; w320
LBL2L42:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $033C v. w320
	LDA $033D; 0EED
	CMP #$01; 0EF0
	.BYTE #$D0, #$05; 0EF2
	LDA $033C; 0EF4
	CMP #$40; 0EF7
	.BYTE #$90, #$03; 0EF9
	JMP LBL2L44; jump to ELSE; 0EFB
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L43:
; RULE: value: NUMBER: (1)
; $033C (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0EFE
	LDA #$01; 0EFF
	ADC $033C; 0F01
	PHA; 0F04
	LDA #$00; 0F05
	ADC $033D; 0F07
	TAX; 0F0A
	PLA; 0F0B
; RULE: init: '=' expression
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033C; 0F0C
	STX $033D; 0F0F
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $033C );
	LDA $033C; 0F12
	STA $D000; 0F15
	LDA $033D; 0F18
	STA $2A; 0F1B
	LDA #$01; 0F1D
	EOR #$FF; 0F1F
	AND $D010; 0F21
	STA $A7; 0F24
	LDA $2A; 0F26
	CLC; 0F28
	ADC $A7; 0F29
	STA $D010; 0F2B
; RULE: value: NUMBER: (1)
; spritex( u1, $033C );
	LDA $033C; 0F2E
	STA $D002; 0F31
	LDA $033D; 0F34
	STA $2A; 0F37
	LDA #$01; 0F39
	ASL; 0F3B
	ASL $2A; 0F3C
	EOR #$FF; 0F3E
	AND $D010; 0F40
	STA $A7; 0F43
	LDA $2A; 0F45
	CLC; 0F47
	ADC $A7; 0F48
	STA $D010; 0F4A
	JSR LBL0L11; moveLegs(); 0F4D
	JMP LBL2L45; 0F50
LBL2L44:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L45:
	JMP LBL1L59; 0F53
LBL1L58:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L59:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L60:
; RULE: value: NUMBER: (320)
; WordID
; $033C
;  vs. 
; WordIMM
; w320
LBL1L61:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $033C v. w320
	LDA $033D; 0F56
	CMP #$01; 0F59
	.BYTE #$D0, #$05; 0F5B
	LDA $033C; 0F5D
	CMP #$40; 0F60
	.BYTE #$B0, #$03; 0F62
	JMP LBL1L63; if c==0 jump to ELSE; 0F64
	.BYTE #$D0, #$03; 0F67
	JMP LBL1L63; if z==1 jump to ELSE; 0F69
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L62:
; RULE: value: NUMBER: (320)
; RULE: init: '=' expression
; x
; w320
	LDA #$40; 0F6C
	LDX #$01; 0F6E
; RULE: statement: ID init
	STA $033C; 0F70
	STX $033D; 0F73
; =========================================================
	JMP LBL1L64; 0F76
LBL1L63:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L64:
	RTS; 0F79
; RULE: datatype: void
; ======================== checkJump ========================
LBL0L10:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L65:
; RULE: value: NUMBER: (60)
; UintID
; $0350
;  vs. 
; UintIMM
; u60
LBL1L66:			; Top of IF statement
	LDA $0350; 0F7A
	CMP #$3C; 0F7D
	.BYTE #$F0, #$03; 0F7F
	JMP LBL1L68; jump to ELSE; 0F81
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L67:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L46:
; RULE: value: NUMBER: (0)
; UintID
; $0338
;  vs. 
; UintIMM
; u0
LBL2L47:			; Top of IF statement
	LDA $0338; 0F84
	CMP #$00; 0F87
	.BYTE #$D0, #$03; 0F89
	JMP LBL2L49; if z==1 jump to ELSE; 0F8B
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L48:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; recentjump
; u1
	LDA #$01; 0F8E
; RULE: statement: ID init
	STA $0337; 0F90
; =========================================================
; =========================================================
;                         FOR LOOP
; =========================================================
LBL3L19:
	PHA; 0F93
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; jumpclock
; u0
	LDA #$00; 0F94
; UINT jumpclock=A datatype#: 00
; UINT UintID A
	STA $0357; 0F96
; ---------------------------------------------------------
; RULE: value: NUMBER: (24)
; UintID
; $0357
;  vs. 
; UintIMM
; u24
LBL3L20:			; Top of FOR Loop
	LDA $0357; 0F99
	CMP #$18; 0F9C
	.BYTE #$B0, #$03; 0F9E
	JMP LBL3L22; if c==0 jump to BODY; 0FA0
	JMP LBL3L23; jump out of FOR; 0FA3
; =========================================================
; ---------------------------------------------------------
LBL3L21:
; inc(ID)
	INC $0357; 0FA6
	JMP LBL3L20; jump to top of FOR loop; 0FA9
; ---------------------------------------------------------
LBL3L22:
	JSR LBL0L12; delayfunction(); 0FAC
; RULE: value: NUMBER: (1)
; $033E (0) - u1 (-1)
; UintID arith UintIMM
	LDA $033E; 0FAF
	SEC; 0FB2
	SBC #$01; 0FB3
; RULE: init: '=' expression
; y
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $033E; 0FB5
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L13:
; RULE: value: NUMBER: (2)
; UintID
; $0336
;  vs. 
; UintIMM
; u2
LBL4L14:			; Top of IF statement
	LDA $0336; 0FB8
	CMP #$02; 0FBB
	.BYTE #$F0, #$03; 0FBD
	JMP LBL4L16; jump to ELSE; 0FBF
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L15:
; RULE: value: NUMBER: (1)
; $033C (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0FC2
	LDA #$01; 0FC3
	ADC $033C; 0FC5
	PHA; 0FC8
	LDA #$00; 0FC9
	ADC $033D; 0FCB
	TAX; 0FCE
	PLA; 0FCF
; RULE: init: '=' expression
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033C; 0FD0
	STX $033D; 0FD3
; =========================================================
	JMP LBL4L17; 0FD6
LBL4L16:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (1)
; $033C (2) - u1 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 0FD9
	LDA $033C; 0FDA
	SBC #$01; 0FDD
	PHA; 0FDF
	LDA $033D; 0FE0
	SBC #$00; 0FE3
	TAX; 0FE5
	PLA; 0FE6
; RULE: init: '=' expression
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033C; 0FE7
	STX $033D; 0FEA
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L17:
; RULE: value: NUMBER: (0)
; spritex( u0, $033C );
	LDA $033C; 0FED
	STA $D000; 0FF0
	LDA $033D; 0FF3
	STA $2A; 0FF6
	LDA #$01; 0FF8
	EOR #$FF; 0FFA
	AND $D010; 0FFC
	STA $A7; 0FFF
	LDA $2A; 1001
	CLC; 1003
	ADC $A7; 1004
	STA $D010; 1006
; RULE: value: NUMBER: (1)
; spritex( u1, $033C );
	LDA $033C; 1009
	STA $D002; 100C
	LDA $033D; 100F
	STA $2A; 1012
	LDA #$01; 1014
	ASL; 1016
	ASL $2A; 1017
	EOR #$FF; 1019
	AND $D010; 101B
	STA $A7; 101E
	LDA $2A; 1020
	CLC; 1022
	ADC $A7; 1023
	STA $D010; 1025
; RULE: value: NUMBER: (0)
; spritey( u0, $033E );
	LDA $033E; 1028
	STA $D001; 102B
; RULE: value: NUMBER: (1)
; spritey( u1, $033E );
	LDA $033E; 102E
	STA $D003; 1031
; ---------------------------------------------------------
	JMP LBL3L21; jump to iterator; 1034
LBL3L23:
	PLA; 1037
; ---------------------------------------------------------
	JMP LBL2L50; 1038
LBL2L49:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L50:
	JMP LBL1L69; 103B
LBL1L68:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L69:
	RTS; 103E
; RULE: datatype: void
; ======================== moveLegs ========================
LBL0L11:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L70:
; RULE: value: NUMBER: (1)
; UintID
; $0339
;  vs. 
; UintIMM
; u1
LBL1L71:			; Top of IF statement
	LDA $0339; 103F
	CMP #$01; 1042
	.BYTE #$F0, #$03; 1044
	JMP LBL1L73; jump to ELSE; 1046
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L72:
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; whichsprite
; u2
	LDA #$02; 1049
; RULE: statement: ID init
	STA $0339; 104B
; =========================================================
; RULE: value: NUMBER: (1)
	LDA #$01; 104E
	EOR #$FF; 1050
	AND $D015; 1052
	STA $D015; 1055
; RULE: value: NUMBER: (2)
	LDA #$02; 1058
	ORA $D015; 105A
	STA $D015; 105D
	JMP LBL1L74; 1060
LBL1L73:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01; 1063
; RULE: statement: ID init
	STA $0339; 1065
; =========================================================
; RULE: value: NUMBER: (2)
	LDA #$02; 1068
	EOR #$FF; 106A
	AND $D015; 106C
	STA $D015; 106F
; RULE: value: NUMBER: (1)
	LDA #$01; 1072
	ORA $D015; 1074
	STA $D015; 1077
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L74:
	RTS; 107A
; RULE: datatype: void
; ======================== delayfunction ========================
LBL0L12:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L75:
	PHA; 107B
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; ldx
; u0
	LDA #$00; 107C
; WORD ldx=A datatype#: 00
	LDX #$00; 107E
	STA $0358; 1080
	STX $0359; 1083
; ---------------------------------------------------------
; WordID
; $0358
;  vs. 
; WordID
; $033A
LBL1L76:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD ID
; =========================================================
	LDA $0359; 1086
	CMP $033B; 1089
	.BYTE #$D0, #$06; 108C
	LDA $0358; 108E
	CMP $033A; 1091
	.BYTE #$B0, #$03; 1094
	JMP LBL1L78; if c==0 jump to BODY; 1096
	JMP LBL1L79; jump out of FOR; 1099
; =========================================================
; ---------------------------------------------------------
LBL1L77:
; RULE: value: NUMBER: (1)
; $0358 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 109C
	LDA #$01; 109D
	ADC $0358; 109F
	PHA; 10A2
	LDA #$00; 10A3
	ADC $0359; 10A5
	TAX; 10A8
	PLA; 10A9
; RULE: init: '=' expression
; ldx
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0358; 10AA
	STX $0359; 10AD
	JMP LBL1L76; jump to top of FOR loop; 10B0
; ---------------------------------------------------------
LBL1L78:
	NOP; 10B3
; ---------------------------------------------------------
	JMP LBL1L77; jump to iterator; 10B4
LBL1L79:
	PLA; 10B7
; ---------------------------------------------------------
	RTS; 10B8
; RULE: datatype: void
; ======================== checkIfStanding ========================
LBL0L13:
; RULE: datatype: word
; RULE: init: '=' expression
; myX
; $033C
; WORD myX=$033C datatype#: 02
	LDA $033C; 10B9
	LDX $033D; 10BC
	STA $035A; 10BF
	STX $035B; 10C2
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; myY
; $033E
; UINT myY=$033E datatype#: 00
; UINT UintID UintID
	LDA $033E; 10C5
	STA $035C; 10C8
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; streturn
; u0
	LDA #$00; 10CB
; UINT streturn=A datatype#: 00
; UINT UintID A
	STA $035D; 10CD
; =========================================================
; RULE: value: NUMBER: (11)
; $035A (2) - u11 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 10D0
	LDA $035A; 10D1
	SBC #$0B; 10D4
	PHA; 10D6
	LDA $035B; 10D7
	SBC #$00; 10DA
	TAX; 10DC
	PLA; 10DD
; RULE: init: '=' expression
; myX
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $035A; 10DE
	STX $035B; 10E1
; =========================================================
; RULE: value: NUMBER: (29)
; $035C (0) - u29 (-1)
; UintID arith UintIMM
	LDA $035C; 10E4
	SEC; 10E7
	SBC #$1D; 10E8
; RULE: init: '=' expression
; myY
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $035C; 10EA
; =========================================================
	LDA $035A; 10ED
	STA $FA; 10F0
	LDA $035B; 10F2
	STA $FB; 10F5
	LDA $035C; 10F7
	STA $FC; 10FA
	JSR GETPLOT; 10FC
	LDY #$00; 10FF
	LDA ($02),Y; 1101
; RULE: init: '=' expression
; standing
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0338; 1103
; =========================================================
	RTS; 1106
; RULE: datatype: void
; ======================== drawFloor ========================
LBL0L14:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L80:
	PHA; 1107
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; dfIT
; $034B
; UINT dfIT=$034B datatype#: 00
; UINT UintID UintID
	LDA $034B; 1108
	STA $035E; 110B
; ---------------------------------------------------------
; UintID
; $035E
;  vs. 
; UintID
; $034C
LBL1L81:			; Top of FOR Loop
	LDA $035E; 110E
	CMP $034C; 1111
	.BYTE #$B0, #$03; 1114
	JMP LBL1L83; if c==0 jump to BODY; 1116
	JMP LBL1L84; jump out of FOR; 1119
; =========================================================
; ---------------------------------------------------------
LBL1L82:
; inc(ID)
	INC $035E; 111C
	JMP LBL1L81; jump to top of FOR loop; 111F
; ---------------------------------------------------------
LBL1L83:
; MC PLOT
	LDA $034D; 1122
	STA $FD; 1125
	LDA $035E; 1127
	STA $FA; 112A
	LDA $034E; 112C
	STA $FC; 112F
	JSR MCPLOT; 1131
; =========================================================
; ---------------------------------------------------------
	JMP LBL1L82; jump to iterator; 1134
LBL1L84:
	PLA; 1137
; ---------------------------------------------------------
	RTS; 1138
; vvv-------------------------------------vvv
; vvv  from p164 of Advanced Machine Code vvv
; vvv   Programming for the Commodore 64  vvv
; vvv-------------------------------------vvv
;
; x = $FA, y = $FC, colour = $FD
MCPLOT:
	LDA $FA; 1139
	AND #$03; 113B
	STA $5C; 113D
	LDA #$00; 113F
	STA $02; 1141
	STA $5D; 1143
	LDA $FD; 1145
	CLC; 1147
	ROR; 1148
	ROR; 1149
	ROR; 114A
	DEC $5C; 114B
	.BYTE #$10, #$FA; 114D
	STA $50; 114F
	LDA $FA; 1151
	AND #$FC; 1153
	ASL; 1155
	ROL $5D; 1156
	STA $5C; 1158
	LDA $FC; 115A
	LSR; 115C
	LSR; 115D
	LSR; 115E
	STA $03; 115F
	LSR; 1161
	ROR $02; 1162
	LSR; 1164
	ROR $02; 1165
	CLC; 1167
	ADC $03; 1168
	STA $03; 116A
	LDA $FC; 116C
	AND #$07; 116E
	ADC $02; 1170
	ADC $5C; 1172
	STA $02; 1174
	LDA $03; 1176
	ADC $5D; 1178
	ADC #$20; 117A
	STA $03; 117C
	LDY #$00; 117E
	LDA ($02),Y; 1180
	ORA $50; 1182
	STA ($02),Y; 1184
	RTS; 1186
; ^^^-------------------------------------^^^
; ^^^  from p164 of Advanced Machine Code ^^^
; ^^^   Programming for the Commodore 64  ^^^
; ^^^-------------------------------------^^^
; vvv-------------------------------------vvv
; vvv  from p155 of Advanced Machine Code vvv
; vvv   Programming for the Commodore 64  vvv
; vvv-------------------------------------vvv
;       L    H
; x = ($FA, $FB), y = $FC
GETPLOT:
	LDA $FA; 1187
	AND #$07; 1189
	TAX; 118B
	SEC; 118C
	LDA #$00; 118D
	STA $02; 118F
	ROR; 1191
	DEX; 1192
	.BYTE #$10, #$FC; 1193
	STA $59; 1195
	LDA $FA; 1197
	AND #$F8; 1199
	STA $5C; 119B
	LDA $FC; 119D
	LSR; 119F
	LSR; 11A0
	LSR; 11A1
	STA $03; 11A2
	LSR; 11A4
	ROR $02; 11A5
	LSR; 11A7
	ROR $02; 11A8
	ADC $03; 11AA
	STA $03; 11AC
	LDA $FC; 11AE
	AND #$07; 11B0
	ADC $02; 11B2
	ADC $5C; 11B4
	STA $02; 11B6
	LDA $03; 11B8
	ADC $FB; 11BA
	ADC $FF; 11BC
	STA $03; 11BE
	RTS; 11C0
; ^^^-------------------------------------^^^
; ^^^  from p155 of Advanced Machine Code ^^^
; ^^^   Programming for the Commodore 64  ^^^
; ^^^-------------------------------------^^^
SIDRND:
	PHA; 11C1
	LDA #$FF; 11C2
	STA $D40E; 11C4
	STA $D40F; 11C7
	LDA #$80; 11CA
	STA $D412; 11CC
	PLA; 11CF
	RTS; 11D0
CLS:		; Clear Screen Routine
	LDA #$20; 11D1
	LDX #$00; 11D3
CLSLOOP:
	STA $0400,X; 11D5
	STA $0500,X; 11D8
	STA $0600,X; 11DB
	STA $06E8,X; 11DE
	DEX; 11E1
	BNE CLSLOOP; 11E2
	RTS; 11E4
MOBCPY:		; Copy 63 bytes from $FB/$FC to $FD/$FE
	LDY #$3F; 11E5
MOBCPL1:
	CPY #$00; 11E7
	BEQ MOBCPL2; 11E9
	LDA ($FB),Y; 11EB
	STA ($FD),Y; 11ED
	DEY; 11EF
	JMP MOBCPL1; 11F0
MOBCPL2:
	RTS; 11F3
