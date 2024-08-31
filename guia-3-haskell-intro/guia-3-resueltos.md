# 1. Definicion de funciones basicas.

## Ejercicio 1. 

a) Implementar la funcion parcial f :: Integer -> Integer definida por extension de la siguiente manera:

- f(1) = 8
- f(4) = 131
- f(16) = 16

cuya especificacion es la siguiente:

```
problema f (n: Z) : Z {
    requiere: { n = 1 V n = 4 V n = 16 }
    asegura: { (n = 1 -> result = 8)  ^ (n = 4 -> result = 131) ^ (n = 16 -> result = 16) }
}
```

```haskell
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16
```


### Resolucion:

### Fin resolucion.

b) Analogamente, especificar e implementar la funcion parcial g :: Integer -> Integer

- g(8) = 16
- g(16) = 4
- g(131) = 1

### Resolucion:


## Especificacion:

```
problema g (n: Z) : Z {
    requiere: { n = 8 V n = 16 V n = 131 }
    asegura: { (n = 8 -> result = 16)  ^ (n = 16 -> result = 4) ^ (n = 131 -> result = 1) }
}
```

## Codigo:

```haskell
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1
```

### Fin resolucion.

c) A partir de las funciones definidas en los item 1 y 2, implementar las funciones parciales h = f o g y k = g o f


```haskell
-- Funcion compuesta h = f(g(h))
h :: Integer -> Integer
h n = f (g n)
```

## Ejercicio 2. 
