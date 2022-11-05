; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; uint : i : $0336 (822)
; uint : s : $0337 (823)
; Adding: return_address_1 of type: uint
; Adding: return_address_2 of type: uint
; RULE: datatype: int
.org $0834
; RULE: datatype: mob
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (224)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (224)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (248)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (248)
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; MOB sprite0=m
; NOT Adding: sprite0 of type: mob
; =========================================================
;                      New Scope (MOB)
	LDA #$C0; 0834
	STA $07F8; 0836
	JSR LBL1L0; 0839
sprite0:
	.BYTE #$00, #$60, #$00, #$00, #$E0, #$00, #$01, #$E0, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$01, #$F8, #$00, #$01, #$F8, #$00
LBL1L0:
	PLA; 087B
	STA $FB; 087C
	PLA; 087E
	STA $FC; 087F
	INC $FB; 0881
	LDA #$00; 0883
	STA $FD; 0885
	LDA #$30; 0887
	STA $FE; 0889
	JSR MOBCPY; 088B
; Release Scope MOB
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (193)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (126)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (255)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (129)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (3)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (6)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (12)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (24)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (48)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (255)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (255)
; RULE: value: NUMBER: (128)
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
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; MOB sprite1=m
; NOT Adding: sprite1 of type: mob
; =========================================================
;                      New Scope (MOB)
	LDA #$C2; 088E
	STA $07F9; 0890
	JSR LBL1L1; 0893
sprite1:
	.BYTE #$00, #$7E, #$00, #$00, #$FF, #$00, #$01, #$81, #$80, #$00, #$01, #$80, #$00, #$01, #$80, #$00, #$03, #$00, #$00, #$06, #$00, #$00, #$0C, #$00, #$00, #$18, #$00, #$00, #$30, #$00, #$00, #$60, #$00, #$00, #$C0, #$00, #$01, #$80, #$00, #$01, #$FF, #$80, #$01, #$FF, #$80, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00
LBL1L1:
	PLA; 08D5
	STA $FB; 08D6
	PLA; 08D8
	STA $FC; 08D9
	INC $FB; 08DB
	LDA #$80; 08DD
	STA $FD; 08DF
	LDA #$30; 08E1
	STA $FE; 08E3
	JSR MOBCPY; 08E5
; Release Scope MOB
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (194)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (192)
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
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; MOB sprite2=m
; NOT Adding: sprite2 of type: mob
; =========================================================
;                      New Scope (MOB)
	LDA #$C4; 08E8
	STA $07FA; 08EA
	JSR LBL1L2; 08ED
sprite2:
	.BYTE #$00, #$00, #$00, #$00, #$00, #$00, #$01, #$C0, #$00, #$02, #$20, #$00, #$00, #$20, #$00, #$00, #$C0, #$00, #$00, #$20, #$00, #$02, #$20, #$00, #$01, #$C0, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00
LBL1L2:
	PLA; 092F
	STA $FB; 0930
	PLA; 0932
	STA $FC; 0933
	INC $FB; 0935
	LDA #$00; 0937
	STA $FD; 0939
	LDA #$31; 093B
	STA $FE; 093D
	JSR MOBCPY; 093F
; Release Scope MOB
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (3)
; RULE: value: NUMBER: (195)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (12)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (12)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (12)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (12)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (248)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (248)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (96)
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
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; MOB sprite3=m
; NOT Adding: sprite3 of type: mob
; =========================================================
;                      New Scope (MOB)
	LDA #$C6; 0942
	STA $07FB; 0944
	JSR LBL1L3; 0947
sprite3:
	.BYTE #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$60, #$00, #$0C, #$60, #$00, #$0C, #$60, #$00, #$0C, #$60, #$00, #$0C, #$60, #$00, #$0F, #$F8, #$00, #$0F, #$F8, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$60, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00, #$00
LBL1L3:
	PLA; 0989
	STA $FB; 098A
	PLA; 098C
	STA $FC; 098D
	INC $FB; 098F
	LDA #$80; 0991
	STA $FD; 0993
	LDA #$31; 0995
	STA $FE; 0997
	JSR MOBCPY; 0999
; Release Scope MOB
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: expression: value: [u0)
; u0
; RULE: init: '=' expression
; else if( isInteger(u0)) - line 2263
	LDA #$00; 099C
; RULE: statement: datatype ID init
; UINT i=A
; Adding: i of type: uint
	STA $0336; ; 099E
; =========================================================
;                      New Scope (FOR)
LBL1L4:
;               initialization goes here
	PHA; 09A1
; RULE: value: NUMBER: (0)
; RULE: expression: value: [u0)
; u0
; RULE: init: '=' expression
; else if( isInteger(u0)) - line 2263
	LDA #$00; 09A2
; RULE: statement: ID init
	STA $0336; 09A4
; RULE: expression: ID : i
; RULE: value: NUMBER: (4)
; RULE: expression: value: [i4)
; i4
; =========================================================
;             condition in FOR
; FOR $0336<i4
; =========================================================
LBL1L5:			; Top of FOR Loop
; Address Found
	LDA $0336; 09A7
; $0336 vs. i4
	CMP #$04; 09AA
	.BYTE #$B0, #$03; 09AC
	JMP LBL1L7; if c==0 jump to BODY; 09AE
	JMP LBL1L8; jump out of FOR; 09B1
LBL1L6:
; RULE: expression: ID : i
; RULE: arithmetic ADD
; RULE: value: NUMBER: (1)
; RULE: expression: value: [i1)
; i1
; RULE: expression: expression arithmetic expression
; $0336 + i1
	LDA $0336; 09B4
	CLC; 09B7
	ADC #$01; 09B8
; RULE: init: '=' expression
; RULE: statement: ID init
	STA $0336; 09BA
	JMP LBL1L5; jump to top of FOR; 09BD
LBL1L7:
; RULE: expression: ID : i
; RULE: value: NUMBER: (15)
; RULE: expression: value: [i15)
; i15
; statement: tSPRITECOLOUR '(' expression ',' expression ')' ';'
	LDA #$0F; 09C0
	STA $D35D; 09C2
	JMP LBL1L6; jump to iterator ; 09C5
LBL1L8:
	PLA; 09C8
; Release Scope FOR
; =========================================================
; RULE: value: NUMBER: (0)
; RULE: expression: value: [i0)
; i0
; RULE: value: NUMBER: (40)
; RULE: expression: value: [i40)
; i40
; RULE: value: NUMBER: (60)
; RULE: expression: value: [i60)
; i60
	LDA #$28; 09C9
	STA $D000; 09CB
	LDA #$3C; 09CE
	STA $D001; 09D0
; RULE: value: NUMBER: (1)
; RULE: expression: value: [i1)
; i1
; RULE: value: NUMBER: (80)
; RULE: expression: value: [i80)
; i80
; RULE: value: NUMBER: (60)
; RULE: expression: value: [i60)
; i60
	LDA #$50; 09D3
	STA $D002; 09D5
	LDA #$3C; 09D8
	STA $D003; 09DA
; RULE: value: NUMBER: (2)
; RULE: expression: value: [i2)
; i2
; RULE: value: NUMBER: (120)
; RULE: expression: value: [i120)
; i120
; RULE: value: NUMBER: (60)
; RULE: expression: value: [i60)
; i60
	LDA #$78; 09DD
	STA $D004; 09DF
	LDA #$3C; 09E2
	STA $D005; 09E4
; RULE: value: NUMBER: (3)
; RULE: expression: value: [i3)
; i3
; RULE: value: NUMBER: (160)
; RULE: expression: value: [i160)
; i160
; RULE: value: NUMBER: (60)
; RULE: expression: value: [i60)
; i60
	LDA #$A0; 09E7
	STA $D006; 09E9
	LDA #$3C; 09EC
	STA $D007; 09EE
	LDA #$0B; 09F1
	STA $03; 09F3
	LDA #$FF; 09F5
	STA $02; 09F7
	JSR PRN; 09F9
; RULE: value: NUMBER: (1)
; RULE: expression: value: [i1)
; i1
; statement: tSPRITEON '(' expression ')' ';' 
	LDA #$01; 09FC
	ORA $D015; 09FE
	STA $D015; 0A01
	JSR LBL0L0; pressenter(); 0A04
; RULE: value: NUMBER: (2)
; RULE: expression: value: [i2)
; i2
; statement: tSPRITEON '(' expression ')' ';' 
	LDA #$02; 0A07
	ORA $D015; 0A09
	STA $D015; 0A0C
	JSR LBL0L0; pressenter(); 0A0F
; RULE: value: NUMBER: (4)
; RULE: expression: value: [i4)
; i4
; statement: tSPRITEON '(' expression ')' ';' 
	LDA #$04; 0A12
	ORA $D015; 0A14
	STA $D015; 0A17
	JSR LBL0L0; pressenter(); 0A1A
; RULE: value: NUMBER: (8)
; RULE: expression: value: [i8)
; i8
; statement: tSPRITEON '(' expression ')' ';' 
	LDA #$08; 0A1D
	ORA $D015; 0A1F
	STA $D015; 0A22
	JSR LBL0L0; pressenter(); 0A25
; RULE: value: NUMBER: (4)
; RULE: expression: value: [i4)
; i4
; statement: tSPRITEOFF '(' expression ')' ';' 
	LDA #$04; 0A28
	EOR #$FF; 0A2A
	AND $D015; 0A2C
	STA $D015; 0A2F
	JSR LBL0L0; pressenter(); 0A32
; RULE: value: NUMBER: (3)
; RULE: expression: value: [i3)
; i3
; statement: tSPRITEOFF '(' expression ')' ';' 
	LDA #$03; 0A35
	EOR #$FF; 0A37
	AND $D015; 0A39
	STA $D015; 0A3C
	JSR LBL0L0; pressenter(); 0A3F
	LDA #$0C; 0A42
	STA $03; 0A44
	LDA #$15; 0A46
	STA $02; 0A48
	JSR PRN; 0A4A
; RULE: value: NUMBER: (10)
; RULE: expression: value: [i10)
; i10
; statement: tSPRITESET '(' expression ')' ';' 
	LDA #$0A; 0A4D
	STA $D015; 0A4F
	JSR LBL0L0; pressenter(); 0A52
; RULE: value: NUMBER: (5)
; RULE: expression: value: [i5)
; i5
; statement: tSPRITESET '(' expression ')' ';' 
	LDA #$05; 0A55
	STA $D015; 0A57
	JSR LBL0L0; pressenter(); 0A5A
; RULE: value: NUMBER: (15)
; RULE: expression: value: [i15)
; i15
; statement: tSPRITESET '(' expression ')' ';' 
	LDA #$0F; 0A5D
	STA $D015; 0A5F
	JSR LBL0L0; pressenter(); 0A62
	LDA #$0C; 0A65
	STA $03; 0A67
	LDA #$20; 0A69
	STA $02; 0A6B
	JSR PRN; 0A6D
; RULE: value: NUMBER: (3)
; RULE: expression: value: [i3)
; i3
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA #$03; 0A70
	EOR $D015; 0A72
	STA $D015; 0A75
	JSR LBL0L0; pressenter(); 0A78
; RULE: value: NUMBER: (3)
; RULE: expression: value: [i3)
; i3
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA #$03; 0A7B
	EOR $D015; 0A7D
	STA $D015; 0A80
	JSR LBL0L0; pressenter(); 0A83
; RULE: value: NUMBER: (12)
; RULE: expression: value: [i12)
; i12
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA #$0C; 0A86
	EOR $D015; 0A88
	STA $D015; 0A8B
	JSR LBL0L0; pressenter(); 0A8E
; RULE: value: NUMBER: (12)
; RULE: expression: value: [i12)
; i12
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA #$0C; 0A91
	EOR $D015; 0A93
	STA $D015; 0A96
	JSR LBL0L0; pressenter(); 0A99
; RULE: value: NUMBER: (15)
; RULE: expression: value: [i15)
; i15
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA #$0F; 0A9C
	EOR $D015; 0A9E
	STA $D015; 0AA1
	JSR LBL0L0; pressenter(); 0AA4
	LDA #$0C; 0AA7
	STA $03; 0AA9
	LDA #$2E; 0AAB
	STA $02; 0AAD
	JSR PRN; 0AAF
	JSR LBL0L0; pressenter(); 0AB2
	LDA #$0C; 0AB5
	STA $03; 0AB7
	LDA #$42; 0AB9
	STA $02; 0ABB
	JSR PRN; 0ABD
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; RULE: expression: value: [u1)
; u1
; RULE: init: '=' expression
; else if( isInteger(u1)) - line 2263
	LDA #$01; 0AC0
; RULE: statement: datatype ID init
; UINT s=A
; Adding: s of type: uint
	STA $0337; ; 0AC2
; =========================================================
;                      New Scope (WHILE)
;                         WHILE LOOP
	PHA; 0AC5
LBL1L9:
; RULE: expression: ID : s
; RULE: value: NUMBER: (9)
; RULE: expression: value: [u9)
; u9
; =========================================================
;             condition in WHILE
; WHILE $0337<u9
; =========================================================
LBL1L10:			; Top of WHILE Loop
; Address Found
	LDA $0337; 0AC6
; $0337 vs. u9
	CMP #$09; 0AC9
	.BYTE #$90, #$03; 0ACB
	JMP LBL1L12; jump to ELSE; 0ACD
LBL1L11:
; RULE: expression: ID : s
; statement: tSPRITEON '(' expression ')' ';' 
	LDA $D015; 0AD0
	ORA $0337; 0AD3
	STA $D015; 0AD6
	JSR LBL0L0; pressenter(); 0AD9
; RULE: expression: ID : s
	ASL $0337; 0ADC
	JMP LBL1L10; jump to top of FOR; 0ADF
LBL1L12:
	PLA; 0AE2
; Release Scope WHILE
; =========================================================
; RULE: value: NUMBER: (4)
; RULE: expression: value: [u4)
; u4
; RULE: init: '=' expression
; else if( isInteger(u4)) - line 2263
	LDA #$04; 0AE3
; RULE: statement: ID init
	STA $0337; 0AE5
; RULE: expression: ID : s
; statement: tSPRITEOFF '(' expression ')' ';' 
	LDA $0337; 0AE8
	EOR #$FF; 0AEB
	AND $D015; 0AED
	STA $D015; 0AF0
	JSR LBL0L0; pressenter(); 0AF3
; RULE: value: NUMBER: (3)
; RULE: expression: value: [i3)
; i3
; RULE: init: '=' expression
; else if( isInteger(i3)) - line 2263
	LDA #$03; 0AF6
; RULE: statement: ID init
	STA $0337; 0AF8
; RULE: expression: ID : s
; statement: tSPRITEOFF '(' expression ')' ';' 
	LDA $0337; 0AFB
	EOR #$FF; 0AFE
	AND $D015; 0B00
	STA $D015; 0B03
	JSR LBL0L0; pressenter(); 0B06
	LDA #$0C; 0B09
	STA $03; 0B0B
	LDA #$58; 0B0D
	STA $02; 0B0F
	JSR PRN; 0B11
; RULE: value: NUMBER: (10)
; RULE: expression: value: [i10)
; i10
; RULE: init: '=' expression
; else if( isInteger(i10)) - line 2263
	LDA #$0A; 0B14
; RULE: statement: ID init
	STA $0337; 0B16
; RULE: expression: ID : s
; statement: tSPRITESET '(' expression ')' ';' 
	LDA $0337; 0B19
	STA $D015; 0B1C
	JSR LBL0L0; pressenter(); 0B1F
; RULE: value: NUMBER: (5)
; RULE: expression: value: [i5)
; i5
; RULE: init: '=' expression
; else if( isInteger(i5)) - line 2263
	LDA #$05; 0B22
; RULE: statement: ID init
	STA $0337; 0B24
; RULE: expression: ID : s
; statement: tSPRITESET '(' expression ')' ';' 
	LDA $0337; 0B27
	STA $D015; 0B2A
	JSR LBL0L0; pressenter(); 0B2D
; RULE: value: NUMBER: (15)
; RULE: expression: value: [i15)
; i15
; RULE: init: '=' expression
; else if( isInteger(i15)) - line 2263
	LDA #$0F; 0B30
; RULE: statement: ID init
	STA $0337; 0B32
; RULE: expression: ID : s
; statement: tSPRITESET '(' expression ')' ';' 
	LDA $0337; 0B35
	STA $D015; 0B38
	JSR LBL0L0; pressenter(); 0B3B
	LDA #$0C; 0B3E
	STA $03; 0B40
	LDA #$63; 0B42
	STA $02; 0B44
	JSR PRN; 0B46
; RULE: value: NUMBER: (3)
; RULE: expression: value: [i3)
; i3
; RULE: init: '=' expression
; else if( isInteger(i3)) - line 2263
	LDA #$03; 0B49
; RULE: statement: ID init
	STA $0337; 0B4B
; RULE: expression: ID : s
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA $0337; 0B4E
	EOR $D015; 0B51
	STA $D015; 0B54
	JSR LBL0L0; pressenter(); 0B57
; RULE: expression: ID : s
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA $0337; 0B5A
	EOR $D015; 0B5D
	STA $D015; 0B60
	JSR LBL0L0; pressenter(); 0B63
; RULE: value: NUMBER: (12)
; RULE: expression: value: [i12)
; i12
; RULE: init: '=' expression
; else if( isInteger(i12)) - line 2263
	LDA #$0C; 0B66
; RULE: statement: ID init
	STA $0337; 0B68
; RULE: expression: ID : s
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA $0337; 0B6B
	EOR $D015; 0B6E
	STA $D015; 0B71
	JSR LBL0L0; pressenter(); 0B74
; RULE: expression: ID : s
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA $0337; 0B77
	EOR $D015; 0B7A
	STA $D015; 0B7D
	JSR LBL0L0; pressenter(); 0B80
; RULE: value: NUMBER: (15)
; RULE: expression: value: [i15)
; i15
; RULE: init: '=' expression
; else if( isInteger(i15)) - line 2263
	LDA #$0F; 0B83
; RULE: statement: ID init
	STA $0337; 0B85
; RULE: expression: ID : s
; statement: tSPRITETOGGLE '(' expression ')' ';' 
	LDA $0337; 0B88
	EOR $D015; 0B8B
	STA $D015; 0B8E
	LDA #$0C; 0B91
	STA $03; 0B93
	LDA #$71; 0B95
	STA $02; 0B97
	JSR PRN; 0B99
; RULE: return: RETURN {} ';'
	RTS; 0B9C
; RULE: datatype: int
LBL0L0:
	JSR SCANF; 0B9D
; RULE: return: RETURN {} ';'
	RTS; 0BA0
MOBCPY:		; Copy 63 bytes from $FB/$FC to $FD/$FE
	LDY #$3F; 0BA1
MOBCPL1:
	CPY #$00; 0BA3
	BEQ MOBCPL2; 0BA5
	LDA ($FB),Y; 0BA7
	STA ($FD),Y; 0BA9
	DEY; 0BAB
	JMP MOBCPL1; 0BAC
MOBCPL2:
	RTS; 0BAF
PRN:
	LDY #$00; 0BB0
PRN_LOOP:
	LDA ($02),Y; 0BB2
	CMP #$00; 0BB4
	BEQ PRN_END; 0BB6
	JSR $FFD2; 0BB8
	INY; 0BBB
	JMP PRN_LOOP; 0BBC
PRN_END:
	RTS; 0BBF
SCANF:
	LDX #$00; 0BC0
	STX $CFDE; 0BC2
SCANFTOP:
	JSR $FF9F; 0BC5
	JSR $FFE4; 0BC8
	BEQ SCANFTOP; 0BCB
	CMP #$0D; 0BCD
	BEQ SCANFEND; 0BCF
	CMP #$14; 0BD1
	BEQ BKSPC; 0BD3
	JSR $FFD2; 0BD5
	LDX $CFDE; 0BD8
	STA $CFE0,X; 0BDB
	INX; 0BDE
	STX $CFDE; 0BDF
	CPX #$10; 0BE2
	BEQ SCANFEND; 0BE4
	JMP SCANFTOP; 0BE6
SCANFEND:
	RTS; 0BE9
BKSPC:
	LDX $CFDF; 0BEA
	DEX; 0BED
	STX $CFDF; 0BEE
	JMP SCANFTOP; 0BF1
GETKEY:
	JSR $FFE4; 0BF4
	CMP #$00; 0BF7
	BEQ GETKEY; 0BF9
	STA $CFDF; 0BFB
	RTS; 0BFE
; $bff			"SPRITEON & SPRITEOFF\n"
STRLBL0:
	.BYTE #$53, #$50, #$52, #$49, #$54, #$45, #$4F, #$4E, #$20, #$26, #$20, #$53, #$50, #$52, #$49, #$54, #$45, #$4F, #$46, #$46, #$0D, #$00
; $c15			"SPRITESET\n"
STRLBL1:
	.BYTE #$53, #$50, #$52, #$49, #$54, #$45, #$53, #$45, #$54, #$0D, #$00
; $c20			"SPRITETOGGLE\n"
STRLBL2:
	.BYTE #$53, #$50, #$52, #$49, #$54, #$45, #$54, #$4F, #$47, #$47, #$4C, #$45, #$0D, #$00
; $c2e			"NOW WITH VARIABLES\n"
STRLBL3:
	.BYTE #$4E, #$4F, #$57, #$20, #$57, #$49, #$54, #$48, #$20, #$56, #$41, #$52, #$49, #$41, #$42, #$4C, #$45, #$53, #$0D, #$00
; $c42			"SPRITEON & SPRITEOFF\n"
STRLBL4:
	.BYTE #$53, #$50, #$52, #$49, #$54, #$45, #$4F, #$4E, #$20, #$26, #$20, #$53, #$50, #$52, #$49, #$54, #$45, #$4F, #$46, #$46, #$0D, #$00
; $c58			"SPRITESET\n"
STRLBL5:
	.BYTE #$53, #$50, #$52, #$49, #$54, #$45, #$53, #$45, #$54, #$0D, #$00
; $c63			"SPRITETOGGLE\n"
STRLBL6:
	.BYTE #$53, #$50, #$52, #$49, #$54, #$45, #$54, #$4F, #$47, #$47, #$4C, #$45, #$0D, #$00
; $c71			"DONE\n"
STRLBL7:
	.BYTE #$44, #$4F, #$4E, #$45, #$0D, #$00
