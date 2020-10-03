
;Moving a string of bytes

assume cs:code,ds:data,es:data
data segment 
	mystring db 'This is assignment 3';
	db 30 DUP(?);
	final_loc db 30 DUP(0);     
data ends
code segment
org 000h;
start:  mov ax, data;
        mov ds, ax;
	mov es, ax;
	lea si, mystring;
	lea di, final_loc;
	mov cx, 20;
	cld;
	REP movsb;	
        mov ah, 4ch;
        int 21h;
	code ends
end start
