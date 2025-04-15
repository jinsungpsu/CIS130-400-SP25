comment /
	DTCC CIS130 Empty Assembly Project
/

.386
.model flat,stdcall
.stack 4096
.data

array1 DWORD 1,2,3,4,5
array1sum DWORD ?
array2 DWORD 6,7,8,9,10,11
array2sum DWORD ?
array3 DWORD 10, 20
array3sum DWORD ?


ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax, 0

	add eax, 5

	mov esi, OFFSET array1
	mov ecx, LENGTHOF array1
	call arraySum
	mov array1sum, eax

	mov ecx, eax

	mov esi, OFFSET array2
	mov ecx, LENGTHOF array2
	call arraySum
	mov array2sum, eax

	mov esi, OFFSET array3
	mov ecx, LENGTHOF array3
	call arraySum
	mov array3sum, eax

	invoke ExitProcess,0
main endp

ArraySum PROC
; Receives: ESI points to an array of doublewords, 
;   ECX = number of array elements.
; Returns: EAX = sum
;-----------------------------------------------------
mov eax,0	; set the sum to zero

L1:	add eax,[esi]	; add each integer to sum
add esi,4	; point to next integer
loop L1	; repeat for array size

	ret
ArraySum ENDP


end main
