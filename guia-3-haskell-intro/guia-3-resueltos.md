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
-- Composicion f o g
h :: Integer -> Integer
h n = f (g n)

-- Composicion g o f
k :: Integer -> Integer
k n = g (f n)
```

## Ejercicio 2.  Especificar e implementar las siguientes funciones, incluyendo su signatura.

### a) absoluto: calcula el valor absoluto de un numero entero.

```
problema absoluto(n : Z) : Z {
    requiere: {True}
    asegura: {resultado es el valor absoluto de n}
}
```

```haskell
absoluto :: Integer -> Integer
absoluto n | n >= 0 = n
           | otherwise = (-n)
```


### b) maximoabsoluto: devuelve el maximo entre el valor absoluto de dos numeros enteros.

```
problema maximoabsoluto(n : Z, m : Z) : Z {
    require: {True}
    asegura: {resultado es igual al numero mas grande entre absoluto(n) y absoluto(m)}
}
```

```haskell
maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto n m | n_absoluto > m_absoluto = n_absoluto
                   | otherwise = m_absoluto
                   where
                   n_absoluto = absoluto n
                   m_absoluto = absoluto m
```

### c) maximo3: devuelve el maximo entre tres numeros enteros.


```
problema maximo3(n : Z, m : Z, o : Z) : Z {
    require: {True}
    asegura: {resultado es el maximo entre n, m y o}
}
```

```haskell
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 n m o | (n >= m && n >= o) = n
              | (m >= n && m >= o) = m
              | otherwise = o
```

### d) algunoEs0: dados dos numero racionales, decide si alguno de los dos es igual a 0 (hacerlo dos veces, una usando pattern matching y otra no).


```
problema algunoEs0(x : R, y : R) : Bool {
    require: {True}
    asegura: {resultado es True si uno de los dos es 0, sino es False}
}
```

```haskell
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | (x == 0.0 || y == 0.0) = True
              | otherwise = False

-- Version pattern matching:
algunoEs0_pm :: Float -> Float -> Bool
algunoEs0_pm 0 _ = True
algunoEs0_pm _ 0 = True
algunoEs0_pm _ _ = False
```

### e) ambosSon0: dados dos numeros racionales, decide si alguno de los dos es igual a 0.(hacerlo dos veces, una usando pattern matching y otra no)

```
problema ambosSon0(x : R, y : R) : Bool {
    require: {True}
    asegura: {resultado es True si ambos son 0, sino es False}
}
```

```haskell
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y = (x == 0 && y == 0)

-- Version pattern matching:
ambosSon0_pm :: Float -> Float -> Bool
ambosSon0_pm 0 0 = True
ambosSon0_pm _ _ = False

```

### f) mismoIntervalo: dados dos numeros reales, indica si estan relacionados considerando la relacion de equivalencia en R cuyas clases de equivalencia son (-inf, 3], (3, 7] y (7, inf+) o dicho de otra forma, si pertenecen al mismo intervalo.
```
problema mismoIntervalo(x : R, y : R) : Bool {
    requiere: {True}
    asegura: {resultado es True si (x <= 3 ^ y <= 3)} 
    asegura: {resultado es True si (x > 3 ^ x <= 7 ^ y > 3 ^ y <= 7)}
    asegura: {resultado es True si (x > 7 ^ y > 7)}
    asegura: {resultado es False si no se cumplen las condiciones sobre x e y de ninguno de los aseguras anteriores}
}
```

```haskell
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | (x <= 3 && y <= 3) = True
                   | (x > 3 && x <= 7 && y > 3 && y <= 7) = True
                   | (x > 7 && y > 7) = True
                   | otherwise = False
```

### g) sumaDistintos: que dados tres numeros enteros calcule la suma sin sumar repetidos (si los hubiera).

```
problema sumaDistintos(n : Z, m : Z, o : Z) : Z {
    requiere: {True}
    asegura: {resultado es la suma de los tres sin sumar repetidos}
}
```

```haskell
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos n m o | (n /= m && m /= o && n /= o) = (n + m + o)
                    | (n /= m && m == o) = (n + m)
                    | (n /= m && n == o) = (n + m)
                    | (n == m && m /= o) = (n + o)
                    | (n == m && m == o) = 0
```

### h) esMultiploDe: dados dos numeros naturales, decidir si el primero es multiplo del segundo.

```
problema esMultiploDe(n : Z, m : Z) : Z {
    requiere: {n y m son mayores a 0}
    asegura: {resultado es True si el primero es multiplo del segundo}
}
```

```haskell
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe n m | (n <= 0 || m <= 0) = undefined
                 | mod n m == 0 = True
                 | otherwise = False
```

### i) digitoUnidades: dado un numero entero, extrae su digito de las unidades.

```
problema digitoUnidades(n : Z) : Z {
    requiere: {True}
    asegura: {resultado es el digito de las unidades de n}
}
```

```haskell
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10
```

### j) digitoDecenas: dado un numero entero mayor a 9, extrae su digito de las decenas.

```
problema digitoDecenas(n : Z) : Z {
    requiere: {n > 9}
    asegura: {resultado es el digito de las decenas de n}
}
```

```haskell
digitoDecenas :: Integer -> Integer
digitoDecenas n | n <= 9 = undefined
                | otherwise = mod (div n 10) 10
```

## Ejercicio 3. Implementar una funcion estanRelacionados :: Integer -> Integer -> Bool 

```
problema estanRelacionados(a : Z, b : Z) {
		requiere: {a != 0 ^ b != 0}
		asegura: {(res = true) <-> a * a + a * b * k = 0 para algun k entero con k != 0}
}

Por ejemplo:
estanRelacionados 8 2 -> True porque existe un k = -4 tal que 8^2 + 8*2*(-4) = 0
estanRelacionados 7 3 -> False porque no existe un k entero tal que 7^2 = 7 * 3 * k = 0
```

```
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b | (mod numerador denominador) == 0 = True
                      | otherwise = False
                     where
					  numerador = a * a
					  denominador = a * b
```
