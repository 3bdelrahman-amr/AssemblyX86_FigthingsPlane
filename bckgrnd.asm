
public draw_bkgnd,game_over,draw_status
.model small
.data

 
 file_name db 'moon.txt'
 ;; fy shy2 8areeb byhsl lma bhot esmeen elfile taht b3d bydrab
;; haga fy montha el habl el sara7a        
handle dw ?
g_over db 'g_over.txt'
color db 2 dup(0)
newl db 2 dup("$")
ms3  db 2 dup("$")
cc db 0
cc2 db 0
 back_xy dw 140,80
 back1_xy dw 0,0
 holder dw 0
 handle2 dw ?
 co db ?
 status dw 0,160
 .code
 

 draw_bkgnd proc far
         lea si,back_xy 
        call open_file ;;;new
        mov cx,30
        mov dx,ds:[si+2] ;;y
        mov ds:[holder],dx    ;;y
       ; mov bx,ds:[si]
        loop1:
        push cx
        mov cx,30
        mov bx,ds:[si]
        loop2:
        push cx
        push dx
        push bx
        call new_l
        call read
        inc word ptr ds:[cc]
        mov co,al
        pop bx
        pop dx
        mov ax,ds:[holder]
        mov cx,320
        mul cx
        add ax,ds:[si];;add x
        xchg di,ax
        mov ah,0
        mov al,co
        mov es:[di],al
       inc word ptr ds:[si]
    ;   mov ah,0
     ;   int 16h
        pop cx
        loop loop2
        
        mov ds:[si],bx
        inc word ptr ds:[holder]
        pop cx
        loop loop1
        xor ah,ah
        mov cc,ah
           call close_file
           mov bx,0
           mov handle,bx
        ret
draw_bkgnd endp
 open_file proc 
        mov ah,3dh
        mov al,0  ;;; open for read
        mov dx,offset file_name ;;;directory path
        int 21h
        mov handle,ax
        ret
open_file endp
 close_file proc 
        mov ah,3eh    
        mov bx,handle
        int 21h
        ret

close_file endp
read proc 
        mov ah,3fh
        mov cx,1       ;;; number of bytes i will read
        mov bx,handle 
        mov dx,offset color  ;;; offset of my buffer
        int 21h
        mov dl,ds:[color]
        cmp dl,36h   ;;102           ;; hna lw kan f ly hwa abyad (122 dy el ascii code bt3 small f)
        je bc
        mov al,0             ;;   lw la2 hahoot zero
        ret
        bc: mov al,0bh
        ret 
read endp
new_l proc 
        mov ah,cc
        cmp ah,20
        jne ll
        xor ah,ah  ;; hasafar el count tany
        mov cc,ah  ;; cc=0
        mov ah,3fh
        mov cx,2       ;;; number of bytes i will read
        mov bx,handle 
        mov dx,offset newl  ;;; offset of my buffer
        int 21h
        ll: ret
new_l endp
;;-----------------------------------------------------------------------------------------------------------

game_over proc far
         lea si,back1_xy 
        call open_file2 ;;;new
        mov cx,200
        mov dx,ds:[si+2]
        mov ds:[holder],dx
        loop1t:
        push cx
        mov cx,320
        mov bx,ds:[si]
        loop2t:
        push cx
        push dx
        push bx
        call new_l2
        call read2
        inc word ptr ds:[cc2]
        mov co,al
        pop bx
        pop dx
        mov ax,ds:[holder]
        mov cx,320
        mul cx
        add ax,ds:[si];;add x
        xchg di,ax
        mov ah,0
        mov al,co
        mov es:[di],al
       inc word ptr ds:[si]
        pop cx
        loop loop2t
        mov ds:[si],bx
        inc word ptr ds:[holder]
        pop cx
        loop loop1t
        xor ah,ah
        mov cc2,ah
        call close_file2
        mov bx,0
        mov handle2,bx
        ret
game_over endp
 open_file2 proc 
        mov ah,3dh
        mov al,0           ;;; open for read
        mov dx,offset g_over ;;;directory path
        int 21h
        mov handle2,ax
        ret
open_file2 endp
close_file2 proc 
        mov ah,3eh    
        mov bx,handle2
        int 21h
        ret

close_file2 endp
read2 proc 
        mov ah,3fh
        mov cx,1       ;;; number of bytes i will read
        mov bx,handle2 
        mov dx,offset color  ;;; offset of my buffer
        int 21h
        mov dl,ds:[color]
        cmp dl,36h   ;;102           ;; hna lw kan f ly hwa abyad (122 dy el ascii code bt3 small f)
        je bcr
        mov al,0             ;;   lw la2 hahoot zero
        ret
        bcr: mov al,0bh
        ret 
read2 endp
new_l2 proc 
        mov ah,cc2
        cmp ah,20
        jne llr
        xor ah,ah  ;; hasafar el count tany
        mov cc2,ah  ;; cc=0
        mov ah,3fh
        mov cx,2       ;;; number of bytes i will read
        mov bx,handle2 
        mov dx,offset newl  ;;; offset of my buffer
        int 21h
        llr: ret
new_l2 endp
draw_status proc    far     
        lea si,status
        mov bx,[si]
        mov cx,320
        mov dx,[si+2]
        mov ah,0ch
        mov al,5
        lrt:  push cx
        mov cx,bx
        int 10h
        inc bx
        pop cx
        loop lrt


        ret

draw_status endp

 
end