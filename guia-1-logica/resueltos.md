# Introducciona a la programacion - Guia Practica 1

### Nota: No todos los ejercicios estan hechos, solo los que considero que:
    - Tienen dificultad
    - Me parecen interesantes.

### Idealmente es estudiar de la forma que mas util me sea, no haciendo todo.

## Ejercicio 7. Usando las reglas de equivalencia del ejercicio anterior, simplificar las siguientes formulas. Indicar en cada paso que regla se utilizo. 

### a) ((p ^ p) V p)

1. ((p ^ p) V p)
2. Aplico idempotencia: (p  V p)
3. Aplico idempotencia: p

### c) (((p ^ (~p V q)) V q) V (p ^ (p V q)))

1. (((p ^ (~p V q)) V q) V (p ^ (p V q)))

2. Aplico absorcion de la conjuncion: (p ^ (p V q)) -> p: 
    (((p ^ (~p V q)) V q) V p)

3. Distribucion de la conjuncion: (p ^ (~p V q)) -> ((p ^ ~p) V (p ^ q))
Me queda: ((((p ^ ~p) V (p ^ q)) V q) V p)

4. Contradiccion de la conjuncion: (p ^ ~p) -> False.
Me queda: ((( False V (p ^ q)) V q) V p)

5. Neutro de la disyuncion: (False V (p ^ q)) -> (p ^ q)
Me queda: (((p ^ q) V q) V p)

6. Absorcion de la disyuncion: ((p ^ q) V q) -> q
Me queda: (q V p)


### e) (((p -> q) ^ (p ^ ~q)) -> q)

1. Reemplazo (p -> q) por (~p V q):

(((~p V q) ^ (p ^ ~q)) -> q)

2. Llamo r a (~p V q) y me queda negativo de r = ~r = ~(~p V q) = (p ^ ~q):
((c ^ ~c) -> q)

3. Reemplazo (c ^ ~c) por False, inversa de la conjuncion:

(False -> q)

4. Reemplazo la implicacion por un OR (Implicacion material):

(~False V q) = (True V q)


5. Por dominacion de la disyuncion:

True.

