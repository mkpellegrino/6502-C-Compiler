; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; uint : p1 : $0336 (822)
; uint : p2 : $0337 (823)
; uint : p3 : $0338 (824)
; uint : p4 : $0339 (825)
; uint : p5 : $033A (826)
; uint : lastdirectiontaken : $033B (827)
; uint : recentjump : $033C (828)
; uint : standing : $033D (829)
; uint : whichsprite : $033E (830)
; uint : y : $033F (831)
; word : x : $0340 (832)
; word : delay : $0342 (834)
; uint : plotcolour : $0344 (836)
; uint : oldvic11 : $0345 (837)
; uint : oldvic16 : $0346 (838)
; uint : oldvic18 : $0347 (839)
; uint : timer : $0348 (840)
; uint : c : $0349 (841)
; uint : rx : $034A (842)
; uint : ry : $034B (843)
; uint : pausev : $034C (844)
; word : myb1 : $034D (845)
; word : mem1 : $034F (847)
; uint : dY : $0351 (849)
; uint : dC : $0352 (850)
; uint : GG : $0353 (851)
; uint : FF : $0354 (852)
; uint : jumpclock : $0355 (853)
; word : myX : $0356 (854)
; uint : myY : $0358 (856)
; uint : XXX : $0359 (857)
; uint : oldD011 : $035A (858)
; uint : oldD016 : $035B (859)
; uint : oldD018 : $035C (860)
; uint : oldD020 : $035D (861)
; uint : oldD021 : $035E (862)
; uint : oldChar : $035F (863)
; word : ldx : $0360 (864)
; RULE: datatype: int
.org $0834
; =========================================================
;                         main()
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p1=A datatype#: 00
; UINT UintID A
	STA $0336; 0834
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p2=A datatype#: 00
; UINT UintID A
	STA $0337; 0837
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p3=A datatype#: 00
; UINT UintID A
	STA $0338; 083A
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p4=A datatype#: 00
; UINT UintID A
	STA $0339; 083D
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT p5=A datatype#: 00
; UINT UintID A
	STA $033A; 0840
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; lastdirectiontaken
; u0
	LDA #$00; 0843
; RULE: statement: datatype ID init
; UINT lastdirectiontaken=A datatype#: 00
; UINT UintID A
	STA $033B; 0845
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; recentjump
; u0
	LDA #$00; 0848
; RULE: statement: datatype ID init
; UINT recentjump=A datatype#: 00
; UINT UintID A
	STA $033C; 084A
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; standing
; u0
	LDA #$00; 084D
; RULE: statement: datatype ID init
; UINT standing=A datatype#: 00
; UINT UintID A
	STA $033D; 084F
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01; 0852
; RULE: statement: datatype ID init
; UINT whichsprite=A datatype#: 00
; UINT UintID A
	STA $033E; 0854
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (100)
; RULE: init: '=' expression
; y
; u100
	LDA #$64; 0857
; RULE: statement: datatype ID init
; UINT y=A datatype#: 00
; UINT UintID A
	STA $033F; 0859
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
	LDA #$20; 085C
	LDX #$00; 085E
	STA $0340; 0860
	STX $0341; 0863
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
	LDA #$CC; 0866
	LDX #$00; 0868
	STA $0342; 086A
	STX $0343; 086D
; =========================================================
	JSR LBL0L12; saveregs(); 0870
; RULE: datatype: uint
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; plotcolour
; u2
	LDA #$02; 0873
; RULE: statement: datatype ID init
; UINT plotcolour=A datatype#: 00
; UINT UintID A
	STA $0344; 0875
; =========================================================
	LDA #$00; 0878
	STA $D020; 087A
	LDA #$00; 087D
	STA $D021; 087F
; RULE: value: NUMBER: (1)
; bank( IMM );
	LDA #$03; 0882
	ORA $DD02; 0884
	STA $DD02; 0887
	LDA #$01; 088A
	EOR #$FF; 088C
	AND #$03; 088E
	STA $02; 0890
	LDA #$FC; 0892
	AND $DD00; 0894
	ORA $02; 0897
	STA $DD00; 0899
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D011; 089C
; RULE: init: '=' expression
; oldvic11
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldvic11=A datatype#: 00
; UINT UintID A
	STA $0345; 089F
; =========================================================
; RULE: value: NUMBER: (32)
	LDA #$20; 08A2
	ORA $0345; 08A4
; RULE: init: '=' expression
; oldvic11
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0345; 08A7
; =========================================================
	LDA #$3B; 08AA
	STA $D011; 08AC
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D016; 08AF
; RULE: init: '=' expression
; oldvic16
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldvic16=A datatype#: 00
; UINT UintID A
	STA $0346; 08B2
; =========================================================
; RULE: value: NUMBER: (16)
	LDA #$10; 08B5
	ORA $0346; 08B7
; RULE: init: '=' expression
; oldvic16
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0346; 08BA
; =========================================================
	LDA #$18; 08BD
	STA $D016; 08BF
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D018; 08C2
; RULE: init: '=' expression
; oldvic18
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldvic18=A datatype#: 00
; UINT UintID A
	STA $0347; 08C5
; =========================================================
; RULE: value: NUMBER: (18)
	LDA #$12; 08C8
	ORA $0347; 08CA
; RULE: init: '=' expression
; oldvic18
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0347; 08CD
; =========================================================
	LDA #$18; 08D0
	STA $D018; 08D2
	JSR LBL0L4; clearhires(); 08D5
	JSR LBL0L15; createplatforms(); 08D8
; RULE: datatype: mob
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (6)
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
; RULE: statement: datatype ID init
; MOB sprite1=m datatype#: 00
; MOB Detected
	LDA #$F7; 08DB
	STA LBL1L0; 08DD
	LDA #$03; 08E0
	STA LBL1L0+1; 08E2
	LDA #$00; <- Sprite #; 08E5
	ADC LBL1L0; 08E7
	STA LBL1L0; 08EA
	JSR SCRMEM; 08ED
	PLA; 08F0
	ADC LBL1L0+1; 08F1
	STA LBL1L0+1; 08F4
	JSR BNKMEM; 08F7
	PLA; 08FA
	ADC LBL1L0+1; 08FB
	STA LBL1L0+1; 08FE
	LDA #$06; 0901
	.BYTE #$8D; 0903
LBL1L0:
	.BYTE #$00, #$00; 0904
	JSR LBL1L1; 0906
sprite1:
	.BYTE #$00, #$00, #$00, #$00, #$0F, #$00, #$00, #$3F, #$F0, #$00, #$3F, #$00, #$00, #$EA, #$00, #$00, #$0A, #$00, #$00, #$08, #$00, #$00, #$15, #$00, #$00, #$55, #$40, #$01, #$5D, #$50, #$01, #$55, #$14, #$01, #$1D, #$06, #$01, #$15, #$00, #$01, #$2A, #$00, #$02, #$2A, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$A2, #$80, #$00, #$A2, #$80
LBL1L1:
	PLA; 0948
	STA $FB; 0949
	PLA; 094B
	STA $FC; 094C
	LDA #$80; 094E
	STA $FD; 0950
	LDA #$01; 0952
	STA $FE; 0954
	JSR BNKMEM; 0956
	PLA; 0959
	CLC; 095A
	ADC $FE; 095B
	STA $FE; 095D
	JSR MOBCPY; 095F
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (5)
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
; RULE: statement: datatype ID init
; MOB sprite2=m datatype#: 00
; MOB Detected
	LDA #$F7; 0962
	STA LBL1L2; 0964
	LDA #$03; 0967
	STA LBL1L2+1; 0969
	LDA #$01; <- Sprite #; 096C
	ADC LBL1L2; 096E
	STA LBL1L2; 0971
	JSR SCRMEM; 0974
	PLA; 0977
	ADC LBL1L2+1; 0978
	STA LBL1L2+1; 097B
	JSR BNKMEM; 097E
	PLA; 0981
	ADC LBL1L2+1; 0982
	STA LBL1L2+1; 0985
	LDA #$05; 0988
	.BYTE #$8D; 098A
LBL1L2:
	.BYTE #$00, #$00; 098B
	JSR LBL1L3; 098D
sprite2:
	.BYTE #$00, #$00, #$00, #$00, #$0F, #$00, #$00, #$3F, #$F0, #$00, #$3F, #$00, #$00, #$EA, #$00, #$00, #$0A, #$00, #$00, #$08, #$00, #$00, #$15, #$00, #$00, #$55, #$40, #$01, #$5D, #$50, #$01, #$55, #$14, #$05, #$1D, #$06, #$04, #$15, #$00, #$04, #$2A, #$00, #$08, #$2A, #$00, #$00, #$22, #$00, #$00, #$20, #$80, #$00, #$20, #$80, #$00, #$20, #$80, #$00, #$28, #$A0, #$00, #$28, #$A0
LBL1L3:
	PLA; 09CF
	STA $FB; 09D0
	PLA; 09D2
	STA $FC; 09D3
	LDA #$40; 09D5
	STA $FD; 09D7
	LDA #$01; 09D9
	STA $FE; 09DB
	JSR BNKMEM; 09DD
	PLA; 09E0
	CLC; 09E1
	ADC $FE; 09E2
	STA $FE; 09E4
	JSR MOBCPY; 09E6
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $0340 );
	LDA $0340; 09E9
	STA $D000; 09EC
	LDA $0341; 09EF
	STA $2A; 09F2
	LDA #$01; 09F4
	EOR #$FF; 09F6
	AND $D010; 09F8
	STA $A7; 09FB
	LDA $2A; 09FD
	CLC; 09FF
	ADC $A7; 0A00
	STA $D010; 0A02
; RULE: value: NUMBER: (0)
; spritey( u0, $033F );
	LDA $033F; 0A05
	STA $D001; 0A08
; RULE: value: NUMBER: (1)
; spritex( u1, $0340 );
	LDA $0340; 0A0B
	STA $D002; 0A0E
	LDA $0341; 0A11
	STA $2A; 0A14
	LDA #$01; 0A16
	ASL; 0A18
	ASL $2A; 0A19
	EOR #$FF; 0A1B
	AND $D010; 0A1D
	STA $A7; 0A20
	LDA $2A; 0A22
	CLC; 0A24
	ADC $A7; 0A25
	STA $D010; 0A27
; RULE: value: NUMBER: (1)
; spritey( u1, $033F );
	LDA $033F; 0A2A
	STA $D003; 0A2D
	LDA #$03; 0A30
	STA $D01C; 0A32
; RULE: value: NUMBER: (1)
	LDA #$01; 0A35
	ORA $D015; 0A37
	STA $D015; 0A3A
; RULE: value: NUMBER: (2)
	LDA #$02; 0A3D
	EOR #$FF; 0A3F
	AND $D015; 0A41
	STA $D015; 0A44
	LDA #$06; 0A47
	STA $D025; 0A49
	LDA #$04; 0A4C
	STA $D026; 0A4E
	LDA #$07; 0A51
	STA $D027; 0A53
	LDA #$07; 0A56
	STA $D028; 0A58
	LDA #$FE; 0A5B
	STA $6008; 0A5D
	LDA #$FE; 0A60
	STA $600A; 0A62
	LDA #$FE; 0A65
	STA $600C; 0A67
	LDA #$FE; 0A6A
	STA $600E; 0A6C
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; timer
; u0
	LDA #$00; 0A6F
; RULE: statement: datatype ID init
; UINT timer=A datatype#: 00
; UINT UintID A
	STA $0348; 0A71
; =========================================================
; RULE: datatype: uint
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0A74
; RULE: init: '=' expression
; c
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT c=A datatype#: 00
; UINT UintID A
	STA $0349; 0A76
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0A79
LBL1L4:
; ---------------------------------------------------------
; RULE: value: NUMBER: (62)
; UintID
; $0349
;  vs. 
; UintIMM
; u62
LBL1L5:			; Top of WHILE Loop
	LDA $0349; 0A7A
	CMP #$3E; 0A7D
	.BYTE #$D0, #$03; 0A7F
	JMP LBL1L7; if z==1 jump to ELSE; 0A81
; =========================================================
LBL1L6:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L0:
; RULE: value: NUMBER: (0)
; UintID
; $0348
;  vs. 
; UintIMM
; u0
LBL2L1:			; Top of IF statement
	LDA $0348; 0A84
	CMP #$00; 0A87
	.BYTE #$F0, #$03; 0A89
	JMP LBL2L3; jump to ELSE; 0A8B
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L2:
	JSR LBL0L9; checkIfStanding(); 0A8E
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L0:
; RULE: value: NUMBER: (0)
; UintID
; $033D
;  vs. 
; UintIMM
; u0
LBL3L1:			; Top of IF statement
	LDA $033D; 0A91
	CMP #$00; 0A94
	.BYTE #$F0, #$03; 0A96
	JMP LBL3L3; jump to ELSE; 0A98
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L2:
; RULE: value: NUMBER: (1)
; $033F (0) + u1 (-1)
; UintID arith UintIMM
	LDA $033F; 0A9B
	CLC; 0A9E
	ADC #$01; 0A9F
; RULE: init: '=' expression
; y
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $033F; 0AA1
; =========================================================
; RULE: value: NUMBER: (0)
; spritey( u0, $033F );
	LDA $033F; 0AA4
	STA $D001; 0AA7
; RULE: value: NUMBER: (1)
; spritey( u1, $033F );
	LDA $033F; 0AAA
	STA $D003; 0AAD
	JMP LBL3L4; 0AB0
LBL3L3:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; recentjump
; u0
	LDA #$00; 0AB3
; RULE: statement: ID init
	STA $033C; 0AB5
; =========================================================
	JSR LBL0L5; checkLeft(); 0AB8
	JSR LBL0L6; checkRight(); 0ABB
	JSR LBL0L7; checkJump(); 0ABE
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L4:
	JMP LBL2L4; 0AC1
LBL2L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L4:
; inc(ID)
	INC $0348; 0AC4
; =========================================================
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0AC7
; RULE: init: '=' expression
; c
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0349; 0AC9
; =========================================================
	JMP LBL1L5; jump to top of WHILE loop; 0ACC
LBL1L7:
	PLA; 0ACF
	JSR LBL0L0; clearkb(); 0AD0
	JSR LBL0L13; restoreregs(); 0AD3
; RULE: value: NUMBER: (0)
; bank( IMM );
	LDA #$03; 0AD6
	ORA $DD02; 0AD8
	STA $DD02; 0ADB
	LDA #$00; 0ADE
	EOR #$FF; 0AE0
	AND #$03; 0AE2
	STA $02; 0AE4
	LDA #$FC; 0AE6
	AND $DD00; 0AE8
	ORA $02; 0AEB
	STA $DD00; 0AED
	RTS; 0AF0
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L0:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00; 0AF1
	STA $C6; ; 0AF3
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 0AF5
	RTS; 0AF8
; RULE: datatype: void
; ======================== rect ========================
LBL0L1:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L8:
	PHA; 0AF9
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; rx
; $0336
; RULE: statement: datatype ID init
; UINT rx=$0336 datatype#: 00
; UINT UintID UintID
	LDA $0336; 0AFA
	STA $034A; 0AFD
; ---------------------------------------------------------
; UintID
; $034A
;  vs. 
; UintID
; $0338
LBL1L9:			; Top of FOR Loop
	LDA $034A; 0B00
	CMP $0338; 0B03
	.BYTE #$B0, #$03; 0B06
	JMP LBL1L11; if c==0 jump to BODY; 0B08
	JMP LBL1L12; jump out of FOR; 0B0B
; =========================================================
; ---------------------------------------------------------
LBL1L10:
; inc(ID)
	INC $034A; 0B0E
	JMP LBL1L9; jump to top of FOR loop; 0B11
; ---------------------------------------------------------
LBL1L11:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL2L5:
	PHA; 0B14
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; ry
; $0337
; RULE: statement: datatype ID init
; UINT ry=$0337 datatype#: 00
; UINT UintID UintID
	LDA $0337; 0B15
	STA $034B; 0B18
; ---------------------------------------------------------
; UintID
; $034B
;  vs. 
; UintID
; $0339
LBL2L6:			; Top of FOR Loop
	LDA $034B; 0B1B
	CMP $0339; 0B1E
	.BYTE #$B0, #$03; 0B21
	JMP LBL2L8; if c==0 jump to BODY; 0B23
	JMP LBL2L9; jump out of FOR; 0B26
; =========================================================
; ---------------------------------------------------------
LBL2L7:
; inc(ID)
	INC $034B; 0B29
	JMP LBL2L6; jump to top of FOR loop; 0B2C
; ---------------------------------------------------------
LBL2L8:
; MCPLOT [uint   word|uint   uintT
	LDA $034A; 0B2F
	STA $FA; 0B32
	LDA $034B; 0B34
	STA $FC; 0B37
	JSR MCPLOT; 0B39
	LDA $033A; 0B3C
	STA $FD; 0B3F
; =========================================================
; ---------------------------------------------------------
	JMP LBL2L7; jump to iterator; 0B41
LBL2L9:
	PLA; 0B44
; ---------------------------------------------------------
; ---------------------------------------------------------
	JMP LBL1L10; jump to iterator; 0B45
LBL1L12:
	PLA; 0B48
; ---------------------------------------------------------
	RTS; 0B49
; RULE: datatype: void
; ======================== pause ========================
LBL0L2:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00; 0B4A
	STA $C6; ; 0B4C
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 0B4E
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0B51
; RULE: init: '=' expression
; pausev
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $034C; 0B54
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0B57
LBL1L13:
; ---------------------------------------------------------
; RULE: value: NUMBER: (0)
; UintID
; $034C
;  vs. 
; UintIMM
; u0
LBL1L14:			; Top of WHILE Loop
	LDA $034C; 0B58
	CMP #$00; 0B5B
	.BYTE #$F0, #$03; 0B5D
	JMP LBL1L16; jump to ELSE; 0B5F
; =========================================================
LBL1L15:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0B62
; RULE: init: '=' expression
; pausev
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $034C; 0B65
; =========================================================
	JMP LBL1L14; jump to top of WHILE loop; 0B68
LBL1L16:
	PLA; 0B6B
	RTS; 0B6C
; RULE: datatype: void
; ======================== showmem ========================
LBL0L3:
; RULE: datatype: word
; RULE: value: NUM: (0x0000)
; RULE: value: NUM: (0x0000)->(w0)
; RULE: init: '=' expression
; myb1
; w0
; unknown type
; w0
; RULE: statement: datatype ID init
; WORD myb1=w0 datatype#: 02
	LDA #$00; 0B6D
	LDX #$00; 0B6F
	STA $034D; 0B71
	STX $034E; 0B74
; =========================================================
; =========================================================
;                         printf("BNK: ");
; =========================================================
	LDA #$13; 0B77
	STA $03; 0B79
	LDA #$3A; 0B7B
	STA $02; 0B7D
	JSR PRN; 0B7F
	JSR BNKMEM; 0B82
	PLA; 0B85
	TAX; 0B86
	LDA #$00; 0B87
; RULE: init: '=' expression
; myb1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034D; 0B89
	STX $034E; 0B8C
; =========================================================
; =========================================================
;                         printf($034D);
; =========================================================
	LDA $034D; 0B8F
	STA HTD_IN; 0B92
	LDA $034E; 0B95
	STA HTD_IN+1; 0B98
	JSR WORD2DEC; 0B9B
	LDX #$00; 0B9E
LBL1L17:
	LDA HTD_STR,X; 0BA0
	CMP #$30; 0BA3
	.BYTE #$D0, #$04; BNE SKIP; 0BA5
	INX; 0BA7
	JMP LBL1L17; 0BA8
	CPX #$06; 0BAB
	.BYTE #$D0 #$01; BNE SKIP; 0BAD
	DEX; 0BAF
LBL1L18:
	LDA HTD_STR,X; 0BB0
	CMP #$00; 0BB3
	.BYTE #$F0, #$07; BEQ #$07; 0BB5
	INX; 0BB7
	JSR $FFD2; 0BB8
	JMP LBL1L18; 0BBB
; =========================================================
;                         printf(" SCR: ");
; =========================================================
	LDA #$13; 0BBE
	STA $03; 0BC0
	LDA #$40; 0BC2
	STA $02; 0BC4
	JSR PRN; 0BC6
	LDA #$00; 0BC9
	STA $03; 0BCB
	JSR SCRMEM; 0BCD
	PLA; 0BD0
	CLC; 0BD1
	ADC $03; 0BD2
	STA $03; 0BD4
	JSR BNKMEM; 0BD6
	PLA; 0BD9
	ADC $03; 0BDA
	TAX; 0BDC
	LDA #$00; 0BDD
; RULE: init: '=' expression
; myb1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034D; 0BDF
	STX $034E; 0BE2
; =========================================================
; =========================================================
;                         printf($034D);
; =========================================================
	LDA $034D; 0BE5
	STA HTD_IN; 0BE8
	LDA $034E; 0BEB
	STA HTD_IN+1; 0BEE
	JSR WORD2DEC; 0BF1
	LDX #$00; 0BF4
LBL1L19:
	LDA HTD_STR,X; 0BF6
	CMP #$30; 0BF9
	.BYTE #$D0, #$04; BNE SKIP; 0BFB
	INX; 0BFD
	JMP LBL1L19; 0BFE
	CPX #$06; 0C01
	.BYTE #$D0 #$01; BNE SKIP; 0C03
	DEX; 0C05
LBL1L20:
	LDA HTD_STR,X; 0C06
	CMP #$00; 0C09
	.BYTE #$F0, #$07; BEQ #$07; 0C0B
	INX; 0C0D
	JSR $FFD2; 0C0E
	JMP LBL1L20; 0C11
; =========================================================
;                         printf(" BMP: ");
; =========================================================
	LDA #$13; 0C14
	STA $03; 0C16
	LDA #$47; 0C18
	STA $02; 0C1A
	JSR PRN; 0C1C
	SEI; 0C1F
	LDA $D018; 0C20
	AND #$08; 0C23
	CLC; 0C25
	ASL; 0C26
	ASL; 0C27
	STA $FF; 0C28
	LDA $DD00; 0C2A
	EOR #$FF; 0C2D
	AND #$03; 0C2F
	CLC; 0C31
	ASL; 0C32
	ASL; 0C33
	ASL; 0C34
	ASL; 0C35
	ASL; 0C36
	ASL; 0C37
	ADC $FF; 0C38
	TAX; 0C3A
	LDA #$00; 0C3B
	CLI; 0C3D
; RULE: init: '=' expression
; myb1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034D; 0C3E
	STX $034E; 0C41
; =========================================================
; =========================================================
;                         printf($034D);
; =========================================================
	LDA $034D; 0C44
	STA HTD_IN; 0C47
	LDA $034E; 0C4A
	STA HTD_IN+1; 0C4D
	JSR WORD2DEC; 0C50
	LDX #$00; 0C53
LBL1L21:
	LDA HTD_STR,X; 0C55
	CMP #$30; 0C58
	.BYTE #$D0, #$04; BNE SKIP; 0C5A
	INX; 0C5C
	JMP LBL1L21; 0C5D
	CPX #$06; 0C60
	.BYTE #$D0 #$01; BNE SKIP; 0C62
	DEX; 0C64
LBL1L22:
	LDA HTD_STR,X; 0C65
	CMP #$00; 0C68
	.BYTE #$F0, #$07; BEQ #$07; 0C6A
	INX; 0C6C
	JSR $FFD2; 0C6D
	JMP LBL1L22; 0C70
	JSR LBL0L10; cr(); 0C73
	RTS; 0C76
; RULE: datatype: void
; ======================== clearhires ========================
LBL0L4:
; RULE: datatype: word
; RULE: statement: datatype ID init
; WORD mem1=A datatype#: 02
	LDX #$00; 0C77
	STA $034F; 0C79
	STX $0350; 0C7C
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (175)
; RULE: init: '=' expression
; dY
; u175
	LDA #$AF; 0C7F
; RULE: statement: datatype ID init
; UINT dY=A datatype#: 00
; UINT UintID A
	STA $0351; 0C81
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (3)
; RULE: init: '=' expression
; dC
; u3
	LDA #$03; 0C84
; RULE: statement: datatype ID init
; UINT dC=A datatype#: 00
; UINT UintID A
	STA $0352; 0C86
; =========================================================
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L23:
	PHA; 0C89
; ---------------------------------------------------------
; RULE: value: NUM: (0xD800)
; RULE: value: NUM: (0xD800)->(w55296)
; RULE: init: '=' expression
; mem1
; w55296
	LDA #$00; 0C8A
	LDX #$D8; 0C8C
; RULE: statement: ID init
	STA $034F; 0C8E
	STX $0350; 0C91
; ---------------------------------------------------------
; RULE: value: NUM: (0xDBFF)
; RULE: value: NUM: (0xDBFF)->(w56319)
; WordID
; $034F
;  vs. 
; WordIMM
; w56319
LBL1L24:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $034F v. w56319
	LDA $0350; 0C94
	CMP #$DB; 0C97
	.BYTE #$D0, #$05; 0C99
	LDA $034F; 0C9B
	CMP #$FF; 0C9E
	.BYTE #$B0, #$03; 0CA0
	JMP LBL1L26; if c==0 jump to BODY; 0CA2
	JMP LBL1L27; jump out of FOR; 0CA5
; =========================================================
; ---------------------------------------------------------
LBL1L25:
; RULE: value: NUMBER: (1)
; $034F (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0CA8
	LDA #$01; 0CA9
	ADC $034F; 0CAB
	PHA; 0CAE
	LDA #$00; 0CAF
	ADC $0350; 0CB1
	TAX; 0CB4
	PLA; 0CB5
; RULE: init: '=' expression
; mem1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034F; 0CB6
	STX $0350; 0CB9
	JMP LBL1L24; jump to top of FOR loop; 0CBC
; ---------------------------------------------------------
LBL1L26:
; =========================================================
;                         poke mem1, 8
; =========================================================
	LDA $034F; 0CBF
	STA LBL2L10; 0CC2
	LDA $0350; 0CC5
	STA LBL2L11; 0CC8
	LDA #$08; 0CCB
	.BYTE #$8D;	  <-- STA absolute; 0CCD
LBL2L10:			; <-- low byte
	.BYTE #$00; 0CCE
LBL2L11:			; <-- hi byte
	.BYTE #$00; 0CCF
; ---------------------------------------------------------
	JMP LBL1L25; jump to iterator; 0CD0
LBL1L27:
	PLA; 0CD3
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L28:
	PHA; 0CD4
; ---------------------------------------------------------
; RULE: value: NUM: (0x4400)
; RULE: value: NUM: (0x4400)->(w17408)
; RULE: init: '=' expression
; mem1
; w17408
	LDA #$00; 0CD5
	LDX #$44; 0CD7
; RULE: statement: ID init
	STA $034F; 0CD9
	STX $0350; 0CDC
; ---------------------------------------------------------
; RULE: value: NUM: (0x47FF)
; RULE: value: NUM: (0x47FF)->(w18431)
; WordID
; $034F
;  vs. 
; WordIMM
; w18431
LBL1L29:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $034F v. w18431
	LDA $0350; 0CDF
	CMP #$47; 0CE2
	.BYTE #$D0, #$05; 0CE4
	LDA $034F; 0CE6
	CMP #$FF; 0CE9
	.BYTE #$B0, #$03; 0CEB
	JMP LBL1L31; if c==0 jump to BODY; 0CED
	JMP LBL1L32; jump out of FOR; 0CF0
; =========================================================
; ---------------------------------------------------------
LBL1L30:
; RULE: value: NUMBER: (1)
; $034F (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0CF3
	LDA #$01; 0CF4
	ADC $034F; 0CF6
	PHA; 0CF9
	LDA #$00; 0CFA
	ADC $0350; 0CFC
	TAX; 0CFF
	PLA; 0D00
; RULE: init: '=' expression
; mem1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034F; 0D01
	STX $0350; 0D04
	JMP LBL1L29; jump to top of FOR loop; 0D07
; ---------------------------------------------------------
LBL1L31:
; =========================================================
;                         poke mem1, 34
; =========================================================
	LDA $034F; 0D0A
	STA LBL2L12; 0D0D
	LDA $0350; 0D10
	STA LBL2L13; 0D13
	LDA #$22; 0D16
	.BYTE #$8D;	  <-- STA absolute; 0D18
LBL2L12:			; <-- low byte
	.BYTE #$00; 0D19
LBL2L13:			; <-- hi byte
	.BYTE #$00; 0D1A
; ---------------------------------------------------------
	JMP LBL1L30; jump to iterator; 0D1B
LBL1L32:
	PLA; 0D1E
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L33:
	PHA; 0D1F
; ---------------------------------------------------------
; RULE: value: NUM: (0x6000)
; RULE: value: NUM: (0x6000)->(w24576)
; RULE: init: '=' expression
; mem1
; w24576
	LDA #$00; 0D20
	LDX #$60; 0D22
; RULE: statement: ID init
	STA $034F; 0D24
	STX $0350; 0D27
; ---------------------------------------------------------
; RULE: value: NUM: (0x7FF8)
; RULE: value: NUM: (0x7FF8)->(w32760)
; WordID
; $034F
;  vs. 
; WordIMM
; w32760
LBL1L34:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $034F v. w32760
	LDA $0350; 0D2A
	CMP #$7F; 0D2D
	.BYTE #$D0, #$05; 0D2F
	LDA $034F; 0D31
	CMP #$F8; 0D34
	.BYTE #$B0, #$03; 0D36
	JMP LBL1L36; if c==0 jump to BODY; 0D38
	JMP LBL1L37; jump out of FOR; 0D3B
; =========================================================
; ---------------------------------------------------------
LBL1L35:
; RULE: value: NUMBER: (1)
; $034F (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0D3E
	LDA #$01; 0D3F
	ADC $034F; 0D41
	PHA; 0D44
	LDA #$00; 0D45
	ADC $0350; 0D47
	TAX; 0D4A
	PLA; 0D4B
; RULE: init: '=' expression
; mem1
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034F; 0D4C
	STX $0350; 0D4F
	JMP LBL1L34; jump to top of FOR loop; 0D52
; ---------------------------------------------------------
LBL1L36:
; =========================================================
;                         poke mem1, 0
; =========================================================
	LDA $034F; 0D55
	STA LBL2L14; 0D58
	LDA $0350; 0D5B
	STA LBL2L15; 0D5E
	LDA #$00; 0D61
	.BYTE #$8D;	  <-- STA absolute; 0D63
LBL2L14:			; <-- low byte
	.BYTE #$00; 0D64
LBL2L15:			; <-- hi byte
	.BYTE #$00; 0D65
; ---------------------------------------------------------
	JMP LBL1L35; jump to iterator; 0D66
LBL1L37:
	PLA; 0D69
; ---------------------------------------------------------
	RTS; 0D6A
; RULE: datatype: void
; ======================== checkLeft ========================
LBL0L5:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L38:
; RULE: value: NUMBER: (30)
; UintID
; $0349
;  vs. 
; UintIMM
; u30
LBL1L39:			; Top of IF statement
	LDA $0349; 0D6B
	CMP #$1E; 0D6E
	.BYTE #$F0, #$03; 0D70
	JMP LBL1L41; jump to ELSE; 0D72
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L40:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; lastdirectiontaken
; u1
	LDA #$01; 0D75
; RULE: statement: ID init
	STA $033B; 0D77
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L16:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $0340
;  vs. 
; WordIMM
; w23
LBL2L17:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0340 v. w23
	LDA $0341; 0D7A
	CMP #$00; 0D7D
	.BYTE #$D0, #$05; 0D7F
	LDA $0340; 0D81
	CMP #$17; 0D84
	.BYTE #$B0, #$03; 0D86
	JMP LBL2L19; if c==0 jump to ELSE; 0D88
	.BYTE #$D0, #$03; 0D8B
	JMP LBL2L19; if z==1 jump to ELSE; 0D8D
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L18:
; RULE: value: NUMBER: (1)
; $0340 (2) - u1 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 0D90
	LDA $0340; 0D91
	SBC #$01; 0D94
	PHA; 0D96
	LDA $0341; 0D97
	SBC #$00; 0D9A
	TAX; 0D9C
	PLA; 0D9D
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0340; 0D9E
	STX $0341; 0DA1
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $0340 );
	LDA $0340; 0DA4
	STA $D000; 0DA7
	LDA $0341; 0DAA
	STA $2A; 0DAD
	LDA #$01; 0DAF
	EOR #$FF; 0DB1
	AND $D010; 0DB3
	STA $A7; 0DB6
	LDA $2A; 0DB8
	CLC; 0DBA
	ADC $A7; 0DBB
	STA $D010; 0DBD
; RULE: value: NUMBER: (1)
; spritex( u1, $0340 );
	LDA $0340; 0DC0
	STA $D002; 0DC3
	LDA $0341; 0DC6
	STA $2A; 0DC9
	LDA #$01; 0DCB
	ASL; 0DCD
	ASL $2A; 0DCE
	EOR #$FF; 0DD0
	AND $D010; 0DD2
	STA $A7; 0DD5
	LDA $2A; 0DD7
	CLC; 0DD9
	ADC $A7; 0DDA
	STA $D010; 0DDC
	JSR LBL0L8; moveLegs(); 0DDF
	JMP LBL2L20; 0DE2
LBL2L19:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L20:
	JMP LBL1L42; 0DE5
LBL1L41:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L42:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L43:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $0340
;  vs. 
; WordIMM
; w23
LBL1L44:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0340 v. w23
	LDA $0341; 0DE8
	CMP #$00; 0DEB
	.BYTE #$D0, #$05; 0DED
	LDA $0340; 0DEF
	CMP #$17; 0DF2
	.BYTE #$F0, #$03; 0DF4
	JMP LBL1L46; jump to ELSE; 0DF6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L45:
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D021; 0DF9
; RULE: init: '=' expression
; GG
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT GG=A datatype#: 00
; UINT UintID A
	STA $0353; 0DFC
; =========================================================
; inc(ID)
	INC $0353; 0DFF
; =========================================================
	LDA $0353; GG; 0E02
	STA $D021; 0E05
	JMP LBL1L47; 0E08
LBL1L46:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L47:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L48:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $0340
;  vs. 
; WordIMM
; w23
LBL1L49:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0340 v. w23
	LDA $0341; 0E0B
	CMP #$00; 0E0E
	.BYTE #$D0, #$05; 0E10
	LDA $0340; 0E12
	CMP #$17; 0E15
	.BYTE #$90, #$03; 0E17
	JMP LBL1L51; jump to ELSE; 0E19
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L50:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; RULE: init: '=' expression
; x
; w23
	LDA #$17; 0E1C
	LDX #$00; 0E1E
; RULE: statement: ID init
	STA $0340; 0E20
	STX $0341; 0E23
; =========================================================
	JMP LBL1L52; 0E26
LBL1L51:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L52:
	RTS; 0E29
; RULE: datatype: void
; ======================== checkRight ========================
LBL0L6:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L53:
; RULE: value: NUMBER: (38)
; UintID
; $0349
;  vs. 
; UintIMM
; u38
LBL1L54:			; Top of IF statement
	LDA $0349; 0E2A
	CMP #$26; 0E2D
	.BYTE #$F0, #$03; 0E2F
	JMP LBL1L56; jump to ELSE; 0E31
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L55:
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; lastdirectiontaken
; u2
	LDA #$02; 0E34
; RULE: statement: ID init
	STA $033B; 0E36
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L21:
; RULE: value: NUMBER: (320)
; WordID
; $0340
;  vs. 
; WordIMM
; w320
LBL2L22:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0340 v. w320
	LDA $0341; 0E39
	CMP #$01; 0E3C
	.BYTE #$D0, #$05; 0E3E
	LDA $0340; 0E40
	CMP #$40; 0E43
	.BYTE #$90, #$03; 0E45
	JMP LBL2L24; jump to ELSE; 0E47
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L23:
; RULE: value: NUMBER: (1)
; $0340 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0E4A
	LDA #$01; 0E4B
	ADC $0340; 0E4D
	PHA; 0E50
	LDA #$00; 0E51
	ADC $0341; 0E53
	TAX; 0E56
	PLA; 0E57
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0340; 0E58
	STX $0341; 0E5B
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $0340 );
	LDA $0340; 0E5E
	STA $D000; 0E61
	LDA $0341; 0E64
	STA $2A; 0E67
	LDA #$01; 0E69
	EOR #$FF; 0E6B
	AND $D010; 0E6D
	STA $A7; 0E70
	LDA $2A; 0E72
	CLC; 0E74
	ADC $A7; 0E75
	STA $D010; 0E77
; RULE: value: NUMBER: (1)
; spritex( u1, $0340 );
	LDA $0340; 0E7A
	STA $D002; 0E7D
	LDA $0341; 0E80
	STA $2A; 0E83
	LDA #$01; 0E85
	ASL; 0E87
	ASL $2A; 0E88
	EOR #$FF; 0E8A
	AND $D010; 0E8C
	STA $A7; 0E8F
	LDA $2A; 0E91
	CLC; 0E93
	ADC $A7; 0E94
	STA $D010; 0E96
	JSR LBL0L8; moveLegs(); 0E99
	JMP LBL2L25; 0E9C
LBL2L24:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L25:
	JMP LBL1L57; 0E9F
LBL1L56:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L57:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L58:
; RULE: value: NUMBER: (320)
; WordID
; $0340
;  vs. 
; WordIMM
; w320
LBL1L59:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0340 v. w320
	LDA $0341; 0EA2
	CMP #$01; 0EA5
	.BYTE #$D0, #$05; 0EA7
	LDA $0340; 0EA9
	CMP #$40; 0EAC
	.BYTE #$F0, #$03; 0EAE
	JMP LBL1L61; jump to ELSE; 0EB0
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L60:
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D020; 0EB3
; RULE: init: '=' expression
; FF
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT FF=A datatype#: 00
; UINT UintID A
	STA $0354; 0EB6
; =========================================================
; RULE: value: NUMBER: (1)
; $0354 (0) - u1 (-1)
; UintID arith UintIMM
	LDA $0354; 0EB9
	SEC; 0EBC
	SBC #$01; 0EBD
; RULE: init: '=' expression
; FF
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0354; 0EBF
; =========================================================
	LDA $0354; FF; 0EC2
	STA $D020; 0EC5
	JMP LBL1L62; 0EC8
LBL1L61:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L62:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L63:
; RULE: value: NUMBER: (320)
; WordID
; $0340
;  vs. 
; WordIMM
; w320
LBL1L64:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0340 v. w320
	LDA $0341; 0ECB
	CMP #$01; 0ECE
	.BYTE #$D0, #$05; 0ED0
	LDA $0340; 0ED2
	CMP #$40; 0ED5
	.BYTE #$B0, #$03; 0ED7
	JMP LBL1L66; if c==0 jump to ELSE; 0ED9
	.BYTE #$D0, #$03; 0EDC
	JMP LBL1L66; if z==1 jump to ELSE; 0EDE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L65:
; RULE: value: NUMBER: (320)
; RULE: init: '=' expression
; x
; w320
	LDA #$40; 0EE1
	LDX #$01; 0EE3
; RULE: statement: ID init
	STA $0340; 0EE5
	STX $0341; 0EE8
; =========================================================
	JMP LBL1L67; 0EEB
LBL1L66:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L67:
	RTS; 0EEE
; RULE: datatype: void
; ======================== checkJump ========================
LBL0L7:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L68:
; RULE: value: NUMBER: (60)
; UintID
; $0349
;  vs. 
; UintIMM
; u60
LBL1L69:			; Top of IF statement
	LDA $0349; 0EEF
	CMP #$3C; 0EF2
	.BYTE #$F0, #$03; 0EF4
	JMP LBL1L71; jump to ELSE; 0EF6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L70:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L26:
; RULE: value: NUMBER: (0)
; UintID
; $033D
;  vs. 
; UintIMM
; u0
LBL2L27:			; Top of IF statement
	LDA $033D; 0EF9
	CMP #$00; 0EFC
	.BYTE #$D0, #$03; 0EFE
	JMP LBL2L29; if z==1 jump to ELSE; 0F00
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L28:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; recentjump
; u1
	LDA #$01; 0F03
; RULE: statement: ID init
	STA $033C; 0F05
; =========================================================
; =========================================================
;                         FOR LOOP
; =========================================================
LBL3L5:
	PHA; 0F08
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; jumpclock
; u0
	LDA #$00; 0F09
; RULE: statement: datatype ID init
; UINT jumpclock=A datatype#: 00
; UINT UintID A
	STA $0355; 0F0B
; ---------------------------------------------------------
; RULE: value: NUMBER: (24)
; UintID
; $0355
;  vs. 
; UintIMM
; u24
LBL3L6:			; Top of FOR Loop
	LDA $0355; 0F0E
	CMP #$18; 0F11
	.BYTE #$B0, #$03; 0F13
	JMP LBL3L8; if c==0 jump to BODY; 0F15
	JMP LBL3L9; jump out of FOR; 0F18
; =========================================================
; ---------------------------------------------------------
LBL3L7:
; inc(ID)
	INC $0355; 0F1B
	JMP LBL3L6; jump to top of FOR loop; 0F1E
; ---------------------------------------------------------
LBL3L8:
	JSR LBL0L14; delayfunction(); 0F21
; RULE: value: NUMBER: (1)
; $033F (0) - u1 (-1)
; UintID arith UintIMM
	LDA $033F; 0F24
	SEC; 0F27
	SBC #$01; 0F28
; RULE: init: '=' expression
; y
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $033F; 0F2A
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L0:
; RULE: value: NUMBER: (2)
; UintID
; $033B
;  vs. 
; UintIMM
; u2
LBL4L1:			; Top of IF statement
	LDA $033B; 0F2D
	CMP #$02; 0F30
	.BYTE #$F0, #$03; 0F32
	JMP LBL4L3; jump to ELSE; 0F34
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L2:
; RULE: value: NUMBER: (1)
; $0340 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0F37
	LDA #$01; 0F38
	ADC $0340; 0F3A
	PHA; 0F3D
	LDA #$00; 0F3E
	ADC $0341; 0F40
	TAX; 0F43
	PLA; 0F44
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0340; 0F45
	STX $0341; 0F48
; =========================================================
	JMP LBL4L4; 0F4B
LBL4L3:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (1)
; $0340 (2) - u1 (-1)
; WordID - (IntIMM || UintIMM)
	SEC; 0F4E
	LDA $0340; 0F4F
	SBC #$01; 0F52
	PHA; 0F54
	LDA $0341; 0F55
	SBC #$00; 0F58
	TAX; 0F5A
	PLA; 0F5B
; RULE: init: '=' expression
; x
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0340; 0F5C
	STX $0341; 0F5F
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L4:
; RULE: value: NUMBER: (0)
; spritex( u0, $0340 );
	LDA $0340; 0F62
	STA $D000; 0F65
	LDA $0341; 0F68
	STA $2A; 0F6B
	LDA #$01; 0F6D
	EOR #$FF; 0F6F
	AND $D010; 0F71
	STA $A7; 0F74
	LDA $2A; 0F76
	CLC; 0F78
	ADC $A7; 0F79
	STA $D010; 0F7B
; RULE: value: NUMBER: (1)
; spritex( u1, $0340 );
	LDA $0340; 0F7E
	STA $D002; 0F81
	LDA $0341; 0F84
	STA $2A; 0F87
	LDA #$01; 0F89
	ASL; 0F8B
	ASL $2A; 0F8C
	EOR #$FF; 0F8E
	AND $D010; 0F90
	STA $A7; 0F93
	LDA $2A; 0F95
	CLC; 0F97
	ADC $A7; 0F98
	STA $D010; 0F9A
; RULE: value: NUMBER: (0)
; spritey( u0, $033F );
	LDA $033F; 0F9D
	STA $D001; 0FA0
; RULE: value: NUMBER: (1)
; spritey( u1, $033F );
	LDA $033F; 0FA3
	STA $D003; 0FA6
; ---------------------------------------------------------
	JMP LBL3L7; jump to iterator; 0FA9
LBL3L9:
	PLA; 0FAC
; ---------------------------------------------------------
	JMP LBL2L30; 0FAD
LBL2L29:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L30:
	JMP LBL1L72; 0FB0
LBL1L71:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L72:
	RTS; 0FB3
; RULE: datatype: void
; ======================== moveLegs ========================
LBL0L8:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L73:
; RULE: value: NUMBER: (1)
; UintID
; $033E
;  vs. 
; UintIMM
; u1
LBL1L74:			; Top of IF statement
	LDA $033E; 0FB4
	CMP #$01; 0FB7
	.BYTE #$F0, #$03; 0FB9
	JMP LBL1L76; jump to ELSE; 0FBB
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L75:
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; whichsprite
; u2
	LDA #$02; 0FBE
; RULE: statement: ID init
	STA $033E; 0FC0
; =========================================================
; RULE: value: NUMBER: (1)
	LDA #$01; 0FC3
	EOR #$FF; 0FC5
	AND $D015; 0FC7
	STA $D015; 0FCA
; RULE: value: NUMBER: (2)
	LDA #$02; 0FCD
	ORA $D015; 0FCF
	STA $D015; 0FD2
	JMP LBL1L77; 0FD5
LBL1L76:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01; 0FD8
; RULE: statement: ID init
	STA $033E; 0FDA
; =========================================================
; RULE: value: NUMBER: (2)
	LDA #$02; 0FDD
	EOR #$FF; 0FDF
	AND $D015; 0FE1
	STA $D015; 0FE4
; RULE: value: NUMBER: (1)
	LDA #$01; 0FE7
	ORA $D015; 0FE9
	STA $D015; 0FEC
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L77:
	RTS; 0FEF
; RULE: datatype: void
; ======================== checkIfStanding ========================
LBL0L9:
; RULE: datatype: word
; RULE: init: '=' expression
; myX
; $0340
; RULE: statement: datatype ID init
; WORD myX=$0340 datatype#: 02
	LDA $0340; 0FF0
	LDX $0341; 0FF3
	STA $0356; 0FF6
	STX $0357; 0FF9
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; myY
; $033F
; RULE: statement: datatype ID init
; UINT myY=$033F datatype#: 00
; UINT UintID UintID
	LDA $033F; 0FFC
	STA $0358; 0FFF
; =========================================================
; =========================================================
;                         lsr(ID) [word]
; =========================================================
	LSR $0357; 1002
	ROR $0356; 1005
; =========================================================
; RULE: datatype: uint
	LDA $0356; 1008
; RULE: init: '=' expression
; XXX
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT XXX=A datatype#: 00
; UINT UintID A
	STA $0359; 100B
; =========================================================
; RULE: value: NUMBER: (6)
; $0359 (0) - u6 (-1)
; UintID arith UintIMM
	LDA $0359; 100E
	SEC; 1011
	SBC #$06; 1012
; RULE: init: '=' expression
; XXX
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0359; 1014
; =========================================================
; RULE: value: NUMBER: (29)
; $0358 (0) - u29 (-1)
; UintID arith UintIMM
	LDA $0358; 1017
	SEC; 101A
	SBC #$1D; 101B
; RULE: init: '=' expression
; myY
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0358; 101D
; =========================================================
	LDA $0359; 1020
	STA $FA; 1023
	LDA #$00; 1025
	STA $FB; 1027
	LDA $0358; 1029
	STA $FC; 102C
	JSR GETPLOT; 102E
	LDY #$00; 1031
	LDA ($02),Y; 1033
; RULE: init: '=' expression
; standing
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $033D; 1035
; =========================================================
	RTS; 1038
; RULE: datatype: void
; ======================== cr ========================
LBL0L10:
; RULE: value: NUM: (0x0D)
; RULE: value: NUM: (0x0D)->(u13)
	LDA #$0D; 1039
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 103B
	RTS; 103E
; RULE: datatype: void
; ======================== sp ========================
LBL0L11:
; RULE: value: NUM: (0x20)
; RULE: value: NUM: (0x20)->(u32)
	LDA #$20; 103F
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 1041
	RTS; 1044
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L12:
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D011; 1045
; RULE: init: '=' expression
; oldD011
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $035A; 1048
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D016; 104B
; RULE: init: '=' expression
; oldD016
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $035B; 104E
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D018; 1051
; RULE: init: '=' expression
; oldD018
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $035C; 1054
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D020; 1057
; RULE: init: '=' expression
; oldD020
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $035D; 105A
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D021; 105D
; RULE: init: '=' expression
; oldD021
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $035E; 1060
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $0286; 1063
; RULE: init: '=' expression
; oldChar
; A
; initializing an unknown with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $035F; 1066
; =========================================================
	RTS; 1069
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L13:
	LDA $035A; oldD011; 106A
	STA $D011; 106D
	LDA $035B; oldD016; 1070
	STA $D016; 1073
	LDA $035C; oldD018; 1076
	STA $D018; 1079
	LDA $035D; oldD020; 107C
	STA $D020; 107F
	LDA $035E; oldD021; 1082
	STA $D021; 1085
	LDA $035F; oldChar; 1088
	STA $0286; 108B
	RTS; 108E
; RULE: datatype: void
; ======================== delayfunction ========================
LBL0L14:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L78:
	PHA; 108F
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; ldx
; u0
	LDA #$00; 1090
; RULE: statement: datatype ID init
; WORD ldx=A datatype#: 00
	LDX #$00; 1092
	STA $0360; 1094
	STX $0361; 1097
; ---------------------------------------------------------
; WordID
; $0360
;  vs. 
; WordID
; $0342
LBL1L79:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD ID
; =========================================================
	LDA $0361; 109A
	CMP $0343; 109D
	.BYTE #$D0, #$06; 10A0
	LDA $0360; 10A2
	CMP $0342; 10A5
	.BYTE #$B0, #$03; 10A8
	JMP LBL1L81; if c==0 jump to BODY; 10AA
	JMP LBL1L82; jump out of FOR; 10AD
; =========================================================
; ---------------------------------------------------------
LBL1L80:
; RULE: value: NUMBER: (1)
; $0360 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 10B0
	LDA #$01; 10B1
	ADC $0360; 10B3
	PHA; 10B6
	LDA #$00; 10B7
	ADC $0361; 10B9
	TAX; 10BC
	PLA; 10BD
; RULE: init: '=' expression
; ldx
; XA
; initializing a word with XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0360; 10BE
	STX $0361; 10C1
	JMP LBL1L79; jump to top of FOR loop; 10C4
; ---------------------------------------------------------
LBL1L81:
	NOP; 10C7
; ---------------------------------------------------------
	JMP LBL1L80; jump to iterator; 10C8
LBL1L82:
	PLA; 10CB
; ---------------------------------------------------------
	RTS; 10CC
; RULE: datatype: void
; ======================== createplatforms ========================
LBL0L15:
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; p1
; u0
	LDA #$00; 10CD
; RULE: statement: ID init
	STA $0336; 10CF
; =========================================================
; RULE: value: NUMBER: (195)
; RULE: init: '=' expression
; p2
; u195
	LDA #$C3; 10D2
; RULE: statement: ID init
	STA $0337; 10D4
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; p3
; u160
	LDA #$A0; 10D7
; RULE: statement: ID init
	STA $0338; 10D9
; =========================================================
; RULE: value: NUMBER: (197)
; RULE: init: '=' expression
; p4
; u197
	LDA #$C5; 10DC
; RULE: statement: ID init
	STA $0339; 10DE
; =========================================================
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; p5
; u1
	LDA #$01; 10E1
; RULE: statement: ID init
	STA $033A; 10E3
; =========================================================
	JSR LBL0L1; rect(); 10E6
	; VOID functions do NOT return a value; 10E9
; RULE: value: NUMBER: (130)
; RULE: init: '=' expression
; p1
; u130
	LDA #$82; 10E9
; RULE: statement: ID init
	STA $0336; 10EB
; =========================================================
; RULE: value: NUMBER: (180)
; RULE: init: '=' expression
; p2
; u180
	LDA #$B4; 10EE
; RULE: statement: ID init
	STA $0337; 10F0
; =========================================================
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; p3
; u160
	LDA #$A0; 10F3
; RULE: statement: ID init
	STA $0338; 10F5
; =========================================================
; RULE: value: NUMBER: (182)
; RULE: init: '=' expression
; p4
; u182
	LDA #$B6; 10F8
; RULE: statement: ID init
	STA $0339; 10FA
; =========================================================
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; p5
; u2
	LDA #$02; 10FD
; RULE: statement: ID init
	STA $033A; 10FF
; =========================================================
	JSR LBL0L1; rect(); 1102
	; VOID functions do NOT return a value; 1105
; RULE: value: NUMBER: (30)
; RULE: init: '=' expression
; p1
; u30
	LDA #$1E; 1105
; RULE: statement: ID init
	STA $0336; 1107
; =========================================================
; RULE: value: NUMBER: (175)
; RULE: init: '=' expression
; p2
; u175
	LDA #$AF; 110A
; RULE: statement: ID init
	STA $0337; 110C
; =========================================================
; RULE: value: NUMBER: (125)
; RULE: init: '=' expression
; p3
; u125
	LDA #$7D; 110F
; RULE: statement: ID init
	STA $0338; 1111
; =========================================================
; RULE: value: NUMBER: (177)
; RULE: init: '=' expression
; p4
; u177
	LDA #$B1; 1114
; RULE: statement: ID init
	STA $0339; 1116
; =========================================================
; RULE: value: NUMBER: (3)
; RULE: init: '=' expression
; p5
; u3
	LDA #$03; 1119
; RULE: statement: ID init
	STA $033A; 111B
; =========================================================
	JSR LBL0L1; rect(); 111E
	; VOID functions do NOT return a value; 1121
	RTS; 1121
HTD_STR:
	.BYTE #$00, #$00, #$00, #$00, #$00, #$00, #$00; 1122
; ------------------------------------------------------------
; This chunk of code is by: Andrew Jacobs, 28-Feb-2004
; Taken from: http://6502.org/source/integers/hex2dec-more.htm
; ------------------------------------------------------------
HTD_IN:
	.BYTE #$00, #$00; 1129
HTD_OUT:
	.BYTE #$00, #$00, #$00; 112B
WORD2DEC:		;2 Byte Word to Decimal
	PLA; 112E
	STA $0334; 112F
	PLA; 1132
	STA $0335; 1133
	SED; 1136
	LDA #$00; 1137
	STA HTD_OUT; 1139
	STA HTD_OUT+1; 113C
	STA HTD_OUT+2; 113F
	LDX #$10; 1142
CNVBIT:
	ASL HTD_IN; 1144
	ROL HTD_IN+1; 1147
	LDA HTD_OUT; 114A
	ADC HTD_OUT; 114D
	STA HTD_OUT; 1150
	LDA HTD_OUT+1; 1153
	ADC HTD_OUT+1; 1156
	STA HTD_OUT+1; 1159
	LDA HTD_OUT+2; 115C
	ADC HTD_OUT+2; 115F
	STA HTD_OUT+2; 1162
	DEX; 1165
	BNE CNVBIT; 1166
	CLD; 1168
; ------------------------------------------------------------
	LDA HTD_OUT; 1169
	PHA; 116C
	LSR; 116D
	LSR; 116E
	LSR; 116F
	LSR; 1170
	ORA #$30; 1171
	STA HTD_STR+4; 1173
	PLA; 1176
	AND #$0F; 1177
	ORA #$30; 1179
	STA HTD_STR+5; 117B
	LDA HTD_OUT+1; 117E
	PHA; 1181
	LSR; 1182
	LSR; 1183
	LSR; 1184
	LSR; 1185
	ORA #$30; 1186
	STA HTD_STR+2; 1188
	PLA; 118B
	AND #$0F; 118C
	ORA #$30; 118E
	STA HTD_STR+3; 1190
	LDA HTD_OUT+2; 1193
	PHA; 1196
	LSR; 1197
	LSR; 1198
	LSR; 1199
	LSR; 119A
	ORA #$30; 119B
	STA HTD_STR; 119D
	PLA; 11A0
	AND #$0F; 11A1
	ORA #$30; 11A3
	STA HTD_STR+1; 11A5
	LDA $0335; 11A8
	PHA; 11AB
	LDA $0334; 11AC
	PHA; 11AF
	RTS; 11B0
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
	SEI; 11B1
	LDA $FA; xcoord; 11B2
	AND #$03; 11B4
	STA $FE; store; 11B6
	LDA #$00; 11B8
	STA $02; loc; 11BA
	STA $FF; store + 1; 11BC
	LDA $FD; colcode; 11BE
	CLC; 11C0
	ROR; 11C1
	ROR; 11C2
	ROR; 11C3
	DEC $FE; store; 11C4
	.BYTE #$10, #$FA; 11C6
	STA $50; mask; 11C8
	LDA $FA; xcoord; 11CA
	AND #$FC; 11CC
	ASL; 11CE
	ROL $FF; store + 1; 11CF
	STA $FE; store; 11D1
	LDA $FC; ycoord; 11D3
	LSR; 11D5
	LSR; 11D6
	LSR; 11D7
	STA $03; loc + 1; 11D8
	LSR; 11DA
	ROR $02; loc; 11DB
	LSR; 11DD
	ROR $02; loc; 11DE
	CLC; 11E0
	ADC $03; loc + 1; 11E1
	STA $03; loc + 1; 11E3
	LDA $FC; ycoord; 11E5
	AND #$07; 11E7
	ADC $02; loc; 11E9
	ADC $FE; store ; 11EB
	STA $02; loc; 11ED
	LDA $03; loc + 1; 11EF
	ADC $FF; store + 1; 11F1
	STA $22; tmpstore; 11F3
; These subroutines I added to calculate the addresses based on VICII settings
	JSR BNKMEM; 11F5
	PLA; 11F8
	CLC; 11F9
	ADC $22;; 11FA
	STA $22; tmpstore; 11FC
	JSR BMPMEM; 11FE
	PLA; 1201
	CLC; 1202
	ADC $22; tmpstore; 1203
	STA $03; loc + 1; 1205
	LDY #$00; 1207
	LDA ($02),Y; 1209
	ORA $50; mask; 120B
	STA ($02),Y; 120D
	CLI; 120F
	RTS; 1210
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
	SEI; 1211
	LDA $FA; 1212
	AND #$03; 1214
	STA $5C; 1216
	LDA #$00; 1218
	STA $02; 121A
	STA $5D; 121C
	LDA $FD; 121E
	CLC; 1220
	ROR; 1221
	ROR; 1222
	ROR; 1223
	DEC $5C; 1224
	.BYTE #$10, #$FA; 1226
	STA $50; 1228
	LDA $FA; 122A
	AND #$FC; 122C
	ASL; 122E
	ROL $5D; 122F
	STA $5C; 1231
	LDA $FC; 1233
	LSR; 1235
	LSR; 1236
	LSR; 1237
	STA $03; 1238
	LSR; 123A
	ROR $02; 123B
	LSR; 123D
	ROR $02; 123E
	CLC; 1240
	ADC $03; 1241
	STA $03; 1243
	LDA $FC; 1245
	AND #$07; 1247
	ADC $02; 1249
	ADC $5C; 124B
	STA $02; 124D
	LDA $03; 124F
	ADC $5D; 1251
	STA $03; 1253
	JSR BNKMEM; 1255
	PLA; 1258
	CLC; 1259
	ADC $03; 125A
	STA $03; 125C
	JSR BMPMEM; 125E
	PLA; 1261
	CLC; 1262
	ADC $03; 1263
	STA $03; 1265
	CLI; 1267
	RTS; 1268
; ^^^------------------------------------^^^
; ^^^ from p164 of Advanced Machine Code ^^^
; ^^^  Programming for the Commodore 64  ^^^
; ^^^ w/ some changes to deal with banks ^^^
; ^^^------------------------------------^^^
BMPMEM:		; Get the bitmap mem location from the vic II
	PLA; 1269
	STA $0334; 126A
	PLA; 126D
	STA $0335; 126E
	LDA $D018; 1271
	AND #$08; 1274
	CLC; 1276
	ASL; 1277
	ASL; 1278
	PHA; 1279
	LDA $0335; 127A
	PHA; 127D
	LDA $0334; 127E
	PHA; 1281
	RTS; 1282
CHRMEM:		; Get the character mem location from the vic II
	PLA; 1283
	STA $0334; 1284
	PLA; 1287
	STA $0335; 1288
	LDA $D018; 128B
	AND #$0E; 128E
	CLC; 1290
	ASL; 1291
	ASL; 1292
	PHA; 1293
	LDA $0335; 1294
	PHA; 1297
	LDA $0334; 1298
	PHA; 129B
	RTS; 129C
SCRMEM:		; Get the screen mem location from the vic II
	PLA; 129D
	STA $0334; 129E
	PLA; 12A1
	STA $0335; 12A2
	LDA $D018; 12A5
	AND #$F0; 12A8
	CLC; 12AA
	LSR; 12AB
	LSR; 12AC
	PHA; 12AD
	LDA $0335; 12AE
	PHA; 12B1
	LDA $0334; 12B2
	PHA; 12B5
	RTS; 12B6
BNKMEM:		; Get the bank memory from the vic II
	PLA; 12B7
	STA $0334; 12B8
	PLA; 12BB
	STA $0335; 12BC
	LDA $DD00; 12BF
	EOR #$FF; 12C2
	AND #$03; 12C4
	CLC; 12C6
	ASL; 12C7
	ASL; 12C8
	ASL; 12C9
	ASL; 12CA
	ASL; 12CB
	ASL; 12CC
	PHA; 12CD
	LDA $0335; 12CE
	PHA; 12D1
	LDA $0334; 12D2
	PHA; 12D5
	RTS; 12D6
BYTE2HEX:		;Display a Hexadecimal Byte
	PLA; 12D7
	STA $0334; 12D8
	PLA; 12DB
	STA $0335; 12DC
	CLD; 12DF
	PLA; 12E0
	TAX; 12E1
	AND #$F0; 12E2
	LSR; 12E4
	LSR; 12E5
	LSR; 12E6
	LSR; 12E7
	CMP #$0A; 12E8
	.BYTE #$90, #$03; 12EA
	CLC; 12EC
	ADC #$07; 12ED
	ADC #$30; 12EF
	JSR $FFD2; 12F1
	TXA; 12F4
	AND #$0F; 12F5
	CMP #$0A; 12F7
	.BYTE #$90, #$03; 12F9
	CLC; 12FB
	ADC #$07; 12FC
	ADC #$30; 12FE
	JSR $FFD2; 1300
	LDA $0335; 1303
	PHA; 1306
	LDA $0334; 1307
	PHA; 130A
	RTS; 130B
MOBCPY:		; Copy 63 bytes from $FB/$FC to $FD/$FE
	SEI; 130C
	CLC; 130D
	LDA #$01; 130E
	ADC $FB; 1310
	STA $FB; 1312
	LDA #$00; 1314
	ADC $FC; 1316
	STA $FC; 1318
	LDY #$3F; 131A
; top-of-loop
MOBCPTOP:
	CPY #$FF; 131C
	.BYTE #$F0, #$08; 131E
	LDA ($FB),Y; 1320
	STA ($FD),Y; 1322
	DEY; 1324
	JMP MOBCPTOP; 1325
; bottom-of-loop
	CLI; 1328
	RTS; 1329
PRN:
	LDY #$00; 132A
PRN_LOOP:
	LDA ($02),Y; 132C
	CMP #$00; 132E
	BEQ PRN_END; 1330
	JSR $FFD2; 1332
	INY; 1335
	JMP PRN_LOOP; 1336
PRN_END:
	RTS; 1339
; $133a			"BNK: "
STRLBL0:
	.BYTE #$42, #$4E, #$4B, #$3A, #$20, #$00
; $1340			" SCR: "
STRLBL1:
	.BYTE #$20, #$53, #$43, #$52, #$3A, #$20, #$00
; $1347			" BMP: "
STRLBL2:
	.BYTE #$20, #$42, #$4D, #$50, #$3A, #$20, #$00
