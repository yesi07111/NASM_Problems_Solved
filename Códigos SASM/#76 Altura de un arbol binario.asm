; ************************************************************
; Función: Cálculo de Altura de Árbol Binario
; 
; Descripción:
;   Calcula la altura de un árbol binario representado en un array
;   donde los nodos vacíos se representan con -1.
;   La altura es la longitud del camino más largo desde la raíz
;   hasta cualquier hoja.
;
; Entradas:
;   - n: Tamaño del array (double word)
;   - array: Array que representa el árbol binario (words)
;           Los nodos vacíos se representan con -1 (0xFFFF)
;
; Salida:
;   Imprime la altura del árbol
;
; Ejemplo:
;   array = [1, 2, 6, -1, 3, -1, -1, -1, -1, 4, 5, -1, -1, -1, -1]
;   Resultado: 4 (altura del árbol)
; 
; Representación del árbol del ejemplo:
;       1
;      / \
;     2   6
;    /     
;   3      
;  / \     
; 4   5    
; ************************************************************

%include "io.inc"

section .data
    n dd 15                  ; Tamaño del array
    array dw 1, 2, 6, -1, 3, -1, -1, -1, -1, 4, 5, -1, -1, -1, -1  ; Árbol binario
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp            ; Para depuración correcta
    
    ; Inicialización de registros
    xor eax, eax           ; Limpia eax (usado para guardar posición temporal)
    xor ebx, ebx           ; Limpia ebx (valor del nodo actual)
    xor ecx, ecx           ; Limpia ecx (contador de altura actual)
    xor edx, edx           ; Limpia edx (altura máxima encontrada)
    xor esi, esi           ; Limpia esi (índice actual)
    xor edi, edi           ; Limpia edi (mitad del array)
    
    mov esi, [n]           ; Carga tamaño del array
    mov edi, [n]           ; Copia tamaño del array
    add esi, 1             ; Ajusta índice inicial
    shr edi, 1             ; Calcula mitad del array
    
    .Next_Node:            ; Procesa siguiente nodo
        xor ebx, ebx       ; Limpia registro para nuevo nodo
        sub esi, 1         ; Decrementa índice
        
    .loop1:                ; Bucle principal
        shl esi, 1         ; Multiplica índice por 2 para acceso
        mov bx, [array + esi - 2]  ; Obtiene valor del nodo
        shr esi, 1         ; Restaura índice
        cmp esi, edi       ; Comprueba si llegó a la mitad
        jle .END           ; Si llegó, termina
        cmp bx, 0xffff     ; Comprueba si es nodo vacío (-1)
        jz .Next_Node      ; Si es vacío, siguiente nodo
        
        xor eax, eax       ; Prepara para guardar posición
        mov eax, esi       ; Guarda posición actual
        
        .Next_Father:      ; Calcula altura recorriendo hacia la raíz
            add esi, 1     ; Ajusta para cálculo de padre
            shr esi, 1     ; Calcula índice del padre
            sub esi, 1     ; Ajusta índice
            
        .Inc_h:           ; Incrementa altura
            inc ecx        ; Aumenta contador de altura
            cmp esi, 1     ; Comprueba si llegó a la raíz
            jnle .Next_Father  ; Si no es raíz, continúa subiendo
        
        ; Actualiza altura máxima si es necesario
        cmp edx, ecx       ; Compara con altura máxima actual
        jge .h_was_less    ; Si actual es menor, no actualiza
        xor edx, edx       ; Limpia máximo anterior
        mov edx, ecx       ; Actualiza nuevo máximo
        
        .h_was_less:      ; Restaura registros para siguiente iteración
            xor ecx, ecx   ; Limpia contador de altura
            xor esi, esi   ; Limpia índice
            xor ebx, ebx   ; Limpia valor de nodo
            
            mov esi, eax   ; Restaura posición original
            xor eax, eax   ; Limpia registro temporal
            sub esi, 1     ; Ajusta índice
            cmp esi, edi   ; Comprueba si llegó a la mitad
            jnle .loop1    ; Si no llegó, continúa
        
    .END:                 ; Finalización
        add edx, 1        ; Ajusta altura final
        PRINT_DEC 1, edx  ; Imprime resultado
    ret