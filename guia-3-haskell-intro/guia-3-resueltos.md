# 1. Definicion de funciones basicas.

## Ejercicio 1. 

### a) Implementar la funcion parcial f :: Integer -> Integer definida por extension de la siguiente manera:

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

```haskell
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b | (mod numerador denominador) == 0 = True
                      | otherwise = False
                     where
					  numerador = a * a
					  denominador = a * b
```

## Ejercicio 4. Especificar e implementar las siguientes funciones, utilizando tuplas para representar pares, ternas de numeros.

### a) prodInt: calcula el producto interno entre dos tuplas R x R

```
problema prodInt(a : R x R, b : R x R) : R {
		requiere: {True}
		asegura: { resulado es el producto interno entre a y b}
}
```

```haskell
prodInt :: (Number, Number) -> (Number, Number) -> Number
prodInt = 1

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt a b = (fst (a) * fst(b)) + (snd(a) * snd(b))
```

### b) todoMenor: Dadas dos tuplas RxR decide si todas las coordenadas de la primera son menores que los de la segunda.

```
problema todoMenor(a : R x R, b : R x R) : Bool {
		requiere: {True}
		asegura: {resultado es True si la primera y segunda coordenada de a es menor a la primera y segunda de b}
}
```

```haskell
todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor a b = (fst(a) < fst(b) && snd(a) < snd(b))
```

### c) distanciaPuntos: Calcula la distancia entre dos puntos de R x R.

```
problema distanciaPuntos(a : R x R, b : R x R) : R {
		requiere: {True}
		asegura: {resultado es la distancia entre a y b}
}
```

```haskell
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos a b = sqrt (((fst(b) - fst(a) ) ^ 2) + ((snd(b) - snd(a) ) ^ 2))
```

### d) sumaTerna: Dada una terna de enteros, calcula la suma de sus tres elementos.

```
problema sumaTerna(a: Z x Z x Z) : Z {
		requiere: {True}
		asegura: {resultado es la suma de los tres componentes de a}
}
```

```haskell
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (a, b, c) = a + b + c
```

### e) sumarSoloMultiplos: Dada una terna de enteros y un natural, calcula la suma de los elementos que son multiplos del numero natural.

```
problema sumarSoloMultiplos(a: Z x Z x Z, b: Z) {
		requiere: {b > 0}
		asegura: {resultado es la suma de los componentes que sean multiplos de b}
}
```

```haskell
sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (a, b, c) n = (esMultiploODefault (a,n) 0) + (esMultiploODefault (b,n) 0) + (esMultiploODefault (c,n) 0)

esMultiploODefault :: (Integer, Integer) -> Integer -> Integer
esMultiploODefault (a, b) n | mod a b == 0 = a
```

### f) posPrimerPar: Dada una terna de enteros devuelve la posicion del primer par, sino hay uno, devuelve 4.

```
problema posPrimerPar(a: Z x Z x Z) : Z {
		requiere: {True}
		asegura: {resultado es la posicion en la que se encontro al primer numero par, sino hay uno, resultado es 4}
}
```

### g) crearPar: crea un par a partir de sus componentes dadas por separado, debe funcionar para cualquier tipo


```
problema crearPar(a: t, b: t) : (t x t) {
		requiere: {True}
		asegura: {resultado es una dupla donde la primer componente es a y la segunda es b}
}
```

```haskell
crearPar :: t -> t -> (t, t)
crearPar a b = (a, b)
```

### h) invertir: Dada una dupla de cualquier tipo, devolver la misma dupla inveritda.

```
problema invertir(a: t x t) : (t x t) {
		requiere: {True}
		asegura: {resultado es la misma a pero invertida}
}
```

```haskell
invertir :: (t, t) -> (t, t)
invertir (a, b) = (b, a)
```

## Ejercicio 5. Implementar la funcion todosMenores :: (Integer, Integer, Integer) -> Bool


```
problema todosMenores(t: Z x Z x Z) : Bool {
		requiere: {True}
		asegura: {(res = true) <=> ((f(t0) > g(t0)) ^ (f(t1) > g(t1)) ^ (f(t0) > g(t0)))}
}


problema f1(n: Z) : Z {
		requiere: {True}
		asegura: { (n <= 7 => res = n^2) ^ (n > 7 => res = 2n -1)}
}

problema g1(n: Z) : Z {
		requiere: {True}
		asegura: {Si n es un numero par, entonces res = n / 2, en caso contrario res = 3n + 1 }
}
```


## Ejercicio 6: Usando los siguientes tipos

```
type Anio = Integer
type EsBisiesto = Bool
```

Programar una funcion ```bisiesto :: Anio -> EsBisiesto segun la siguiente especificacion:

```
problema bisiesto(año : Z) : Bool {
		requiere: {True}
		asegura: { res = false <=> año no es multiplo de 4, o año es multiplo de 100 pero no de 400}
}

Por ejemplo:

bisiesto 1901 --> False
bisiesto 1900 --> False
bisiesto 1904 --> True
bisiesto 2000 --> True
```

```haskell
type Anio = Integer
type EsBisiesto = Bool

bisiesto :: Anio -> EsBisiesto
bisiesto n | ((esMultiploDe n 4) == False || ((esMultiploDe n 100) && (esMultiploDe n 400) == False)) = False
           | otherwise = True
```

## Ejercicio 7: 

### a) Implementar una funcion:

```
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float

problema distanciaManhattan(p, q: R x R x R) {
		requiere: {True}
		asegura: {res = sum(i =0, 2) {absoluto(pi - qi)} }
}

Por ejemplo:
distanciaManhattan (2, 3, 4) (7, 3, 8) --> 9
distanciaManhattan ((-1), 0, (-8.5)) (3.3, 4, (-4)) --> 12.8
```

```haskell
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (t1, t2, t3) (y1, y2, y3) = absolutoBis (t1 - y1) + absolutoBis (t2 - y2) + absolutoBis (t3 - y3)

absolutoBis :: Float -> Float
absolutoBis n | n >= 0 = n
              | otherwise = (-1) * n
```

