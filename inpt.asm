public inputt,print_name,player_one_win,player_two_win,player_one,actual_s,player_two,actual_s2
extrn send_recieves_playernames:far, initialise :far,o3od_recieve:far,what_player_i_am:byte
.model small
.data

actual_s dw 0
player_one db 16 dup("$")

actual_s2 dw 0
player_two db 16 dup("$") 
msg1 db "enter player one name"
size1 dw $-msg1
msg2 db "enter player two name"
size2 dw $-msg2
msg3 db "enter your name 3adel"
size3 dw $-msg3
cntnue db "press any key to continue..."
cnt dw $-cntnue

won db "  won"
.code
;-------------------------
;-------------------------
;-------------------------
inputt proc far
   mov ax,@data
   mov ds,ax
   mov es,ax
   mov ax,0
   mov [actual_s],ax
   mov [actual_s2],ax
;---------------
mov ah,0
mov al,13h
int 10h
push bp
;;1

;------------------------------------------------ babda2ha b2ny ba clear el screen
lalaaa:  mov ax,0600h
mov cx,0
mov dx,184fh
mov bx,0
int 10h
;--------------------------------------------------- dy message bt2olo yda5l esmo
 mov bp ,offset msg1
mov ah,13h
mov dl,10
mov dh,10
mov cx,size1
mov bl,5
mov bh,0
mov al,0
int 10h
;-------------------------------------------------------ba set el cursor taht el message
hoho: mov ah,2
      mov dh,15
      mov dl,10
      int 10h
;----------------------------------------------- habda2 hna a5od el input charecter charecter
        mov ax,0
        mov [actual_s],ax
        mov cx,15
        lea si,player_one
      ;  lea di,player_two
        inpp:
        mov ah,0
        int 16h
        cmp ah,28       ;; law das enter ynot ya5od el esm eltany
        je dff
        push ax
         ;call o3od_recieve
        pop ax
        mov ah,0eh      ;; ely ba5do bazhro 3latool 3shan ybanlo hwa da5al eh
        mov bh,0
      mov bl,4           
      int 10h
          
         ;call recieve_alN
        mov [si],al
        
        inc si
        inc word ptr [actual_s]
        loop inpp          ;; hy jump mn loop lw das enter aw da5al 15 bzbt


;----------------------------------------------- bt check hna lw el input sa7
dff: mov al,[player_one]
cmp al,41h
jb haha
cmp al,5ah
ja haha
jmp uy
haha: cmp al,61h
jb yaaah
cmp al,7ah
ja  yaaah
;-------------------------------------------------
uy:

;call send_recieves_playernames          ;send_name_elplayereltany
;call recieve_playername
                                                                                                                                                                comment!
                                                                                                                                                                uy:
                                                                                                                                                                lala: mov ax,0600h
                                                                                                                                                                mov cx,0
                                                                                                                                                                mov dx,184fh
                                                                                                                                                                mov bx,0
                                                                                                                                                                int 10h
                                                                                                                                                                mov bp ,offset msg2
                                                                                                                                                                mov ah,13h
                                                                                                                                                                mov cx,size2
                                                                                                                                                                mov dl,10
                                                                                                                                                                mov dh,10
                                                                                                                                                                mov bl,5
                                                                                                                                                                mov bh,0
                                                                                                                                                                mov al,0
                                                                                                                                                                int 10h
                                                                                                                                                                !
;-------------------------------------------------
                                                                                                                                                                comment !
                                                                                                                                                        hihi: mov ah,2
                                                                                                                                                        mov dh,15
                                                                                                                                                        mov dl,10
                                                                                                                                                        int 10h
                                                                                                                                                        ;-------------------
                                                                                                                                                        mov ax,0
                                                                                                                                                        mov [actual_s2],ax
                                                                                                                                                        lea si,player_two
                                                                                                                                                        mov cx,15
                                                                                                                                                        inppp:
                                                                                                                                                        mov ah,0
                                                                                                                                                        int 16h
                                                                                                                                                        cmp ah,28
                                                                                                                                                        je dffff
                                                                                                                                                        mov ah,0eh
                                                                                                                                                        mov bh,0
                                                                                                                                                        mov bl,4
                                                                                                                                                        int 10h
                                                                                                                                                        mov [si],al
                                                                                                                                                        inc si
                                                                                                                                                        inc word ptr [actual_s2]
                                                                                                                                                        loop inppp
                                                                                                                                                        ; jmp dffff
                                                                                                                                                        ;-------------------

                                                                                                                                                        dffff: mov al,[player_two]
                                                                                                                                                        cmp al,41h
                                                                                                                                                        jb hahaa
                                                                                                                                                        cmp al,5ah
                                                                                                                                                        ja hahaa
                                                                                                                                                        jmp ty
                                                                                                                                                        hahaa: cmp al,61h
                                                                                                                                                        jb yahhh_
                                                                                                                                                        cmp al,7ah
                                                                                                                                                        ja yahhh_
                                                                                                                                                        jmp ty
                                                                                                                                                        ;------------------------------------
                                                                                                                                                        !
jmp ty
;-------------------------------------------------------------
;comment !
yaaah: mov ax,0600h
mov cx,0
mov dx,184fh
mov bx,0
int 10h
mov bp ,offset msg3
mov ah,13h
mov cx,size3
mov dl,10
mov dh,10
mov bl,4
mov bh,0
mov al,0
int 10h
jmp hoho
                                                                                                                                                comment !
                                                                                                                                                yahhh_: mov ax,0600h
                                                                                                                                                mov cx,0
                                                                                                                                                mov dx,184fh
                                                                                                                                                mov bx,0
                                                                                                                                                int 10h
                                                                                                                                                mov bp ,offset msg3
                                                                                                                                                mov ah,13h
                                                                                                                                                mov cx,size3
                                                                                                                                                mov dl,10
                                                                                                                                                mov dh,10
                                                                                                                                                mov bl,4
                                                                                                                                                mov bh,0
                                                                                                                                                mov al,0
                                                                                                                                                int 10h
                                                                                                                                                jmp hihi
                                                                                                                                                !
ty: pop bp 
ret
inputt endp
;-----------------------------
;-----------------------------
;-----------------------------
print_name proc far
        push bp
        push es
        mov ax,@data
        mov es,ax

        mov ah,2
        cmp what_player_i_am,0
        jne ymeen 
        ;-------------------------bshoof hwa anhy la3eeb w 3la asaso bshoof mkano
        mov dh,21
        mov dl,0
        int 10h
        jmp sd
        ;------------------------
       ymeen: mov dl,30
        mov dh,21
        int 10h
        sd: mov ah,13h
       
        mov al,0
        mov bl,12
        mov bh,0
        mov cx,actual_s
        mov bp,offset player_one
        int 10h
        ;-------------------------------------------------------------------------
        
        mov ah,2
         cmp what_player_i_am,0
         je rt
        mov dh,21
        mov dl,0
        int 10h
        jmp kl
        ;------------------------
        rt:  mov dh,21
        mov dl,30
        int 10h
       kl: mov ah,13h

        mov al,0
        mov bl,1
        mov bh,0
        mov cx,actual_s2
        mov bp,offset player_two
        int 10h
        pop es
        pop bp
        ret
print_name endp
player_one_win proc  

         push bp
        push es
        mov ax,@data
        mov es,ax
       mov ah,13h
         mov dh,17
         mov dl,10
        mov al,0
        mov bl,11
        mov bh,0
      
       ; dec cx
       ;---------------------- bshoof hna brdo hwa anhy player 3shan atba3 esmo lw ksb
       cmp what_player_i_am,0
       jne  ta5ta5a
        mov bp,offset player_one
          mov cx,actual_s
        int 10h 
        jmp jh
        ta5ta5a: mov bp,offset player_two
          mov cx,actual_s2
        int 10h
        ;------------------------
        jh: mov ah,2
        
        mov dl,10
        add dx,actual_s
        mov dh,17
        int 10h
        mov ah,13h

        mov al,0
        mov bl,11
        mov bh,0
        mov cx,5
        mov bp,offset won
        int 10h
        mov ah,13h
        mov al,0
        mov bl,6
        mov bh,0
        mov bp ,offset cntnue
        mov cx,cnt
        mov dh,20
        mov dl,10
        int 10h
        mov ah,0
        int 16h
        mov ah,4ch
        int 21h
        pop es
        pop bp

ret 


player_one_win endp
player_two_win proc far

         push bp
        push es
        mov ax,@data
        mov es,ax
       mov ah,13h
         mov dh,17
         mov dl,10
        mov al,0
        mov bl,11
        mov bh,0
      
        ;dec cx
      ;---------------------- bshoof hna brdo hwa anhy player 3shan atba3 esmo lw ksb
       cmp what_player_i_am,1
       jne  ta5ta5aa
        mov bp,offset player_one
          mov cx,actual_s
        int 10h 
        jmp jhh
        ta5ta5aa: mov bp,offset player_two
          mov cx,actual_s2
        int 10h
        ;------------------------
     jhh:   mov ah,2
        
        mov dl,10
        add dx,actual_s2
        mov dh,17
        int 10h
        mov ah,13h

        mov al,0
        mov bl,11
        mov bh,0
        mov cx,5
        mov bp,offset won
        int 10h
        mov ah,13h
        mov al,0
        mov bl,6
        mov bh,0
        mov bp ,offset cntnue
        mov cx,cnt
        mov dh,20
        mov dl,10
        int 10h
        mov ah,0
        int 16h
        mov ah,4ch
        int 21h
        pop es
        pop bp

ret 


player_two_win endp
end 