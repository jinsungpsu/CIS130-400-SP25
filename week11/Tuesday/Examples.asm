comment /
	Week 10 Examples
/

.386
.model flat,stdcall
.stack 4096
.data

comment /
	week 11 examples
/
myBytes BYTE 80h,66h,0A5h

comment /
	end week 11 examples
/

ExitProcess proto,dwExitCode:dword

.code
main proc
comment / week 11 examples 
myBytes BYTE 80h,66h,0A5h
/

mov eax, 0
mov al, myBytes
add al, myBytes + 1
add al, myBytes + 2

movzx ax, myBytes
movzx bx, myBytes+1
movzx cx, myBytes+2
add ax, bx
add ax, cx

mov ax, -32768
neg ax            ; this "runs" but is a logical error, because -32768 is largest negative value
                  ; so its negation cannot be represented with 16 bits.
                  ; in other words, +32768 CANNOT be represented with DWORD type

comment / end week 11 examples 

/
	invoke ExitProcess,0
main endp
end main
