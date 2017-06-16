;using the logical Controller Interface
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
	mov al,82h
	out dx,al

	mov al,01
rpt:
	mov dx,pa
	out dx,al
	call delay
	ror al,1

	push ax         ; int 21h changes [al]
	mov ah,06h
	mov dl,0ffh
	int 21h
	pop ax
	jz rpt          ; function 06 try to sense, if a key is   
                                 ;pressed, if yes, ZF = 0 

	mov ah,4ch
	int 21h

delay proc
	mov si,02fffh
    l2: mov di,0ffffh
    l1: dec di
	jnz l1
	dec si
	jnz l2
	ret
delay endp

code ends
end start
