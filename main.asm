public mainnn
extrn main:far,inputt:far,wait_to_enter:far,send_recieves_playernames:far,o3od_recieve:far,initialise:far,send_name:far,recieve_name:far,what_player_i_am:byte
extrn main2:far,send_al:far,receive:far,rec:byte
.model small
.data
curs_x db ?
curs_y db ?
start db "start game ya sadiqy ";,10,13,10,13
strt dw $-start
chat    db "start chat ";,10,13,10,13
cht dw $-chat
level1 db "level 1"
levl1  dw $-level1
level2  db "level 2"
levl2   dw $-level2
escape   db "escape"
ec dw $-escape
gr db 0ah
yl db 0eh
counter db 0
counter2 db 0
.code


;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
;*  mainnn proc 
;*  this procedure call inputt proc(that takes the names from the user ) then it print the choices that the user gonna choose from them  
;*  either it gonna start the game or start chat or exit the game 
;*  @param : takes no parameters 
;*  
;*    
;***************************************************************************

mainnn proc far
   call inputt
  
    mov ax,@data
    mov ds,ax
    mov es,ax
    mov ah,0
    mov al,13h
    int 10h
    mov ax,0600h
    mov cx,0
    mov dx,184fh
    mov bh,0
    int 10h
    ;----------------------------------
    maiin:
   mov ax,0600h
    mov cx,0
    mov dx,184fh
    mov bh,0
    int 10h
    
     ;--------------------
     mov al,[counter]
    cmp al,3
    jbe loo
        mov al,0
        mov [counter],al
    loo: call mov_curs
    mov ah,0
    int 16h
    cmp ah,80
    je bo
    cmp ah,72
    je boo
    cmp ah,28
    je sz
    jmp maiin
    bo:    mov ah,[counter]
           cmp ah,2
           je hgg 
           inc ds:[counter]
    hgg: jmp maiin
    boo:   mov ah,ds:[counter]
           cmp ah,0
           je hg
           dec ds:[counter]
    hg:    jmp maiin
    sz:  mov ah,[counter]
           cmp ah,0
            je km
           cmp ah,2
           jne gtr
           
            mov ax,0600h
            mov cx,0
            mov dx,184fh
            mov bh,0
            int 10h
           mov ah,4ch
           int 21h

           km:
           jmp tooot
 ;;-------------------------------law das enter w hwa wa2f 3la enter elgame hygy hna w ybda2 elgame bs lazm a5lih yb3at esmo elawl lel nahya eltanya
 ;;-------------------------------------------------------------------------------------------------------------------------------------------------
 ;;-------------------------------------------------------------------------------------------------------------------------------------------------               


gtr: jmp maiin 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
   
 bn:  
    mov al,[counter2]
    mov [counter],al

    lvl: mov ax,0600h
    mov cx,0
    mov dx,184fh
    mov bh,0
    int 10h    
    
   
mov al,[counter]
    cmp al,3
    jbe loo2
        mov al,0
        mov [counter],al
    loo2: call mov_curs2
         mov ah,0
        int 16h
       cmp ah,80
       je bo2
       cmp ah,72
       je boo2
       cmp ah,28
       je sz2
       jmp lvl
       bo2:    mov ah,[counter]
           
       
           cmp ah,2
           je hgg2 
           inc ds:[counter]
    hgg2: jmp lvl
    boo2:   mov ah,ds:[counter]
           cmp ah,0
           je hg2
           dec ds:[counter]
    hg2:    jmp lvl
        sz2:  mov ah,[counter]
           cmp ah,0
           je levell1                                         ;;tooot2             
           cmp ah,1
           je  levell2                                          ;;tooot
           











 mov ax,0600h
            mov cx,0
            mov dx,184fh
            mov bh,0
            int 10h
           mov ah,4ch
           int 21h     

levell1: mov al,99h

       call send_al
       call main2 
levell2: mov al,88h
        call send_al
        call main



tooot:  call initialise   
    
        call wait_to_enter
        ;--------------------------
      
       ; mov ah,0
        ;int 16h
        ;---------------
        comment !
        mov ah,2
        mov dh,24
        mov dl,1
        int 10h
        mov ah,09h
        mov al,what_player_i_am
        add al,'0'
        mov cx,1
        mov bh,0
        mov bl,13
        int 10h
        !
        ; mov ah,0
        ;int 16h
        cmp what_player_i_am,1
        je playertwo
                                                                             ;call send_recieves_playernames 
                                                                             ;call o3od_recieve
        call send_name
        call recieve_name
        jmp bn 
        ;333333333333333
        playertwo: call recieve_name
        call send_name
       k3eed: call receive
        cmp rec,99h
        je lvl1
        cmp rec,88h
        je lvl2
        jmp k3eed
;444444444444444444444444444
lvl1: call main2
       lvl2: call main
tooot2:

        call initialise   
    
        call wait_to_enter
        ;--------------------------
      
       ; mov ah,0
        ;int 16h
        ;---------------
        comment !
        mov ah,2
        mov dh,24
        mov dl,1
        int 10h
        mov ah,09h
        mov al,what_player_i_am
        add al,'0'
        mov cx,1
        mov bh,0
        mov bl,13
        int 10h
        !
        ; mov ah,0
        ;int 16h
        cmp what_player_i_am,1
        je playertwo
                                                                             ;call send_recieves_playernames 
                                                                             ;call o3od_recieve
        call send_name
        call recieve_name
        
        playertwo2: call recieve_name
        call send_name
       mn2: call main2



gtr2:    jmp lvl  
         
mainnn endp
start_main proc
       mov ah,13h
       mov al,0
       mov bh,0
       int 10h
    
   ret
start_main endp


;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
;*  mov_curs 
;*  this procedure changes the cursor position to be able to choose fromthe menu that is shown  
;*  @param : takes no parameters 
;*  
;*    
;***************************************************************************

mov_curs proc
          push bp 
          mov ah,[counter]
          cmp ah,0
          jne bv
          mov bl,0ah
         jmp kjkg
        bv: mov bl,05h
       kjkg: mov dl,10
         mov dh,10
         mov bp,offset start
         mov cx,strt
         
         
                     call start_main
         mov ah,[counter]
         cmp ah,1
         jne bvvv
         mov bl,0ah
         jmp kjk
         
        bvvv: mov bl,05h
       kjk: 
        mov dl,10
        mov dh,12
        mov bp,offset chat
        mov cx,cht
        call start_main
        ;---------------------------------- 
        mov ah,[counter]
         cmp ah,2
         jne bvv
         mov bl,0ah
         jmp kjkv
         
        bvv: mov bl,05h
       kjkv: 
               mov dl,10
               mov dh,14
               mov bp,offset escape
               mov cx,ec
               call start_main
        pop bp
        ret
mov_curs endp
mov_curs2 proc
          push bp 
          mov ah,[counter]
          cmp ah,0
          jne bv2
          mov bl,0ah
         jmp kjkg2
        bv2: mov bl,05h
       kjkg2: mov dl,10
         mov dh,10
         mov bp,offset level1
         mov cx,levl1
         
         
                     call start_main
         mov ah,[counter]
         cmp ah,1
         jne bvvv2
         mov bl,0ah
         jmp kjk2
         
        bvvv2: mov bl,05h
       kjk2: 
        mov dl,10
        mov dh,12
        mov bp,offset level2
        mov cx,levl2
        call start_main
        ;---------------------------------- 
        mov ah,[counter]
         cmp ah,2
         jne bvv2
         mov bl,0ah
         jmp kjkv2
         
        bvv2: mov bl,05h
       kjkv2: 
               mov dl,10
               mov dh,14
               mov bp,offset escape
               mov cx,ec
               call start_main
        pop bp
        ret
mov_curs2 endp

end mainnn