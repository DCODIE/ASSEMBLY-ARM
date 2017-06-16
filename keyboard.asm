;KEY BOARD DISPLY ROW,COULMN AND KEY PRESSD
.model small
.data
ms db "the row no. is"
row db ?
db "...the col no. is..."
col db ?,"$"
msg db 'key code is:$'
table db 'ABCDEFGHIJKLM'
keycode db ?
range db ?
temp db ?
pa equ 24a0h
pb equ 24a1h
pc equ 24a2h
cr equ 24a3h
.code
mov ax,@data
mov ds,ax
mov dx,cr
mov al,90h
out dx,al
again:mov dx,pc
mov al,01h
out dx,al
mov bl,31h
mov range,00h
mov dx,pa
in al,dx
cmp al,00
jne kp
mov dx,pc
mov al,02h
out dx,al
mov bl,32h
mov range,08h
mov dx,pa
in al,dx
cmp al,00
jne kp
mov dx,pc
mov al,04h
out dx,al
mov bl,33h
mov range,10h
mov dx,pa
in al,dx
cmp al,00
jne kp
jmp again
kp:mov temp,al
mov row,bl
mov bh,31h
l1:ror al,1
jc cf
inc bh
jmp l1
cf:
mov col,bh
lea dx,ms
mov ah,09
int 21h
lea dx,msg
mov ah,09
int 21h
l2:ror temp,1
jc cf2
inc range
jmp l2
cf2:mov al,range
lea bx,table
xlat
mov keycode,al
sub keycode,41h
mov ah,00h
mov al,keycode
aam
mov bx,ax
add bx,3030h
mov dl,bh
mov ah,2
int 21h
mov dl,bl
mov ah,2
int 21h
mov ah,4ch
int 21h
end
