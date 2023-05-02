.org $0834
	;; install the 1st interrupt routine

	;; turn off interrupt requests
	SEI

	;; turn off CIA interrupt requests
	LDA #$7F
	STA $DC0D
	STA $DD0D

	;; ACK CIA IRQs
	LDA $DC0D
	LDA $DD0D

	;; Enable the Raster Interrupt Requests
	LDA #$01
	STA $D01A
	
	;; 69th raster line
	LDA #$45
	STA $D012
	
	;; zero out the high bit of D011
	LDA $D011
	AND #$7F
	STA $D011

	;; put the address of the routine into the
	;; the address that normally gets called
	LDA #<IRQ1
	STA $0314
	LDA #>IRQ1
	STA $0315

	;; turn interrupts back on
	CLI

	;; return to caller
	rts

IRQ1:
	;;
	;; routine goes here
	;; vvvv  -----  vvvv

	;; delay for timing
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP

        ;; SAVE THE SCREEN BG COLOUR
	LDA $D021
	STA OLDBG

	;; CHANGE THE SCREEN BG COLOUR
        LDA #$00
        STA $D021

	;; SAVE THE CURRENT D016
	LDA $D016
	STA OLDSHIFT

	;; shift the screen 7 bits to the right
	AND #$F8
	ORA #$07
	STA $D016

	;;
	;; INSTALL THE 2ND INT ROUTINE
        ;; 
	LDA #$7F
	STA $DC0D
	STA $DD0D
	LDA $DC0D
	LDA $DD0D
	LDA #$01
	STA $D01A
	
	;; 133rd raster line
	;; LDA #$85
	LDA #$4A
	STA $D012

	;; zero out the high bit of D011
	;; LDA $D011
	;; AND #$7F
	;; STA $D011

	LDA #<IRQ2
	STA $0314
	LDA #>IRQ2
	STA $0315

	;;
	;; ^^^^  -----  ^^^^
	;;

        ;; ACK INT
	LDA #$FF
	STA $D019

        ;; CALL AN INTERRUPT ROUTINE THAT
	;; DOES VERY LITTLE
	;; JMP $EA81
	JMP $EA7E

IRQ2:
	;;
	;; routine goes here
	;; vvvv  -----  vvvv

	;; delay for timing
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP

        ;; RESTORE SCREEN COLOUR
	;; LDA OPCODE
	.BYTE #$A9
OLDBG:
	.BYTE #$06
        STA $D021

	.BYTE #$A9
OLDSHIFT:
	.BYTE #$C8
	STA $D016
	
        ;; RE-INSTALL 1ST ROUTINE
	LDA #$7F
	STA $DC0D
	STA $DD0D
	LDA $DC0D
	LDA $DD0D
	LDA #$01
	STA $D01A
	;; 69th raster line
	LDA #$45
	STA $D012

	;; zero out the high bit of D011	
	;; LDA $D011
	;; AND #$7F
	;; STA $D011

	LDA #<IRQ1
	STA $0314
	LDA #>IRQ1
	STA $0315
	;;
	;; ^^^^  -----  ^^^^
	;;
	
        ;; ACK INT
	LDA #$FF
	STA $D019

        ;; CALL THE NORMAL INT ROUTINE 
	JMP $EA31
	

