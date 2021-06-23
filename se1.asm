.Model small
.stack 64
.data 
value db ?
R1  DB 0
C1  DB 0
R2  DB 13
C2  DB 0

.code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
intia proc
mov dx,3fbh
mov al,10000000b
out dx,al
mov dx,3f8h
mov al,0ch
out dx,al
mov dx,39fh
mov al,0
out dx,al
mov dx,3fbh

mov dx,3fbh
mov al,00011011b
out dx,al
ret
intia endp

cls proc
mov ax,0b800h
mov es,ax
mov ax,0720h
mov di,0
mov cx,2000
rep stosw
ret
cls endp

split proc

   mov ah,6       ; function 6
   mov al,12        ; scroll by 1 line    
   mov bh,7       ; normal video attribute         
   mov ch,0       ; upper left Y
   mov cl,0        ; upper left X
   mov dh,12     ; lower right Y
   mov dl,79      ; lower right X 
   int 10h           

   mov ah,6       ; function 6
   mov al,13        ; scroll by 1 line    
   mov bh,125     ; normal video attribute         
   mov ch,13     ; upper left Y
   mov cl,0        ; upper left X
   mov dh,24   ; lower right Y
   mov dl,79      ; lower right X 
   int 10h           
  ret 
split endp





main proc
mov ax,@data
mov ds,ax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
call intia
call cls
call split
;;;;;;;;;;
again:
mov ah,01
int 16h
jz recieve
mov ah,0
int 16h
mov value,AL
;;;;;;;;
;;;;;;;;;;;;;;;;;;
mov dx , 3FDH		; Line Status Register
send:In al , dx 			;Read Line Status
and al , 00100000b
JZ send                              ;Not empty

;If empty put the VALUE in Transmit data register
mov dx , 3F8H		; Transmit data register
mov  al,VALUE
out dx , al
;;;;;;;;;;;;

;UPDATE CVURSOR POS IN SEND PROC
MOV AH,2
MOV DH,R1
MOV DL,C1 
MOV BH,0
INT 10H
INC C1 
CMP C1,79

JNZ HUDA
INC R1
MOV C1,0 

CMP R1,12
JL  HUDA 
MOV AX,0601H
MOV BH,07H
MOV CX,0
MOV DH,11
MOV DL,79
INT 10H

MOV C1,0 
;MOV R1,12
MOV R1,11
HUDA: 


;PRINT

MOV AH,9
MOV AL,VALUE
MOV CX,1
MOV BH,00
MOV BL,7
INT 10H 

recieve:
;Check that Data is Ready
mov dx , 3FDH		; Line Status Register
CHK:	in al , dx 
AND al , 1
JZ again                                    ;Not Ready
 ;If Ready read the VALUE in Receive data register
mov dx , 03F8H
in al , dx 
mov VALUE , al
;;;;;;UPDATE CURSOR POS
MOV AH,2
MOV DH,R2
MOV DL,C2 
INT 10H
INC C2

 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CMP C2,79

JNZ EXIT
INC R2
MOV C2,0 

CMP R2,24
JL  EXIT
MOV AX,0601H
MOV BH,125
MOV CH,13
MOV CL,0
MOV DH,24
MOV DL,79
INT 10H
DEC R2
EXIT:
;;PRINT

MOV AH,9
MOV AL,VALUE
MOV CX,1
MOV BH,00
MOV BL,125
INT 10H 
jmp again






main endp
end main
