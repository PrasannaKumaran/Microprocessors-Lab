
;Comparing two strings

assume cs:code,ds:data,es:data
data segment 
	orig_string DB 'encrypted';
	str_length equ ($ - encrypted);
	input_word db 'Encryption;;     
data ends

code segment
	org 0200h;
start:  mov ax, data;
        mov ds, ax;
	mov es, ax;
	mov dx, 0fffeh;
	mov al, 99h;
	out dx, al;
	lea si, encrypted
	lea di, input_word;
	mov cx, str_length;
	cld;
	REPE cmpsb;
	jne sound_alarm;
	jmp ok;
sound_alarm: 
	mov al, 01;
	mov dx, offfah;	
	out dx, al;
	hlt;
ok: 	NOP;
        mov ah, 4ch;
        int 21h;
	code ends
end start
