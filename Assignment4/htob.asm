;Program to convert hexadecimal to bcd

assume cs:code, ds:data
data segment 
	hex db 0fbh
	bcd1 db 00h
	bcd2 db 00h
data ends

code segment 
	org 0100h
start:
	mov ax, data
	mov ds, ax
	mov al, hex
	mov ah, 00h
	mov bl, 64h
	div bl
	mov bcd1, al
	mov al, ah
	mov ah, 00
	mov bl, 0Ah
	div bl
	mov cl, 04h
	shl al, cl
	add al, ah
	mov bcd2, al
	mov ah, 4ch
	int 21h
code ends
end start