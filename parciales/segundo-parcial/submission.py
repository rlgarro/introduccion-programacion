from queue import Queue as Cola
from queue import LifoQueue as Pila

# Ejercicio 1
def es_primo(n: int) -> bool:
    if n == 1:
        return False

    divisor: int = 2
    while divisor < n:
        if n % divisor == 0:
            return False
        divisor += 1

    return True

def pertenece(n: int, numeros: list[int]) -> bool:
    for numero in numeros:
        if n == numero:
            return True

    return False

def obtener_primos_divisores(n: int) -> list[int]:
    divisor: int = 2
    primos: list[int]  = []
    while divisor <= n:
        if n % divisor == 0 and es_primo(divisor) and not pertenece(divisor, primos):
            primos.append(divisor)

        divisor += 1

    return primos

def pertenece_dict(n: int, dictionary: dict[int, int]) -> bool:
    for key in dictionary.keys():
        if n == key:
            return True

    return False

def multiplos_de_primos(v: list[int]) -> dict[int,int]:
    primos: dict[int, int] = {}
    for numero in v:
        primos_divisores = obtener_primos_divisores(numero)
        for primo in primos_divisores:
            if pertenece_dict(primo, primos):
                apariciones = primos[primo]
                primos[primo] = apariciones + 1
            else:
                primos[primo] = 1

    return primos

# Ejercicio 2
def long_secuencia_de_unos(lista: list[int]) -> int:
    max_consecucion: int = 0
    conteo_actual: int = 0
    for n in lista:
        if n == 1:
            conteo_actual += 1
        elif conteo_actual > max_consecucion:
            max_consecucion = conteo_actual
            conteo_actual = 0

    if conteo_actual > max_consecucion:
        max_consecucion = conteo_actual

    return max_consecucion

def longitud_mas_grande(A: list[list[int]]) -> int:
    longitud_mas_grande: int = 0
    for lista in A:
        longitud = long_secuencia_de_unos(lista)
        if longitud > longitud_mas_grande:
            longitud_mas_grande = longitud

    return longitud_mas_grande

# Ejercicio 3
def string_size(s: str) -> int:
    size = 0
    for char in s:
        size += 1

    return size


def resolver(cuenta: str) -> int:
    ultimo_numero: int = 0
    numero: str = ""
    ultima_operacion: str = ""
    suma: int = 0
    for i in range(string_size(cuenta)):
        # empiezo el siguiente numero y termino el anterior
        actual = cuenta[i]
        if (actual == '+' or actual == '-') and i == 0:
            numero += actual

        elif (actual == '+' or actual == '-') and i != 0:
            suma += int(numero)
            numero = actual
        
        else:
            numero += actual

    suma += int(numero)
            
    return suma

def int_size(lista: list[int]) -> int:
    size = 0
    for n in lista:
        size += 1
    return size

def reverse(lista: list[int]) -> list[int]:
    res: [int] = []
    index = int_size(lista) - 1
    while index >= 0:
        res.append(lista[index])
        index -= 1

    return res


def resolver_cuentas(A: Pila[str]) -> list[int]:
    res: [int] = []

    pila_temp: Pila[str] = Pila()

    while not A.empty():
        cuenta_actual = A.get()
        pila_temp.put(cuenta_actual)
        res.append(resolver(cuenta_actual))

    while not pila_temp.empty():
        A.put(pila_temp.get())

    return reverse(res)

# Ejercicio 4
def obtener_maximo(s: list[tuple[int,int]]) -> int:
    maximo :int = 1
    for tupla in s:
        if tupla[0] > maximo:
            maximo = tupla[0]
        if tupla[1] > maximo:
            maximo = tupla[1]

    return maximo

def generar_lista_perfecta(maximo: int) -> list[tuple[int,int]]:
    lista_perfecta = []
    for i in range(1, maximo + 1):
        for j in range(1, maximo + 1):
            lista_perfecta.append((i, j))

    return lista_perfecta

def pertenece(tupla: tuple[int, int], lista: list[int]) -> bool:
    for el in lista:
        if el == tupla:
            return True

    return False

def dame_el_que_falta(s: list[tuple[int,int]]) -> tuple[int,int]:
    maximo = obtener_maximo(s)
    lista_perfecta = generar_lista_perfecta(maximo)
    for tupla in lista_perfecta:
        if not pertenece(tupla, s):
            return tupla

    return (0,0)
