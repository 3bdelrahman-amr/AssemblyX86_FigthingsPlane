

public print_chat,my_writting,wsize, recieving, rsize 
.model small
.data
my_writting db 35 dup("$")

 wsize dw 0

  recieving db 35 dup("$")

  rsize dw 0

.code

print_chat proc far
 
 ;comment !

    lea di,recieving
   
   lea si,my_writting
 
     
    
 
      bye_bye: cmp wsize,0
        je bn 
        ;-------------------------- 
         mov ah,2
        mov dh,23
        mov dl,0
        int 10h
        ;------------------------------
        mov cx,wsize
        cmp cx,20
        je rr
        lea si,my_writting
        ttt:
        mov ah,0eh
        mov al,[si]
        mov bl,5
        mov bh,0
        int 10h
        inc si
       
        loop ttt
        jmp op
        rr: xor cx,cx
          mov wsize,cx
    ; -----------------------------    
    op:  
     bn: cmp rsize,0
      je outt   
     ;-----------------------
        mov ah,2
        mov dh,23
        mov dl,15
        int 10h
    ;-------------------------
        mov cx,rsize
         cmp cx,20
         je gd
        lea si,recieving
        tt:
        mov ah,0eh
        mov al,[si]
        mov bl,3
        mov bh,0
       
        
        int 10h
        inc si
       loop tt
       jmp ks
    gd: xor cx,cx
          mov rsize,cx
        ;-------------------------------
     ks:
  outt: ret
print_chat endp



end