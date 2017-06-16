;Read two strings, store them in locations  STR1  and  STR2 . Check whether they are equal or not and display appropriated messages. Also display the length of the stored strings.

disp macro msg
	lea dx,msg
	mov ah,09h
	int 21h
endm
assume cs:code,ds:data
data segment
	str1 db 100 dup(?)
	str2 db 100 dup(?)
            msg1 db "Enter 1st string : $"
	msg2 db 0ah,0dh,"The length of 1st string is : "
	len1 db ?,"$"
           msg3 db 0ah,0dh,"Enter 2nd string : $"
	msg4 db 0ah,0dh,"The length of 2nd string is : "
	len2 db ?,"$"
           msg5 db 0ah,0dh,"The 2 stings are equal$"
	msg6 db 0ah,0dh,"The 2 stings are not equal$"
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov es,ax
         disp msg1
	lea si,str1
	mov cl,00h      ; to hold length
 next_char:
	mov ah,01h
	int 21h
	cmp al,0dh      ; am I done with entering string?
	je next_string  ; yes, go to read next string
	mov [si],al     ; no, store the character at [si] and read next character
	inc si
	inc cl
	jmp next_char
 next_string:
	add cl,30h      ; to display length, ASCII value is needed
	mov len1,cl     ; so, I can read strings of max. length 9 only, is it OK?
          disp msg3
	lea si,str2
	mov cl,00h
next_char1:
	mov ah,01h
	int 21h
	cmp al,0dh
	je  disp_length
	mov [si],al
	inc si
	inc cl
	jmp next_char1
disp_length:
	add cl,30h
	mov len2,cl
	disp msg2
	disp msg4

	cmp len1,cl
	jne not_equal
	lea si,str1
	lea di,str2
	cld
	sub cl,30h
	rep cmpsb
	jnz not_equal
	disp msg5
	jmp exit
not_equal:
	disp msg6
exit:   mov ah,4ch
	int 21h
code ends
end start
