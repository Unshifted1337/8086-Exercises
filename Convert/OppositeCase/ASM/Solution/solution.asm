Solution

; program to calculate 7 * (4 + 10) + (10 / 5)
    org 100h
    jmp main
    
result: db "Result of 7*(4+10)+(10/5) is: $"
                                            
main:                                            
                                            
    mov bx, 5   ; load number 5 for making division
    mov ax, 10  ; load number 10 for making division
    mov dx, 0   ; clear dx for the division
    div bx      ; calculate 10/5
    mov cx, ax  ; save 10/5 in cx
    mov ax, 4   ; load number 4
    add ax, 10  ; calculate (4+10)
    mov bx, 7   ; load number 7 for making multiplication
    mul bx      ; calculate 7*(4+10)
    add ax, cx  ; calculate final result 7*(4+10) + 10/5 in ax

    ; here result is in ax
                          
    mov di, ax  ; save result in di

    ; print result message
    mov ah, 9               ; function 9 for printing a string
    mov dx, offset result   ; load address of string to print
    int 21h                 ; print the string using DOS
    
    ; convert resulting number to ascii
    mov ax, di      ; restore result in ax
    mov bx, 10      ; load 10 to make divisions by 10
    push bx         ; save 10 in stack
convert:
    mov dx, 0       ; clear dx for making division
    div bx          ; divide number by 10
    add dx, 48      ; convert remainder digit to ascii
    push dx         ; save ascii digit on stack
    cmp ax, 0       ; see if the number is zero
    jne convert     ; if not zero, keep converting number
    ; print number on the screen

; Program to change upper or lower case letters to the
; opposite case

    org 100h

    jmp main

prompt1:    db "Enter any two lowercase characters:", 10, 13, '$'
prompt2:    db "Enter any two uppercase characters:", 10, 13, '$'

main:
        
    ; Print prompt for lowercase letters
    mov ah, 9; function 9 for printing a string
    mov dx, offset prompt1; load address of the string to print
    int 21h; print the string using DOS

    ; read the first character
    mov ah, 1; function 1 to read a character
    int 21h; read character using DOS
    mov bl, al; save the character in bl

    ; read space
    mov ah, 1; function 1 to read a character
    int 21h; read character using DOS

    ; read the second character
    mov ah, 1; function 1 to read a character
    int 21h; read character using DOS
    mov bh, al; save the character in bh
                   
    ; print space
    mov dl, 32; put space in dl for printing it
    mov ah, 2; function 2 to print character
    int 21h; print character using DOS
                   
    ; print first char in uppercase
    xor bl, 32; change case for the first character
    mov dl, bl; put char in dl for printing it
    mov ah, 2; function 2 to print character
    int 21h; print character using DOS

    ; print space
    mov dl, 32; put space in dl for printing it
    mov ah, 2; function 2 to print character
    int 21h; print character using DOS

    ; print second char in uppercase
    xor bh, 32; change case for the second character
    mov dl, bh; put char in dl for printing it
    mov ah, 2; function 2 to print character
    int 21h; print character using DOS
    
    mov dl, 0ah; print new line.
    int 21h
    mov dl, 0dh             ; print carriage return.
    int 21h    

    ; Print prompt for uppercase letters
    mov ah, 9; function 9 for printing a string
    mov dx, offset prompt2; load address of the string to print
    int 21h; print the string using DOS
    

    ; read the first character
    mov ah, 1; function 1 to read a character
    int 21h; read character using DOS
    mov bl, al; save the character in bl

    ; read space
    mov ah, 1; function 1 to read a character
    
    
           
; Procedure to calculate a factorial
; requires the number to calculate in ax, returns the
; result in ax

factorial proc
    cmp ax, 2       ; see if the number is < 2
    jge calc        ; if >=2, go to calculation
     
    mov ax, 1       ; if 0 or 1, return 1 
    ret 

calc:
    push ax         ; save number in stack
    dec ax          ; calculate n-1
    call factorial  ; call factorial of n-1
    pop bx          ; restore initial number from stack
    mul bx          ; multiply num*factorial(num-1) to get factorial
    ret             ; return result
factorial endp
