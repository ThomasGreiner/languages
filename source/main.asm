global main

extern atoi
extern printf

section .data
  stdout equ 1
  sys_exit equ 1
  sys_write equ 4
  
  msg_error_num db "Expected exactly one argument", 10, 0
  msg_error_num_L equ $ - msg_error_num
  msg_error_neg db "Negative number: %ld", 10, 0
  msg_fac db "fac(%ld) = %ld", 10, 0
  msg_fib db "fib(%ld) = %ld", 10, 0

section .text
  main:
    ; check for argc != 2
    cmp rdi, 2
    jne .write_error_num
    
    ; convert passed argument to integer
    mov rdi, [rsi + 8]
    call atoi
    
    ; check for arg < 0 (works for integers < 0x80)
    push rax
    test rax, 0x80
    jne .write_error_neg
    pop rax
    
    call .fac_init
    call .fib_init
    jmp .exit_success
  
  ; rax: input
  ; rbx; output
  ; rcx: counter
  .fac_init:
    mov rbx, 1
    mov rcx, rax
    
    jmp .fac_next
  
  .fac_next:
    ; if counter < 2
    cmp rcx, 2
    jl .write_fac
    
    ; output *= counter
    push rax
    mov rax, rcx
    mul rbx
    mov rbx, rax
    pop rax
    
    ; counter--
    dec rcx
    
    jmp .fac_next
  
  .write_fac:
    push rax
    
    mov rdx, rbx
    mov rsi, rax
    mov rdi, msg_fac
    
    xor rax, rax ; required to push/pop rax
    call printf
    
    pop rax
    ret
  
  ; rax: input
  ; rbx: output
  ; rcx: previous
  ; rdx: counter
  .fib_init:
    mov rbx, 1
    mov rcx, 1
    mov rdx, rax
    
    jmp .fib_next
  
  .fib_next:
    ; if counter < 3
    cmp rdx, 3
    jl .write_fib
    
    ; increment previous and current values
    push rax
    mov rax, rbx
    mov rbx, rcx
    mov rcx, rax
    pop rax
    add rbx, rcx
    
    ; counter--
    dec rdx
    
    jmp .fib_next
  
  .write_fib:
    push rax
    
    mov rdx, rbx
    mov rsi, rax
    mov rdi, msg_fib
    
    xor rax, rax ; required to push/pop rax
    call printf
    
    pop rax
    ret
  
  .write_error_num:
    mov rax, sys_write
    mov rbx, stdout
    mov rcx, msg_error_num
    mov rdx, msg_error_num_L
    int 0x80
    
    jmp .exit_error
  
  .write_error_neg:
    mov rsi, rax
    mov rdi, msg_error_neg
    call printf
    
    jmp .exit_error
  
  .exit_error:
    mov rax, sys_exit
    mov rbx, 1
    int 0x80
  
  .exit_success:
    mov rax, sys_exit
    mov rbx, 0
    int 0x80
