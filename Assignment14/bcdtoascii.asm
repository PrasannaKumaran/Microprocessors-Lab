MOV A, r1
anl a,#0fh
add a,#30h
mov r3 ,a
mov a,r1
swap a
anl a,#0fh
add a,#30h
mov r2,a
HERE: SJMP HERE
