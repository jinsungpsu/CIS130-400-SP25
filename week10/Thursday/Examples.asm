comment /
	Week 10 Examples
/

.386
.model flat,stdcall
.stack 4096
.data

;symbolic constants that can be redefined
COUNT = 5
INITIAL_GRADE = 100

; symbol that can't be redefined
MAX_GRADE EQU <100>

grades2 DWORD COUNT dup(MAX_GRADE)
grades DWORD COUNT dup(INITIAL_GRADE)



var1 BYTE ?
var2 DWORD ?, ?, ?
var3 WORD 1,2,3,4
var3size = $ - var3			; size calculations
							; using the current locatoin
							; pointer
							; must be done in the correct place
							; meaning... if the location changes
							; aka more memory was allocated
							; then the result will be wrong
							; this is the size in BYTES
							; so in this example, it'll be 8
							; if i want the "length" aka
							; number of elements
							; I have to divide by 2
							; because WORD = 16 bits or 2 BYTES
var4 BYTE "Hello World", 0
wrongvar3size = $ - var3	; this is wrong
							; because var4 was allocated...
							;
var4size = $ - var4			; var4size is a symbolic constant
							; current location (current address of ram as OS allocates memory)
							; var4 is a label for that data
							; aka address in ram

mem1 DWORD 123
mem2 DWORD 345
mem3 DWORD 678

mem4 WORD 111

lab2array DWORD 5,5,5,5,5
lab2result DWORD ?

ExitProcess proto,dwExitCode:dword

.code
main proc
	; lab
	add lab2result, lab2array, lab2array+4, lab2array+8, lab2array+12
	comment /
		there's a lot of intermediary steps
		clear eax to hold our result (if less than 32 bit values)

		mov the FIRST item in the array into eax
		then add the second, third, fourth, etc.
		then save eax back into RAM

		int[] arr = {1,2,3,4,5};
		int sum = arr[0] + arr[1] + arr[2] + arr[3] + arr[4];
	/



	; types of operands
	; immediate addressing/operand
	; int x = 5;

	mov eax, var4size
	mov ebx, var3size

	; MOV (and most/probably all) operations
	; do NOT allow 2 memory operands

	; mov mem1, mem2

	; mov eax, mem4		; mismatched operands
						; eax = 32 bits
						; mem4 = 16 bits

	mov ax, mem4		; this is fine
						; this will fill the lower
						; 16 bits of EAX
						; with whatever was in mem4
						; and the upper 16 bits of EAX
						; are UNAFFECTED

	; could deal with this two ways
	; first clear out EAX

	mov eax, 0			; clear it out
	mov ax, mem4

	; OR

	movzx eax, mem4		; allows us to mismatch types

	; use movsx for signed values	

	invoke ExitProcess,0
main endp
end main
