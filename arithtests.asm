.org $C000
	LDA #$21; C000
	STA $0344; C002
	LDA #$C1; C005
	STA $03; C007
	LDA #$43; C009
	STA $02; C00B
	JSR PRN; C00D
	LDA $0344; C010
	PHA; C013
	JSR BYTE2HEX; C014
	JSR LBL0L0; cr(); C017
	LDA #$21; C01A
	STA $0345; C01C
	LDA #$C1; C01F
	STA $03; C021
	LDA #$56; C023
	STA $02; C025
	JSR PRN; C027
	LDA $0345; C02A
	PHA; C02D
	JSR BYTE2HEX; C02E
	JSR LBL0L0; cr(); C031
	LDA #$00; C034
	STA $0346; C036
	LDA #$C1; C039
	STA $03; C03B
	LDA #$69; C03D
	STA $02; C03F
	JSR PRN; C041
	LDA $0346; C044
	PHA; C047
	JSR BYTE2HEX; C048
	JSR LBL0L0; cr(); C04B
	LDA #$2A; C04E
	STA $0344; C050
	LDA #$C1; C053
	STA $03; C055
	LDA #$7C; C057
	STA $02; C059
	JSR PRN; C05B
	LDA $0344; C05E
	PHA; C061
	JSR BYTE2HEX; C062
	JSR LBL0L0; cr(); C065
	LDA $0346; C068
	CLC; C06B
	ADC #$2D; C06C
	STA $0344; C06E
	LDA #$C1; C071
	STA $03; C073
	LDA #$8F; C075
	STA $02; C077
	JSR PRN; C079
	LDA $0344; C07C
	PHA; C07F
	JSR BYTE2HEX; C080
	JSR LBL0L0; cr(); C083
	LDA $0346; C086
	CLC; C089
	ADC $0344; C08A
	STA $0344; C08D
	LDA #$C1; C090
	STA $03; C092
	LDA #$A2; C094
	STA $02; C096
	JSR PRN; C098
	LDA $0344; C09B
	PHA; C09E
	JSR BYTE2HEX; C09F
	JSR LBL0L0; cr(); C0A2
	LDA $0346; C0A5
	CLC; C0A8
	ADC #$3D; C0A9
	STA $0344; C0AB
	LDA #$C1; C0AE
	STA $03; C0B0
	LDA #$B5; C0B2
	STA $02; C0B4
	JSR PRN; C0B6
	LDA $0344; C0B9
	PHA; C0BC
	JSR BYTE2HEX; C0BD
	JSR LBL0L0; cr(); C0C0
	RTS; C0C3
LBL0L0:
	LDA #$C1; C0C4
	STA $03; C0C6
	LDA #$C8; C0C8
	STA $02; C0CA
	JSR PRN; C0CC
	RTS; C0CF
FMULT:
	PLA; C0D0
	STA $0341; C0D1
	PLA; C0D4
	STA $0342; C0D5
	LDA $0342; C0D8
	PHA; C0DB
	LDA $0341; C0DC
	PHA; C0DF
	RTS; C0E0
FIN:
	PLA; C0E1
	STA $0341; C0E2
	PLA; C0E5
	STA $0342; C0E6
	PLA; C0E9
	STA $7A; C0EA
	PLA; C0EC
	STA $7B; C0ED
	JSR $0079; C0EF
	JSR $BCF3; C0F2
	LDA $0342; C0F5
	PHA; C0F8
	LDA $0341; C0F9
	PHA; C0FC
	RTS; C0FD
BYTE2HEX:		;Display a Hexadecimal Byte
	PLA; C0FE
	STA $0341; C0FF
	PLA; C102
	STA $0342; C103
	CLD; C106
	PLA; C107
	TAX; C108
	AND #$F0; C109
	LSR; C10B
	LSR; C10C
	LSR; C10D
	LSR; C10E
	CMP #$0A; C10F
	.BYTE #$90; C111
	.BYTE #$03; C112
	CLC; C113
	ADC #$07; C114
	ADC #$30; C116
	JSR $FFD2; C118
	TXA; C11B
	AND #$0F; C11C
	CMP #$0A; C11E
	.BYTE #$90; C120
	.BYTE #$03; C121
	CLC; C122
	ADC #$07; C123
	ADC #$30; C125
	JSR $FFD2; C127
	LDA $0342; C12A
	PHA; C12D
	LDA $0341; C12E
	PHA; C131
	RTS; C132
PRN:
	LDY #$00; C133
PRN_LOOP:
	LDA ($02),Y; C135
	CMP #$00; C137
	BEQ PRN_END; C139
	JSR $FFD2; C13B
	INY; C13E
	JMP PRN_LOOP; C13F
PRN_END:
	RTS; C142
; $c143			"INT M=33      M = "
STRLBL0:
	.BYTE #$49
	.BYTE #$4E
	.BYTE #$54
	.BYTE #$20
	.BYTE #$4D
	.BYTE #$3D
	.BYTE #$33
	.BYTE #$33
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$00
; $c156			"INT Z=16+17   Z = "
STRLBL1:
	.BYTE #$49
	.BYTE #$4E
	.BYTE #$54
	.BYTE #$20
	.BYTE #$5A
	.BYTE #$3D
	.BYTE #$31
	.BYTE #$36
	.BYTE #$2B
	.BYTE #$31
	.BYTE #$37
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$5A
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$00
; $c169			"INT Y;        Y = "
STRLBL2:
	.BYTE #$49
	.BYTE #$4E
	.BYTE #$54
	.BYTE #$20
	.BYTE #$59
	.BYTE #$3B
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$59
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$00
; $c17c			"M = 23 + 19   M = "
STRLBL3:
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$32
	.BYTE #$33
	.BYTE #$20
	.BYTE #$2B
	.BYTE #$20
	.BYTE #$31
	.BYTE #$39
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$00
; $c18f			"M = Y + 45    M = "
STRLBL4:
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$59
	.BYTE #$20
	.BYTE #$2B
	.BYTE #$20
	.BYTE #$34
	.BYTE #$35
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$00
; $c1a2			"M = Y + M     M = "
STRLBL5:
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$59
	.BYTE #$20
	.BYTE #$2B
	.BYTE #$20
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$00
; $c1b5			"M = 61 + Y    M = "
STRLBL6:
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$36
	.BYTE #$31
	.BYTE #$20
	.BYTE #$2B
	.BYTE #$20
	.BYTE #$59
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$20
	.BYTE #$4D
	.BYTE #$20
	.BYTE #$3D
	.BYTE #$20
	.BYTE #$00
; $c1c8			"\n"
STRLBL7:
	.BYTE #$0D
	.BYTE #$00