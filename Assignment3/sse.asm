assume cs:code, ds:data

data segment
	count dw 0008h
	status dw 0000h
	str1 db 'password'
	str2 db 'o'
data ends

code segment
	org 0000h
start:
	mov ax, data
	mov ds, ax
	mov es, ax
	mov dx, count
	mov cx, count
	mov al, [str2]
	mov di, offset str1
	cld
	repne scasb
	je s1
	mov status, 0000h
	jmp s2
s1:	
	sub dx, cx
	mov status, dx
s2:
	mov ah, 4ch
	int 21h
code ends
end start