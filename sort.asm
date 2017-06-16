;TO ARRANGE N 16 BIT NOS IN ASCENDING ORDER.
.MODEL SMALL
.DATA
ARRAY DW 7777H,0567H,9999H,0000H
.CODE
START:    MOV AX,@DATA
          MOV DS,AX
          MOV DX,0004H
L3:       MOV CX,DX
          LEA SI,ARRAY
L2:       MOV AX,[SI]
          INC SI
          INC SI
          CMP AX,[SI]
          JC L1
          XCHG AX,[SI]
          MOV [SI-2],AX
L1:       LOOP L2
          DEC DX
          JNZ L3
         MOV AH,04CH
          INT 21H
          END START
