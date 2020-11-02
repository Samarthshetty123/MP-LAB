.MODEL SMALL
DISPLAY MACRO MSG
LEA DX,MSG
MOV AH,09H
INT 21H
ENDM
.DATA
MSG1 DB 0DH,0AH,"ENTER STRING : $"
MSG2 DB 0DH,0AH,"REVERSEE STRING : $"
MSG3 DB 0DH,0AH,"INPUT STRING IS POLINDROME $"
MSG4 DB 0DH,0AH,"INPUT STRING IS NOT POLINDROME STRING $"
STRING DB 80H DUP(?)
RSTRING DB 80H DUP(?)
.CODE
START: MOV AX,@DATA
       MOV DS,AX
       DISPLAY MSG1
       MOV SI,OFFSET STRING
       XOR CL,CL
AGAIN:MOV AH,01H
      INT 21H
      CMP AL,0DH
      JE NEXT
      MOV [SI],AL
      INC SI
      INC CL
      JMP AGAIN
NEXT:MOV [SI],BYTE PTR '$'
      DEC SI
      MOV CH,CL
      MOV DI,OFFSET RSTRING
BACK:MOV AL,[SI]
     MOV [DI],AL
     DEC SI
     INC DI
     DEC CH
     JNE BACK
     MOV [DI],BYTE PTR '$'
     DISPLAY MSG2
     DISPLAY RSTRING
     MOV SI,OFFSET STRING
AG:MOV AL,[SI]
    CMP AL,[DI]
    JNE FAIL
    INC SI
    INC DI
    DEC CX
    JZ SUCCESS
    JMP AG
FAIL:DISPLAY MSG4
     JMP FINAL
SUCCESS:DISPLAY MSG3
FINAL: MOV AH,4CH
       INT 21H
END

