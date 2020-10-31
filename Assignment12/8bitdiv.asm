MOV R0, #00
MOV A, r1 ;input1
mov B, r2 ;input2
div ab
MOV r4, a
mov r3,b
HERE: SJMP HERE
