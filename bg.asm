public set_,draw_stars
 ;;; module el background ly btetharak
.model small
.data
stars dw 160 dup(0)
ys  dw 1
prev db 0
.code

set_ proc
        mov cx,80
        mov ax,0
        lea si,stars
        loo1:
        mov word ptr[si],ax
        add ax,4
        add si,2
        loop loo1

ret
set_ endp
draw_stars proc  far
         ;; array of stars
        mov dx,3      ;; y point
        mov bx,4
      ;  mov cx,100
        ;-----------------barsm bullet wahda hna
        lyu:   mov ah,0ch
        mov al,03h
        lea si,stars  
        mov cx,80
        l32: push cx
             mov cx,[si]
             int 10h
             add si,2
             pop cx
             loop l32
            cmp dx,190
        jge ex
        ;mov ah,0
        ;int 16h
        inc bx
        call inc_
        add dx,10
       ; lea si,stars
       jmp lyu
        ;---------------------------------------

        ex: ret
draw_stars endp
inc_  proc    ;;; bt increment el stars
        lea si,stars
        mov cx,80
        lbv:
        mov ax,[si]
       ; cmp ax,325
        ;jae uy
        add ax,bx
        jmp lj
        uy: mov ax,0
        lj:
        mov [si],ax
        add si,2
        loop lbv
        mov ax,0
        mov [ys],ax
        ret
inc_  endp
clear proc
        mov ax,0600h
        mov bh,0
        mov cx,0
        mov dx ,184fh
        int 10h
        ret
clear endp
end 