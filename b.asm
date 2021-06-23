
extrn left_plane_xy:word ,rht_plane_xy:word,hlth_size:word,hlth_size2:word,xy_barrier:word,xy_barrier2:word
public draw_b,mov_b,get_bulPos,mov_b2,draw_b,,get_bulPos2,draw_b2,draw_arr,mov_barr,draw_arr2,mov_barr2
public clear_arr,clear_arr2,kill_plane_rht,kill_plane_lft,yes_barrier,destroy_bar,yes_barrier2,destroy_bar2
extrn barrxy:word,bar_count:word,power_health:far,set_health:far,set_health2:far,power_health2:far
extrn random_gen0to4:far,rnd4:byte,random_gento4:far
public clear_shld,clear_shld1,destroy_bar2l1,destroy_barl1  
.model huge
.stack 100
.data
pointarr dw 800 dup(0)
pointarr2 dw 800 dup(0)
count dw 0
count2 dw 0
;start dw 100
 b_h dw 8
b_w dw 4
 b_x dw 0
b_y dw 0
b_x2 dw 0
b_y2 dw 0
stk  dw 0
prev db 0
ho dw 0
yes_barrier db 1  ;;1 to draw 0 to not
yes_barrier2 db 1
to_popx dw ?
to_popy dw ?
to_bulx dw ?
to_buly dw ?
ipp dw ?
rem db 0
bool_shld db 0
shld_t db 0
bool_shld1 db 0
shld_t1 db 0

;cp dw 0
.code

 draw_b proc  far
        mov ah,0ch
        mov al,0ah
        ;mov dx,count
        ;mov ho,dx
        mov dx,b_y
        mov cx,b_w
        mov bx,b_x
        ;-------------------bt-check el boundries
      ;  cmp bx,300
       ; jg ex  
        ; cmp bx,3
        ;jb ex
        ;------------------------------------------
        ; l456:  ;ay esm 3shan msh la2y asamy ahbdha

        
        ;-----------------barsm bullet wahda hna
        l32: push cx
        mov cx,bx
        int 10h
        inc bx
        pop cx
        loop l32
        cmp dx,b_h
        jge ex
        inc dx
        mov bx,b_x
        jmp l32
        ;---------------------------------------

        ex: ret


draw_b endp

mov_b proc far                             ;;; dy bt move bullet el left plane
            mov bx,b_x
           ; cmp bx,310
            ;ja u
             ;mov bx,b_x
            ;cmp bx,5
            ;jb u
             add bx,15
             u:   ret
mov_b endp

 get_bulPos proc  far                       ;; dy bt-get position elbullet bt3 left plane
              ;----------------------------bfady el buffer hna
                ; mov ah,0
                ; int 16h
                 ;-----------------bzawed el point fl array of point bs bmla mn el a5r
                lea si,pointarr
                add si,count
                mov dx, [left_plane_xy]
                 
                add dx,25
                mov[si],dx ;x
                mov dx, [left_plane_xy+2]
                ;xchg dl,dh
                add dx,20
                 mov[si+2],dx ;y
                 mov dx,count
                 add dx,4
                 mov count,dx  ; # in byte
               ; mov b_y,dx


ret
get_bulPos endp
;---------------------------------------------------------------
;---------------------------------------------------------------
mov_b2 proc far
            mov bx,b_x2
           ; cmp bx,300
            ;jg uu
            ; mov bx,b_x2
            ;cmp bx,10
            ;jb uu
                sub bx,15 ;;;
               
             uu:   ret
mov_b2 endp
draw_b2 proc  far
      ;  mov dx,[count2]
       ;; cmp dx,0
        ;je exx
        mov ah,0ch
        mov al,0ah
        mov dx,b_y2
        mov cx,b_w
        mov bx,b_x2
        ;-------------------bt-check el boundries
        ; cmp bx,310
        ;jg exx  
        ;cmp bx,12
        ;jb exx
        ;------------------------------------------
        ; l456:  ;ay esm 3shan msh la2y asamy ahbdha
        ;-----------------barsm bullet wahda hna
        l322: push cx
        mov cx,bx
        int 10h
        dec bx
        pop cx
        loop l322
        cmp dx,b_h
        jge exx
        inc dx
        mov bx,b_x2
       
        jmp l322
        ;---------------------------------------

        exx: ret


draw_b2 endp
get_bulPos2 proc  far
 ;mov ah,0
  ;      int 16h
                lea si,pointarr2
                add si,count2
                mov dx, [rht_plane_xy]
                sub dx,25
                mov[si],dx
                ;mov b_x2,dx
                mov dx, [rht_plane_xy+2]
                add dx,20
                 mov[si+2],dx
                 mov dx,count2
                 add dx,4
                 mov count2,dx
                ;mov b_y2,dx


ret
get_bulPos2 endp
mov_barr proc far                       ;; dy bt-move el bullets ely 3la screen
     mov bx,count
     
     cmp bx,0
     je yu
     mov cl,2
     shr bx,cl
     mov cx,bx  ; 3adadhom in doubleword delwa2ty
     lea si,pointarr
     l73:
     mov bx,[si] ;x
     mov b_x,bx
     call mov_b
     mov [si],bx
     add si,4 ;y
     loop l73
    yu: ret
mov_barr endp
draw_arr proc far

  mov bx,ds:[count]
  cmp bx,0
  je plk
     mov cl,2
     shr bx,cl
     xchg bx,cx
     lea si,pointarr
    
  l72:
     mov bx,[si] ;x
     mov b_x,bx
     mov bx,[si+2]
     mov b_y,bx
     add si,4 ;y
     push si
     push cx
     call draw_b
    ; mov ah,0
     ;int 16h
     pop cx
     pop si
     ;dec cx
     loop l72
    plk: ret
draw_arr endp
;--------------------------------------------------
mov_barr2 proc far
     mov bx,count2
     
     cmp bx,0
     je yu2
     mov cl,2
     shr bx,cl
     mov cx,bx  ; 3adadhom in doubleword delwa2ty
     lea si,pointarr2
     ;add si,start
     ;sub si,count
     l732:
     mov bx,[si] ;x
     mov b_x2,bx
     call mov_b2
     mov [si],bx
     ;mov bx,[si]
     add si,4 ;y
     ;mov b_y,bx
     ;push si
     
     ;pop si
     ;sub cx,1
     loop l732
    yu2: ret
mov_barr2 endp
draw_arr2 proc far

  mov bx,ds:[count2]
  cmp bx,0
  je plk2
     mov cl,2
     shr bx,cl
     mov cx,bx
     lea si,pointarr2
     ;add si,[count2]
  l722:
     mov bx,[si] ;x
     mov b_x2,bx
     mov bx,[si+2]
     mov b_y2,bx
     add si,4 ;y
     push si
     push cx
     call draw_b2
    ; mov ah,0
     ;int 16h
     pop cx
     pop si
     ;dec cx
     loop l722
    plk2: ret
draw_arr2 endp


 clear_arr proc far
      mov dx,ds:[count]  ;; 3dadhom in byte
      cmp dx,0
      je sxc
      mov cl,2
      shr dx,cl
      xchg dx,cx
      lea si,pointarr
      add si,[count] ;;a7aaaaaaaaaaaaaaaaaaaaaaa 3lya xd
      sub si,4
      l1q: 
      mov dx,[si+2]              ;; loop dy bt push kol el array
      push dx  ;; push y
      mov dx,[si]  
      push dx   ;; push x
      sub  si,4          ;; b3ady xy
      loop l1q
      ;-------------------------------------------------------------
       lea si,pointarr
       mov dx,ds:[count]  ;; 3dtha tany 
       mov cl,2
       shr dx,cl
       xchg dx,cx
       l2q:
       pop dx
       cmp dx,291        ;;; moshklaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
       ja lpp
       ;cmp dx,30
       ;jb lpp
       mov [si],dx
          pop dx
        add si,2
        mov[si],dx
        add si,2 
       ;; add si,4
       jmp lkk
       lpp:
        pop dx          ;; hna haslha mn el array
         mov bx,ds:[count]
         sub bx,4
       mov [count],bx
       ;-------                    ;; return to the array again
      
      

       lkk:
      loop l2q
      sxc: ret
clear_arr endp
clear_arr2 proc far
      mov dx,[count2]  ;; 3dadhom in byte
      cmp dx,0
      je rtr
      mov cl,2
      shr dx,cl
      xchg dx,cx
      lea si,pointarr2
      add si,[count2]
      sub si,4

      ;----------------------------------------------------------el loop dy btmla 
      l11q:               ;; loop dy bt push kol el array
      mov dx,[si+2]              ;; loop dy bt push kol el array
      push dx  ;; push y
      mov dx,[si]  
      push dx   ;; push x
      sub  si,4 
      loop l11q  
      ;--------------------------------------
       lea si,pointarr2
       mov dx,[count2]  ;; 3dtha tany 
       mov cl,2
       shr dx,cl
       xchg dx,cx
       l2qq:
       pop dx
       cmp dx,10
       jl lppp 
              ;;;;;;;;;;;;;;;;;;;;;;;;;
       ;mov[si],dx
        mov[si],dx
        pop dx
        add si,2
        mov[si],dx
        add si,2 
       
       jmp lkkk
       lppp:
       pop dx
       mov bx,ds:[count2]
       sub bx,4
       mov [count2],bx
       ;cmp bx,0
       ;je rtr
       ;------------
       
       lkkk: 
      loop l2qq
    rtr:  ret
clear_arr2 endp
 kill_plane_rht proc far
       mov dx,ds:[count]
       cmp dx,0
       je cv
      lea si,rht_plane_xy         ;;right corner of right plane
      lea di,pointarr             ;; pointer to the begining of the bullet array
      mov ax,ds:[di]
      mov bx ,ds:[si]
     ; cmp ax,bx                  ;; if bul_x > right_corner_x
      ;ja cv                       ;; return
      sub bx,50                  ;; plane_x=plane_x-55  --> =260
      cmp ax,290   ;bx                   ;; if(bull_x< plane_x_left_corner)                             ;;;8ayrtha
      jb cv                       ;; return  
      mov bx,ds:[si+2]   ;;;         here as above but for  the Y range
      mov ax,ds:[di+2]    ;;;       
      add bx,5
      cmp ax,bx
      jb cv
      add bx,30
      cmp ax,bx
      ja cv
      cmp [bool_shld],1
      je cv
     mov ax,ds:[hlth_size2]
      sub ax,24
      mov ds:[hlth_size2],ax
      ;mov ah,0
      ;int 16h
      cv: ret
kill_plane_rht endp
 kill_plane_lft proc far
      lea si,left_plane_xy
      lea di,pointarr2
xc:     mov ax,ds:[di]  ;;pointer to bull arr
      mov bx,ds:[si]  ;; pointer to left coner of left plane
   mov dx,ds:[count2]
       cmp dx,0
       je cvv
       ;----debug bs
       ; cmp dx,8
       ;jbe cvv
       ;-------
       cmp ax,25      ;; bull_x if(plane_x>45) continue
      ja cvv            
     ; add bx,50      ;; bul_x+=55->=60
      cmp ax,15      ;; if(plane_x< 15)continue;
      jb cvv
      mov bx,ds:[si+2]   ;;;y_plane
      mov ax,ds:[di+2]   ;;; y_bullet
      add bx,5           ;;;  y_plane+=5
      cmp ax,bx          ;;; if(y_plane< y_bullet)continue
      jb cvv             
      ;add bx,5           
      add bx,30           
      cmp ax,bx
      ja cvv
      
      mov ax,ds:[hlth_size]
      sub ax,24
      mov ds:[hlth_size],ax
      cmp ax,0
      je cvv
      add di,4
      ;add si,4
      ;mov ax,ds:[di]
      ;mov bx,ds:[si]

      jmp xc      ;;9:44
      cvv: ret
kill_plane_lft endp
;;-----------------------------
;;---------------------------
;;------------------------------
destroy_bar  proc far
       
      kamel:                   ;,xy_barrier 
             lea di,pointarr2    ;; bullets el tayara ely 3la ymeen
    ;-----------------------------------------------
     
      mov dx,[count2]
      cmp dx,0
      jne re  ; xoxo
      ret
      re:
      ;------------------------------- comparison m3a el bullet 3la x axis bt3 el right plane
      ;--------------------------------------------
      ;-----------------------------------------------
      mov cx,[count2]
      ass: push cx
       lea si,barrxy 
      mov cx,[bar_count]
      cmp cx,0
      jne zxx
      pop cx
      ret
      zxx:
      bull_barr:
      push cx
      ;cmp [count2],0
      ;je xoxo
      mov ax,[si]  ; x el barrier
      mov dx,[di]  ; x bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_x hatrodo brdo
      jb t3ala_hna

      add ax,20    ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hna
      ;------------------------------
       ;------------------------------- nfs elklam brdo bs 3la y
      mov ax,[si+2]  ; y el barrier
      mov dx,[di+2]  ; y bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_y hatrodo brdo
      jb t3ala_hna

      add ax,20   ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hna
      ;------------------------------wsal hna yb2a etdrab fa hmaweto b2a w amsaho
     
       mov ax,[di]
       mov to_bulx,ax
        mov ax,[di+2]
       mov to_buly,ax
       push di
       call far ptr pop_bull2
       pop di
      
      ;------------------------------------------------looop lel array el tany matnsash
      mov ax,[si]
      mov [to_popx],ax
       mov ax,[si+2]
      mov [to_popy],ax
      push si
      call far ptr pop_bar
     pop si
     ;call power_health2
     ;call set_health
     call far ptr select_powerup 
        cmp [count2],0
        jne t3ala_hna
        pop cx
        pop cx
        ;mov bh,0
         ;           mov rem,bh
        ret
      ;mov ah,4ch
      ;int 21h
      t3ala_hna: cmp rem,1
                je wc               ; pop di
                add si,4 
                jmp th
                wc: mov bh,0
                    mov rem,bh
                  th:  pop cx  
       ; cmp [bar_count],0
        ;   je xoxo
      
       loop bull_barr 
       add di,4
       pop cx
       
       loop ass
        
       ;---------------------------------------------------------------------
      xoxo:
     mov bh,0
                    mov rem,bh
      etl3_bra: ret
destroy_bar endp
;-----------------------------
;-----------------------------
;------------------------------
;-----------------------------------------------
destroy_bar2  proc far   ;; dy ley red plane
       kamel2:                    ;,xy_barrier 
             lea di,pointarr    ;; bullets el tayara ely 3la ymeen
    ;-----------------------------------------------
     
      mov dx,[count]
      cmp dx,0
      jne jh    ; xoxo2
      ret
      jh:
      ;------------------------------- comparison m3a el bullet 3la x axis bt3 el right plane
      ;--------------------------------------------
      ;-----------------------------------------------

           mov cx,[count]
          asss: push cx 
         lea si,barrxy 
         mov cx,[bar_count]
          cmp cx,0
      jne zxxx
      pop cx
      ret
      zxxx:

      bull_barr2:
      push cx
      ;cmp [count2],0
      ;je xoxo
      mov ax,[si]  ; x el barrier
      mov dx,[di]  ; x bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_x hatrodo brdo
      jb t3ala_hna2

      add ax,20    ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hna2
      ;------------------------------
       ;------------------------------- nfs elklam brdo bs 3la y
      mov ax,[si+2]  ; y el barrier
      mov dx,[di+2]  ; y bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_y hatrodo brdo
      jb t3ala_hna2

      add ax,20   ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hna2
      ;------------------------------wsal hna yb2a etdrab fa hmaweto b2a w amsaho
       mov ax,[di]
       mov to_bulx,ax
        mov ax,[di+2]
       mov to_buly,ax
       push di
       call far ptr pop_bull1
       pop di
      
      ;------------------------------------------------looop lel array el tany matnsash
      mov ax,[si]
      mov [to_popx],ax
       mov ax,[si+2]
      mov [to_popy],ax
      push si
      call far ptr pop_bar
         pop si
     ;call set_health2
     ;call power_health  
     call far ptr select_powerup1
        cmp [count],0
        jne t3ala_hna2
        pop cx
        pop cx
      ;  mov bh,0
       ;    mov rem,bh
        ret
      
      t3ala_hna2: cmp rem,1
                je wc2               
                add si,4 
                jmp th2
                wc2: mov bh,0
                mov rem,bh
                th2:  pop cx  
       
      
        loop bull_barr2
         add di,4
         pop cx
         
         loop asss  
         ;mov ah,4ch
         ;int 21h      
       ;---------------------------------------------------------------------
       ;-------------------------------------------------------------------------
      xoxo2:
     mov bh,0
                    mov rem,bh
      etl3_bra2: ret
destroy_bar2 endp
;------------------------------
;-------------------------------
;------------------------------
  pop_bar proc far
  lea si,barrxy
   mov ax,[bar_count]
   ;---------
cmp ax,0
je kokoko
   ;----
      mov cl,2
      shl ax,cl
      ;mul cl
      mov cx,ax  ;; cx hna in byte wl ax kman
      
      add si,cx
      sub si,4
      mov cx,[bar_count]
      hey_mona: mov dx,[si+2]
                push dx
                mov dx,[si]
                push dx
                sub si,4
                loop hey_mona
               
     
      mov dx,ax  ;; dx w ax in byte
  
      mov cx,[bar_count]  ; dx
      lea si,barrxy   ;pointarr
    
      mona_zaki:   
                      pop dx 
                      cmp  dx,word ptr[to_popx]
                       jne zz
                        pop ax
                       ;mov ax,[si+2]
                       cmp ax,word ptr[to_popy]
                       jne du
                       mov bh,1
                       mov rem,bh
                       jmp zaki
                       zz: pop ax
                   
                                  du:  mov [si],dx
                                  
                                   mov [si+2],ax
                                   add si,4
                        zaki: 
                        loop mona_zaki
                    
                      dec word ptr [bar_count]

kokoko: 
;!;pop si
;push word ptr[ipp]
      ret
 ;mov ah,4ch
     ;  int 21h 
pop_bar endp

;;---------------------------
;;--------------------------
;;--------------------------
 pop_bull2 proc far
 
mov dx,[count2]
cmp dx,0
jne vb
ret
vb:
      mov cl,2
      shr dx,cl
      lea di,pointarr2
      add di,[count2]
      sub di,4
      mov cx,dx
      afashtaka21: mov dx,[di+2]
                push dx
                mov dx,[di]
                push dx
                sub di,4
                loop afashtaka21
               
     ; pop dx      ;; pop x ely msh 3awzha
     ; pop dx      ;; pop y ely msh 3wzha
      
    
      ;cmp dx,0
      ;jne hereaa2
      ;ret
      ;;jmp xoxo
      mov dx,[count2]
      hereaa21: mov cl,2
      shr dx,cl
      mov cx,dx
      ;push di
      lea di,pointarr2
      ;------------------
      ;------------------
      erg3o_kolkoa21: 
                      pop dx 
                      cmp  dx,word ptr[to_bulx]
                       jne zzz1
                        pop ax
                       ;mov ax,[si+2]
                       cmp ax,word ptr[to_buly]
                       jne duu1
                       ;mov bh,1
                       ;mov rem,bh
                       jmp zakii1
                       zzz1: pop ax
                   
                                  duu1:  mov [di],dx
                                  
                                   mov [di+2],ax
                                   add di,4
                  zakii1:
                  loop erg3o_kolkoa21
                  mov dx,[count2]
                   sub dx,4
                  mov [count2],dx
;mov ah,4ch
;int 21h

  ret

 pop_bull2 endp
 ;;-------------------
 ;;---------------------
 ;;--------------------
 pop_bull1 proc far
 
mov dx,[count]
cmp dx,0

jne sa
      ret
      sa:
      mov cl,2
      shr dx,cl
      lea di,pointarr
      add di,[count]
      sub di,4
      mov cx,dx
      afashtaka2: mov dx,[di+2]
                push dx
                mov dx,[di]
                push dx
                sub di,4
                loop afashtaka2
               
     ; pop dx      ;; pop x ely msh 3awzha
     ; pop dx      ;; pop y ely msh 3wzha
      
    
      ;cmp dx,0
      ;jne hereaa2
      ;ret
      ;;jmp xoxo
      mov dx,[count]
      hereaa2: mov cl,2
      shr dx,cl
      mov cx,dx
      ;push di
      lea di,pointarr
      ;------------------
      ;------------------
      erg3o_kolkoa2: 
                      pop dx 
                      cmp  dx,word ptr[to_bulx]
                       jne zzz
                        pop ax
                       ;mov ax,[si+2]
                       cmp ax,word ptr[to_buly]
                       jne duu
                       ;mov bh,1
                       ;mov rem,bh
                       jmp zakii
                       zzz: pop ax
                   
                                  duu:  mov [di],dx
                                  
                                   mov [di+2],ax
                                   add di,4
                  zakii:
                  loop erg3o_kolkoa2
                  mov dx,[count]
                   sub dx,4
                  mov [count],dx
;mov ah,4ch
;int 21h

  ret
 pop_bull1 endp
 ;;----------------------------
 ;;-----------------------------
 ;;------------------------------
 set_shield proc far
    mov ah,1
    mov bool_shld,ah
    ret
 set_shield endp
 ;----------------------------
 ;----------------------------
 ;----------------------------
 ;-----------------------------
 clear_shld proc far
          cmp [bool_shld],0
          je rb
          mov ah,2ch
          trr: int 21h
          cmp dl,shld_t
          je trr
          inc byte ptr [shld_t]
          cmp [shld_t],20
          jb rb 
          mov ah,0
          mov [bool_shld],ah

      rb:  ret
 clear_shld endp
 ;;-------------------------
 ;;-------------------------
 ;;-------------------------
 select_powerup proc     far         ;;; for player 2
         call random_gento4
        ;  mov ah,4ch
         ;int 21h
         mov ah,[rnd4]
        
         cmp ah,0
         je sh
         cmp ah,1
         je hlthh
         cmp ah,2
         je super_bul

         ret
         ;----------------------
         sh: call far ptr set_shield
         ret
         hlthh: call far ptr power_health2
          ret
          super_bul: call far ptr set_health
          ret


        ;ret
 select_powerup endp
 ;;---------------------------------
 ;;-----------------------------------
 ;;----------------------------------
 select_powerup1 proc     far         ;;; for player 1
         call random_gento4
        ;  mov ah,4ch
         ;int 21h
         mov ah,[rnd4]
        
         cmp ah,0
         je sh1
         cmp ah,1
         je hlthh1
         cmp ah,2
         je super_bul1

         ret
         ;----------------------
         sh1: call far ptr set_shield1
         ret
         hlthh1: call far ptr power_health2
          ret
          super_bul1: call far ptr set_health2
          ret


        ;ret
 select_powerup1 endp
 set_shield1 proc far
    mov ah,1
    mov bool_shld1,ah
    ret
 set_shield1 endp
 ;----------------------------
 ;----------------------------
 ;----------------------------
 ;-----------------------------
 clear_shld1 proc far
          cmp [bool_shld1],0
          je rb1
          mov ah,2ch
          trr1: int 21h
          cmp dl,shld_t1
          je trr1
          inc byte ptr [shld_t1]
          cmp [shld_t1],20
          jb rb 
          mov ah,0
          mov [bool_shld1],ah

      rb1:  ret
 clear_shld1 endp
 ;;-------------------------
 ;;-------------------------
 ;;-------------------------






destroy_bar2l1  proc far   ;; dy ley red plane
       kamelm2:                    ;,xy_barrier 
             lea di,pointarr    ;; bullets el tayara ely 3la ymeen
    ;-----------------------------------------------
     
      mov dx,[count]
      cmp dx,0
      jne jhg    ; xoxo2
      ret
      jhg:
      ;------------------------------- comparison m3a el bullet 3la x axis bt3 el right plane
      ;--------------------------------------------
      ;-----------------------------------------------

           mov cx,[count]
          asssd: push cx 
         lea si,barrxy 
         mov cx,[bar_count]
          cmp cx,0
      jne zxxxc
      pop cx
      ret
      zxxxc:

      bull_barrt2:
      push cx
      ;cmp [count2],0
      ;je xoxo
      mov ax,[si]  ; x el barrier
      mov dx,[di]  ; x bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_x hatrodo brdo
      jb t3ala_hnab2

      add ax,20    ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hnab2
      ;------------------------------
       ;------------------------------- nfs elklam brdo bs 3la y
      mov ax,[si+2]  ; y el barrier
      mov dx,[di+2]  ; y bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_y hatrodo brdo
      jb t3ala_hnab2

      add ax,20   ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hnab2
      ;------------------------------wsal hna yb2a etdrab fa hmaweto b2a w amsaho
       mov ax,[di]
       mov to_bulx,ax
        mov ax,[di+2]
       mov to_buly,ax
       push di
       call far ptr pop_bull1
       pop di
      
      ;------------------------------------------------looop lel array el tany matnsash
      mov ax,[si]
      mov [to_popx],ax
       mov ax,[si+2]
      mov [to_popy],ax
      push si
      call far ptr pop_bar
         pop si
     ;call set_health2
     ;call power_health  
     ;call far ptr select_powerup1
        cmp [count],0
        jne t3ala_hnab2
        pop cx
        pop cx
      ;  mov bh,0
       ;    mov rem,bh
        ret
      
      t3ala_hnab2: cmp rem,1
                je wcv2               
                add si,4 
                jmp thj2
                wcv2: mov bh,0
                mov rem,bh
                thj2:  pop cx  
       
      
        loop bull_barrt2
         add di,4
         pop cx
         
         loop asssd  
         ;mov ah,4ch
         ;int 21h      
       ;---------------------------------------------------------------------
       ;-------------------------------------------------------------------------
      xoxop2:
     mov bh,0
                    mov rem,bh
      etl3_brab2: ret
destroy_bar2l1 endp











destroy_barl1  proc far
       
      kamelo:                   ;,xy_barrier 
             lea di,pointarr2    ;; bullets el tayara ely 3la ymeen
    ;-----------------------------------------------
     
      mov dx,[count2]
      cmp dx,0
      jne rer  ; xoxo
      ret
      rer:
      ;------------------------------- comparison m3a el bullet 3la x axis bt3 el right plane
      ;--------------------------------------------
      ;-----------------------------------------------
      mov cx,[count2]
      assd: push cx
       lea si,barrxy 
      mov cx,[bar_count]
      cmp cx,0
      jne zxxy
      pop cx
      ret
      zxxy:
      bull_barrt:
      push cx
      ;cmp [count2],0
      ;je xoxo
      mov ax,[si]  ; x el barrier
      mov dx,[di]  ; x bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_x hatrodo brdo
      jb t3ala_hnab

      add ax,20    ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hnab
      ;------------------------------
       ;------------------------------- nfs elklam brdo bs 3la y
      mov ax,[si+2]  ; y el barrier
      mov dx,[di+2]  ; y bul bt3 eltayara ely 3la shemal
      
      cmp dx,ax    ;lw a2al mn bul_y hatrodo brdo
      jb t3ala_hnab

      add ax,20   ;nfs elklam bs lw lsa mgabsh el right corner
      cmp dx,ax
      ja t3ala_hnab
      ;------------------------------wsal hna yb2a etdrab fa hmaweto b2a w amsaho
     
       mov ax,[di]
       mov to_bulx,ax
        mov ax,[di+2]
       mov to_buly,ax
       push di
       call far ptr pop_bull2
       pop di
      
      ;------------------------------------------------looop lel array el tany matnsash
      mov ax,[si]
      mov [to_popx],ax
       mov ax,[si+2]
      mov [to_popy],ax
      push si
      call far ptr pop_bar
     pop si
     ;call power_health2
     ;call set_health
     ;call far ptr select_powerup 
        cmp [count2],0
        jne t3ala_hnab
        pop cx
        pop cx
        ;mov bh,0
         ;           mov rem,bh
        ret
      ;mov ah,4ch
      ;int 21h
      t3ala_hnab: cmp rem,1
                je wce               ; pop di
                add si,4 
                jmp thj
                wce: mov bh,0
                    mov rem,bh
                  thj:  pop cx  
       ; cmp [bar_count],0
        ;   je xoxo
      
       loop bull_barrt 
       add di,4
       pop cx
       
       loop assd
        
       ;---------------------------------------------------------------------
      xoxom:
     mov bh,0
                    mov rem,bh
      etl3_brab: ret
destroy_barl1 endp







end 