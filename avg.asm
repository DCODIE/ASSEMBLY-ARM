;AVERAGE OF NUMBERS
.model small
.data
  n db 006h,04h,0ah,0ch
  res db ?
.code
mov ax,@data
mov ds,ax
mov al,00h
mov si,00h
step: add al,n[si]
inc si
cmp si,04h
jne step
mov bl,04h
mov ah,00h
div bl
mov res,al
mov ah,4ch
int 21h
end

