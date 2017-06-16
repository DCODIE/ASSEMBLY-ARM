;ADDITION OF TWO 16-BIT NUMBERS
.MODEL SMALL
.DATA
N1 DW 0009H
N2 DW 0002H
RES DW 4 DUP (0)
.CODE
START:    	MOV AX,@DATA
          		MOV DS,AX
   MOV AX,N1
          		MOV BX,N2
          		MOV DX,0000H
          		ADD AX,BX
          		JNC LAB1
          		INC DX
LAB1: 	MOV RES,AX
          		MOV RES+2,DX
                        MOV AH,04CH
          		INT 21H
          		END START
