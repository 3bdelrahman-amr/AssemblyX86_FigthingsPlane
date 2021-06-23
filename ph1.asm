
;extrn draw_bkgnd:far
extrn draw_pic_rht:far,draw_pic_left:far,clear_buf:far,get_time:far,shift_tri:far,draw_b:far,mov_b:far,draw_b2:far
extrn mov_b2:far,draw_arr:far,mov_barr:far,draw_arr2:far,mov_barr2:far, clear_screen:far ;;,draw_bkgnd:far
extrn clear_arr:far,clear_arr2:far,kill_plane_rht:far,kill_plane_lft:far,draw_health:far,draw_health2:far,is_gameOver:far
;extrn draw_barrier:far,barrier_mov:far,draw_barrier_rht:far,rht_barrier_mov:far,
extrn is_gameOver2:far
extrn set_:far,draw_stars:far,destroy_bar:far,draw_status:far,mainnn:far,print_name:far,destroy_bar2:far;;,yes_barrier:byte,yes_barrier2:byte
extrn initialise:far,recieved_changes:far,print_chat:far 
                                                                     ;;re_chat:far,
                                                                     
extrn  random_gen20to170:far,mo_bar:far,drw_brs:far,make_pups:far,clear_shld:far,clear_shld1:far   ;,set_xy:far
extrn destroy_bar2l1:far , destroy_barl1:far
public main,main2
.model huge
.data
 

;------------------------------
;coord dw 5,40,5,60

;color db  5
;top dw 0 
;bool dw 0
;bool2 dw 0
prev_time db 0
bullet dw 60,90
bullet_size dw 4
yoyo dw ?



.code
main proc far
;call mainnn
    mov ax,@data
    mov ds,ax 
    mov ax,0a000h
    mov es,ax
    mov ah,0
    mov al,13h
    int 10h
  
   ;call set_xy
   call initialise    ;;;enta ro7t feen
    begining:
    call make_pups
     call clear_screen   ;;1
   call clear_shld 
   call clear_shld1
  ;; call draw_bkgnd
        call draw_stars     ;;2
        call draw_status
        call print_name
       ; call re_chat
       call print_chat
      
        
       
       call draw_health   ;;3
    call draw_health2   ;;4
      
    call draw_pic_left   ;;5
    call draw_pic_rht   ;;6
    
    call shift_tri  ;;9
    call recieved_changes
  

    call clear_buf   ;;10
    ;call barrier_mov ;;11
    ;call rht_barrier_mov ;;12
    call mov_barr ;;13 
    call mov_barr2 ;;14
    call drw_brs 
                               ;sam3nyyyyyyy a  na sm3aaaaak
                                  ;;;la2
     call destroy_bar2
      ;mov[yoyo],ax
    call destroy_bar ;;15
       call mo_bar
    
    ;call draw_barrier  ;;7
    ;call draw_barrier_rht  ;;8
    call kill_plane_rht  ;;16
  
    call kill_plane_lft ;;17
    call draw_arr
    call draw_arr2
    call is_gameOver
     call is_gameOver2
     
    
    call clear_arr
    call clear_arr2
    
    
    
    again: 
     call get_time
            cmp dl,prev_time
    je again
    mov prev_time,dl
   
jmp begining


    mov ah,4ch
    int 21h
main endp




main2 proc far
;call mainnn
    mov ax,@data
    mov ds,ax 
    mov ax,0a000h
    mov es,ax
    mov ah,0
    mov al,13h
    int 10h
  
   ;call set_xy
   call initialise    ;;;enta ro7t feen
    begining2:
    call make_pups
     call clear_screen   ;;1
   call clear_shld 
   call clear_shld1
  ;; call draw_bkgnd
        call draw_stars     ;;2
        call draw_status
        call print_name
       ; call re_chat
       call print_chat
      
        
       
       call draw_health   ;;3
    call draw_health2   ;;4
      
    call draw_pic_left   ;;5
    call draw_pic_rht   ;;6
    
    call shift_tri  ;;9
    call recieved_changes
  

    call clear_buf   ;;10
    ;call barrier_mov ;;11
    ;call rht_barrier_mov ;;12
    call mov_barr ;;13 
    call mov_barr2 ;;14
    call drw_brs 
                               ;sam3nyyyyyyy a  na sm3aaaaak
                                  ;;;la2
     call destroy_bar2l1
      ;mov[yoyo],ax
    call destroy_barl1 ;;15
       call mo_bar
    
    ;call draw_barrier  ;;7
    ;call draw_barrier_rht  ;;8
    call kill_plane_rht  ;;16
  
    call kill_plane_lft ;;17
    call draw_arr
    call draw_arr2
    call is_gameOver
     call is_gameOver2
     
    
    call clear_arr
    call clear_arr2
    
    
    
    again2: 
     call get_time
            cmp dl,prev_time
    je again2
    mov prev_time,dl
   
jmp begining2


    mov ah,4ch
    int 21h
main2 endp


end 