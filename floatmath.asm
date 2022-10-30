; Adding: return_address_1 of type: uint
; Adding: return_address_2 of type: uint
.org $0834
	LDA #$0D
	STA $03
	LDA #$26
	STA $02
	JSR PRN
	JSR LBL0L3; hl()
; Adding: x of type: float
; =========== IMM -> FAC ==========
; Base address: 0336
	LDA #$82
	STA $0336
	LDA #$00
	STA $0337
	LDA #$00
	STA $0338
	LDA #$00
	STA $0339
	LDA #$00
	STA $033A
; =================================
; Adding: y of type: float
; =========== IMM -> FAC ==========
; Base address: 033B
	LDA #$83
	STA $033B
	LDA #$A4
	STA $033C
	LDA #$8B
	STA $033D
	LDA #$0A
	STA $033E
	LDA #$F5
	STA $033F
; =================================
; Adding: z of type: float
; =========== IMM -> FAC ==========
; Base address: 0340
	LDA #$82
	STA $0340
	LDA #$49
	STA $0341
	LDA #$0F
	STA $0342
	LDA #$CF
	STA $0343
	LDA #$80
	STA $0344
; =================================
; Adding: w of type: float
; =========== IMM -> FAC ==========
; Base address: 0345
	LDA #$00
	STA $0345
	LDA #$00
	STA $0346
	LDA #$00
	STA $0347
	LDA #$00
	STA $0348
	LDA #$00
	STA $0349
; =================================
	LDA #$0D
	STA $03
	LDA #$4B
	STA $02
	JSR PRN
	JSR LBL0L0; printINIT()
	LDA #$45
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	LDA #$0D
	STA $03
	LDA #$4D
	STA $02
	JSR PRN
	JSR LBL0L0; printINIT()
	LDA #$36
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	LDA #$0D
	STA $03
	LDA #$4F
	STA $02
	JSR PRN
	JSR LBL0L0; printINIT()
	LDA #$3B
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	LDA #$0D
	STA $03
	LDA #$51
	STA $02
	JSR PRN
	JSR LBL0L0; printINIT()
	LDA #$40
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	JSR LBL0L2; pause()
	JSR $FF81; cls()
	LDA #$0D
	STA $03
	LDA #$53
	STA $02
	JSR PRN
	JSR LBL0L3; hl()
	LDA #$0D
	STA $03
	LDA #$6D
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_MEM
	LDA #$3B
	LDY #$03
	JSR $BBA2
	LDA #$40
	LDY #$03
	JSR $B867; FADD
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	LDA #$45
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	LDA #$0D
	STA $03
	LDA #$7A
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $B867; RAM + FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0D
	STA $03
	LDA #$93
	STA $02
	JSR PRN
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $BBA2
	LDA #$69
	LDY #$00
; FLOAT_IMM arithmetic FLOAT_MEM
	JSR $B867; RAM + FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0D
	STA $03
	LDA #$AC
	STA $02
	JSR PRN
; FLOAT_IMM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$83
	STA $69
	LDA #$3B
	STA $6A
	LDA #$84
	STA $6B
	LDA #$0E
	STA $6C
	LDA #$17
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	JSR LBL0L2; pause()
	JSR $FF81; cls()
	LDA #$0D
	STA $03
	LDA #$D1
	STA $02
	JSR PRN
	JSR LBL0L3; hl()
	LDA #$0D
	STA $03
	LDA #$EC
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_MEM
	LDA #$3B
	LDY #$03
	JSR $BBA2
	LDA #$40
	LDY #$03
	JSR $B850; FSUB
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	LDA #$45
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	LDA #$0D
	STA $03
	LDA #$F9
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $B850; RAM - FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0E
	STA $03
	LDA #$12
	STA $02
	JSR PRN
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $BBA2
	LDA #$69
	LDY #$00
; FLOAT_IMM arithmetic FLOAT_MEM
	JSR $B850; RAM - FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0E
	STA $03
	LDA #$2B
	STA $02
	JSR PRN
; FLOAT_IMM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$7F
	STA $69
	LDA #$58
	STA $6A
	LDA #$BC
	STA $6B
	LDA #$16
	STA $6C
	LDA #$9C
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	JSR LBL0L2; pause()
	JSR $FF81; cls()
	LDA #$0E
	STA $03
	LDA #$50
	STA $02
	JSR PRN
	JSR LBL0L3; hl()
	LDA #$0E
	STA $03
	LDA #$6C
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_MEM
	LDA #$3B
	LDY #$03
	JSR $BBA2
	LDA #$40
	LDY #$03
	JSR $BA28; FMULT
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	LDA #$45
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	LDA #$0E
	STA $03
	LDA #$79
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $BA28; RAM * FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0E
	STA $03
	LDA #$92
	STA $02
	JSR PRN
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $BBA2
	LDA #$69
	LDY #$00
; FLOAT_IMM arithmetic FLOAT_MEM
	JSR $BA28; RAM * FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0E
	STA $03
	LDA #$AB
	STA $02
	JSR PRN
; FLOAT_IMM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$84
	STA $69
	LDA #$08
	STA $6A
	LDA #$A2
	STA $6B
	LDA #$B2
	STA $6C
	LDA #$7C
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	JSR LBL0L2; pause()
	JSR $FF81; cls()
	LDA #$0E
	STA $03
	LDA #$D0
	STA $02
	JSR PRN
	JSR LBL0L3; hl()
	LDA #$0E
	STA $03
	LDA #$E9
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_MEM
	LDA #$3B
	LDY #$03
	JSR $BBA2
	LDA #$40
	LDY #$03
	JSR $BB0F; FDIV
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	LDA #$45
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	LDA #$0E
	STA $03
	LDA #$F6
	STA $02
	JSR PRN
; FLOAT_MEM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $BB0F; RAM/FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0F
	STA $03
	LDA #$0F
	STA $02
	JSR PRN
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$82
	STA $69
	LDA #$2D
	STA $6A
	LDA #$F8
	STA $6B
	LDA #$4C
	STA $6C
	LDA #$AD
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDA #$40
	LDY #$03
	JSR $BBA2
	LDA #$69
	LDY #$00
; FLOAT_IMM arithmetic FLOAT_MEM
	JSR $BB0F; RAM/FAC
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	LDA #$0F
	STA $03
	LDA #$28
	STA $02
	JSR PRN
; FLOAT_IMM arithmetic FLOAT_IMM
; =========== IMM -> FAC ==========
; Base address: 69
	LDA #$81
	STA $69
	LDA #$13
	STA $6A
	LDA #$EE
	STA $6B
	LDA #$DC
	STA $6C
	LDA #$C2
	STA $6D
	LDA #$69
	LDY #$00
	JSR $BBA2; RAM -> FAC
; =================================
	LDX #$45
	LDY #$03
	JSR $BBD4;  FAC -> MEM
	JSR LBL0L1; printW()
	JSR LBL0L2; pause()
	LDA #$0F
	STA $03
	LDA #$4D
	STA $02
	JSR PRN
	RTS
LBL0L0:
	LDA #$0F
	STA $03
	LDA #$55
	STA $02
	JSR PRN
	RTS
LBL0L1:
	LDA #$45
	LDY #$03
	JSR $BBA2; RAM -> FAC
	JSR $AABC; FAC -> CRT
	RTS
LBL0L2:
	LDA #$0F
	STA $03
	LDA #$66
	STA $02
	JSR PRN
	JSR SCANF
	RTS
LBL0L3:
	LDA #$0F
	STA $03
	LDA #$72
	STA $02
	JSR PRN
	RTS
LBL0L4:
	NOP
	NOP
	NOP
	RTS
PRN:
	LDY #$00
PRN_LOOP:
	LDA ($02),Y
	CMP #$00
	BEQ PRN_END
	JSR $FFD2
	INY
	JMP PRN_LOOP
PRN_END:
	RTS
SCANF:
	LDX #$00
	STX $CFDE
SCANFTOP:
	JSR $FF9F
	JSR $FFE4
	BEQ SCANFTOP
	CMP #$0D
	BEQ SCANFEND
	CMP #$14
	BEQ BKSPC
	JSR $FFD2
	LDX $CFDE
	STA $CFE0,X
	INX
	STX $CFDE
	CPX #$10
	BEQ SCANFEND
	JMP SCANFTOP
SCANFEND:
	RTS
BKSPC:
	LDX $CFDF
	DEX
	STX $CFDF
	JMP SCANFTOP
GETKEY:
	JSR $FFE4
	CMP #$00
	BEQ GETKEY
	STA $CFDF
	RTS
; $d26			"    FLOATING POINT ARITHMETIC TESTS\n"
STRLBL0:
	.BYTE #$20, #$20, #$20, #$20, #$46, #$4C, #$4F, #$41, #$54, #$49, #$4E, #$47, #$20, #$50, #$4F, #$49, #$4E, #$54, #$20, #$41, #$52, #$49, #$54, #$48, #$4D, #$45, #$54, #$49, #$43, #$20, #$54, #$45, #$53, #$54, #$53, #$0D, #$00
; $d4b			"W"
STRLBL1:
	.BYTE #$57, #$00
; $d4d			"X"
STRLBL2:
	.BYTE #$58, #$00
; $d4f			"Y"
STRLBL3:
	.BYTE #$59, #$00
; $d51			"Z"
STRLBL4:
	.BYTE #$5A, #$00
; $d53			"                ADDITION\n"
STRLBL5:
	.BYTE #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$41, #$44, #$44, #$49, #$54, #$49, #$4F, #$4E, #$0D, #$00
; $d6d			"W = Z + Y =\n"
STRLBL6:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2B, #$20, #$59, #$20, #$3D, #$0D, #$00
; $d7a			"W = Z + 2.71828 (IMM) =\n"
STRLBL7:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2B, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $d93			"W = 2.71828 (IMM) + Z =\n"
STRLBL8:
	.BYTE #$57, #$20, #$3D, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2B, #$20, #$5A, #$20, #$3D, #$0D, #$00
; $dac			"W = 3.14159 (IMM) + 2.71828 (IMM) =\n"
STRLBL9:
	.BYTE #$57, #$20, #$3D, #$20, #$33, #$2E, #$31, #$34, #$31, #$35, #$39, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2B, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $dd1			"              SUBTRACTION\n"
STRLBL10:
	.BYTE #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$53, #$55, #$42, #$54, #$52, #$41, #$43, #$54, #$49, #$4F, #$4E, #$0D, #$00
; $dec			"W = Z - Y =\n"
STRLBL11:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2D, #$20, #$59, #$20, #$3D, #$0D, #$00
; $df9			"W = Z - 2.71828 (IMM) =\n"
STRLBL12:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2D, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $e12			"W = 2.71828 (IMM) - Z =\n"
STRLBL13:
	.BYTE #$57, #$20, #$3D, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2D, #$20, #$5A, #$20, #$3D, #$0D, #$00
; $e2b			"W = 3.14159 (IMM) - 2.71828 (IMM) =\n"
STRLBL14:
	.BYTE #$57, #$20, #$3D, #$20, #$33, #$2E, #$31, #$34, #$31, #$35, #$39, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2D, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $e50			"            MULTIPLICATION\n"
STRLBL15:
	.BYTE #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$4D, #$55, #$4C, #$54, #$49, #$50, #$4C, #$49, #$43, #$41, #$54, #$49, #$4F, #$4E, #$0D, #$00
; $e6c			"W = Z * Y =\n"
STRLBL16:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2A, #$20, #$59, #$20, #$3D, #$0D, #$00
; $e79			"W = Z * 2.71828 (IMM) =\n"
STRLBL17:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2A, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $e92			"W = 2.71828 (IMM) * Z =\n"
STRLBL18:
	.BYTE #$57, #$20, #$3D, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2A, #$20, #$5A, #$20, #$3D, #$0D, #$00
; $eab			"W = 3.14159 (IMM) * 2.71828 (IMM) =\n"
STRLBL19:
	.BYTE #$57, #$20, #$3D, #$20, #$33, #$2E, #$31, #$34, #$31, #$35, #$39, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2A, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $ed0			"               DIVISION\n"
STRLBL20:
	.BYTE #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$44, #$49, #$56, #$49, #$53, #$49, #$4F, #$4E, #$0D, #$00
; $ee9			"W = Z / Y =\n"
STRLBL21:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2F, #$20, #$59, #$20, #$3D, #$0D, #$00
; $ef6			"W = Z / 2.71828 (IMM) =\n"
STRLBL22:
	.BYTE #$57, #$20, #$3D, #$20, #$5A, #$20, #$2F, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $f0f			"W = 2.71828 (IMM) / Z =\n"
STRLBL23:
	.BYTE #$57, #$20, #$3D, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2F, #$20, #$5A, #$20, #$3D, #$0D, #$00
; $f28			"W = 3.14159 (IMM) / 2.71828 (IMM) =\n"
STRLBL24:
	.BYTE #$57, #$20, #$3D, #$20, #$33, #$2E, #$31, #$34, #$31, #$35, #$39, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$2F, #$20, #$32, #$2E, #$37, #$31, #$38, #$32, #$38, #$20, #$28, #$49, #$4D, #$4D, #$29, #$20, #$3D, #$0D, #$00
; $f4d			"\nDONE.\n"
STRLBL25:
	.BYTE #$0D, #$44, #$4F, #$4E, #$45, #$2E, #$0D, #$00
; $f55			" INITIALIZED TO:"
STRLBL26:
	.BYTE #$20, #$49, #$4E, #$49, #$54, #$49, #$41, #$4C, #$49, #$5A, #$45, #$44, #$20, #$54, #$4F, #$3A, #$00
; $f66			"PRESS ENTER"
STRLBL27:
	.BYTE #$50, #$52, #$45, #$53, #$53, #$20, #$45, #$4E, #$54, #$45, #$52, #$00
; $f72			"=======================================\n"
STRLBL28:
	.BYTE #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$0D, #$00
