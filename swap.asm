;SWAP THE NUMBER
.model small 
.data
.code
mov bx,@data
mov ds,bx
mov bx,30h
mov cx,20h
xchg bx,cx
end
