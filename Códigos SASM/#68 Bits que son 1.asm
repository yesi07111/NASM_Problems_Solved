; ************************************************************
; Función: Contador de Bits 1
; 
; Descripción:
;   Cuenta la cantidad de bits que tienen valor 1 en un número
;   de 16 bits (word).
;
; Entrada:
;   - n: Número de 16 bits a analizar (word)
;
; Salida:
;   Imprime la cantidad total de bits que son 1 en el número
;
; Ejemplo:
;   n = 0xFFFF (1111 1111 1111 1111 en binario)
;   Resultado: 16 (todos los bits son 1)
; ************************************************************

%include "io.inc"

section .data
    n dw 0xffff       ; Número a analizar (en este caso todos los bits son 1)

section .text
global CMAIN
CMAIN:
    mov ebp, esp      ; Para depuración correcta
    xor eax, eax      ; Limpia el registro eax
    xor ebx, ebx      ; Limpia el registro ebx (se usará como contador)
    xor ecx, ecx      ; Limpia el registro ecx (contador de iteraciones)
    xor edx, edx      ; Limpia el registro edx
    
    mov ax, [n]       ; Carga el número en ax
    
    .loop1:
        mov dx, ax         ; Guarda una copia del número actual
        and ax, 1         ; Aisla el bit menos significativo
        jz .plus          ; Si es cero, salta a plus
        inc bx            ; Si es 1, incrementa el contador
        
        .plus:
            inc ecx           ; Incrementa el contador de iteraciones
            mov ax, dx        ; Recupera el número original
            shr ax, 1         ; Desplaza todos los bits una posición a la derecha
            cmp ecx, 16       ; Compara si ya procesamos los 16 bits
            jne .loop1        ; Si no, continúa el bucle
            
     PRINT_DEC 1, ebx    ; Imprime el total de bits que son 1
    ret