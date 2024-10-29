'''
#######################
##### EJERCICIO I #####
#######################

Enunciado: 
Implementar una funcion generar_nros_al_azar(in cantidad : int, in desde : int, in hasta: int) -> Pila[int] que genere una pila de cantidad de numeros enteros al azar en el rango [desde, hasta]

Pueden usar la funcion random.randint(< desde >, < hasta >) y la clase LifoQueue() que es un ejemplo de una implementacion basica:

    from queue import LifoQueue as Pila
    p = Pila()
    p.put(1) # apilar
    elemento = p.get() # desapilar
    p.empty() # vacia?

'''
from queue import LifoQueue as Pila
import random

def generar_nros_al_azar(cantidad : int, desde : int, hasta : int) -> Pila:
    pila = Pila()
    for i in range(cantidad):
        pila.put(random.randint(desde, hasta))

    return pila


def imprimir_pila(pila : Pila):
    if pila.empty():
        return

    pila_temp = Pila()
    print("[", end="")
    while not (pila.empty()):
        elem = pila.get()
        print('{0}, '.format(elem), end="")
        pila_temp.put(elem)

    print("]", end="")
    poner_todos(pila_temp, pila)

# pone todos los elem de pila en pila2
def poner_todos(pila : Pila, pila2 : Pila) -> Pila:
    while not (pila.empty()):
        pila2.put(pila.get())


def get_unmodified(pila : Pila):
    last = pila.get()
    pila.put(last)
    return last

imprimir_pila(generar_nros_al_azar(100,1,100))
# usando la funcion dos veces probamos que pilita1 quedo desafectada
# imprimir_pila(pilita1)

