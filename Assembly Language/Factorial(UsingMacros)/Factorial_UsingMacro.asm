

; Part 2 
; Factorial
;  
;YOUR NAME GOES HERE:  Siddharth Pathak
;Student Number : V00876495
;Date: November 18,2017
; Description
;
.include "m2560def.inc"

.cseg

;  Obtain the constant from location init
	ldi zH, high(init<<1)
	ldi zL, low(init<<1)
	lpm r16, Z

;***
; YOUR CODE GOES HERE:
;
.MACRO ADDW					;define the Marco 
	add @0, @2
	adc @1, @3
.ENDMACRO

main:

	push r17
	mov r17, r16
	push r18
	push r19
	push r20

	call recursive
	pop r20
	pop r19
	pop r18
	pop r17
	sts result, r24
	sts result+1, r25
	
	push r17
	push r18
	push r19
	push r20
	push r21

	ldi r17, 0xff			
	sts DDRL,  r17

	ldi r18, 0b00000001
	and r18, r24
	lsl r18

	ldi r19, 0b00000010
	and r19, r24
	lsl r19
	lsl r19
	or r19, r18

	ldi r20, 0b00000100
	and r20, r24
	lsl r20
	lsl r20
	lsl r20
	or r20, r19

	ldi r21, 0b00001000
	and r21, r24
	lsl r21
	lsl r21
	lsl r21
	lsl r21
	or r21,r20

	sts PORTL, r21
	pop r21
	pop r20
	pop r19
	pop r18
	pop r17
	jmp done
	
recursive: 					
	push r16
	dec r16
	cpi r16, 1
	brne recursive
	call base_case
	call move_space
	
	call factorial

base_case: 				;Stack base case
	ldi r24, low(1)
	ldi r25, high(1)
	
	ret

move_space:				;reduce spaces
	pop r16
	pop r16
	pop r16
	
factorial:
	pop r16
	
	mov r18, r16
	mov r19, r24
	mov r20, r25
	
	call multiply
	cp r16, r17
	brne factorial
	ret

multiply:
	
	addw r24, r25, r19, r20		;run addw by loop
	dec r18									
	cpi r18,1
	brne multiply
	ret

; YOUR CODE FINISHES HERE
;****

done:	jmp done

; The constant, named init, holds the starting number.  
init:	.db 0x04

; This is in the data segment (ie. SRAM)
; The first real memory location in SRAM starts at location 0x200 on
; the ATMega 2560 processor.  
;
.dseg
.org 0x200

result:	.byte 2

