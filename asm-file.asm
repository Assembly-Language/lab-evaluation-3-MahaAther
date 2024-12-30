INCLUDE Irvine32.inc
.data
msg db "total positive number",0     ;msg to display
array sword -3,-7,-4,-5,1,2,3,7,9    ;array
count dword ?                        ;variable for store total positive num
.code
asmfunc PROC 
   mov esi,offset array              ;move first index of array to esi
   mov ecx,lengthof array            ;ecx=array lenght means loops ends when array lenght ends
   mov eax,0                         ;declare eax,0 because we display count with eax 
checkloop:                           ;loop to check if num is positive or not
   movsx ebx,word ptr [esi]          ;sign-extend esi into ebx
   test ebx,8000h                    ;test ebx(array elments) with 8000 to check M.S.B
   jnz skip                          ;jump to label if zero flag not set (means num is negative)
   inc count                         ;if positive then do inc in count variable 
skip:                                  
   add esi,type word                 ;incremnet esi with type of word to move on next element
   loop checkloop                    ;looping until (ecx<0)
;display total positive number in an array
mov edx,offset msg                   ;msg for total even num
call writestring
call crlf
mov eax,count                        ;mov count to eax to display
call writeint                        ;display eax(total positive num)
call crlf                           
ret                                  ;program ends
asmfunc ENDP                         ;end of asmfunc proc
end                                   