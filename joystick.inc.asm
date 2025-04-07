!JSportA: .byte $00
JSbtnPressA: .byte $00
JSnorth: .byte $00
JSsouth: .byte $00
JSeast: .byte $00
JSwest: .byte $00
	
getJS:
	lda $DC00
	sta !JSportA-

	lda #$10
	and !JSportA-
	sta JSbtnPressA
	
	lda #$01
	and !JSportA-
	sta JSnorth
	
	lda #$02
	and !JSportA-
	sta JSsouth
	
	lda #$04
	and !JSportA-
	sta JSwest
	
	lda #$08
	and !JSportA-
	sta JSeast
	
	rts 
