%include "io.inc"

section .data
    c_a dw 3
    A dw 1, 3, 4
    c_b dw 3
    B dw 1, 2, 3
       
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    xor eax, eax
    xor ebx, ebx
    
    mov ax, [c_a]
    mov bx, [c_b]
    
    shl eax, 1
    shl ebx, 1
    
    xor ecx, ecx
    xor edx, edx
    
    .loop1:
        mov cx, [A + eax - 2]
        .loop2:
            mov dx, [B + ebx - 2]
            cmp ecx, edx
            jz .continue
            
            sub ebx, 2
            jnz .loop2
        
        PRINT_DEC 1, ecx
            
        .continue:
        sub eax, 2
        jnz .loop1
   
    ret