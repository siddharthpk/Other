;Name : Siddharth
;Part 1

;Student number V00876495
;Creation Date 01/10/2017

.include "m2560def.inc"
;
; *********************************************************
; * Program information goes here. *
; * Examples include: Course name, assignment number, *
; * program name, program description, program input, *
; * program output, programmer name, creation date, *
; * dates of program updates. *
; *******************************************************
; ***********************
; * Code segment follows: *
     
	
	 
; ***********************
.cseg

; number1 = 27
.def a = R16

 ; number2 = 41
.def b = R17

; number3 = 15;
.def c = R18
;************************
; Your code starts here:

  ldi a,27
  ldi b,41
  ldi c,15
  

  ; sum=0 
 clr R0
 add R0, a
 add R0, b
 add R0, c
 sts result, R0

; Your code finishes here.
;*************************
done: jmp done
; ***********************
; * Data segment follows: *
; ***********************

 
.dseg
.org 0x200

result: .db 1
