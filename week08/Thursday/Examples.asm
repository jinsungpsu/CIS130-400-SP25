comment /
	multi line comments
	start with the directive "COMMENT"
	followed by a character of YOUR choice
	and then the multiline comment ends
	when you use that character again

	choose a character that is UNLIKELY
	to appear WITHIN your comment
/

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



num dword 12				; name of variable
							; type of variable
							; initial value
							; by default, this is in decimal
num2 dword 99
num3 dword 102				; decimal
num4 dword 100101010b	; binary
num5 dword 1010Ah				; hex
num6 dword 0AABBCCFFh				; hex value that starts with a letter
							; add a leading 0
num7 dword -5				; can use sign

add eax, 10
add eax, (-10*5) + 2

; a character
; BYTE = 8 bit
grade BYTE 'a'
grade1 BYTE "A"
grade2 BYTE 'F'
grade3 BYTE 65
grade4 BYTE 10010101b

; DWORD = 32 bit
grade5 DWORD 'a'

; the language doesn't care
; about the data type
; cares about the data SIZE
; program needs to figure out
; what is stored in there
; and do what it needs to do

; strings
; array of chars
; array of BYTEs

; defining an array
; of 11 characters
; so this is most similar to
; char message[11];
; in fact
; MORE accurate - data type
; short in C++ is 2 bytes
; short message[11];
message BYTE 'hello world'
message2 BYTE "Hello World"

; cout << "I am a \"cat\"";
; in assembly
; simpler
; 'I am a "cat"'

; example of reserved keyword
; dword is a reserved keyword
; it means something very specific
; to the language
; therefore, i cannot use it as a name
; for a variable
; dword dword 5

; identifiers are NOT case sensitive
; CAT = cat = Cat = CaT = cAt


; for lab 1
; save the result of the addition
; we need to define the variable HERE
; can't do it within the "program"
; in the code section
; can give an intial value like
; any other varialbe
; you can also use ? to leave uninitialized
; uninitialized doesn't mean
; it doesn't have a value
; it means it has an UNKNOWN value
; because that ram was most likely
; previously used by someone else
result dword 0				; int result = 0
result2 dowrd ?				; int result2;

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
	example1: mov ebx,10
	add	eax,ebx				; eax = eax + ebx
							; eax += ebx
	
	mov result, eax
	invoke ExitProcess,0
main endp
end main
