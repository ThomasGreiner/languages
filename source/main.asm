global main

extern atoi
extern printf

section .data
  stdout equ 1
  sys_exit equ 1
  sys_write equ 4
  
  dummy equ -1
  
  msg_fac db "fac(%d) = %d", 10, 0
  msg_error_num db "Expected exactly one argument", 10, 0
  msg_error_num_L equ $ - msg_error_num
  msg_error_neg db "Negative number: %d", 10, 0

section .text
  main:
    ; check for argc != 2
    cmp rdi, 2
    jne .write_error_num
    
    ; convert passed argument to integer
    mov rdi, [rsi + 8]
    call atoi
    
    ; check for arg < 0
    push rax
    test rax, 0x80
    jne .write_error_neg
    pop rax
    
    call .write_fac
    call .exit_success
  
  .write_fac:
    mov rdx, dummy
    mov rsi, rax
    mov rdi, msg_fac
    call printf
    ret
  
  .write_error_num:
    mov rax, sys_write
    mov rbx, stdout
    mov rcx, msg_error_num
    mov rdx, msg_error_num_L
    int 0x80
    
    call .exit_error
  
  .write_error_neg:
    mov rsi, rax
    mov rdi, msg_error_neg
    call printf
    
    call .exit_error
  
  .exit_error:
    mov rax, sys_exit
    mov rbx, 1
    int 0x80
  
  .exit_success:
    mov rax, sys_exit
    mov rbx, 0
    int 0x80
