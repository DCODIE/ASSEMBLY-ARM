;SYSTEM TIME DISPLAY
.model small
.code
mov ah,2ch
int 21h
mov al,ch
call disp
mov dl,':'
mov ah,02h
int 21h
mov al,cl
call disp
mov dl,':'
mov ah,02
int 21h
mov al,dh
call disp
mov ah,4ch
int 21h
disp proc near
aam
add ax,3030
mov bx,ax
mov dl,ah
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
ret
disp endp
end
