assume cs: code, ds: dataseg
dataseg segment
	a dw 1500H
	b dw 3000H
	product dw 0000H
	overflow dw 0000H
dataseg ends
code segment
	org 0000h
start:
	mov ax, dataseg
	mov ds, ax
	mov dx, 0000h
	mov ax, a
	mov bx, b
	mul bx
	mov product, ax
	mov ax, dx
	mov overflow, ax
	mov ah, 4ch
	int 21h
code ends
end start