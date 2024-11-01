; ************************************************************
; Función: Cálculo del Volumen de una Pirámide
; 
; Descripción:
;   Calcula el volumen de una pirámide usando la fórmula:
;   V = (B * h) / 3
;   donde B es el área de la base y h es la altura
;
; Entradas:
;   - B: Área de la base (word)
;   - h: Altura de la pirámide (word)
;
; Salida:
;   Imprime el volumen de la pirámide
;
; Ejemplo:
;   B = 4 (área de la base)
;   h = 3 (altura)
;   Resultado: 4 (volumen = (4 * 3) / 3 = 4)
; ************************************************************

%include "io.inc"

section .data
    B dw 4            ; Área de la base
    h dw 3            ; Altura de la pirámide

section .text
    global _start
    global main
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp      ; Para depuración correcta
    xor eax, eax      ; Limpia el registro eax
    xor ebx, ebx      ; Limpia el registro ebx
    
    mov ax, [B]       ; Carga el área de la base en ax
    mov bx, [h]       ; Carga la altura en bx
    imul bx           ; Multiplica ax por bx (B * h)
    
    xor ebx, ebx      ; Limpia ebx para el divisor
    mov bx, 3         ; Carga el divisor (3)
    idiv bx           ; Divide ax entre bx ((B * h) / 3)
    
    PRINT_DEC 1, ax   ; Imprime el resultado
    ret