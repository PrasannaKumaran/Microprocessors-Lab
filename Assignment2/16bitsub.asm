assume cs: code, ds: dataseg
dataseg segment
	a dw 1511h
	b dw 4235h
	difference dw 0000H
	carry db 00H
dataseg ends
code segment
	org 0000h
start:
	mov ax, dataseg
	mov ds, ax

	mov ax, a
	mov bx, b
	mov ch, 00h
	sub ax, bx
	jnc here
	neg ax
	inc ch
here:
	mov difference, ax	
	mov carry, ch
	mov ah, 4ch
	int 21h
code ends
end start