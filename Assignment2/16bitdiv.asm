assume cs: code, ds: dataseg
dataseg segment
	a dw 2500h
	b dw 1020h
	quotient dw 0000h
	remainder dw 0000h
dataseg ends
code segment
	org 0000h
start:
	mov ax, dataseg
	mov ds, ax
	mov dx, 0000h
	mov ax, a
	mov bx, b
	div bx	
	mov quotient, ax
	mov remainder, dx
	
	mov ah, 4ch
	int 21h
code ends
end start