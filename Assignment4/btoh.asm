;Program to convert BCD to Hexadecimal

assume cs:code, ds:data

data segment
	bcd db 47h
	hex db 00h
data ends

code segment 
	org 0000h
start:
	mov ax, data
	mov ds, ax
	
	mov al, bcd
	mov bl, bcd
	mov cl, 04h

	shr al, cl
	shl bl, cl
	shr bl, cl
	
	mov ah, 00h
	mov dl, 0Ah
	mul dl

	add al, bl
	mov hex, al

	mov ah, 4ch
	int 21h
	code ends
end start