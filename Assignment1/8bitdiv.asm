assume cs: code, ds: dataseg
dataseg segment
	a dw 1000h
	b db 25h
	quotient db 00h
	remainder db 00h
dataseg ends
code segment
	org 0000h
start:
	mov ax, dataseg
	mov ds, ax
	mov ax, a
	mov bl, b
	mov ah, 00h
	div bl	
	mov quotient, al
	mov remainder, ah
	
	mov ah, 4ch
	int 21h
code ends
end start