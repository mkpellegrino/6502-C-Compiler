.org $033C


	;; setup the new interrupt handler
init:

	;; store the olde interrupt handler address
	;; so we can call it later
	lda $0314
	sta $03A0
	lda $0315
	sta $03A1	

	;; disable interrupts
	sei

	;; put the new int. handler's address
	;; in the place where the old one was
	lda #<myirqhan
	ldx #>myirqhan
	sta $0314
	stx $0315

	;; re-enable interrupts
	cli
	rts

	;; the new interrupt handler
myirqhan:

	;; put the current cursor row on the screen
	ldx $D6
	inx
	stx $0400

	;; remember to call the old interrupt handler!
	jmp ($03A0)


	;; this just does the opposite of what init does
restore:
	sei
	lda $03A0
	sta $0314	
	lda $03A1
	sta $0315
	cli
	rts
