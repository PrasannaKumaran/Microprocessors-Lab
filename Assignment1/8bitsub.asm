assume cs: code, ds: dataseg
dataseg segment
	a db 11h
	b db 43h
	difference db 00h
	carry db 00h
dataseg ends
code segment
	org 0000h
start:
	mov ax, dataseg
	mov ds, ax
	mov ah, a
	mov bh, b
	mov ch, 00h
	sub ah, bh
	jnc here
	neg ah
	inc ch
here:
	mov difference, ah	
	mov carry, ch
	mov ah, 4ch
	int 21h
code ends
end start