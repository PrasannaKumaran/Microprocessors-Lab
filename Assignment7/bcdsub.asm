assume cs:code ,ds:data
data segment
    inp1 db 21h
    inp2 db 97h
    carry db 00h
    sum db 00h
data ends
code segment
	org 0100h
start:	
	mov ax,data
	mov ds,ax
    mov al,inp1
    mov bl,inp2
    mov cl,00h
    sub al,bl
    das
    jnc skip	
	mov dl,99h
    inc cl
	sub dl,al
	inc dl
	mov al,dl
	das	
skip:
	mov sum,al
	mov carry,cl
    mov ah,4ch
	int 21h
code ends
end start