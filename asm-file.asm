INCLUDE Irvine32.inc

.data
msg2 BYTE "Total positive numbers: ", 0

.code
asmfunc PROC array:PTR DWORD, p2:DWORD
    ; Initialize registers
    xor ebx, ebx            ; Clear ebx (positive number counter)
    mov esi, array          ; Load address of the array into esi
    mov ecx, p2         ; Load the number of elements into ecx

check_next:
    cmp ecx, 0              ; Check if there are elements left
    jz finish               ; If no elements left, finish
    mov eax, [esi]          ; Load current array element into eax
    cmp eax, 0              ; Compare element with 0
    jle skip                ; If <= 0, skip incrementing counter
    inc ebx                 ; Increment positive number counter

skip:
    add esi, 4              ; Move to the next DWORD element
    loop check_next         ; Repeat for remaining elements

finish:
    ; Display the message
    mov edx, OFFSET msg2    ; Load address of msg2 into edx
    call WriteString        ; Display the message
    call Crlf               ; Newline

    ; Display the count of positive numbers
    mov eax, ebx            ; Load the count into eax
    call WriteInt           ; Print the integer
    call Crlf               ; Newline

    ret                     ; Return to caller
asmfunc ENDP
END
