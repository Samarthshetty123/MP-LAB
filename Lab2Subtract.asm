.MODEL SMALL
.DATA
A DB 40
B DB 20
RES DB ?

.CODE
MOV AX,@DATA
MOV DS,AX
MOV AL,A
MOV BL,B
SUB AL,BL
MOV RES,AL

MOV AH,4CH
INT 21H
END
