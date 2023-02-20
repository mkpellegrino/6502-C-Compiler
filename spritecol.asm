; RULE: datatype: int
.org $0834
; =========================================================
;                         main()
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; one
; w1
; unknown type
; w1
; RULE: statement: datatype ID init
; WORD one=w1 datatype#: 02
	LDA #$01; 0834
	LDX #$00; 0836
	STA $0336; 0838
	STX $0337; 083B
; =========================================================
; RULE: datatype: word
; RULE: statement: datatype ID '[' (U)INTIMM ']'  <== ARRAY
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID '[' (U)INTIMM ']'  <== ARRAY
; =========================================================
	LDA #$02; 083E
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT x1d=A datatype#: 00
; UINT UintID A
	STA $0350; 0840
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT y2d=A datatype#: 00
; UINT UintID A
	STA $0351; 0843
; =========================================================
	JSR LBL0L14; shortcls(); 0846
; Switch out the ROM
	SEI; 0849
	LDA $01; 084A
	AND #$FE; 084C
	STA $01; 084E
	CLI; 0850
; ------------------
	JSR LBL0L12; saveregs(); 0851
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$00; 0854
	STA $D020; 0856
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$00; 0859
	STA $D021; 085B
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$05; 085E
	STA $0286; 0860
; =========================================================
;                         printf("SPRITE COLLISION TEST\nBY MICHAEL K. PELLEGRINO\nUSING 64C COMPILER\nFEBRUARY 11, 2023\nUP: 8, DOWN: K, LEFT: U, RIGHT: O");
; =========================================================
	LDA #$14; 0863
	STA $03; 0865
	LDA #$35; 0867
	STA $02; 0869
	JSR PRN; 086B
; spriteon( exp );
	LDA #$00; 086E
	ORA $D015; 0870
	STA $D015; 0873
; bank( IMM );
	LDA #$03; 0876
	ORA $DD02; 0878
	STA $DD02; 087B
	LDA #$01; 087E
	EOR #$FF; 0880
	AND #$03; 0882
	STA $02; 0884
	LDA #$FC; 0886
	AND $DD00; 0888
	ORA $02; 088B
	STA $DD00; 088D
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite1
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite1=m datatype#: 00
; MOB Detected
	LDA #$F7; 0890
	STA LBL1L0; 0892
	LDA #$03; 0895
	STA LBL1L0+1; 0897
	LDA #$00; <- Sprite #; 089A
	ADC LBL1L0; 089C
	STA LBL1L0; 089F
	JSR SCRMEM; 08A2
	PLA; 08A5
	ADC LBL1L0+1; 08A6
	STA LBL1L0+1; 08A9
	JSR BNKMEM; 08AC
	PLA; 08AF
	ADC LBL1L0+1; 08B0
	STA LBL1L0+1; 08B3
	LDA #$01; 08B6
	.BYTE #$8D; 08B8
LBL1L0:
	.BYTE #$00, #$00; 08B9
	JSR LBL1L1; 08BB
sprite1:
	.BYTE #$FF, #$FF, #$FF, #$EA, #$AA, #$AB, #$E5, #$55, #$5B, #$E5, #$55, #$5B, #$E5, #$65, #$9B, #$E5, #$75, #$DB, #$E5, #$96, #$5B, #$E5, #$A6, #$9B, #$E5, #$B6, #$DB, #$E5, #$D7, #$5B, #$E5, #$E7, #$9B, #$E5, #$F7, #$DB, #$E6, #$59, #$5B, #$E6, #$69, #$9B, #$E6, #$79, #$DB, #$E6, #$9A, #$5B, #$E6, #$AA, #$9B, #$E6, #$BA, #$DB, #$E5, #$55, #$5B, #$EA, #$AA, #$AB, #$FF, #$FF, #$FF
LBL1L1:
	PLA; 08FD
	STA $FB; 08FE
	PLA; 0900
	STA $FC; 0901
	LDA #$40; 0903
	STA $FD; 0905
	LDA #$00; 0907
	STA $FE; 0909
	JSR BNKMEM; 090B
	PLA; 090E
	CLC; 090F
	ADC $FE; 0910
	STA $FE; 0912
	JSR MOBCPY; 0914
; =========================================================
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite2
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite2=m datatype#: 00
; MOB Detected
	LDA #$F7; 0917
	STA LBL1L2; 0919
	LDA #$03; 091C
	STA LBL1L2+1; 091E
	LDA #$01; <- Sprite #; 0921
	ADC LBL1L2; 0923
	STA LBL1L2; 0926
	JSR SCRMEM; 0929
	PLA; 092C
	ADC LBL1L2+1; 092D
	STA LBL1L2+1; 0930
	JSR BNKMEM; 0933
	PLA; 0936
	ADC LBL1L2+1; 0937
	STA LBL1L2+1; 093A
	LDA #$02; 093D
	.BYTE #$8D; 093F
LBL1L2:
	.BYTE #$00, #$00; 0940
	JSR LBL1L3; 0942
sprite2:
	.BYTE #$69, #$EA, #$5A, #$DD, #$7F, #$5E, #$79, #$96, #$6D, #$FD, #$9E, #$A6, #$6D, #$AD, #$DE, #$E9, #$7E, #$DA, #$EF, #$5D, #$76, #$DD, #$57, #$5F, #$59, #$DB, #$F5, #$ED, #$F5, #$96, #$BB, #$6A, #$EA, #$FB, #$9D, #$FD, #$E6, #$F6, #$FA, #$EF, #$EE, #$DF, #$95, #$59, #$96, #$56, #$AB, #$DB, #$E9, #$FA, #$D7, #$55, #$F7, #$B9, #$E5, #$A7, #$F6, #$D5, #$F6, #$7D, #$59, #$6A, #$5E
LBL1L3:
	PLA; 0984
	STA $FB; 0985
	PLA; 0987
	STA $FC; 0988
	LDA #$80; 098A
	STA $FD; 098C
	LDA #$00; 098E
	STA $FE; 0990
	JSR BNKMEM; 0992
	PLA; 0995
	CLC; 0996
	ADC $FE; 0997
	STA $FE; 0999
	JSR MOBCPY; 099B
; =========================================================
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite3
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite3=m datatype#: 00
; MOB Detected
	LDA #$F7; 099E
	STA LBL1L4; 09A0
	LDA #$03; 09A3
	STA LBL1L4+1; 09A5
	LDA #$02; <- Sprite #; 09A8
	ADC LBL1L4; 09AA
	STA LBL1L4; 09AD
	JSR SCRMEM; 09B0
	PLA; 09B3
	ADC LBL1L4+1; 09B4
	STA LBL1L4+1; 09B7
	JSR BNKMEM; 09BA
	PLA; 09BD
	ADC LBL1L4+1; 09BE
	STA LBL1L4+1; 09C1
	LDA #$03; 09C4
	.BYTE #$8D; 09C6
LBL1L4:
	.BYTE #$00, #$00; 09C7
	JSR LBL1L5; 09C9
sprite3:
	.BYTE #$69, #$EA, #$5A, #$DD, #$7F, #$5E, #$79, #$96, #$6D, #$FD, #$9E, #$A6, #$6D, #$AD, #$DE, #$E9, #$7E, #$DA, #$EF, #$5D, #$76, #$DD, #$57, #$5F, #$59, #$DB, #$F5, #$ED, #$F5, #$96, #$BB, #$6A, #$EA, #$FB, #$9D, #$FD, #$E6, #$F6, #$FA, #$EF, #$EE, #$DF, #$95, #$59, #$96, #$56, #$AB, #$DB, #$E9, #$FA, #$D7, #$55, #$F7, #$B9, #$E5, #$A7, #$F6, #$D5, #$F6, #$7D, #$59, #$6A, #$5E
LBL1L5:
	PLA; 0A0B
	STA $FB; 0A0C
	PLA; 0A0E
	STA $FC; 0A0F
	LDA #$C0; 0A11
	STA $FD; 0A13
	LDA #$00; 0A15
	STA $FE; 0A17
	JSR BNKMEM; 0A19
	PLA; 0A1C
	CLC; 0A1D
	ADC $FE; 0A1E
	STA $FE; 0A20
	JSR MOBCPY; 0A22
; =========================================================
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite4
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite4=m datatype#: 00
; MOB Detected
	LDA #$F7; 0A25
	STA LBL1L6; 0A27
	LDA #$03; 0A2A
	STA LBL1L6+1; 0A2C
	LDA #$03; <- Sprite #; 0A2F
	ADC LBL1L6; 0A31
	STA LBL1L6; 0A34
	JSR SCRMEM; 0A37
	PLA; 0A3A
	ADC LBL1L6+1; 0A3B
	STA LBL1L6+1; 0A3E
	JSR BNKMEM; 0A41
	PLA; 0A44
	ADC LBL1L6+1; 0A45
	STA LBL1L6+1; 0A48
	LDA #$04; 0A4B
	.BYTE #$8D; 0A4D
LBL1L6:
	.BYTE #$00, #$00; 0A4E
	JSR LBL1L7; 0A50
sprite4:
	.BYTE #$BD, #$6F, #$D5, #$E6, #$F9, #$EE, #$5D, #$EF, #$B7, #$5D, #$D7, #$BD, #$6E, #$75, #$D5, #$E5, #$5B, #$59, #$AF, #$DF, #$7F, #$9D, #$D9, #$69, #$77, #$F9, #$F5, #$75, #$F5, #$66, #$5B, #$5B, #$AA, #$B7, #$ED, #$BB, #$E7, #$BB, #$77, #$DE, #$65, #$FD, #$E5, #$DE, #$55, #$95, #$6D, #$BB, #$65, #$75, #$EF, #$5B, #$AD, #$7F, #$FE, #$6F, #$75, #$AF, #$57, #$9D, #$9B, #$FB, #$99
LBL1L7:
	PLA; 0A92
	STA $FB; 0A93
	PLA; 0A95
	STA $FC; 0A96
	LDA #$00; 0A98
	STA $FD; 0A9A
	LDA #$01; 0A9C
	STA $FE; 0A9E
	JSR BNKMEM; 0AA0
	PLA; 0AA3
	CLC; 0AA4
	ADC $FE; 0AA5
	STA $FE; 0AA7
	JSR MOBCPY; 0AA9
; =========================================================
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite5
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite5=m datatype#: 00
; MOB Detected
	LDA #$F7; 0AAC
	STA LBL1L8; 0AAE
	LDA #$03; 0AB1
	STA LBL1L8+1; 0AB3
	LDA #$04; <- Sprite #; 0AB6
	ADC LBL1L8; 0AB8
	STA LBL1L8; 0ABB
	JSR SCRMEM; 0ABE
	PLA; 0AC1
	ADC LBL1L8+1; 0AC2
	STA LBL1L8+1; 0AC5
	JSR BNKMEM; 0AC8
	PLA; 0ACB
	ADC LBL1L8+1; 0ACC
	STA LBL1L8+1; 0ACF
	LDA #$05; 0AD2
	.BYTE #$8D; 0AD4
LBL1L8:
	.BYTE #$00, #$00; 0AD5
	JSR LBL1L9; 0AD7
sprite5:
	.BYTE #$BD, #$AE, #$99, #$AD, #$E5, #$AE, #$7F, #$A6, #$6B, #$5B, #$5F, #$B9, #$EA, #$D6, #$ED, #$7B, #$69, #$FA, #$FF, #$F6, #$FA, #$9E, #$96, #$9A, #$5B, #$FB, #$AF, #$FD, #$A7, #$79, #$99, #$EE, #$E6, #$6A, #$9F, #$E5, #$F9, #$A9, #$DB, #$59, #$F5, #$DE, #$9F, #$BA, #$6A, #$ED, #$D7, #$7F, #$A6, #$DA, #$E6, #$B7, #$99, #$67, #$95, #$65, #$DF, #$6F, #$B9, #$59, #$DD, #$BF, #$F7
LBL1L9:
	PLA; 0B19
	STA $FB; 0B1A
	PLA; 0B1C
	STA $FC; 0B1D
	LDA #$40; 0B1F
	STA $FD; 0B21
	LDA #$01; 0B23
	STA $FE; 0B25
	JSR BNKMEM; 0B27
	PLA; 0B2A
	CLC; 0B2B
	ADC $FE; 0B2C
	STA $FE; 0B2E
	JSR MOBCPY; 0B30
; =========================================================
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite6
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite6=m datatype#: 00
; MOB Detected
	LDA #$F7; 0B33
	STA LBL1L10; 0B35
	LDA #$03; 0B38
	STA LBL1L10+1; 0B3A
	LDA #$05; <- Sprite #; 0B3D
	ADC LBL1L10; 0B3F
	STA LBL1L10; 0B42
	JSR SCRMEM; 0B45
	PLA; 0B48
	ADC LBL1L10+1; 0B49
	STA LBL1L10+1; 0B4C
	JSR BNKMEM; 0B4F
	PLA; 0B52
	ADC LBL1L10+1; 0B53
	STA LBL1L10+1; 0B56
	LDA #$06; 0B59
	.BYTE #$8D; 0B5B
LBL1L10:
	.BYTE #$00, #$00; 0B5C
	JSR LBL1L11; 0B5E
sprite6:
	.BYTE #$6D, #$57, #$96, #$EA, #$E9, #$DE, #$B5, #$F7, #$DF, #$FD, #$B9, #$6E, #$DE, #$EB, #$67, #$DD, #$DA, #$F5, #$67, #$E9, #$BA, #$7F, #$BD, #$9A, #$E6, #$DF, #$95, #$EF, #$56, #$6D, #$F5, #$66, #$E9, #$F7, #$D6, #$D9, #$9D, #$56, #$5E, #$7A, #$DD, #$79, #$7B, #$EA, #$57, #$97, #$AE, #$57, #$B7, #$67, #$9F, #$F9, #$7A, #$AE, #$56, #$ED, #$9B, #$E5, #$BB, #$5D, #$69, #$DA, #$6A
LBL1L11:
	PLA; 0BA0
	STA $FB; 0BA1
	PLA; 0BA3
	STA $FC; 0BA4
	LDA #$80; 0BA6
	STA $FD; 0BA8
	LDA #$01; 0BAA
	STA $FE; 0BAC
	JSR BNKMEM; 0BAE
	PLA; 0BB1
	CLC; 0BB2
	ADC $FE; 0BB3
	STA $FE; 0BB5
	JSR MOBCPY; 0BB7
; =========================================================
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite7
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite7=m datatype#: 00
; MOB Detected
	LDA #$F7; 0BBA
	STA LBL1L12; 0BBC
	LDA #$03; 0BBF
	STA LBL1L12+1; 0BC1
	LDA #$06; <- Sprite #; 0BC4
	ADC LBL1L12; 0BC6
	STA LBL1L12; 0BC9
	JSR SCRMEM; 0BCC
	PLA; 0BCF
	ADC LBL1L12+1; 0BD0
	STA LBL1L12+1; 0BD3
	JSR BNKMEM; 0BD6
	PLA; 0BD9
	ADC LBL1L12+1; 0BDA
	STA LBL1L12+1; 0BDD
	LDA #$07; 0BE0
	.BYTE #$8D; 0BE2
LBL1L12:
	.BYTE #$00, #$00; 0BE3
	JSR LBL1L13; 0BE5
sprite7:
	.BYTE #$79, #$FD, #$A6, #$D7, #$7E, #$D5, #$6D, #$E6, #$55, #$EB, #$55, #$A9, #$EF, #$BE, #$FB, #$A9, #$65, #$76, #$ED, #$E9, #$BB, #$FD, #$55, #$9A, #$9A, #$6A, #$6F, #$6B, #$6F, #$E6, #$57, #$F7, #$6F, #$7E, #$EE, #$DB, #$BF, #$56, #$9A, #$6B, #$7F, #$6A, #$A7, #$FE, #$DD, #$B7, #$9A, #$AA, #$9F, #$D5, #$DB, #$7A, #$FA, #$6E, #$AF, #$A5, #$EF, #$B5, #$B7, #$5E, #$F9, #$7E, #$DD
LBL1L13:
	PLA; 0C27
	STA $FB; 0C28
	PLA; 0C2A
	STA $FC; 0C2B
	LDA #$C0; 0C2D
	STA $FD; 0C2F
	LDA #$01; 0C31
	STA $FE; 0C33
	JSR BNKMEM; 0C35
	PLA; 0C38
	CLC; 0C39
	ADC $FE; 0C3A
	STA $FE; 0C3C
	JSR MOBCPY; 0C3E
; =========================================================
; RULE: datatype: mob
; RULE: init: '=' expression
; sprite8
; m
; MOB
; RULE: statement: datatype ID init
; MOB sprite8=m datatype#: 00
; MOB Detected
	LDA #$F7; 0C41
	STA LBL1L14; 0C43
	LDA #$03; 0C46
	STA LBL1L14+1; 0C48
	LDA #$07; <- Sprite #; 0C4B
	ADC LBL1L14; 0C4D
	STA LBL1L14; 0C50
	JSR SCRMEM; 0C53
	PLA; 0C56
	ADC LBL1L14+1; 0C57
	STA LBL1L14+1; 0C5A
	JSR BNKMEM; 0C5D
	PLA; 0C60
	ADC LBL1L14+1; 0C61
	STA LBL1L14+1; 0C64
	LDA #$08; 0C67
	.BYTE #$8D; 0C69
LBL1L14:
	.BYTE #$00, #$00; 0C6A
	JSR LBL1L15; 0C6C
sprite8:
	.BYTE #$E5, #$56, #$6B, #$F7, #$F9, #$A7, #$FE, #$6A, #$9A, #$76, #$FF, #$7E, #$D6, #$DD, #$D7, #$AE, #$AE, #$59, #$FB, #$75, #$66, #$65, #$75, #$A6, #$F7, #$BD, #$7E, #$B7, #$57, #$DE, #$9D, #$55, #$6D, #$F5, #$DE, #$9D, #$EE, #$D9, #$95, #$AE, #$DB, #$7B, #$E7, #$6F, #$A5, #$B7, #$59, #$EA, #$75, #$9D, #$E6, #$F7, #$67, #$AA, #$DE, #$7B, #$F6, #$9F, #$AB, #$E5, #$BE, #$9A, #$95
LBL1L15:
	PLA; 0CAE
	STA $FB; 0CAF
	PLA; 0CB1
	STA $FC; 0CB2
	LDA #$00; 0CB4
	STA $FD; 0CB6
	LDA #$02; 0CB8
	STA $FE; 0CBA
	JSR BNKMEM; 0CBC
	PLA; 0CBF
	CLC; 0CC0
	ADC $FE; 0CC1
	STA $FE; 0CC3
	JSR MOBCPY; 0CC5
; =========================================================
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$3B; 0CC8
	STA $D011; 0CCA
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; 0CCD
	STA $D016; 0CCF
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; 0CD2
	STA $D018; 0CD4
	JSR LBL0L1; clearhires(); 0CD7
; RULE: init: '=' expression
; 0
; w288
; unknown type
; w288
	LDX #$00; 0CDA
	LDA #$20; 0CDC
	STA $0338,X; 0CDE
	INX; 0CE1
	LDA #$01; 0CE2
	STA $0338,X; 0CE4
; =========================================================
; RULE: init: '=' expression
; 1
; w128
; unknown type
; w128
	LDX #$02; 0CE7
	LDA #$80; 0CE9
	STA $0338,X; 0CEB
	INX; 0CEE
	LDA #$00; 0CEF
	STA $0338,X; 0CF1
; =========================================================
; RULE: init: '=' expression
; 2
; w240
; unknown type
; w240
	LDX #$04; 0CF4
	LDA #$F0; 0CF6
	STA $0338,X; 0CF8
	INX; 0CFB
	LDA #$00; 0CFC
	STA $0338,X; 0CFE
; =========================================================
; RULE: init: '=' expression
; 3
; w32
; unknown type
; w32
	LDX #$06; 0D01
	LDA #$20; 0D03
	STA $0338,X; 0D05
	INX; 0D08
	LDA #$00; 0D09
	STA $0338,X; 0D0B
; =========================================================
; RULE: init: '=' expression
; 4
; w128
; unknown type
; w128
	LDX #$08; 0D0E
	LDA #$80; 0D10
	STA $0338,X; 0D12
	INX; 0D15
	LDA #$00; 0D16
	STA $0338,X; 0D18
; =========================================================
; RULE: init: '=' expression
; 5
; w240
; unknown type
; w240
	LDX #$0A; 0D1B
	LDA #$F0; 0D1D
	STA $0338,X; 0D1F
	INX; 0D22
	LDA #$00; 0D23
	STA $0338,X; 0D25
; =========================================================
; RULE: init: '=' expression
; 6
; w32
; unknown type
; w32
	LDX #$0C; 0D28
	LDA #$20; 0D2A
	STA $0338,X; 0D2C
	INX; 0D2F
	LDA #$00; 0D30
	STA $0338,X; 0D32
; =========================================================
; RULE: init: '=' expression
; 7
; w128
; unknown type
; w128
	LDX #$0E; 0D35
	LDA #$80; 0D37
	STA $0338,X; 0D39
	INX; 0D3C
	LDA #$00; 0D3D
	STA $0338,X; 0D3F
; =========================================================
; RULE: init: '=' expression
; 0
; u64
	LDA #$40; 0D42
; UintID_array[(U)IntIMM] = A
	LDX #$00; 0D44
	STA $0348,X; 0D46
; =========================================================
; RULE: init: '=' expression
; 1
; u64
	LDA #$40; 0D49
; UintID_array[(U)IntIMM] = A
	LDX #$01; 0D4B
	STA $0348,X; 0D4D
; =========================================================
; RULE: init: '=' expression
; 2
; u64
	LDA #$40; 0D50
; UintID_array[(U)IntIMM] = A
	LDX #$02; 0D52
	STA $0348,X; 0D54
; =========================================================
; RULE: init: '=' expression
; 3
; u112
	LDA #$70; 0D57
; UintID_array[(U)IntIMM] = A
	LDX #$03; 0D59
	STA $0348,X; 0D5B
; =========================================================
; RULE: init: '=' expression
; 4
; u112
	LDA #$70; 0D5E
; UintID_array[(U)IntIMM] = A
	LDX #$04; 0D60
	STA $0348,X; 0D62
; =========================================================
; RULE: init: '=' expression
; 5
; u112
	LDA #$70; 0D65
; UintID_array[(U)IntIMM] = A
	LDX #$05; 0D67
	STA $0348,X; 0D69
; =========================================================
; RULE: init: '=' expression
; 6
; u160
	LDA #$A0; 0D6C
; UintID_array[(U)IntIMM] = A
	LDX #$06; 0D6E
	STA $0348,X; 0D70
; =========================================================
; RULE: init: '=' expression
; 7
; u160
	LDA #$A0; 0D73
; UintID_array[(U)IntIMM] = A
	LDX #$07; 0D75
	STA $0348,X; 0D77
; =========================================================
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$0D; 0D7A
	STA $D025; 0D7C
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$05; 0D7F
	STA $D026; 0D81
	LDA #$0A; 0D84
	STA $D027; 0D86
	LDA #$0B; 0D89
	STA $D028; 0D8B
	LDA #$0C; 0D8E
	STA $D029; 0D90
	LDA #$01; 0D93
	STA $D02A; 0D95
	LDA #$02; 0D98
	STA $D02B; 0D9A
	LDA #$03; 0D9D
	STA $D02C; 0D9F
	LDA #$04; 0DA2
	STA $D02D; 0DA4
	LDA #$05; 0DA7
	STA $D02E; 0DA9
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$FF; 0DAC
	STA $D01C; 0DAE
	JSR LBL0L0; updateSpritePositions(); 0DB1
; spriteon( exp );
	LDA #$FF; 0DB4
	ORA $D015; 0DB6
	STA $D015; 0DB9
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$01; 0DBC
	STA $47F8; 0DBE
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$02; 0DC1
	STA $47F9; 0DC3
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$03; 0DC6
	STA $47FA; 0DC8
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$04; 0DCB
	STA $47FB; 0DCD
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$05; 0DD0
	STA $47FC; 0DD2
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$06; 0DD5
	STA $47FD; 0DD7
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$07; 0DDA
	STA $47FE; 0DDC
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$08; 0DDF
	STA $47FF; 0DE1
; RULE: datatype: uint
; RULE: init: '=' expression
; timer
; u0
	LDA #$00; 0DE4
; RULE: statement: datatype ID init
; UINT timer=A datatype#: 00
; UINT UintID A
	STA $0352; 0DE6
; =========================================================
; RULE: datatype: uint
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0DE9
; RULE: init: '=' expression
; c
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT c=A datatype#: 00
; UINT UintID A
	STA $0353; 0DEB
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0DEE
LBL1L16:
; ---------------------------------------------------------
; UintID
; $0353
;  vs. 
; UintIMM
; u62
LBL1L17:			; Top of WHILE Loop
	LDA $0353; 0DEF
	CMP #$3E; 0DF2
	.BYTE #$D0, #$03; 0DF4
	JMP LBL1L19; if z==1 jump to ELSE; 0DF6
; =========================================================
LBL1L18:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L0:
; UintID
; $0352
;  vs. 
; UintIMM
; u10
LBL2L1:			; Top of IF statement
	LDA $0352; 0DF9
	CMP #$0A; 0DFC
	.BYTE #$F0, #$03; BEQ +3; 0DFE
	JMP LBL2L3; jump to ELSE; 0E00
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L2:
	JSR LBL0L3; checkRight(); 0E03
	JSR LBL0L2; checkLeft(); 0E06
	JSR LBL0L4; checkUp(); 0E09
	JSR LBL0L5; checkDown(); 0E0C
	JSR LBL0L7; updateAIPositions(); 0E0F
	JSR LBL0L0; updateSpritePositions(); 0E12
	JSR LBL0L6; checkCollision(); 0E15
	JMP LBL2L4; 0E18
LBL2L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L4:
; inc(expression)
	INC $0352; 0E1B
; =========================================================
	LDA #$3F; 0E1E
	AND $0352; 0E20
; RULE: init: '=' expression
; timer
; A
; initialising an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0352; 0E23
; =========================================================
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; 0E26
; RULE: init: '=' expression
; c
; A
; initialising an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0353; 0E28
; =========================================================
	JMP LBL1L17; jump to top of WHILE loop; 0E2B
LBL1L19:
	PLA; 0E2E
	JSR LBL0L11; clearkb(); 0E2F
; spriteset( exp );
	LDA #$00; 0E32
	STA $D015; 0E34
; bank( IMM );
	LDA #$03; 0E37
	ORA $DD02; 0E39
	STA $DD02; 0E3C
	LDA #$00; 0E3F
	EOR #$FF; 0E41
	AND #$03; 0E43
	STA $02; 0E45
	LDA #$FC; 0E47
	AND $DD00; 0E49
	ORA $02; 0E4C
	STA $DD00; 0E4E
	JSR LBL0L13; restoreregs(); 0E51
; Switch the ROM back in
	SEI; 0E54
	LDA $01; 0E55
	ORA #$01; 0E57
	STA $01; 0E59
	CLI; 0E5B
; ------------------
	RTS; 0E5C
; RULE: datatype: void
; ======================== updateSpritePositions ========================
LBL0L0:
; Preserve $02
	LDA $02; 0E5D
	PHA; 0E5F
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L20:
	PHA; 0E60
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; uspI
; u0
	LDA #$00; 0E61
; RULE: statement: datatype ID init
; UINT uspI=A datatype#: 00
; UINT UintID A
	STA $0354; 0E63
; ---------------------------------------------------------
; UintID
; $0354
;  vs. 
; UintIMM
; u8
LBL1L21:			; Top of FOR Loop
	LDA $0354; 0E66
	CMP #$08; 0E69
	.BYTE #$B0, #$03; BCS +3; 0E6B
	JMP LBL1L23; if c==0 jump to BODY; 0E6D
	JMP LBL1L24; jump out of FOR; 0E70
; =========================================================
; ---------------------------------------------------------
LBL1L22:
; inc(expression)
	INC $0354; 0E73
	JMP LBL1L21; jump to top of FOR loop; 0E76
; ---------------------------------------------------------
LBL1L23:
; ID '[' (U)IntID ']' -> XA
	LDA $0354; 0E79
	ASL; 0E7C
	TAX; 0E7D
	LDA $0338,X; 0E7E
	PHA; 0E81
	INX; 0E82
	LDA $0338,X; 0E83
	TAX; 0E86
	PLA; 0E87
; spritex( $0354, XA );
; spritex( UINTID, XA );
	TAY; 0E88
	LDA $02; 0E89
	PHA; 0E8B
	LDA $03; 0E8C
	PHA; 0E8E
	STY $02; 0E8F
	STX $03; temporarily store the High Byte; 0E91
	LDA $0354; sprite # -> A; 0E93
	ASL; multiply it by 2; 0E96
	TAX; make Sprite# * 2 the index (X); 0E97
	TYA; move the Low Byte of x-coord to A; 0E98
	STA $D000,X; set the low-byte value; 0E99
	LDA $0354; 0E9C
	PHA; 0E9F
	JSR BIN2BIT; 0EA0
	PLA; 0EA3
	EOR #$FF; 0EA4
	AND $D010; 0EA6
	STA $05; 0EA9
	LDX $0354; 0EAB
	INX; 0EAE
	LDA $03; puts the High Byte of the x-coord into A (it's a 1 or a 0); 0EAF
	LSR; puts that 1 or 0 into the carry flag; 0EB1
; top-of-loop
	ROL; 0EB2
	DEX; 0EB3
	.BYTE #$D0, #$FC; BNE top-of-loop; 0EB4
	ORA $05; 0EB6
	STA $D010; 0EB8
	PLA; 0EBB
	STA $03; 0EBC
	PLA; 0EBE
	STA $02; 0EBF
; ID '[' expression ']' -> A
	LDX $0354; 0EC1
	LDA $0348,X; 0EC4
; spritey( $0354, A );
; spritey( (U)IntID, A );
	PHA; 0EC7
	LDA $0354; 0EC8
	ASL; 0ECB
	TAX; 0ECC
	PLA; 0ECD
	STA $D001,X; set the y-coord; 0ECE
; ---------------------------------------------------------
	JMP LBL1L22; jump to iterator; 0ED1
LBL1L24:
	PLA; 0ED4
; ---------------------------------------------------------
; Restore $02
	PLA; 0ED5
	STA $02; 0ED6
	RTS; 0ED8
; RULE: datatype: void
; ======================== clearhires ========================
LBL0L1:
; RULE: datatype: word
; RULE: init: '=' expression
; mem1
; w0
; unknown type
; w0
; RULE: statement: datatype ID init
; WORD mem1=w0 datatype#: 02
	LDA #$00; 0ED9
	LDX #$00; 0EDB
	STA $0355; 0EDD
	STX $0356; 0EE0
; =========================================================
; Preserve $02
	LDA $02; 0EE3
	PHA; 0EE5
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L25:
	PHA; 0EE6
; ---------------------------------------------------------
; RULE: init: '=' expression
; mem1
; w55296
	LDA #$00; 0EE7
	LDX #$D8; 0EE9
; RULE: statement: ID init
; WordID = XA
	STA $0355; 0EEB
	STX $0356; 0EEE
; ---------------------------------------------------------
; WordID
; $0355
;  vs. 
; WordIMM
; w56319
LBL1L26:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0355 v. w56319
	LDA $0356; 0EF1
	CMP #$DB; 0EF4
	.BYTE #$D0, #$05; 0EF6
	LDA $0355; 0EF8
	CMP #$FF; 0EFB
	.BYTE #$B0, #$03; BCS +3; 0EFD
	JMP LBL1L28; if c==0 jump to BODY; 0EFF
	JMP LBL1L29; jump out of FOR; 0F02
; =========================================================
; ---------------------------------------------------------
LBL1L27:
; OP2
; RULE: expression: expression arithmetic expression
; $0355 + w1
; $0355 (2) + w1 (-1)
	CLC; 0F05
; WordID + WordIMM -> XA
	LDA $0355; 0F06
	ADC #$01; 0F09
	TAY; 0F0B
	LDA $0356; 0F0C
	ADC #$00; 0F0F
	TAX; 0F11
	TYA; 0F12
; RULE: init: '=' expression
; mem1
; XA
; initialising a word with XA
; unknown type
; XA
; RULE: statement: ID init
; WordID = XA
	STA $0355; 0F13
	STX $0356; 0F16
	JMP LBL1L26; jump to top of FOR loop; 0F19
; ---------------------------------------------------------
LBL1L28:
; poke( expression, expression );
	LDA $0355; 0F1C
	STA LBL2L5; 0F1F
	LDA $0356; 0F22
	STA LBL2L6; 0F25
	LDA #$11; 0F28
	.BYTE #$8D;	  <-- STA absolute; 0F2A
LBL2L5:			; <-- low byte
	.BYTE #$00; 0F2B
LBL2L6:			; <-- hi byte
	.BYTE #$00; 0F2C
; ---------------------------------------------------------
	JMP LBL1L27; jump to iterator; 0F2D
LBL1L29:
	PLA; 0F30
; ---------------------------------------------------------
; Restore $02
	PLA; 0F31
	STA $02; 0F32
; Preserve $02
	LDA $02; 0F34
	PHA; 0F36
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L30:
	PHA; 0F37
; ---------------------------------------------------------
; RULE: init: '=' expression
; mem1
; w17408
	LDA #$00; 0F38
	LDX #$44; 0F3A
; RULE: statement: ID init
; WordID = XA
	STA $0355; 0F3C
	STX $0356; 0F3F
; ---------------------------------------------------------
; WordID
; $0355
;  vs. 
; WordIMM
; w18424
LBL1L31:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0355 v. w18424
	LDA $0356; 0F42
	CMP #$47; 0F45
	.BYTE #$D0, #$05; 0F47
	LDA $0355; 0F49
	CMP #$F8; 0F4C
	.BYTE #$B0, #$03; BCS +3; 0F4E
	JMP LBL1L33; if c==0 jump to BODY; 0F50
	JMP LBL1L34; jump out of FOR; 0F53
; =========================================================
; ---------------------------------------------------------
LBL1L32:
; OP2
; RULE: expression: expression arithmetic expression
; $0355 + w1
; $0355 (2) + w1 (-1)
	CLC; 0F56
; WordID + WordIMM -> XA
	LDA $0355; 0F57
	ADC #$01; 0F5A
	TAY; 0F5C
	LDA $0356; 0F5D
	ADC #$00; 0F60
	TAX; 0F62
	TYA; 0F63
; RULE: init: '=' expression
; mem1
; XA
; initialising a word with XA
; unknown type
; XA
; RULE: statement: ID init
; WordID = XA
	STA $0355; 0F64
	STX $0356; 0F67
	JMP LBL1L31; jump to top of FOR loop; 0F6A
; ---------------------------------------------------------
LBL1L33:
; poke( expression, expression );
	LDA $0355; 0F6D
	STA LBL2L7; 0F70
	LDA $0356; 0F73
	STA LBL2L8; 0F76
	LDA #$BC; 0F79
	.BYTE #$8D;	  <-- STA absolute; 0F7B
LBL2L7:			; <-- low byte
	.BYTE #$00; 0F7C
LBL2L8:			; <-- hi byte
	.BYTE #$00; 0F7D
; ---------------------------------------------------------
	JMP LBL1L32; jump to iterator; 0F7E
LBL1L34:
	PLA; 0F81
; ---------------------------------------------------------
; Restore $02
	PLA; 0F82
	STA $02; 0F83
; Preserve $02
	LDA $02; 0F85
	PHA; 0F87
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L35:
	PHA; 0F88
; ---------------------------------------------------------
; RULE: init: '=' expression
; mem1
; w24576
	LDA #$00; 0F89
	LDX #$60; 0F8B
; RULE: statement: ID init
; WordID = XA
	STA $0355; 0F8D
	STX $0356; 0F90
; ---------------------------------------------------------
; WordID
; $0355
;  vs. 
; WordIMM
; w32760
LBL1L36:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0355 v. w32760
	LDA $0356; 0F93
	CMP #$7F; 0F96
	.BYTE #$D0, #$05; 0F98
	LDA $0355; 0F9A
	CMP #$F8; 0F9D
	.BYTE #$B0, #$03; BCS +3; 0F9F
	JMP LBL1L38; if c==0 jump to BODY; 0FA1
	JMP LBL1L39; jump out of FOR; 0FA4
; =========================================================
; ---------------------------------------------------------
LBL1L37:
; OP2
; RULE: expression: expression arithmetic expression
; $0355 + w1
; $0355 (2) + w1 (-1)
	CLC; 0FA7
; WordID + WordIMM -> XA
	LDA $0355; 0FA8
	ADC #$01; 0FAB
	TAY; 0FAD
	LDA $0356; 0FAE
	ADC #$00; 0FB1
	TAX; 0FB3
	TYA; 0FB4
; RULE: init: '=' expression
; mem1
; XA
; initialising a word with XA
; unknown type
; XA
; RULE: statement: ID init
; WordID = XA
	STA $0355; 0FB5
	STX $0356; 0FB8
	JMP LBL1L36; jump to top of FOR loop; 0FBB
; ---------------------------------------------------------
LBL1L38:
; poke( expression, expression );
	LDA $0355; 0FBE
	STA LBL2L9; 0FC1
	LDA $0356; 0FC4
	STA LBL2L10; 0FC7
	LDA #$00; 0FCA
	.BYTE #$8D;	  <-- STA absolute; 0FCC
LBL2L9:			; <-- low byte
	.BYTE #$00; 0FCD
LBL2L10:			; <-- hi byte
	.BYTE #$00; 0FCE
; ---------------------------------------------------------
	JMP LBL1L37; jump to iterator; 0FCF
LBL1L39:
	PLA; 0FD2
; ---------------------------------------------------------
; Restore $02
	PLA; 0FD3
	STA $02; 0FD4
	RTS; 0FD6
; RULE: datatype: void
; ======================== checkLeft ========================
LBL0L2:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L40:
; UintID
; $0353
;  vs. 
; UintIMM
; u30
LBL1L41:			; Top of IF statement
	LDA $0353; 0FD7
	CMP #$1E; 0FDA
	.BYTE #$F0, #$03; BEQ +3; 0FDC
	JMP LBL1L43; jump to ELSE; 0FDE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L42:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L11:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 0FE1
	LDA $0338,X; 0FE3
	PHA; 0FE6
	INX; 0FE7
	LDA $0338,X; 0FE8
	TAX; 0FEB
	PLA; 0FEC
; RegXA
; XA
;  vs. 
; WordIMM
; w24
LBL2L12:			; Top of IF statement
; XA relop WordIMM
	TAY; 0FED
	LDA $02; 0FEE
	PHA; 0FF0
	LDA $03; 0FF1
	PHA; 0FF3
	LDA #$00; 0FF4
	STA $03; 0FF6
	LDA #$18; 0FF8
	STA $02; 0FFA
	TXA; 0FFC
	CMP $03; 0FFD
	.BYTE #$D0, #$03; BNE +3; 0FFF
	TYA; 1001
	CMP $02; 1002
	PLA; 1004
	STA $03; 1005
	PLA; 1007
	STA $02; 1008
	.BYTE #$B0, #$03; BCS +3; 100A
	JMP LBL2L14; if c==0 jump to ELSE; 100C
	.BYTE #$D0, #$03; 100F
	JMP LBL2L14; if z==1 jump to ELSE; 1011
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L13:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 1014
	LDA $0338,X; 1016
	PHA; 1019
	INX; 101A
	LDA $0338,X; 101B
	TAX; 101E
	PLA; 101F
; OP1
; RULE: expression: expression arithmetic expression
; XA - u1
; XA (-1) - u1 (-1)
	SEC; 1020
; XA arith UintIMM
	SBC #$01; 1021
	TAY; 1023
	TXA; 1024
	SBC #$00; 1025
	TAX; 1027
	TYA; 1028
; RULE: init: '=' expression
; 0
; XA
; initialising a word with XA
; unknown type
; XA
; word array[(U)IntIMM] = XA;
	TAY; 1029
	TXA; 102A
	PHA; 102B
	TYA; 102C
	LDX #$00; 102D
	STA $0338,X; 102F
	INX; 1032
	PLA; 1033
	STA $0338,X; 1034
; =========================================================
	JMP LBL2L15; 1037
LBL2L14:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L15:
	JMP LBL1L44; 103A
LBL1L43:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L44:
	RTS; 103D
; RULE: datatype: void
; ======================== checkRight ========================
LBL0L3:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L45:
; UintID
; $0353
;  vs. 
; UintIMM
; u38
LBL1L46:			; Top of IF statement
	LDA $0353; 103E
	CMP #$26; 1041
	.BYTE #$F0, #$03; BEQ +3; 1043
	JMP LBL1L48; jump to ELSE; 1045
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L47:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L16:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 1048
	LDA $0338,X; 104A
	PHA; 104D
	INX; 104E
	LDA $0338,X; 104F
	TAX; 1052
	PLA; 1053
; RegXA
; XA
;  vs. 
; WordIMM
; w320
LBL2L17:			; Top of IF statement
; XA relop WordIMM
	TAY; 1054
	LDA $02; 1055
	PHA; 1057
	LDA $03; 1058
	PHA; 105A
	LDA #$01; 105B
	STA $03; 105D
	LDA #$40; 105F
	STA $02; 1061
	TXA; 1063
	CMP $03; 1064
	.BYTE #$D0, #$03; BNE +3; 1066
	TYA; 1068
	CMP $02; 1069
	PLA; 106B
	STA $03; 106C
	PLA; 106E
	STA $02; 106F
	.BYTE #$90, #$03; BCC +3; 1071
	JMP LBL2L19; jump to ELSE; 1073
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L18:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 1076
	LDA $0338,X; 1078
	PHA; 107B
	INX; 107C
	LDA $0338,X; 107D
	TAX; 1080
	PLA; 1081
; OP1
; RULE: expression: expression arithmetic expression
; XA + u1
; XA (-1) + u1 (-1)
	CLC; 1082
; XA arith UintIMM
	ADC #$01; 1083
	TAY; 1085
	TXA; 1086
	ADC #$00; 1087
	TAX; 1089
	TYA; 108A
; RULE: init: '=' expression
; 0
; XA
; initialising a word with XA
; unknown type
; XA
; word array[(U)IntIMM] = XA;
	TAY; 108B
	TXA; 108C
	PHA; 108D
	TYA; 108E
	LDX #$00; 108F
	STA $0338,X; 1091
	INX; 1094
	PLA; 1095
	STA $0338,X; 1096
; =========================================================
	JMP LBL2L20; 1099
LBL2L19:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L20:
	JMP LBL1L49; 109C
LBL1L48:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L49:
	RTS; 109F
; RULE: datatype: void
; ======================== checkUp ========================
LBL0L4:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L50:
; UintID
; $0353
;  vs. 
; UintIMM
; u27
LBL1L51:			; Top of IF statement
	LDA $0353; 10A0
	CMP #$1B; 10A3
	.BYTE #$F0, #$03; BEQ +3; 10A5
	JMP LBL1L53; jump to ELSE; 10A7
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L52:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L21:
; ID '[' expression ']' -> A
	LDX #$00; 10AA
	LDA $0348,X; 10AC
; RegA
; A
;  vs. 
; UintIMM
; u50
LBL2L22:			; Top of IF statement
	CMP #$32; 10AF
	.BYTE #$B0, #$03; BCS +3; 10B1
	JMP LBL2L24; if c==0 jump to ELSE; 10B3
	.BYTE #$D0, #$03; 10B6
	JMP LBL2L24; if z==1 jump to ELSE; 10B8
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L23:
; ID '[' expression ']' -> A
	LDX #$00; 10BB
	LDA $0348,X; 10BD
	PHA; 10C0
; OP2
; RULE: expression: expression arithmetic expression
; A - u1
; A (-1) - u1 (-1)
	SEC; 10C1
; A arith UintIMM
	PLA; 10C2
	SBC #$01; 10C3
; RULE: init: '=' expression
; 0
; A
; initialising an unknown type with A
; unknown type
; A
; UintID_array[(U)IntIMM] = A
	LDX #$00; 10C5
	STA $0348,X; 10C7
; =========================================================
	JMP LBL2L25; 10CA
LBL2L24:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L25:
	JMP LBL1L54; 10CD
LBL1L53:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L54:
	RTS; 10D0
; RULE: datatype: void
; ======================== checkDown ========================
LBL0L5:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L55:
; UintID
; $0353
;  vs. 
; UintIMM
; u37
LBL1L56:			; Top of IF statement
	LDA $0353; 10D1
	CMP #$25; 10D4
	.BYTE #$F0, #$03; BEQ +3; 10D6
	JMP LBL1L58; jump to ELSE; 10D8
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L57:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L26:
; ID '[' expression ']' -> A
	LDX #$00; 10DB
	LDA $0348,X; 10DD
; RegA
; A
;  vs. 
; UintIMM
; u229
LBL2L27:			; Top of IF statement
	CMP #$E5; 10E0
	.BYTE #$90, #$03; BCC +3; 10E2
	JMP LBL2L29; jump to ELSE; 10E4
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L28:
; ID '[' expression ']' -> A
	LDX #$00; 10E7
	LDA $0348,X; 10E9
	PHA; 10EC
; OP2
; RULE: expression: expression arithmetic expression
; A + u1
; A (-1) + u1 (-1)
	CLC; 10ED
; A arith UintIMM
	PLA; 10EE
	ADC #$01; 10EF
; RULE: init: '=' expression
; 0
; A
; initialising an unknown type with A
; unknown type
; A
; UintID_array[(U)IntIMM] = A
	LDX #$00; 10F1
	STA $0348,X; 10F3
; =========================================================
	JMP LBL2L30; 10F6
LBL2L29:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L30:
	JMP LBL1L59; 10F9
LBL1L58:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L59:
	RTS; 10FC
; RULE: datatype: void
; ======================== checkCollision ========================
LBL0L6:
; RULE: datatype: word
; RULE: statement: datatype ID init
; WORD collXVar=A datatype#: 02
	LDX #$00; 10FD
	STA $0357; 10FF
	STX $0358; 1102
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT collYVar=A datatype#: 00
; UINT UintID A
	STA $0359; 1105
; =========================================================
; Preserve $02
	LDA $02; 1108
	PHA; 110A
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L60:
	PHA; 110B
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; ccI
; u1
	LDA #$01; 110C
; RULE: statement: datatype ID init
; UINT ccI=A datatype#: 00
; UINT UintID A
	STA $035A; 110E
; ---------------------------------------------------------
; UintID
; $035A
;  vs. 
; UintIMM
; u8
LBL1L61:			; Top of FOR Loop
	LDA $035A; 1111
	CMP #$08; 1114
	.BYTE #$B0, #$03; BCS +3; 1116
	JMP LBL1L63; if c==0 jump to BODY; 1118
	JMP LBL1L64; jump out of FOR; 111B
; =========================================================
; ---------------------------------------------------------
LBL1L62:
; inc(expression)
	INC $035A; 111E
	JMP LBL1L61; jump to top of FOR loop; 1121
; ---------------------------------------------------------
LBL1L63:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 1124
	LDA $0338,X; 1126
	PHA; 1129
	INX; 112A
	LDA $0338,X; 112B
	TAX; 112E
	PLA; 112F
; OP1
	PHA; 1130
	TXA; 1131
	PHA; 1132
; ID '[' (U)IntID ']' -> XA
	LDA $035A; 1133
	ASL; 1136
	TAX; 1137
	LDA $0338,X; 1138
	PHA; 113B
	INX; 113C
	LDA $0338,X; 113D
	TAX; 1140
	PLA; 1141
; OP2
; RULE: expression: expression arithmetic expression
; XA - XA
; XA (-1) - XA (-1)
	SEC; 1142
; XA - XA
	STA $FB; 1143
	STX $FC; 1145
	PLA; 1147
	TAX; 1148
	PLA; 1149
	SBC $FB; 114A
	TAY; 114C
	TXA; 114D
	SBC $FC; 114E
	TAX; 1150
	TYA; 1151
; RULE: init: '=' expression
; collXVar
; XA
; initialising a word with XA
; unknown type
; XA
; RULE: statement: ID init
; WordID = XA
	STA $0357; 1152
	STX $0358; 1155
; =========================================================
; ID '[' expression ']' -> A
	LDX #$00; 1158
	LDA $0348,X; 115A
	PHA; 115D
; ID '[' expression ']' -> A
	LDX $035A; 115E
	LDA $0348,X; 1161
; OP2
; RULE: expression: expression arithmetic expression
; A - A
; A (-1) - A (-1)
	SEC; 1164
; A arithmetic A
	STA $FB; 1165
	PLA; 1167
	SBC $FB; 1168
; RULE: init: '=' expression
; collYVar
; A
; initialising an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0359; 116A
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L31:
; WordID
; $0357
;  vs. 
; WordIMM
; w320
LBL2L32:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0357 v. w320
	LDA $0358; 116D
	CMP #$01; 1170
	.BYTE #$D0, #$05; 1172
	LDA $0357; 1174
	CMP #$40; 1177
	.BYTE #$B0, #$03; BCS +3; 1179
	JMP LBL2L34; if c==0 jump to ELSE; 117B
	.BYTE #$D0, #$03; 117E
	JMP LBL2L34; if z==1 jump to ELSE; 1180
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L33:
; ID '[' (U)IntID ']' -> XA
	LDA $035A; 1183
	ASL; 1186
	TAX; 1187
	LDA $0338,X; 1188
	PHA; 118B
	INX; 118C
	LDA $0338,X; 118D
	TAX; 1190
	PLA; 1191
; OP1
	PHA; 1192
	TXA; 1193
	PHA; 1194
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 1195
	LDA $0338,X; 1197
	PHA; 119A
	INX; 119B
	LDA $0338,X; 119C
	TAX; 119F
	PLA; 11A0
; OP2
; RULE: expression: expression arithmetic expression
; XA - XA
; XA (-1) - XA (-1)
	SEC; 11A1
; XA - XA
	STA $FB; 11A2
	STX $FC; 11A4
	PLA; 11A6
	TAX; 11A7
	PLA; 11A8
	SBC $FB; 11A9
	TAY; 11AB
	TXA; 11AC
	SBC $FC; 11AD
	TAX; 11AF
	TYA; 11B0
; RULE: init: '=' expression
; collXVar
; XA
; initialising a word with XA
; unknown type
; XA
; RULE: statement: ID init
; WordID = XA
	STA $0357; 11B1
	STX $0358; 11B4
; =========================================================
	JMP LBL2L35; 11B7
LBL2L34:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L35:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L36:
; UintID
; $0359
;  vs. 
; UintIMM
; u200
LBL2L37:			; Top of IF statement
	LDA $0359; 11BA
	CMP #$C8; 11BD
	.BYTE #$B0, #$03; BCS +3; 11BF
	JMP LBL2L39; if c==0 jump to ELSE; 11C1
	.BYTE #$D0, #$03; 11C4
	JMP LBL2L39; if z==1 jump to ELSE; 11C6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L38:
; ID '[' expression ']' -> A
	LDX $035A; 11C9
	LDA $0348,X; 11CC
	PHA; 11CF
; ID '[' expression ']' -> A
	LDX #$00; 11D0
	LDA $0348,X; 11D2
; OP2
; RULE: expression: expression arithmetic expression
; A - A
; A (-1) - A (-1)
	SEC; 11D5
; A arithmetic A
	STA $FB; 11D6
	PLA; 11D8
	SBC $FB; 11D9
; RULE: init: '=' expression
; collYVar
; A
; initialising an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0359; 11DB
; =========================================================
	JMP LBL2L40; 11DE
LBL2L39:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L40:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L41:
; WordID
; $0357
;  vs. 
; WordIMM
; w24
LBL2L42:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0357 v. w24
	LDA $0358; 11E1
	CMP #$00; 11E4
	.BYTE #$D0, #$05; 11E6
	LDA $0357; 11E8
	CMP #$18; 11EB
	.BYTE #$90, #$03; BCC +3; 11ED
	JMP LBL2L44; jump to ELSE; 11EF
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L43:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L0:
; UintID
; $0359
;  vs. 
; UintIMM
; u21
LBL3L1:			; Top of IF statement
	LDA $0359; 11F2
	CMP #$15; 11F5
	.BYTE #$90, #$03; BCC +3; 11F7
	JMP LBL3L3; jump to ELSE; 11F9
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L2:
; inc(expression)
	INC $D020; 11FC
; =========================================================
	JMP LBL3L4; 11FF
LBL3L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L4:
	JMP LBL2L45; 1202
LBL2L44:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L45:
; ---------------------------------------------------------
	JMP LBL1L62; jump to iterator; 1205
LBL1L64:
	PLA; 1208
; ---------------------------------------------------------
; Restore $02
	PLA; 1209
	STA $02; 120A
	RTS; 120C
; RULE: datatype: void
; ======================== updateAIPositions ========================
LBL0L7:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L65:
; UintID
; $0350
;  vs. 
; UintIMM
; u2
LBL1L66:			; Top of IF statement
	LDA $0350; 120D
	CMP #$02; 1210
	.BYTE #$F0, #$03; BEQ +3; 1212
	JMP LBL1L68; jump to ELSE; 1214
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L67:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$02; 1217
	LDA $0338,X; 1219
	PHA; 121C
	INX; 121D
	LDA $0338,X; 121E
	TAX; 1221
	PLA; 1222
; OP1
; RULE: expression: expression arithmetic expression
; XA - u1
; XA (-1) - u1 (-1)
	SEC; 1223
; XA arith UintIMM
	SBC #$01; 1224
	TAY; 1226
	TXA; 1227
	SBC #$00; 1228
	TAX; 122A
	TYA; 122B
; RULE: init: '=' expression
; 1
; XA
; initialising a word with XA
; unknown type
; XA
; word array[(U)IntIMM] = XA;
	TAY; 122C
	TXA; 122D
	PHA; 122E
	TYA; 122F
	LDX #$02; 1230
	STA $0338,X; 1232
	INX; 1235
	PLA; 1236
	STA $0338,X; 1237
; =========================================================
	JMP LBL1L69; 123A
LBL1L68:
; ---------------------------------------------------------
;                       ELSE:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$02; 123D
	LDA $0338,X; 123F
	PHA; 1242
	INX; 1243
	LDA $0338,X; 1244
	TAX; 1247
	PLA; 1248
; OP1
; RULE: expression: expression arithmetic expression
; XA + u1
; XA (-1) + u1 (-1)
	CLC; 1249
; XA arith UintIMM
	ADC #$01; 124A
	TAY; 124C
	TXA; 124D
	ADC #$00; 124E
	TAX; 1250
	TYA; 1251
; RULE: init: '=' expression
; 1
; XA
; initialising a word with XA
; unknown type
; XA
; word array[(U)IntIMM] = XA;
	TAY; 1252
	TXA; 1253
	PHA; 1254
	TYA; 1255
	LDX #$02; 1256
	STA $0338,X; 1258
	INX; 125B
	PLA; 125C
	STA $0338,X; 125D
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L69:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L70:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$02; 1260
	LDA $0338,X; 1262
	PHA; 1265
	INX; 1266
	LDA $0338,X; 1267
	TAX; 126A
	PLA; 126B
; RegXA
; XA
;  vs. 
; WordIMM
; w24
LBL1L71:			; Top of IF statement
; XA relop WordIMM
	TAY; 126C
	LDA $02; 126D
	PHA; 126F
	LDA $03; 1270
	PHA; 1272
	LDA #$00; 1273
	STA $03; 1275
	LDA #$18; 1277
	STA $02; 1279
	TXA; 127B
	CMP $03; 127C
	.BYTE #$D0, #$03; BNE +3; 127E
	TYA; 1280
	CMP $02; 1281
	PLA; 1283
	STA $03; 1284
	PLA; 1286
	STA $02; 1287
	.BYTE #$90, #$03; BCC +3; 1289
	JMP LBL1L73; jump to ELSE; 128B
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L72:
; RULE: init: '=' expression
; x1d
; u1
	LDA #$01; 128E
; RULE: statement: ID init
	STA $0350; 1290
; =========================================================
	JMP LBL1L74; 1293
LBL1L73:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L74:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L75:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$02; 1296
	LDA $0338,X; 1298
	PHA; 129B
	INX; 129C
	LDA $0338,X; 129D
	TAX; 12A0
	PLA; 12A1
; RegXA
; XA
;  vs. 
; WordIMM
; w315
LBL1L76:			; Top of IF statement
; XA relop WordIMM
	TAY; 12A2
	LDA $02; 12A3
	PHA; 12A5
	LDA $03; 12A6
	PHA; 12A8
	LDA #$01; 12A9
	STA $03; 12AB
	LDA #$3B; 12AD
	STA $02; 12AF
	TXA; 12B1
	CMP $03; 12B2
	.BYTE #$D0, #$03; BNE +3; 12B4
	TYA; 12B6
	CMP $02; 12B7
	PLA; 12B9
	STA $03; 12BA
	PLA; 12BC
	STA $02; 12BD
	.BYTE #$B0, #$03; BCS +3; 12BF
	JMP LBL1L78; if c==0 jump to ELSE; 12C1
	.BYTE #$D0, #$03; 12C4
	JMP LBL1L78; if z==1 jump to ELSE; 12C6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L77:
; RULE: init: '=' expression
; x1d
; u2
	LDA #$02; 12C9
; RULE: statement: ID init
	STA $0350; 12CB
; =========================================================
	JMP LBL1L79; 12CE
LBL1L78:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L79:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L80:
; UintID
; $0351
;  vs. 
; UintIMM
; u2
LBL1L81:			; Top of IF statement
	LDA $0351; 12D1
	CMP #$02; 12D4
	.BYTE #$F0, #$03; BEQ +3; 12D6
	JMP LBL1L83; jump to ELSE; 12D8
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L82:
; ID '[' expression ']' -> A
	LDX #$02; 12DB
	LDA $0348,X; 12DD
	PHA; 12E0
; OP2
; RULE: expression: expression arithmetic expression
; A - u1
; A (-1) - u1 (-1)
	SEC; 12E1
; A arith UintIMM
	PLA; 12E2
	SBC #$01; 12E3
; RULE: init: '=' expression
; 2
; A
; initialising an unknown type with A
; unknown type
; A
; UintID_array[(U)IntIMM] = A
	LDX #$02; 12E5
	STA $0348,X; 12E7
; =========================================================
	JMP LBL1L84; 12EA
LBL1L83:
; ---------------------------------------------------------
;                       ELSE:
; ID '[' expression ']' -> A
	LDX #$02; 12ED
	LDA $0348,X; 12EF
	PHA; 12F2
; OP2
; RULE: expression: expression arithmetic expression
; A + u1
; A (-1) + u1 (-1)
	CLC; 12F3
; A arith UintIMM
	PLA; 12F4
	ADC #$01; 12F5
; RULE: init: '=' expression
; 2
; A
; initialising an unknown type with A
; unknown type
; A
; UintID_array[(U)IntIMM] = A
	LDX #$02; 12F7
	STA $0348,X; 12F9
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L84:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L85:
; ID '[' expression ']' -> A
	LDX #$02; 12FC
	LDA $0348,X; 12FE
; RegA
; A
;  vs. 
; UintIMM
; u29
LBL1L86:			; Top of IF statement
	CMP #$1D; 1301
	.BYTE #$90, #$03; BCC +3; 1303
	JMP LBL1L88; jump to ELSE; 1305
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L87:
; RULE: init: '=' expression
; y2d
; u1
	LDA #$01; 1308
; RULE: statement: ID init
	STA $0351; 130A
; =========================================================
	JMP LBL1L89; 130D
LBL1L88:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L89:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L90:
; ID '[' expression ']' -> A
	LDX #$02; 1310
	LDA $0348,X; 1312
; RegA
; A
;  vs. 
; UintIMM
; u180
LBL1L91:			; Top of IF statement
	CMP #$B4; 1315
	.BYTE #$B0, #$03; BCS +3; 1317
	JMP LBL1L93; if c==0 jump to ELSE; 1319
	.BYTE #$D0, #$03; 131C
	JMP LBL1L93; if z==1 jump to ELSE; 131E
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L92:
; RULE: init: '=' expression
; y2d
; u2
	LDA #$02; 1321
; RULE: statement: ID init
	STA $0351; 1323
; =========================================================
	JMP LBL1L94; 1326
LBL1L93:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L94:
	RTS; 1329
; RULE: datatype: void
; ======================== cr ========================
LBL0L8:
	LDA #$0D; 132A
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 132C
	RTS; 132F
; RULE: datatype: void
; ======================== sp ========================
LBL0L9:
	LDA #$20; 1330
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 1332
	RTS; 1335
; RULE: datatype: void
; ======================== pause ========================
LBL0L10:
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$00; 1336
	STA $C6; 1338
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFE4; 133A
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 133D
; RULE: init: '=' expression
; pausev
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $035B; 1340
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 1343
LBL1L95:
; ---------------------------------------------------------
; UintID
; $035B
;  vs. 
; UintIMM
; u0
LBL1L96:			; Top of WHILE Loop
	LDA $035B; 1344
	CMP #$00; 1347
	.BYTE #$F0, #$03; BEQ +3; 1349
	JMP LBL1L98; jump to ELSE; 134B
; =========================================================
LBL1L97:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 134E
; RULE: init: '=' expression
; pausev
; A
; initialising an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $035B; 1351
; =========================================================
	JMP LBL1L96; jump to top of WHILE loop; 1354
LBL1L98:
	PLA; 1357
	RTS; 1358
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L11:
; poke( expression, expression );
; POKE( <uint/int> IMM,IMM)
	LDA #$00; 1359
	STA $C6; 135B
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 135D
	RTS; 1360
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L12:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D011; 1361
; RULE: init: '=' expression
; oldD011
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $035C; 1364
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D016; 1367
; RULE: init: '=' expression
; oldD016
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $035D; 136A
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D018; 136D
; RULE: init: '=' expression
; oldD018
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $035E; 1370
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020; 1373
; RULE: init: '=' expression
; oldD020
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $035F; 1376
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021; 1379
; RULE: init: '=' expression
; oldD021
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $0360; 137C
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286; 137F
; RULE: init: '=' expression
; oldChar
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $0361; 1382
; =========================================================
	RTS; 1385
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L13:
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $035C; 1386
	STA $D011; 1389
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $035D; 138C
	STA $D016; 138F
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $035E; 1392
	STA $D018; 1395
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $035F; 1398
	STA $D020; 139B
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0360; 139E
	STA $D021; 13A1
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0361; 13A4
	STA $0286; 13A7
	RTS; 13AA
; RULE: datatype: void
; ======================== shortcls ========================
LBL0L14:
	LDA #$93; 13AB
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 13AD
	RTS; 13B0
BIN2BIT:		;Convert an integer in A to the Ath bit
	PLA; 13B1
	STA $0334; 13B2
	PLA; 13B5
	STA $0335; 13B6
	PLA; 13B9
	TAX; 13BA
	INX; 13BB
	LDA #$00; 13BC
	SEC; 13BE
; top-of-loop:
	ROL; 13BF
	DEX; 13C0
	.BYTE #$D0, #$FC; BNE top-of-loop; 13C1
	PHA; 13C3
	LDA $0335; 13C4
	PHA; 13C7
	LDA $0334; 13C8
	PHA; 13CB
	RTS; 13CC
SCRMEM:		; Get the screen mem location from the vic II
	PLA; 13CD
	STA $0334; 13CE
	PLA; 13D1
	STA $0335; 13D2
	LDA $D018; 13D5
	AND #$F0; 13D8
	CLC; 13DA
	LSR; 13DB
	LSR; 13DC
	PHA; 13DD
	LDA $0335; 13DE
	PHA; 13E1
	LDA $0334; 13E2
	PHA; 13E5
	RTS; 13E6
BNKMEM:		; Get the bank memory from the vic II
	PLA; 13E7
	STA $0334; 13E8
	PLA; 13EB
	STA $0335; 13EC
	LDA $DD00; 13EF
	EOR #$FF; 13F2
	AND #$03; 13F4
	CLC; 13F6
	ASL; 13F7
	ASL; 13F8
	ASL; 13F9
	ASL; 13FA
	ASL; 13FB
	ASL; 13FC
	PHA; 13FD
	LDA $0335; 13FE
	PHA; 1401
	LDA $0334; 1402
	PHA; 1405
	RTS; 1406
MOBCPY:		; Copy 63 bytes from $FB/$FC to $FD/$FE
	SEI; 1407
	CLC; 1408
	LDA #$01; 1409
	ADC $FB; 140B
	STA $FB; 140D
	LDA #$00; 140F
	ADC $FC; 1411
	STA $FC; 1413
	LDY #$3F; 1415
; top-of-loop
MOBCPTOP:
	CPY #$FF; 1417
	.BYTE #$F0, #$08; BEQ +8; 1419
	LDA ($FB),Y; 141B
	STA ($FD),Y; 141D
	DEY; 141F
	JMP MOBCPTOP; 1420
; bottom-of-loop
	CLI; 1423
	RTS; 1424
PRN:
	LDY #$00; 1425
PRN_LOOP:
	LDA ($02),Y; 1427
	CMP #$00; 1429
	BEQ PRN_END; 142B
	JSR $FFD2; 142D
	INY; 1430
	JMP PRN_LOOP; 1431
PRN_END:
	RTS; 1434
; $1435			"SPRITE COLLISION TEST\nBY MICHAEL K. PELLEGRINO\nUSING 64C COMPILER\nFEBRUARY 11, 2023\nUP: 8, DOWN: K, LEFT: U, RIGHT: O"
STRLBL0:
	.BYTE #$53, #$50, #$52, #$49, #$54, #$45, #$20, #$43, #$4F, #$4C, #$4C, #$49, #$53, #$49, #$4F, #$4E, #$20, #$54, #$45, #$53, #$54, #$0D, #$42, #$59, #$20, #$4D, #$49, #$43, #$48, #$41, #$45, #$4C, #$20, #$4B, #$2E, #$20, #$50, #$45, #$4C, #$4C, #$45, #$47, #$52, #$49, #$4E, #$4F, #$0D, #$55, #$53, #$49, #$4E, #$47, #$20, #$36, #$34, #$43, #$20, #$43, #$4F, #$4D, #$50, #$49, #$4C, #$45, #$52, #$0D, #$46, #$45, #$42, #$52, #$55, #$41, #$52, #$59, #$20, #$31, #$31, #$2C, #$20, #$32, #$30, #$32, #$33, #$0D, #$55, #$50, #$3A, #$20, #$38, #$2C, #$20, #$44, #$4F, #$57, #$4E, #$3A, #$20, #$4B, #$2C, #$20, #$4C, #$45, #$46, #$54, #$3A, #$20, #$55, #$2C, #$20, #$52, #$49, #$47, #$48, #$54, #$3A, #$20, #$4F, #$00
