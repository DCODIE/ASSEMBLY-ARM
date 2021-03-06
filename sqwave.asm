;INTERFACE A DAC TO GENERATE A SQUARE WAVE FORM

.MODEL SMALL
.STACK  100
.DATA
.CODE
DELAY PROC NEAR
	MOV BX,0FFFH
L1:     MOV SI,02FFFH
L2:     DEC SI
	JNZ L2
	DEC DX
	JNZ L1
	RET
	DELAY ENDP
START:  MOV AX,@DATA
	MOV DS,AX
	MOV AL,80H
MOV DX,24a3H
OUT DX,AL
SQUARE:MOV AL,00H
	MOV DX,24a0H
	OUT DX,AL
	CALL DELAY
	MOV AL,0FFH
	MOV DX,24a0H
	OUT DX,AL
	CALL DELAY
	JMP SQUARE
INT 03H
END START
