section .data
    prompt1 db "Enter the first integer: ", 0
    prompt2 db "Enter the second integer: ", 0
    format db "%d", 0
    result db "The difference is: %d", 0

section .bss
    num1 resd 1
    num2 resd 1
    difference resd 1

section .text
    extern  _printf, _scanf, _exit

global _main

_main:
    ; Display prompt for first integer
    push prompt1
    call _printf
    add esp, 4

    ; Read first integer
    lea eax, [num1]
    push eax
    push format
    call _scanf
    add esp, 8

    ; Display prompt for second integer
    push prompt2
    call _printf
    add esp, 4

    ; Read second integer
    lea eax, [num2]
    push eax
    push format
    call _scanf
    add esp, 8

    ; Calculate difference
    mov eax, [num1]
    sub eax, [num2]
    mov [difference], eax

    ; Display the result
    push dword [difference]
    push result
    call _printf
    add esp, 8

    ; Exit the program
    push 0
    call _exit