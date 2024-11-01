; ************************************************************
; Función: Diferencia de Conjuntos
; 
; Descripción:
;   Calcula la diferencia entre dos conjuntos A y B (A-B),
;   es decir, encuentra los elementos que están en A pero no en B.
;
; Entradas:
;   - c_a: Cantidad de elementos en el conjunto A (word)
;   - A: Array con los elementos del conjunto A (word)
;   - c_b: Cantidad de elementos en el conjunto B (word)
;   - B: Array con los elementos del conjunto B (word)
;
; Salida:
;   Imprime los elementos que están en A pero no en B
;
; Ejemplo:
;   A = {1,3,4}, B = {1,2,3}
;   Resultado: 4 (único elemento en A que no está en B)
; ************************************************************

%include "io.inc"

section .data
    c_a dw 3          ; Cantidad de elementos en A
    A dw 1, 3, 4      ; Elementos del conjunto A
    c_b dw 3          ; Cantidad de elementos en B
    B dw 1, 2, 3      ; Elementos del conjunto B
       
section .text
global CMAIN
CMAIN:
    mov ebp, esp      ; Para depuración correcta
    
    xor eax, eax      ; Limpia el registro eax
    xor ebx, ebx      ; Limpia el registro ebx
    
    ; Carga las cantidades de elementos
    mov ax, [c_a]     ; ax = cantidad de elementos en A
    mov bx, [c_b]     ; bx = cantidad de elementos en B
    
    ; Multiplica por 2 (cada elemento ocupa 2 bytes al ser word)
    shl eax, 1        ; eax *= 2
    shl ebx, 1        ; ebx *= 2
    
    xor ecx, ecx      ; Limpia ecx
    xor edx, edx      ; Limpia edx
    
    .loop1:           ; Bucle exterior (recorre A)
        mov cx, [A + eax - 2]    ; Obtiene elemento actual de A
        .loop2:                  ; Bucle interior (recorre B)
            mov dx, [B + ebx - 2]; Obtiene elemento actual de B
            cmp ecx, edx         ; Compara elementos
            jz .continue         ; Si son iguales, salta
            
            sub ebx, 2           ; Siguiente elemento de B
            jnz .loop2          ; Si no es cero, continúa el bucle
        
        PRINT_DEC 1, ecx        ; Imprime el elemento si no se encontró en B
            
        .continue:
        sub eax, 2              ; Siguiente elemento de A
        jnz .loop1             ; Si no es cero, continúa el bucle
   
    ret