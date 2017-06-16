
;Read your name from the keyboard and display it at a specified location on the screen in front of the message What is your name ?  You must clear the entire screen before display.

.model small
.data
msg db 'what is your name:'
NEM db 50 dup(0)
.code
mov ax,@data
mov ds,ax
mov si,0
mov ah,1
bac:int 21h
mov NEM[si],al
inc si
cmp al,13d
jne bac
mov byte ptr NEM[si],'$'
call clr
call setc
lea dx,msg
mov ah,9
int 21h
mov ah,4ch
int 21h
clr:mov ah,6
mov al,0
mov bh,4
mov ch,0
mov cl,0
mov dh,24
mov dl,79
int 10h
ret
setc:mov ah,2
mov bh,0
mov dh,12
mov dl,20
int 10h
ret
end
