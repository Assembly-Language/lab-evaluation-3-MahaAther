INCLUDE Irvine32.inc 
.data
msg2 byte "total positive num",0
.code 
asmfunc PROC array:DWORD, p2:DWORD
    mov eax, 0           ; Clear eax (not used directly here)
    mov ebx, 0           ; Counter for positive numbers
    mov esi, array       ; Load address of array into esi
    mov ecx, p2          ; Load the count of array elements into ecx
    
next:
    mov eax, [esi]       ; Load current element into eax
    cmp eax, 0           ; Compare with zero
    jle skip             ; If less than or equal to zero, skip
    inc ebx              ; Increment counter for positive numbers

skip:
    add esi, TYPE array  ; Move to the next element
    loop next            ; Repeat for all elements
    
    ; Print total positive numbers
    mov edx, offset msg2 ; Load the address of msg2 into edx
    call writestring     ; Print the message string
    call crlf            ; Newline
    mov eax, ebx         ; Move the count of positive numbers into eax
    call writeint        ; Print the positive count
    call crlf            ; Newline
    
    ret
asmfunc ENDP
end