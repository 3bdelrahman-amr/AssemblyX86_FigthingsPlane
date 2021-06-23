public random_gen20to170,mo_bar,set_xy,drw_brs
public barrxy,bar_count, make_pups,random_gen0to4,rnd4,random_gento4
.model small
.data
rnd170 dw 0
barrxy dw   65,20,80,30,120,50,200,14                       ;16         ;dup(?)
bar_count dw 4
holdera dw 0,0
p db 0
velx  dw -6,-7,-7,-7
vely  dw 5,-5,5,-5
timep db 0
rnd4 db ?
.code
;;-------------------
;;------------------
comment !
main proc
        mov ax,@data
        mov ds,ax
        mov ax,0a000h
        mov es,ax
        ;-------------------------set graphics
        mov ah,0
        mov al,13h
        int 10h
        ;---------------------clear screen
        mov ax,0600h
        mov bx,000h
        mov cx,0
        mov dx,184fh
        int 10h
        ;---------------------------
       call set_xy
        ;-----------------------------
     bgg:  mov ax,0600h
        mov bx,000h
        mov cx,0
        mov dx,184fh
        int 10h
        drw_brs proc   
     mov cx,4
        lea si,barrxy
        hj:
        push cx
        call draw_barrier
        pop cx
        add si,4

        loop hj
        drw_brs endp

call mo_bar far
        mov ah,2ch
      agg:  int 21h
        cmp dl,p
        je agg
        mov p,dl
              jmp bgg
          mov ah,0
          int 16h
         mov ah,4ch 
         int 21h

main endp
!
;---------------------
;--------------------
;---------------------

set_xy proc far
        lea si,barrxy
        mov cx,4
        kk:
        ;----------- set x
        push cx
        mov ah,2ch
      ag:  int 21h
        cmp dl,p
        je ag
        mov p,dl
        call far ptr random_gen20to170
        mov ax,[rnd170]
        mov [si],ax
        add si,2
       
         mov ah,2ch
      cgg:  int 21h
        cmp dl,p
        je cgg
        mov p,dl
        ;--------------------------set y
        call far ptr random_gen20to170
        mov ax,[rnd170]
        mov [si],ax
        add si,2
       
        pop cx
        loop kk      ;----------------loop 4 times
        ret
set_xy endp
;;-------------------------------
;;-------------------------------
;;-------------------------------
random_gen20to170 proc   far    ;;ax bx dx
            mov ah,2ch
            int 21h
            mov al,dl
            mov ah,0
            mov bl,170
            div bl
            cmp ah,60
            jbe yoyoo 
            ;add ah,10
            mov byte ptr[rnd170],ah
            mov ah,0
            mov byte ptr[rnd170+1],ah
            ret
            yoyoo: add ah,60
            mov byte ptr [rnd170],ah
            mov ah,0
            mov byte ptr[rnd170+1],ah
            ret


random_gen20to170 endp

;;---------------------------
;;------------------------------
;;------------------------------
draw_barrier proc     far     ;(btrsm eltayara ely 3la shemal)
         
         cmp bar_count,0
         je nooo
  
        
          
        
        mov cx,20           
        mov ax,ds:[si]
        mov [holdera],ax
        mov ax,ds:[si+2]
        mov [holdera+2],ax
       
        loop1a:
        push cx
        mov cx,20
        
        mov ax,ds:[holdera]
        push ax
        loop2a:
        push cx
        mov ax,ds:[holdera+2] 
        mov cx,320
        mul cx
        add ax,ds:[holdera]
        xchg di,ax
       
        call far ptr random_gen0to4   ;; el alwan random kolha
         mov ah,0
        mov al,rnd4
        mov es:[di],al
        inc word ptr ds:[holdera]
        
        pop cx
        loop loop2a
         pop ax
         mov ds:[holdera],ax
       
        inc word ptr ds:[holdera+2]
        
        pop cx
        loop loop1a
    nooo:    ret
    draw_barrier endp
    ;;-----------------
    ;;-----------------
    ;;-------------
    mo_bar proc far
                mov cx,4
                lea di,velx
                lea si,barrxy
                lea bx,vely
                kkk:
            mov ax,[si]
            cmp ax,59
            jb hh
            cmp ax,240
            ja hh
            ;-----------
            add ax,[bx]
            mov [si],ax
            ;---------------
            jmp ll
            hh: neg  word ptr [bx]
                add ax,[bx]
                mov [si],ax
                
                ;----------------
                ll:  add si,2
                
                mov ax,[si]
            cmp ax,20
            jb hhh
            ;add ax,20
            cmp ax,139
            ja hhh
            ;mov ax,[si]
            ;-----------------
                ;-----------
            add ax,[di]
            mov [si],ax
            ;---------------
            jmp lll
            hhh: neg word ptr [di]
             ;    mov ax,[si]
                add ax,[di]
                mov [si],ax
                lll: add bx,2
                    add si,2
                    add di,2
                ;----------------
                loop kkk
                ret
    loop kkk
    mo_bar endp
    ;;------------------
    ;;------------------
    ;;--------------------
     drw_brs proc   far
     mov cx,[bar_count]
        lea si,barrxy
        hj:
        push cx
        call far ptr draw_barrier
        pop cx
        add si,4

        loop hj
        ret
        drw_brs endp

        make_pups proc far
         cmp [bar_count],4
                jae v
                mov ah,2ch
                agn: int 21h
                cmp dl,timep
                je agn
                inc byte ptr [timep]
                cmp timep,20
                jb v
                 mov ah,0
                mov timep,ah
                
               
               
                lea si,barrxy
                mov ax,[bar_count]
                shl ax,1
                shl ax,1 
                add si,ax
                call random_gen20to170
                mov ax,[rnd170]
                mov [si],ax
                mov [si+2],ax
                inc word ptr [bar_count]
                ;mov ah,0 
                ;int 16h

       v: ret
        make_pups endp
        random_gen0to4 proc far
        push ax
        push bx
            mov ah,2ch
            int 21h
            mov al,dl
            mov ah,0
            mov bl,16
            div bl
            mov [rnd4],ah
            pop bx
            pop ax
            
            ret
random_gen0to4 endp
random_gento4 proc far
        push ax
        push bx
            mov ah,2ch
            int 21h
            mov al,dl
            mov ah,0
            mov bl,3
            div bl
            mov [rnd4],ah
            pop bx
            pop ax
            
            ret
random_gento4 endp
end
