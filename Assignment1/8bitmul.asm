assume cs: code, ds: dataseg
dataseg segment
	a db 15h
	b db 23h
	product dw 00h
	overflow db 00h
dataseg ends
code segment
	org 0000h
start:
	mov ax, dataseg
	mov ds, ax
	mov al, a
	mov bl, b
	mov ch, 00h
	mul bl
	jnc here
	inc ch
here:
	mov product, ax	
	mov overflow, ch
	mov ah, 4ch
	int 21h
code ends
end start