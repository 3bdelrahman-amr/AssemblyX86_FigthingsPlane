
public draw_pic_rht,draw_pic_left,clear_buf,clear_screen,get_time,shift_tri,left_plane_xy,rht_plane_xy,draw_health,hlth_size,hlth_size2
public draw_health2,is_gameOver,barrier_mov,rht_barrier_mov,draw_barrier_rht,is_gameOver2,xy_barrier,xy_barrier2,recieved_changes
extrn get_bulPos:far, get_bulPos2:far,game_over:far,yes_barrier:byte,yes_barrier2:byte,player_one_win:far,player_two_win:far,mainnn:far
extrn send_al:far,send_ah:far,receive:far,rec:byte,,what_player_i_am:byte    ;;,deb:far
extrn my_writting:byte,wsize:word, recieving:byte, rsize:word 
public power_health,set_health,set_health2,power_health2  
.model huge
.data
 plane_lef db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,12,12,12,12,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,0,12,0,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,12,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,12,0,12,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,12,0,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,12,0,12,12,0,12,12,12,12,12,12,12,12,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,12,0,12,0,12,12,12,0,12,12,0,12,12,12,12,12,12,0,12,12,12,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,12,0,12,0,12,12,0,0,12,0,12,0,12,0,12,12,0,12,12,12,0,12,0,12,12,12,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,12,0,12,0,12,12,0,12,12,0,12,12,12,12,12,0,12,12,0,12,0,12,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,0,12,0,12,0,0,12,0,12,0,12,0,12,0,12,12,0,12,0,12,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,12,12,0,12,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,0,12,12,0,12,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,12,12,0,12,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,12,0,12,12,0,12,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,12,0,12,0,12,0,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,12,0,12,0,12,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 
 ;------------------------------------------------------------------------------------------------------
   plane_rht db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,9,9,9,9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,0,9,0,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,9,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,0,9,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,9,0,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,9,0,9,9,0,9,9,9,9,9,9,9,9,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,0,9,0,9,9,9,0,9,9,0,9,9,9,9,9,9,0,9,9,9,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,0,9,0,9,9,0,0,9,0,9,0,9,0,9,9,0,9,9,9,0,9,0,9,9,9,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,9,0,9,0,9,9,0,9,9,0,9,9,9,9,9,0,9,9,0,9,0,9,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,0,9,0,9,0,0,9,0,9,0,9,0,9,0,9,9,0,9,0,9,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,9,9,0,9,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,0,9,9,0,9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,9,0,9,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,9,0,9,9,0,9,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,0,9,0,9,0,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 



;-------------------------
left_plane_xy dw 5,100     ;(left corner)
rht_plane_xy dw 315,100     ;(left corner)
holde dw ?                 ;(bst3mlha 3shan ahold haga wna brsm )
holder dw ?,?
lngth_pic dw 50            ;(da el height wl width bta3 el soorat el planes)
size_pic dw ? 
but dw ?   
hlth dw 0,2  
hlth_size dw 120,8 
hlth2 dw 318,2  
 hlth_size2 dw 120,8 
 xy_barrier dw 90,20
 xy_barrier2 dw 200,140
 xy_size dw 20
 vel_x dw 5
 vel_xx dw 5   
;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------  
.code
 draw_pic_left proc far          ;(btrsm eltayara ely 3la shemal)
          lea di,left_plane_xy  
         lea si,plane_lef ;; da el loon
        mov cx,ds:[lngth_pic]            ;lngth_pic
        mov ax,ds:[di]
        mov [holder],ax
        mov ax,ds:[di+2]
        mov [holder+2],ax
       
        loop1:
        push cx
        mov cx,ds:[lngth_pic]
        
        mov ax,ds:[holder]
        push ax
        loop2:
        push cx
        mov ax,ds:[holder+2]  ;; y
        mov cx,320
        mul cx
        add ax,ds:[holder]
        xchg di,ax
        mov ah,0
        mov al,ds:[si]
        mov es:[di],al
        inc word ptr ds:[holder]
        inc si
        pop cx
        loop loop2
         pop ax
         mov ds:[holder],ax
       
        inc word ptr ds:[holder+2]
        
        pop cx
        loop loop1
        ret
draw_pic_left endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;***************************************************************************
;*  draw_pic_rht
;*  this procedure draws ]
;*  
;*  @param : AX  
;*  @PARAM
;*    @return 
;***************************************************************************


draw_pic_rht proc far          ;(btrsm el tayara ely 3la ymeen )
         lea di,rht_plane_xy  
         lea si,plane_rht ;; da el loon
        mov cx,ds:[lngth_pic]            ;lngth_pic
        mov ax,ds:[di]
        mov [holder],ax
        mov ax,ds:[di+2]
        mov [holder+2],ax
       
        loop11:
        push cx
        mov cx,ds:[lngth_pic]
        
        mov ax,ds:[holder]
        push ax
        loop22:
        push cx
        mov ax,ds:[holder+2]  ;; y
        mov cx,320
        mul cx
        add ax,ds:[holder]
        xchg di,ax
        mov ah,0
        mov al,ds:[si]
        mov es:[di],al
        dec word ptr ds:[holder]
        inc si
        pop cx
        loop loop22
         pop ax
         mov ds:[holder],ax
         inc word ptr ds:[holder+2]
        
        pop cx
        loop loop11
        ret
draw_pic_rht endp


 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------

clear_screen proc far      ;(bayna mn esmha :D)
   mov ax,0600h
   mov bh,0h
   mov bl,00h
   mov cx,0
    mov dx,184fh
   int 10h
ret


clear_screen endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
get_time proc           ;(ba-get el system time hna 3shan a3raf harsm emta tany(ha-update interface kol my3ady wa2t ad eh da asdy bnady 3leeha fl main))
mov ah,2ch
int 21h
ret
get_time endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------

shift_tri proc far               ;(btshouf eh ely galha mn el keyboar w bta5od el desicion 3la asaso thrak haga msln aw mt3mlsh haga)
        lea si,left_plane_xy
        lea di,rht_plane_xy
        xor al,al
        mov ah,1      ;ba5od dir men el user ;;; ah :scan code ;; al: ascii
        int 16h
       
        jz bara_yala
        ;--------------------
        mov ah,0
         int 16h
       ;------------------------------- 
       
        cmp ah,48h            
        je up2
         cmp ah,50h            
        je down2
        cmp ah,4bh            
        je bul2
        cmp ah,3bh
        je menu
        ;cmp al,1bh
        ;jne bara_yala
        ;call exit    ;(far)
        
       call far ptr add_chatAnd_send
         
       bara_yala: ret
    ;-------------------------------------------
        up:     
        mov bx, [si+2]
        cmp bx,10
        jbe o
        sub bx,10
        mov [si+2],bx 
        
        o: jmp sendah    ;ret
   ;---------------------------------------------     
        down:
         mov bx, [si+2]
         add bx,50
         cmp bx,160               ;;check boundry
          jae oo
        sub bx,40

        mov [si+2],bx
       
        oo: jmp sendah;ret
      ;-------------------------------------------                  
        up2: 
        cmp what_player_i_am,1         ;;; player 2 ely 3la ymeen we 1 3la shemal
        je to
        jmp up
       to: mov bx, [di+2]
         cmp bx,10
        jbe ooo
        sub bx,10
        mov [di+2],bx 
       
        ooo: jmp sendah   ;ret
        ;-------------------------------
        down2:
          cmp what_player_i_am,1  
          je tu
          jmp down
        tu: mov bx, [di+2]
        add bx,50
         cmp bx,160
          jae oooo
        sub bx,40
        mov [di+2],bx 
       
        oooo: jmp sendah          ;ret
      ;----------------  
        bul: 
         
        call get_bulPos
        jmp sendah
        
  ;----------------------------------------------      
        bul2: 
          cmp what_player_i_am,1  
          je tl
          jmp bul
        tl: call get_bulPos2
        jmp sendah
        
  ;-----------------------------------------------      
        menu:
        call send_ah
        call mainnn
        ret
      
;----------------------------------------------------

            sendah: call send_ah
            ret
            sendal: call send_al
            ret
 ;;------------------------------------------------------------------------------------           
shift_tri endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
comment !
exit proc 
          call  send_ah
           mov ax,0600h
            mov cx,0
            mov dx,184fh
            mov bh,0
            int 10h
            mov ah,4ch
            int 21h
             ret
exit endp
!

clear_buf proc far
    
     ; mov ah,0
      ;  int 16h
       
        ret
 clear_buf endp
  ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
 draw_health proc far
        
     lea di,hlth 
       
        mov cx,[hlth_size+2]  ;;y
        mov ax,[di]
        mov [holder],ax
        mov ax,[di+2]
        mov [holder+2],ax
        mov ah,0ch
          mov dx,[di+2]
        loop16:
        push cx
        mov cx,[hlth_size]
        cmp cx,0
        je fz
         cmp cx,320
        ja fz    
        mov bx,[di]
        loop26:
        push cx
        mov cx,[di]
        mov al,13
        int 10h
        inc word ptr [di]
        pop cx
        loop loop26
        mov [di],bx
        inc dx
      
        pop cx
        loop loop16
     
       fz: ret
draw_health endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
draw_health2 proc far
        
     lea di,hlth2 
       
        mov cx,[hlth_size2+2]  ;;lngth y
        mov ax,[di]
        mov [holder],ax
        mov ax,[di+2]
        mov [holder+2],ax
        mov ah,0ch
        mov dx,[di+2]
        loop162:
        push cx
        mov cx,[hlth_size2]     ;; lngth x
        cmp cx,0
        je fzz
        cmp cx,320
        ja fzz  
        mov bx,[di]
        loop262:
        push cx
        mov cx,[di]
        mov al,9
        int 10h
        dec word ptr [di]
        pop cx
        loop loop262
        mov [di],bx
        inc dx
        pop cx
        loop loop162
      
       fzz: ret
        draw_health2 endp
;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
 is_gameOver proc
      lea si,hlth_size
      mov ax,ds:[si]
      cmp ax,0
      ja nm
      call game_over
      call player_two_win
      mov ah,4ch
      int 21h
      nm: ret


is_gameOver endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
is_gameOver2 proc
     
      lea si,hlth_size2
      mov ax,[si]
      cmp ax,0
      ja nmm
      call game_over
      call player_one_win
      mov ah,4ch
      int 21h
      nmm: ret


is_gameOver2 endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
 draw_barrier proc far          ;(btrsm eltayara ely 3la shemal)
          mov al,[yes_barrier]
          cmp al,0
          je nooo
          lea di,xy_barrier 
         ;lea si,plane_lef ;; da el loon
        mov cx,ds:[xy_size]            ;lngth_pic
        mov ax,ds:[di]
        mov [holder],ax
        mov ax,ds:[di+2]
        mov [holder+2],ax
       
        loop1a:
        push cx
        mov cx,ds:[xy_size]
        
        mov ax,ds:[holder]
        push ax
        loop2a:
        push cx
        mov ax,ds:[holder+2]  ;; y
        mov cx,320
        mul cx
        add ax,ds:[holder]
        xchg di,ax
        mov ah,0
        mov al,10
        mov es:[di],al
        inc word ptr ds:[holder]
        ;inc si
        pop cx
        loop loop2a
         pop ax
         mov ds:[holder],ax
       
        inc word ptr ds:[holder+2]
        
        pop cx
        loop loop1a
    nooo:    ret
draw_barrier endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
barrier_mov proc far
 
      lea si,xy_barrier
      mov ax,[si+2]
     cmp ax,10
      jbe sx
      ;add ax,20
      cmp ax,140
      jae sx
      ;sub ax,20
      mov bx,ds:[vel_x]
      add ax,bx
      mov ds:[si+2],ax
       
      ret
      sx: ;sub ax,20 
      mov bx,ds:[vel_x]
      neg bx
      add ax,bx
      mov ds:[vel_x],bx
      mov ds:[si+2],ax
      ret

barrier_mov endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
 draw_barrier_rht proc far          ;(btrsm eltayara ely 3la shemal)
 
            mov al,[yes_barrier2]
            cmp al,0
            je la2a
        
          lea di,xy_barrier2 
         ;lea si,plane_lef ;; da el loon
        mov cx,ds:[xy_size]            ;lngth_pic
        mov ax,ds:[di]
        mov [holder],ax
        mov ax,ds:[di+2]
        mov [holder+2],ax
       
        loop1aa:
        push cx
        mov cx,ds:[xy_size]
        
        mov ax,ds:[holder]
        push ax
        loop2aa:
        push cx
        mov ax,ds:[holder+2]  ;; y
        mov cx,320
        mul cx
        add ax,ds:[holder]
        xchg di,ax
        mov ah,0
        mov al,5
        mov es:[di],al
        inc word ptr ds:[holder]
        ;inc si
        pop cx
        loop loop2aa
         pop ax
         mov ds:[holder],ax
       
        inc word ptr ds:[holder+2]
        
        pop cx
        loop loop1aa
        la2a: ret
draw_barrier_rht endp
 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
rht_barrier_mov proc far
      lea si,xy_barrier2
      mov ax,[si+2]
     cmp ax,10
      jbe sxx
      ;add ax,20
      cmp ax,140
      jae sxx
      mov bx,ds:[vel_xx]
      ;sub ax,20
      add ax,bx
      mov ds:[si+2],ax
       
      ret
      sxx: ;sub ax,20
       mov bx,ds:[vel_xx]
      neg bx
      add ax,bx
      mov ds:[vel_xx],bx
      mov ds:[si+2],ax
      ret

rht_barrier_mov endp

 ;;----------------------------------------------------
;;----------------------------------------------------
;;---------------------------------------------------
recieved_changes proc far               ;(btshouf eh ely galha mn el keyboar w bta5od el desicion 3la asaso thrak haga msln aw mt3mlsh haga)
        lea si,left_plane_xy
        lea di,rht_plane_xy
        call receive


        cmp rec,0
        jne kamel_kamel
        ret
kamel_kamel: ; cmp rec ,119            
        ;je upp
        ;cmp rec,115
        ;je downp
        ;cmp rec,20h      ;(fy moshkla hna)
        ;je bulp
        cmp rec,48h            
        je up2p
         cmp rec,50h            
        je down2p
        cmp rec,4bh            
        je bul2p
        cmp rec,3bh
        je menup
        cmp rec,1bh
        je brarp
        ;--------
      call far ptr recieve_add
          ;--------------
       ouuuuut: ret
        ;-------------------------------
        upp: 
         
        mov bx, [si+2]
        cmp bx,10
        jbe oh
        sub bx,10
        mov [si+2],bx 
        
        oh: ret
        ;------------------------------------
        downp: 
         mov bx, [si+2]
         add bx,50
         cmp bx,160               ;;check boundry
          jae ooh
        sub bx,40

        mov [si+2],bx
      
        ooh: ret   
        ;--------------------------------------             
        up2p:
        cmp what_player_i_am,1
        je upp
        ;jmp upp
        fd: mov bx, [di+2]
         cmp bx,10
        jbe oooh
        sub bx,10
        mov [di+2],bx 
       
        oooh: ret
        ;-----------------------------------
        down2p:
               cmp what_player_i_am,1
        je downp
        mov bx, [di+2]
        add bx,50
         cmp bx,160
          jae ooooh
        sub bx,40
        mov [di+2],bx 
       
        ooooh: ret
 ;-------------------------------------------------------       
        bulp: 
        
        call get_bulPos

        ret
  ;----------------------------------------------
        bul2p:
            cmp what_player_i_am,1
        je bulp 
        call get_bulPos2
        ret
  ;------------------------------------------------    hna lw das f1 haywady main menu  
        menup: ;mov ah,0
        ;int 16h
        call mainnn
        ret
  ;-----------------------------------------------------------hna lw das exit      
        brarp:   mov ax,0600h
            mov cx,0
            mov dx,184fh
            mov bh,0
            int 10h
            mov ah,4ch
            int 21h
       etl3_bra_m3lsh:      ret
 ;;------------------------------------------------------------------------------------           
recieved_changes endp
;;--------------------------------
;;---------------------------------
add_chatAnd_send proc far
            lea si,my_writting
            add si,wsize
            mov [si],al
            inc word ptr [wsize]
            call send_al
            ret
add_chatAnd_send endp
;-----------------------------
;----------------------------
recieve_add proc far
           lea si,recieving
            add si,rsize
            mov al,rec
            cmp al,20h
            jb tof
            cmp al,7ah
            ja tof
            mov [si],al
            inc word ptr [rsize]
tof: ret

recieve_add endp
;;--------------
;;---------------
;;---------
power_health proc far
        mov ax,[hlth_size]
      cmp ax,120
      je fff
      add ax,24
      mov [hlth_size],ax
      fff: ret



power_health endp
;;-------------------
;;------------------
power_health2 proc far
        mov ax,[hlth_size2]
      cmp ax,120
      je io       ;ffff
      add ax,24
      mov [hlth_size2],ax
      io: ret



power_health2 endp

;;------------------------
;;----------------------
set_health proc far
        mov ax,0
      mov [hlth_size],ax
      ret
      set_health endp
      ;;---------------------
      ;;--------------------
      set_health2 proc far
      mov ax,0
      mov [hlth_size2],ax
      ret
set_health2 endp

end