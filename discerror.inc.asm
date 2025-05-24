// Possible Return Values
	
// 0	OK, no error exists.
// 26	Attempt to write with write protect on.
// 29	Disk id mismatch.
// 30	General syntax error
// 32	Invalid command.
// 33	Invalid filename.
// 34	No file given.
// 60	File open for write.
// 61 	File not open.
// 62	File not found.
// 63	File exists.
// 64	File type mismatch.
// 72	Disk full or directory full.
// 74	Drive not ready.

!lv_mem0:
	.byte $00
diskerror:
// Send TALK command to serial bus
	lda #$00
	sta $90
	lda #$08
	sta $BA
	jsr $FFB4
// Send TALK secondary address to serial bus
	lda #$6F
	sta $B9
	jsr $FF96
	
	jsr $FFA5
// A has 1st PETSCII digit
	pha
	jsr $FFA5
// A has 2nd PETSCII digit
	//sec
	//sbc #$30
	and #$0F
	sta $03
	pla
	//sec
	//sbc #$30
	and #$0F
// multiply by 10
	sta $02
	asl
	asl
	asl
	asl $02
	clc
	adc $02
// add in the 1's place
	adc $03
	sta !lv_mem0-
// Send UNTALK command to serial bus
	jsr $FFAB
	pla 
	tax 
	pla 
	tay 
	lda !lv_mem0-
	pha 
	lda #$01
	pha 
	tya 
	pha 
	txa 
	pha 
// Returning the error code via the stack
	rts 
