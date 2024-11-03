# IMPORTS
from queue import LifoQueue as Pila
import random

def imprimir_pila(pila : Pila):
    if pila.empty():
        return

    pila_temp = Pila()
    copiar_pila(pila, pila_temp)
    print("[", end="")
    while not (pila.empty()):
        elem = pila.get()
        print('{0}, '.format(elem), end="")

    print("]")
    copiar_pila(pila_temp, pila)

# Genera una nueva pila con los mismos elemntos de la ingresada sin vaciarla.
def copiar_pila(pila : Pila, pilaCopy : Pila) -> Pila:
    pila_temp = Pila()
    while not (pila.empty()):
        elem = pila.get()
        pilaCopy.put(elem)
        pila_temp.put(elem)

    while not (pila_temp.empty()):
        pila.put(pila_temp.get())


'''
##### EJERCICIO 1

Enunciado: 
Implementar una funcion generar_nros_al_azar(in cantidad : int, in desde : int, in hasta: int) -> Pila[int] que genere una pila de cantidad de numeros enteros al azar en el rango [desde, hasta]

Pueden usar la funcion random.randint(< desde >, < hasta >) y la clase LifoQueue() que es un ejemplo de una implementacion basica:

    from queue import LifoQueue as Pila
    p = Pila()
    p.put(1) # apilar
    elemento = p.get() # desapilar
    p.empty() # vacia?

'''

def generar_nros_al_azar(cantidad : int, desde : int, hasta : int) -> Pila:
    pila = Pila()
    for i in range(cantidad):
        pila.put(random.randint(desde, hasta))

    return pila

'''
#### EJERCICIO 2

Enunciado: 
Implementar una funcion cantidad_elementos(in p : Pila) -> int que, dada una pila, cuente y devuelva la cantidad de elementos que contiene. No se puede utilizar la funcion LifoQueue.qsize(). Si se usa get() para recorrer la pila, esto modifica el parametro de entrada. Y como la especificacion dice que es de tipo in hay que restaurarla.
'''

def cantidad_elementos(pila : Pila) -> int:
    if (pila.empty()):
        return 0

    cantidad = 0
    pila_temporal : Pila = Pila()
    copiar_pila(pila, pila_temporal)
    while not(pila.empty()):
        pila.get()
        cantidad += 1


    copiar_pila(pila_temporal, pila)
    return cantidad

'''
#### EJERCICIO 3
'''

def buscar_el_maximo(pila : Pila[int]) -> int:
    if (pila.empty()):
        return 0

    maximo : int = 0
    pila_temporal : Pila = Pila()
    copiar_pila(pila, pila_temporal)

    while not(pila.empty()):
        elem = pila.get()
        if elem > maximo:
            maximo = elem

    copiar_pila(pila_temporal, pila)
    return maximo

'''
#### EJERCICIO 4
'''

def buscar_nota_maxima(pila : Pila[tuple[str,int]]) -> tuple[str, int]:
    pila_temporal = Pila()
    copiar_pila(pila, pila_temporal)

    maximo : tuple[str, int] = ("", 0)
    while not(pila.empty()):
        nombre, nota = pila.get()
        if nota > maximo[1]:
            maximo = (nombre, nota)

    copiar_pila(pila_temporal, pila)
    return maximo

def esta_bien_balanceada(formula : str) -> bool:
    if formula == "":
        return True

    parentesis_a_cerrar : int = 0
    for character in formula:
        if character == '(':
            parentesis_a_cerrar += 1
        elif character == ')' and parentesis_a_cerrar > 0:
            parentesis_a_cerrar -= 1

    if parentesis_a_cerrar > 0:
        return False

    return True
