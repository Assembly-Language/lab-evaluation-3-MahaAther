INCLUDE Irvine32.inc
.data
;public asmfunc
msg db "total positive number",0
array sword -3,-7,-4,-5,1,2,3,7,9
count dword ?
.code
asmfunc PROC
   mov esi,offset array
   mov ecx,lengthof array
   mov eax,0       ;declare eax,0 because we display count with eax 
checkloop: 
   movsx ebx,word ptr [esi]
   test ebx,8000h
   jnz skip
   inc count
skip: 
   add esi,type word
   loop checkloop
;display total positive number in an array
mov edx,offset msg
call writestring
call crlf
mov eax,count
call writeint
call crlf
asmfunc ENDP
end