
 
.include "m2560def.inc"
;
; *********************************************************
; * Program information goes here. *
; * Name: Siddharth Pathak *
; * Part 2 *
; * Hexadecimal Decremention *
; * Creation Date: 8/10/2017 *
; * dates of program updates: 11/10/2017  *
; *******************************************************
; ***********************
; * Code segment follows: *
; ***********************
.cseg
;************************
; Your code starts here:

ldi XL,low(0x200)
ldi XH,high(0x200)

ldi r16, 0x0f
	.def temp = r17
	ldi r18, 0xff
    sts DDRL,r18
	.def mask =r19
	


 i: 
	ldi r19, 0b00001000
	AND r19,r16
	lsl r19
	lsl r19
	lsl r19
	lsl r19 

	mov r17, r19
	
	
	ldi r19, 0b00000100
	AND r19,r16
	lsl r19
	lsl r19
	lsl r19

	OR r17, r19

	ldi r19, 0b00000010
	AND r19,r16
	lsl r19
	lsl r19

	OR r17, r19

	ldi r19, 0b00000001
	AND r19,r16
	lsl r19

	OR r17, r19
 
	sts PORTL,r17



	
	ldi r24, 0x2A ; approx. 0.5 second delay
	outer: ldi r23, 0xFF
	middle: ldi r22, 0xFF
	inner: dec r22
	brne inner
	dec r23
	brne middle
	dec r24
	brne outer
	
	st X+,R16
	dec r16
	cpi r16 ,0x00

	brne i
 
; Your code finishes here.
;*************************
done: jmp done
; ***********************
; * Data segment follows: *
; ***********************
.dseg
.org 0x200
data : .byte 1
