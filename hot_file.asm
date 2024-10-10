.section .text
_start:
    mov rax, 0x2000004  # write system call
    mov rdi, 1          # stdout
    mov rsi, message    # message pointer
    mov rdx, 13         # message length
    syscall

    mov rax, 0x2000001  # exit system call
    xor rdi, rdi        # exit code 0
    syscall

.section .data
message:    db "Hello, World!", 10