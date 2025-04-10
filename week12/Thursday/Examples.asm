comment /
	Week 12 Examples
/

.386
.model flat,stdcall
.stack 4096		; needs 4096 bytes for the runtime stack
.data

arr DWORD 1,2,3,4,5
result DWORD ?
arrElementSize DWORD TYPE arr

ExitProcess proto,dwExitCode:dword

.code
main proc			; int main()
					; a function
	
	; index in eax
	; the size of each element in ebx
	; sum in edx

	mov eax, 0	; start our counter or "i" at 0
	mov edx, 0

	call bob

	; initialize ecx to the # of iterations
	mov ecx, 5

	; start our loop, by adding a label

	loopStart:
	; body of loop
		add edx, arr[eax*TYPE arr]
		; in our program
		; eax is counter
		; TYPE arr is 4 (4 bytes) bc arr is DWORD
		; when eax or "i" is 0
		; arr[0] = address of arr and add 0 
		; 0 * 4 = 0
		; when eax or "i" is 1
		; then arr[1] = 2nd item in high level language
		; arr[1 * 4] = arr[4] = 2nd item in assembly
		; for an array of DWORD

		inc eax

	; loop and target to where to go back to
	LOOP loopStart

	mov result, edx


	comment /
		int sum = 0;
		for (int i = 0; i < lenght; i++) {
			sum+=array[i];
		}
	/

invoke ExitProcess,0
main endp				; end of main procedure
						; end of int main()


bob proc
	mov eax, 10

	ret
bob endp

end main
