# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
# se debería devolver res = [3,4,5] ó res = [3,5,4] ó res = [4,3,5] ó res = [4,5,3] 
# ó res = [5,3,4] ó res = [5,4,3]

def pertenece(elemento : int, lista : [int]) -> bool:
    for el in lista:
        if elemento == el:
            return True
    return False

def elementos_exclusivos(s : [int], t : [int]) -> [int]:
    res : [int] = []
    listas = s + t
    for el in listas:
        if not (pertenece(el, s) and pertenece(el, t)) and (not pertenece(el,res)):
            res.append(el)

    return res


s = [-1, 4, 0, 4, 3, 0, 100, 0, -1, -1]
t = [0,100,5,0,100,-1,5]

print(elementos_exclusivos(s, t))


# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2

def existe_en_dict(gesuchte_schluessel : str, diccionario) -> bool:
    for key in diccionario.keys():
        if key == gesuchte_schluessel:
            return True

    return False


def contar_traducciones_iguales(ing: dict, ale : dict) -> int:
    iguales = 0
    for key in ing.keys():
        if existe_en_dict(key, ale) and ing[key] == ale[key]:
            iguales += 1

    return iguales

aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
ingles = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}

print(contar_traducciones_iguales(ingles, aleman))
