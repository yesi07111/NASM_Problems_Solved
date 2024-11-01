# Problema #53 Diferencia de Conjuntos
c_a = 3
A = [1, 3, 4]
c_b = 3
B = [1, 2, 3]

def DiffAWithB(A, B):
    print("A\B es: ")
    toPrint = True
    numToPrint = ''
    for a in A:
        for b in B:
            if a == b:
                toPrint = False
                break
        if toPrint:
            numToPrint += str(a) + ' '
        toPrint = True
    print(numToPrint)

DiffAWithB(A, B)

# Problema #68 Bits que son 1
n = 0xffff

def BitsCount(n):
    print("Cantidad de bits que son 1: ") 
    n = bin(n)
    count = 0
    for b in n:
        if b == '1':
            count += 1
    print(count)

BitsCount(n)

#Problema 76 Altura de un arbol binario
n = 15
array = [1, 2, 6, -1, 3, -1, -1, -1, -1, 4, 5, -1, -1, -1, -1]

def Altura(arr):
    print("La altura del árbol binario es: ")
    h = 1
    h0 = 1
    f = 0
    i = len(arr) - 1
    half = len(arr)//2 - 1

    while(i >= half):
        if arr[i] != -1:
            f = (i + 1)//2 - 1
            h0 += 1
            
            if f != 0:
                for t in range(10000):
                    f = (f + 1)//2 - 1
                    h0 += 1

                    if f == 0:
                        break
            if h0 > h: 
                h = h0
        i -= 1
        h0 = 1
    print(h)

Altura(array)

# Problema #92 Volumen de una pirámide
B = 4
h = 3

def VolPir(B, h):
    print("El volumen es " + str((B*h)//3) + " cm^3")

VolPir(B, h)