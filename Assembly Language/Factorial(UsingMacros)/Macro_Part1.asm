; Part 1
; Siddharth Pathak
; V00876495

.cseg
.def factor 
;************************
; Your code starts here:
;

; initialize the stack pointer
	ldi r16, low(RAMEND)
	out SPL, r16
	ldi r16, high(RAMEND)
	out SPH, r16
		
	; prepare the parameters X and Z
	ldi ZH, high(dest)
	ldi ZL, low(dest)



.macro addw
ldi r17,@0
ldi r18,@1
ldi r19,@2
ldi r20,@3
add r17,r19
adc r18,r20
.endmacro
	
	addw 0x01,0x01,0x02,0x01



	;addw 0x01,0x01,0x02,0x01

done:	jmp done

; *****************
; * Data segment follows: *
; *****************
.dseg
.org 0x200
dest: .byte 14