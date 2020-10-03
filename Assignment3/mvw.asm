assume cs:code,ds:data

data segment
	string db 99h,88h,77h,66h,55h;
	loc db ?;
data ends

code segment
	org 0000h;
start: 
	mov ax,data;
	mov ds,ax;
	mov es,ax;
	mov si,offset string;
	mov di,offset loc;
	mov cx,05h;
	cld;
	looping:lodsb
	mov ah,[di];
	mov [si-1],ah;
	stosb
	loop looping
	mov ah,4ch;
	int 21h;
code ends
end start