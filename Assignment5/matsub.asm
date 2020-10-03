assume cs:code,ds:data
data segment
	row1 db 02h
	row2 db 02h
	col1 db 04h
	col2 db 04h
	org 0010h
	matrix1 db 77h,66h,55h,44h,33h,22h,11h,00h
	org 0020h
	matrix2 db 00h,11h,22h,33h,44h,55h,66h,77h
	org 0030h
	result db 8 DUP(0)
data ends
code segment
	org 0100h
start:  mov ax,data
	mov ds,ax
	mov cl,row1
	mov dl,row2
	cmp cl,dl
	jne last
	mov cl,col1
	mov dl,col2
	cmp cl,dl
	jne last
	mov al,row2
	mul cl	
	mov cx,ax
	mov si, offset matrix1
	mov di, offset matrix2
	mov bx, offset result
here:	mov al, [si]
	sub al, [di]
	mov [bx], al
	inc si
	inc di
	inc bl
	loop here
last:	mov ah,4ch
	int 21h
code ends
end start