;PROGRAM TO CHECK SUBSTRING
.model small
.data
str db 'one plus two equals three'
l1 dw $-str
su db 'plus'
l2 dw $-su
msg1 db "present",0ah,0dh,24h
msg2 db "not",0ah,0dh,24h
.code
mov ax,@data
mov ds,ax
mov es,ax
mov cx,l1
mov bx,l2
mov di,str
mov si,su
cld
rpt:
mov al,[si]
repne scasb
inc si
mov cx,dx
dec bx
sub cx,bx
jb ms2
mov cx,bx
repz cmpsb
jnz nft
lea dx,msg1	
mov ah,09h
int 21h
jmp exit
ms2:lea dx,msg2
mov ah,09h
int 21h
exit:mov ah,4ch
int 21h
nft: mov cx,dx
lea si,su
mov bx,l2
jmp rpt
end
