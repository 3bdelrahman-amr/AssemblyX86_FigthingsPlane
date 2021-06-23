public initialise,send_ah,send_al,receive,rec,send_recieves_playernames,o3od_recieve,wait_to_enter,what_player_i_am,recieve_name,send_name
public ingame_recieve,ingame_send,rec_chat,deb
extrn player_one:word,actual_s:word,player_two:word,actual_s2:word
.model small
.data
rec db 0   ;; el recieved data ha5odha hna
flag_received db 0  ;;;lw na galy haga hab3at 0aah 
what_player_i_am db 0
rec_chat db 0
.code

;---------------------------------------------------------------
;---------------------------------------------------------------
initialise proc far  ;;1
            mov dx,3fbh
            mov al,80h
            out dx,al
            ;-----------------
            mov dx,3f8h
            mov al,0ch
            out dx,al
            ;-------------------
            mov dx,3f9h
            mov al,0
            out dx,al
            ;-----------
            mov dx,3fbh
            mov al,1bh
            out dx,al
            ret



initialise endp
;------------------------------------------------------------
;-------------------------------------------------------------
 send_al proc    far   ;;2       ;; ba send elvalue ely fl al
         ;; el line status address
    send_tany1: mov bl,0
               mov flag_received,bl  ;; reset flag (elflag da by =aah lw el data raht elnahya eltanya  fal pc hayb3t aa m3naha y3ni eno gatlo el data)  
        mov dx,3fdh 
           ;xchg al,ah        ;; line status register
        push ax  ;; el value ely ha sentha bhafz 3leeha
        ;-----------------------
        shoof_send1: in al,dx
        and al,20h    
        jz shoof_send1  ;; lw el transmitter data msh fadya ha3od aloop lhad ma tefda
        ;;-------------------------
        ;;-------------------------
        pop ax    ;; ha pop el value bta3ty
        mov dx,3f8h
    
        out dx,al           ;; hab3at hna ely fl ah
        push ax
        call he_receive   ;; hna hashouf el pc el tany f3ln wesltlo el data wla la2,,,, law gtlo hayb3tly aa 8eer kda  el flag by 0
        pop ax
        cmp flag_received,0aah
        jne send_tany1     ;; lw mgtloosh fa hab3thalo tany 
         push ax
         mov ah,0
         mov flag_received,ah
         pop ax
         ret        


ret
;;---------------------------------------------------------------
;;---------------------------------------------------------------
;;----------------------------------------------------------------
send_al endp
;;---------------------------------------------------------------------------------------
;;; delwa2ty na 3ayz allop lhad ma register tefda 3shan ab3at feeha el value
;;; w lhad ma el pc eltany yb3atly el flag eno galo haga
;-------------------------------------------------------------------------------------------
send_ah proc    far           ;;3     ;; by send el value ely fl ah
        ;; el line status address
        push ax
         mov al,ah
    send_tany: mov bl,0
               mov flag_received,bl  ;; reset flag 
               ;;(elflag da by =aah lw el data raht elnahya eltanya  fal pc hayb3t aa m3naha y3ni eno gatlo el data)  
        mov dx,3fdh 
                 ;; line status register
        push ax  ;; el value ely ha sentha bhafz 3leeha
        ;-----------------------
        shoof_send2: in al,dx
        and al,20h    
        jz shoof_send2  ;; lw el transmitter data msh fadya ha3od aloop lhad ma tefda
        ;;-------------------------
        ;;-------------------------
        pop ax    ;; ha pop el value bta3ty
        mov dx,3f8h
    
        out dx,al           ;; hab3at hna ely fl ah
        push ax
        call he_receive   ;; hna hashouf el pc el tany f3ln wesltlo el data wla la2,,,, law gtlo hayb3tly aa 8eer kda  el flag by 0
        pop ax
        cmp flag_received,0aah
        jne send_tany     ;; lw mgtloosh fa hab3thalo tany 
       pop ax
         ret        
        
send_ah endp
;-----------------------------------------------------------
;------------------------------------------------------------
;-----------------------------ba receive el value fy rec(da variable)
receive proc far       ;;4
        
        ;;--------------------------
        mov dx,3fdh
        in al,dx
        and al,1
        jz braaaaaaa   ;; mgalish haga fa hatl3 bra el func 5ales
        ;;-----------------------gally hna fa ha send lel tany el flag a2olo eny galy el data
        mov dx,3f8h
        in al,dx
        mov rec,al         ;; hahold eldata bta3ty fy rec da (eldata ely gatly)
        ;-----------------------ha sent el flag lel nahya eltanya a2olo eny galy haga
        mov dx,3f8h
        mov al,0aah             ;; bhot fl al 0aah w ab3tha 3shan a2ool lel pc eltany en eldata bta3to wasaletly
        out dx,al
        ;--------------------------------------------------   
         ret
        braaaaaaa: mov ah,0               ;;; na bahot fl rec 0 lw mgaleesh haga 3shn ba compare byh w lw bysaweeh ba5rg bra elfunction
                   mov rec,ah
                   ret



receive endp
;----------------------------------------------------------------------
;----------------------------------------------------------------------
he_receive proc  ;; elflag haygyly hna w y3rafny elhaga weslt wla la2
         
        
        mov dx,3f8h
        in al,dx
        mov flag_received,al
         ret


he_receive endp
;-----------------------------------------------------------------------------
;-----------------------------------------------------------------------------
send_recieves_playernames proc far
        lea si,player_one
        lea di,player_two     ;; hashawer 3la el esm  3shan ab3to
        mov cx,[actual_s]     ;; 3dad el charecter ely hasendha
       inc cx

        send_elname:          ;; el loop dy hatsend 
        
                  ;;send_ah
         ;---------------------------         
        howhow: call receive
        cmp rec,0
        je howhow  ;inc_si

        mov ah,rec
        mov [di],ah
        inc di
        inc word ptr [actual_s2]               ;recieve_playername
        inc_si: mov al,[si]   
               call send_al
            inc si
        loop send_elname
          lw_lsa_fyhaga_matsendetsh: call recieve_alN
                                       cmp rec,0
                                       je get_out
                                        mov ah,rec
                                        mov [di],ah
                                        inc di
                                        inc word ptr [actual_s2]  
                                      jmp lw_lsa_fyhaga_matsendetsh                ;; dy bt-send flag ely hat5aly ely by-recieve ybatal ye-recieve
        get_out: ret
send_recieves_playernames endp
;------------------------------------------
;-------------------------------------------
;-------------------------------------------
 send_alN proc
        mov dx,3fdh 
           ;xchg al,ah        ;; line status register
        push ax  ;; el value ely ha sentha bhafz 3leeha
        ;-----------------------
        shoof_send11: in al,dx
        and al,20h    
        jz shoof_send11  ;; lw el transmitter data msh fadya ha3od aloop lhad ma tefda
        ;;-------------------------
        ;;-------------------------
        pop ax    ;; ha pop el value bta3ty
        mov dx,3f8h
    
        out dx,al           ;; hab3at hna ely fl ah
        ;push ax

         ret
send_alN endp
;;-----------------------------------------
;;-----------------------------------------
;;-----------------------------------------
recieve_alN proc
        ;;--------------------------
       ;ananah21:
        mov dx,3fdh
        in al,dx
        and al,1
        jz ananah21             ;braaaaaaa   ;; mgalish haga fa hatl3 bra el func 5ales
        ;;-----------------------gally hna fa ha send lel tany el flag a2olo eny galy el data
        mov dx,3f8h
        in al,dx
        mov rec,al         ;; hahold eldata bta3ty fy rec da (eldata ely gatly)

     ret
     ananah21:       mov ah,0
                   mov rec,ah
                   ret
recieve_alN endp
;----------------
;----------------
;----------------
o3od_recieve proc far
    lea di,player_two
    add di,actual_s2
     yo:    mov dx,3fdh
        in al,dx
        and al,1
        jz ananah4             ;braaaaaaa   ;; mgalish haga fa hatl3 bra el func 5ales
        ;;-----------------------gally hna fa ha send lel tany el flag a2olo eny galy el data
        mov dx,3f8h
        in al,dx
        mov [di],al
        inc word ptr [actual_s2]         ;; hahold eldata bta3ty fy rec da (eldata ely gatly)
       jmp yo 
   ananah4:  ret      

     ;ret
o3od_recieve endp
wait_to_enter proc far
                           ;;ba wait hna lhad ma el player eltany ywsl nafs el satr
                           ; ely bywsl el awl hwa player one
;--------------------------------------------------------------------------------
               
        call receive
     cmp rec,0abh
       jne erga3_tany
       mov ah,1
       mov what_player_i_am,ah  ;kda na palyer 2
        mov al,0aah
        call send_al
       ret
;---------------------------------------------------get hna yb2a na player one
     erga3_tany: mov ah,0
                 mov flag_received,ah 
                 mov al,0abh
               call send_al
  ta5:   call receive
     cmp rec,0aah
     jne ta5;erga3_tany 
 
     ret
wait_to_enter endp
;;-------------------------
;;------------------------
;;-------------------------
send_name proc
lea si,player_one
      
        mov cx,[actual_s]     ;; 3dad el charecter ely hasendha
      ; inc cx

        send_elnamet:          ;; el loop dy hatsend 
        
                        ;recieve_playername
        mov al,[si]   
        call send_alN
        inc si
        loop send_elnamet
        mov al,"$"
      call  send_alN
        ret
send_name endp
;-----------------
;---------------
;------------------
recieve_name proc
         lea si,player_two
      
        
        rec_named: call recieve_alN          ;; el loop dy hatsend 
          cmp rec,"$"
          je wq
          cmp rec,0
          je rec_named         
        cmp rec,30h
        jb rec_named
        cmp  rec,7ah
        ja rec_named           
        
        mov [si],al   
        
        inc si
        inc word ptr [actual_s2]
        ;loop rec_named
        jmp rec_named
        wq: ret
        recieve_name endp
;-----------------------------------------------------------
;-----------------------------------------------------------
;-----------------------------------------------------------


ingame_send proc  far  
         
                ;; ha-send hna el charecter bta3t el in-game chatting
               ;; el line status address
    send_tany31: ;mov bl,0
               ;mov flag_received,bl  ;; reset flag (elflag da by =aah lw el data raht elnahya eltanya  fal pc hayb3t aa m3naha y3ni eno gatlo el data)  
        ;mov dx,3fdh 
          
        push ax  
        call receive
        ;mov dx,3f8h
        ;in al,dx    
        mov al,rec 
        mov rec_chat,al
        ;-----------------------
        ;shoof_send31: in al,dx
        ;and al,20h    
        ;jz shoof_send31  ;; lw el transmitter data msh fadya ha3od aloop lhad ma tefda
        ;;-------------------------
        ;;-------------------------
        ; pop ax
         call send_al
         ;mov al,3   
        ;mov dx,3f8h
        ;out dx,al
        ;pop ax   
        ;----
        ;----
        ;push ax
        ;mov dx,3fdh
        ;in al,dx
        ;and al,1
        ;jz ou 
         
        pop ax
        ret
        
        
                





        ;ou:; mov ah,0
        ;mov rec_chat,ah
        ;pop ax
         ;ret
ingame_send endp
ingame_recieve proc far
              ;;--------------------------
              comment!
              hg: call he_receive
              cmp rec,0cch
              jne hg
              ;---------
               mov dx,3f8h
        mov al,0cch            
        out dx,al
              ;--------------
        nn: mov dx,3fdh
        in al,dx
        and al,1
        jz nn  ;braaaaaaaa   ;; mgalish haga fa hatl3 bra el func 5ales
        ;;-----------------------gally hna fa ha send lel tany el flag a2olo eny galy el data
        mov dx,3f8h
        in al,dx
        mov rec_chat,al         ;; hahold eldata bta3ty fy rec da (eldata ely gatly)
        ;-----------------------ha sent el flag lel nahya eltanya a2olo eny galy haga
        mov dx,3f8h
        mov al,0cch             ;; bhot fl al 0aah w ab3tha 3shan a2ool lel pc eltany en eldata bta3to wasaletly
        out dx,al
        ;--------------------------------------------------   
         ret
        braaaaaaaa: mov ah,0               ;;; na bahot fl rec 0 lw mgaleesh haga 3shn ba compare byh w lw bysaweeh ba5rg bra elfunction
                   mov rec_chat,ah
                   
!
          ret
ingame_recieve endp
;-----------------------------
deb proc far
  ;debug
           mov ah,2
        mov dh,25
        mov dl,0
        int 10h
        mov cx,1
       
        
        mov ah,0eh
        mov al,rec
        mov bl,5
        mov bh,0
        int 10h
        mov ah,0
        int 16h
        ret
deb endp


end