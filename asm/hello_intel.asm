    section .data
message: db "Hello, World!", 0Ah, 00h
    global _main
    section .text
_main:
    mov rax, 0x02000004
    mov rdi, 1
    mov rsi, qword message
    mov rdx, 13
    syscall
    mov rax, 0x02000001
    mov rdi, 0
    syscall




