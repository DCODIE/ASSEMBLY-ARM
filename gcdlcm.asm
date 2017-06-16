;GCD AND LCM assume cs:code,ds:data
data segment
         x db 05d
         y db 25d
         gcd db ?
         data ends
code segment
   start: MOV ax,data
          MOV ds,ax
          MOV al,x
          MOV bl,y
     rpt:cmp al,bl
        je gcd_found
        jg larger
        sub bl,al
        jmp rpt
     larger:sub al,bl
            jmp rpt
    gcd_found: mov gcd,al
               mov ah,4ch
               int 21h
               code ends
               end start
