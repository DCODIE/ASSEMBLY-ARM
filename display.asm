;FIRE AND HELP DISPLAY 
.model small
.data
fire db 086h,0afh,0cfh,8eh ;hex values of F,I,R,E in 7 segment
help db 08ch,0c7h,86h,89h
pa equ 24a0h
pb equ 24a1h
pc equ 24a2h
cr equ 24a3h
.code
mov ax,@data
mov ds,ax
mov dx,cr
mov al,80h
out dx,al
bak:lea si,fire
call display
call delay
lea si,help
call display
call delay
mov ah,06h
mov dl,0ffh
int 21h
jz bak
mov ah,4ch
int 21h
display:mov cx,04
bak2:mov bl,08
mov al,[si]
next:rol al,01
mov dx,pb
out dx,al
push ax
mov dx,pc
mov al,0ffh
out dx,al
mov al,00h
out dx,al
pop ax
dec bl
jnz next 
inc si
loop bak2
ret
delay proc
mov si,0ffffh
l1:mov di,0ffffh
l2:dec di
jnz l2
dec si
jnz l1
ret
delay endp
end
