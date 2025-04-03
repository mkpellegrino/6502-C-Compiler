// needed if plotting a point
//indexToBit: .byte 128,64,32,16,8,4,2,1
cell_addr_hi:	.byte $A0,$A1,$A2,$A3,$A5,$A6,$A7,$A8,$Aa,$Ab,$Ac,$Ad,$Af,$B0,$B1,$B2,$B4,$B5,$B6,$B7,$B9,$Ba,$Bb,$Bc,$Be
cell_addr_lo:	.byte $00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00

!lv_arg0: .byte $00 // y
!lv_arg1: .byte $00, $00
!lv_addr_hi: .byte $00
!lv_addr_lo: .byte $00
	
getpixel:	
	pla
	tax 
	pla 
	tay
	
	pla 
	sta !lv_arg0-
	pla 
	sta !lv_arg1- +1
	pla 
	sta !lv_arg1-
	tya 
	pha
	txa 
	pha

	///

	lda !lv_arg0-
	lsr
	lsr
	lsr
	tax            //  x = Y/8	
	lda !lv_arg1-
	and #$f8       // x /8 * 8 = clear lower 3 bits to 0
	clc
	adc cell_addr_lo,x // (Y/8)*320
	sta !lv_addr_lo-     // so this is BASE+Y/8*320+((X/8)*8)
	lda cell_addr_hi,x
	adc !lv_arg1- +1 // xhi byte
	sta !lv_addr_hi-  // and the upper 8 bits
	lda !lv_arg1-
	and #$07
	tax            // get the Bit to set from X
	lda !lv_arg0-
	and #$07         // get the Line we want to set
	adc !lv_addr_lo-
	sta !lv_addr_lo-
	//tay
	//lda (ADDRESS),y   ; read value
	//ora indexToBit,x ;or with x index to bit
	//sta (zpTemp),y   ; store it back


	pla 
	tax 
	pla 
	tay 

	lda !lv_addr_lo-
	pha
	lda !lv_addr_hi-
	pha
	lda #$02
	pha
	
	tya 
	pha 
	txa 
	pha 

	rts
