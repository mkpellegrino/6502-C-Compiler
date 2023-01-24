; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; word : testdata : $0336 (822)
; uint : loop : $0338 (824)
; RULE: datatype: void
.org $0834
; =========================================================
;                         main()
; =========================================================
	LDA #<LBL1L0; 0834
	STA $0336; 0836
	LDA #>LBL1L0; 0839
	STA $0337; 083B
	JMP !+; 083E
LBL1L0:
	.BYTE #$0C; 0841
	.BYTE #$EC; 0842
	.BYTE #$CA; 0843
	.BYTE #$97; 0844
	.BYTE #$96; 0845
	.BYTE #$9B; 0846
	.BYTE #$70; 0847
	.BYTE #$32; 0848
	.BYTE #$A6; 0849
	.BYTE #$4D; 084A
	.BYTE #$75; 084B
	.BYTE #$6C; 084C
	.BYTE #$01; 084D
	.BYTE #$B6; 084E
	.BYTE #$29; 084F
	.BYTE #$E8; 0850
	.BYTE #$02; 0851
	.BYTE #$68; 0852
	.BYTE #$69; 0853
	.BYTE #$43; 0854
	.BYTE #$88; 0855
	.BYTE #$9D; 0856
	.BYTE #$F7; 0857
	.BYTE #$FA; 0858
	.BYTE #$53; 0859
	.BYTE #$1C; 085A
	.BYTE #$10; 085B
	.BYTE #$C8; 085C
	.BYTE #$F4; 085D
	.BYTE #$2F; 085E
	.BYTE #$92; 085F
	.BYTE #$C3; 0860
	.BYTE #$16; 0861
	.BYTE #$BF; 0862
	.BYTE #$66; 0863
	.BYTE #$FB; 0864
	.BYTE #$E9; 0865
	.BYTE #$4E; 0866
	.BYTE #$72; 0867
	.BYTE #$19; 0868
	.BYTE #$EC; 0869
	.BYTE #$1A; 086A
	.BYTE #$93; 086B
	.BYTE #$E6; 086C
	.BYTE #$0E; 086D
	.BYTE #$3D; 086E
	.BYTE #$B3; 086F
	.BYTE #$93; 0870
	.BYTE #$82; 0871
	.BYTE #$E2; 0872
	.BYTE #$DB; 0873
	.BYTE #$5D; 0874
	.BYTE #$CE; 0875
	.BYTE #$6C; 0876
	.BYTE #$A6; 0877
	.BYTE #$B5; 0878
	.BYTE #$D2; 0879
	.BYTE #$4F; 087A
	.BYTE #$75; 087B
	.BYTE #$D5; 087C
	.BYTE #$65; 087D
	.BYTE #$6A; 087E
	.BYTE #$26; 087F
	.BYTE #$42; 0880
	.BYTE #$AA; 0881
	.BYTE #$92; 0882
	.BYTE #$A9; 0883
	.BYTE #$54; 0884
	.BYTE #$9D; 0885
	.BYTE #$9B; 0886
	.BYTE #$61; 0887
	.BYTE #$C0; 0888
	.BYTE #$FC; 0889
	.BYTE #$30; 088A
	.BYTE #$BE; 088B
!
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L1:
	PHA; 088C
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; loop
; u0
	LDA #$00; 088D
; RULE: statement: datatype ID init
; UINT loop=A datatype#: 00
; UINT UintID A
	STA $0338; 088F
; ---------------------------------------------------------
; UintID
; $0338
;  vs. 
; UintIMM
; u65
LBL1L2:			; Top of FOR Loop
	LDA $0338; 0892
	CMP #$41; 0895
	.BYTE #$B0, #$03; BCS +3; 0897
	JMP LBL1L4; if c==0 jump to BODY; 0899
	JMP LBL1L5; jump out of FOR; 089C
; =========================================================
; ---------------------------------------------------------
LBL1L3:
; inc(ID)
	INC $0338; 089F
	JMP LBL1L2; jump to top of FOR loop; 08A2
; ---------------------------------------------------------
LBL1L4:
; Dereference: testdata
	LDA $0336; 08A5
	STA LBL2L0; 08A8
	LDA $0337; 08AB
	STA LBL2L0+1; 08AE
	LDX $0338; 08B1
	.BYTE #$BD;		LDA ABS,X; 08B4
LBL2L0:
	.BYTE #$00; 08B5
	.BYTE #$00; 08B6
; =========================================================
;                         printf(A);
; =========================================================
	PHA; 08B7
	JSR BYTE2HEX; 08B8
	JSR LBL0L1; sp(); 08BB
; ---------------------------------------------------------
	JMP LBL1L3; jump to iterator; 08BE
LBL1L5:
	PLA; 08C1
; ---------------------------------------------------------
	JSR LBL0L0; cr(); 08C2
	RTS; 08C5
; RULE: datatype: void
; ======================== cr ========================
LBL0L0:
; RULE: value: HEX_NUM: (0x0D)
; RULE: value: HEX_NUM: (0x0D)->(u13)
	LDA #$0D; 08C6
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 08C8
	RTS; 08CB
; RULE: datatype: void
; ======================== sp ========================
LBL0L1:
; RULE: value: HEX_NUM: (0x20)
; RULE: value: HEX_NUM: (0x20)->(u32)
	LDA #$20; 08CC
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 08CE
	RTS; 08D1
BYTE2HEX:		;Display a Hexadecimal Byte
	PLA; 08D2
	STA $0334; 08D3
	PLA; 08D6
	STA $0335; 08D7
	CLD; 08DA
	PLA; 08DB
	TAX; 08DC
	AND #$F0; 08DD
	LSR; 08DF
	LSR; 08E0
	LSR; 08E1
	LSR; 08E2
	CMP #$0A; 08E3
	.BYTE #$90, #$03; 08E5
	CLC; 08E7
	ADC #$07; 08E8
	ADC #$30; 08EA
	JSR $FFD2; 08EC
	TXA; 08EF
	AND #$0F; 08F0
	CMP #$0A; 08F2
	.BYTE #$90, #$03; 08F4
	CLC; 08F6
	ADC #$07; 08F7
	ADC #$30; 08F9
	JSR $FFD2; 08FB
	LDA $0335; 08FE
	PHA; 0901
	LDA $0334; 0902
	PHA; 0905
	RTS; 0906
