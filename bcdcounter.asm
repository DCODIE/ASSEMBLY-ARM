;BCD up-down Counter using the logical Controller Interface
assume cs:code,ds:data
data segment
	pa equ 24A0h
	pb equ 24A1h
	pc equ 24A2h
	cr equ 24A3h
data ends
code segment
start:
	mov ax,data
	mov ds,ax

	mov dx,cr
	mov al,80h
	out dx,al

	mov cx,100d

	mov dx,pa
	mov al,00h
next:
	out dx,al
	call delay
	add al,01
	daa             ; a decimal counter
	loop next

	mov ah,4ch
	int 21h

delay proc
       mov si,03fffh
    l2: mov di,0ffffh
    l1: dec di
	jnz l1
	dec si
	jnz l2
	ret             ; imp
delay endp
code ends
end start
