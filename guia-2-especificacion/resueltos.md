# Introducciona a la programacion - Guia Practica 1

### Nota: No todos los ejercicios estan hechos, solo los que considero que:
    - Tienen dificultad
    - Me parecen interesantes.

### Idealmente es estudiar de la forma que mas util me sea, no haciendo todo.

## Ejercicio 4. Se desea especificar el problema de duplicar todos los valores de la secuencia y se cuenta con la siguiente especificacion:

```
problema duplicarTodos (s: seq⟨Z⟩) : seq⟨Z⟩ {
requiere: {True}
asegura: {resultado tiene la misma cantidad de elementos que s}
}
```

a) ¿Que problemas tiene la especificacion dada? Dar ejemplos de valores para resultado que satisfagan la especificacion pero no
sean respuestas correctas.
b) Indicar cual/es se los siguientes asegura deberia/n ser agregado/s a la especificacion. Justificar en cada caso por que deberian
o no ser agregados.
asegura: {Para cada valor x que pertenece a s, hay algun valor en resultado que es la salida de duplicar(x).}
asegura: {En cada posicion de resultado, el valor es mayor al valor en esa misma posicion de s.}
asegura: {En cada posicion de resultado, el valor es igual a la salida de aplicar duplicar() al valor en esa misma posicion
de s.}
asegura: {Todos los elementos de resultado son numeros pares.}
Nota: el problema duplicar() esta especificado en el Ejercicio 1.
