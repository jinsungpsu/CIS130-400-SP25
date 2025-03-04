; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
; My program
; my name
; assembly is interesting... i guess

.386
.model flat,stdcall
.stack 4096

; ################################
; variables defined here
; ################################
.data
num dword 12	; name of variable
				; type of variable
				; initial value
				; by default, this is in decimal
num2 dword 99
num3 dword 102			; decimal
num4 dword 100101010b	; binary
num5 dword 1010Ah		; hex

ExitProcess proto,dwExitCode:dword


; ################################
; code goes here... actual instructions
; ################################

.code
main proc
	mov	eax, num			; move instructions
							; without E
							; 2 operands
							; first operand
							; is the destination
							; 2nd operand
							; is the source
							; not really a move
							; more like a copy
							; because the data
							; in num is still gonna
							; be in num
							; but also copied into
							; eax
							; which is a register!
	mov ebx,10
	add	eax,ebx				; eax = eax + ebx
							; eax += ebx

	invoke ExitProcess,0
main endp
end main
