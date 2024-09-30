# Ejercicios tipo parcial
Departamento de Computación
Facultad de Ciencias Exactas y Naturales
Universidad de Buenos Aires


# Sistema de stock
Una reconocida empresa de comercio electronico nos pide desarrollar un sistema de stock de mercaderia. El conjunto de
mercaderias puede representarse con una secuencia de nombres de los productos, donde puede haber productos repetidos. El
stock puede representarse como una secuencia de tuplas de dos elementos, donde el primero es el nombre del producto y el
segundo es la cantidad que hay en stock (en este caso no hay nombre de productos repetidos). Tambi´en se cuenta con una
lista de precios de productos representada como una secuencia de tuplas de dos elementos, donde el primero es el nombre
del producto y el segundo es el precio.
Para implementar este sistema nos enviaron las siguientes especificaciones y nos pidieron que hagamos el desarrollo
enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en la materia Introducci´on a la
Programacion / Algoritmos y Estructuras de Datos I (FCEyN-UBA)


## Ejercicio 1. Implementar la funcion productos :: [String] -> [(String, Int)]

```
problema generarStock(productos: seq<String>) : seq<String x Z> {
    asegura: { La longitud de res es igual a la cantidad de productos distintos que hay en productos }
    asegura: { Para cada producto que pertenece a productos existe un i tal que 0 <= i < |res| y res[i]_0 = producto y res[i]_1 es igual a la cantidad de veces que aparece producto en productos}
}
```

```haskell
generarStock :: [String] -> [(String, Int)]
generarStock [] = []
generarStock (x:xs) = (contarProducto x xs) : generarStock (sacarProducto x xs)

sacarProducto :: String -> [String] -> [String]
sacarProducto _ [] = []
sacarProducto producto (x:xs) | producto == x = (sacarProducto producto xs)
                              | otherwise = x : (sacarProducto producto xs)

contarProducto :: String -> [String] -> (String, Int)
contarProducto nombreProducto [] = (nombreProducto, 1)
contarProducto nombreProducto (productoActual:resto) | nombreProducto == productoActual = (nombreProducto, snd (contarProducto nombreProducto resto) + 1)
                                                     | otherwise = (contarProducto nombreProducto resto)
```

### Ejercicio 2. Implementar la funcion stockDeProducto :: [(String, Int)] -> String -> Int

```
problema stockDeProducto(stock: seq<String x Z>, producto: String) : Z {
    requiere: {No hay productos repetidos en stock}
    requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
    asegura: {(res = 0 si producto no se encuentra en el stock) o (existe un i tal que 0<= i < |stock| y producto = stock[i]_0 y res = stock[i]_1}
}
```

```haskell
stockDeProducto :: [(String, Int)] -> String -> Int
stockDeProducto [] _ = 0
stockDeProducto (producto:productos) nombreProducto | fst producto == nombreProducto = snd producto
                                                    | otherwise = stockDeProducto productos nombreProducto
```

### Ejercicio 3. Implementar la funcion dineroEnStock :: [(String, Int)] -> [(String, Float)] -> Float

```haskell
dineroEnStock :: [(String, Int)] -> [(String, Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock (productoActual:productosRestantes) precios = (precioProducto * fromIntegral (snd productoActual)) + (dineroEnStock productosRestantes precios)
                                                          where precioProducto = precioDeProducto (fst productoActual) precios

precioDeProducto :: String -> [(String, Float)] -> Float
precioDeProducto producto (precioProducto:preciosRestantes) | producto == (fst precioProducto) = snd precioProducto
                                                            | otherwise = precioDeProducto producto preciosRestantes

```

### Ejercicio 4. Implementar la funcion aplicarOferta :: [(String, Int)] -> [(String, Float)] -> [(String, Float])


```
problema aplicarOferta(stock: seq<String x Z>, precios: seq<String x R>) : seq<String x R> {

requiere: {No hay productos repetidos en stock}
requiere: {No hay productos repetidos en precios}
requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
requiere: {Todas los precios (segundas componentes) de precios son mayores a cero}
requiere: {Todo producto de stock aparece en la lista de precios}
asegura: {|res| = |precios|}
asegura: {Para todo 0 <= i < |precios|, si stockDeProducto(stock, precios[i]_0) > 10, entonces res[i]_0 = precios[i]_0 y res[i]_1 = precios[i]_1 * 0.80 }
asegura: {Para todo 0 <= i < |precios|, si stockDeProducto(stock, precios[i]_0) <= 10, entonces res[i]_0 = precios[i]_0 y res[i]_1 = precios[i]_1}
}
```

```haskell
aplicarOferta :: [(String, Int)] -> [(String, Float)] -> [(String, Float)]
aplicarOferta _ [] = []
aplicarOferta stock (precio:preciosRestantes) = (fst precio, precioFinalProducto) : (aplicarOferta stock preciosRestantes)
                                              where precioFinalProducto = getPrecioFinalProducto (snd precio) (stockDeProducto stock (fst precio))

getPrecioFinalProducto :: Float -> Int -> Float
getPrecioFinalProducto precioOriginal stock | stock > 10 = precioOriginal * 0.8
                                            | otherwise = precioOriginal
```


### Ejercicio 5. Implementar la funcion maximo :: Tablero -> Int

```
problema maximo(t: Tablero) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma y tienen al menos un elemento}
requiere: {Existe al menos una columna en el tablero t}
requiere: {El tablero t no es vacio, todos los numeros del tablero son positivos, mayor estricto a 0}
asegura: {res es igual al numero mas grande del tablero t}
}
```

```haskell
type Fila = [Int]
type Tablero = [Fila] -- Cada fila tiene de forma asegurada al pasarse como param, la misma longitud. Tablero viene a ser [[...], [...]..., [...]]
type Posicion = (Int, Int) -- (fila, columna)
type Camino = [Posicion]


maximo :: Tablero -> Int
maximo [unicaFila] = maximoEnFila unicaFila
maximo (filaActual:restoDeFilas) | maximoEnFila filaActual > maximo restoDeFilas = maximoEnFila filaActual
                                 | otherwise = maximo restoDeFilas

maximoEnFila :: Fila -> Int
maximoEnFila [ultimo] = ultimo
maximoEnFila (actual:restoDeFila) | actual > maximoFilaRestante = actual
```

### Ejercicio 6. Implementar la funcion masRepetido : Tablero -> Int

```
problema masRepetido(t: Tablero) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma y tienen al menos un elemento}
requiere: {Existe al menos una columna en el tablero t}
requiere: {El tablero t no es vacio, todos los numeros del tablero son positivos, mayor estricto a 0},
asegura: {res es igual al numero que mas eces aparece en un tablero t. Si hay empate devuelve cualquiera de ellos}
}
```

```haskell
type Aparicion = (Int,Int) -- (numero, cantidad de apariciones de numero)

masRepetido :: Tablero -> Int
masRepetido tablero = masOcurrente tableroUnificado tableroUnificado
                    where 
                    tableroUnificado = unificarEnFila tablero

masOcurrente :: Fila -> Fila -> Int
masOcurrente [ultimoElem] _ = ultimoElem
masOcurrente (actual:siguiente:restantes) filaCompleta | snd (aparicion actual filaCompleta) > snd (aparicion siguiente filaCompleta) = masOcurrente (actual:restantes) filaCompleta
                                                       | otherwise = masOcurrente (siguiente:restantes) filaCompleta

unificarEnFila :: Tablero -> Fila
unificarEnFila [] = []
unificarEnFila (filaActual:restoFilas) = (unificarEnFila restoFilas) ++ filaActual

aparicion :: Int -> Fila -> Aparicion
aparicion n [] = (n, 0)
aparicion n (elemActual:restoFila) | n == elemActual = (n, snd (aparicion n restoFila) + 1)
                                   | otherwise = (n, snd (aparicion n restoFila))
```

### Ejercicio 7. Implementar la funcion valoresDeCamino :: Tablero -> Camino -> [Int]

```
problema valoresDeCamino(t: Tablero, c: Camino) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma y tienen al menos un elemento}
requiere: {Existe al menos una columna en el tablero t}
requiere: {El tablero t no es vacio, todos los numeros del tablero son positivos, mayor estricto a 0},
requiere: {El camino c es un camino valido, es decir, secuencia de posiciones adyacentes en la que solo es posible desplazarse hacia la posicion de la derecha o hacia y abajo y todas las posiciones estan dentro de los limites del tablero t}
asegura: {res es igual a la secuencia de numeros que estan en el camino c, ordenados de la misma forma que aparecen las posiciones correspondientes en el camino}
}
```

```haskell
valoresDeCamino :: Tablero -> Camino -> [Int]
valoresDeCamino tablero camino = valores tablero camino 1

obtenerElemento :: Posicion -> Fila -> Int -> Int
obtenerElemento (fila, columna) (elemActual:elementos) indiceElemento | columna /= indiceElemento = obtenerElemento (fila, columna) elementos (indiceElemento + 1)
                                                                      | otherwise = elemActual

obtenerPorPosicion :: Posicion -> Fila -> Int
obtenerPorPosicion posicion fila = obtenerElemento posicion fila 1


filaPosicion :: Posicion -> Int
filaPosicion (n, _) = n

valores :: Tablero -> Camino -> Int -> [Int]
valores _ [] _ = []
valores [] _ _ = []
valores (fila:filas) [ultimaPosicion] _ = (obtenerPorPosicion ultimaPosicion fila) : []
valores (fila:filas) (posicion:posicionSiguiente:posiciones) filaActual | (filaPosicion posicion) /= filaActual = valores filas (posicion:posicionSiguiente:posiciones) (filaActual + 1)
                                                                        | (filaPosicion posicion) == (filaPosicion posicionSiguiente) = (obtenerPorPosicion posicion fila) : valores (fila:filas) (posicionSiguiente:posiciones) filaActual
                                                                        | otherwise = (obtenerPorPosicion posicion fila) : (valores filas (posicionSiguiente:posiciones) (filaActual + 1))
```

### Ejercicio 8. Implementar la funcion esCaminoFibo :: [Int] -> Int -> Bool

```
problema esCaminoFibo (s:seq<Z>, i: Z) : Bool {
    requiere: {la secuencia de numeros s es no vacia y esta compuesta por numeros positivos (mayor estricto que 0) que representan los valores de un camino en un tablero}
    requiere: {i>= 0}
    asegura: {res = true <=> los valores de s son la sucesion de Fibonacci inicializada con el numero pasado como paratro i}
}
```
```haskell
esCaminoFibo :: [Int] -> Int -> Bool
esCaminoFibo [ultimoValor] indice = ultimoValor == (fibonacci indice)
esCaminoFibo (valor:valores) indiceActual = (valor == fibonacci indiceActual) && esCaminoFibo valores (indiceActual + 1)


fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
```

### Ejercicio 9. Implementar la funcion divisoresPropios :: Int -> [Int]

```
problema divisoresPropios(n: Z) : seq<Z> {
 requiere: {n > 0}
 asegura: {res es la lista de divisores de propios de n, ordenada de mayor a menor}
}
```

```haskell
divisoresPropios :: Int -> [Int]
divisoresPropios 1 = [1]
divisoresPropios n = 1 : obtenerDivisores n 2

obtenerDivisores :: Int -> Int -> [Int]
obtenerDivisores dividendo divisorActual | dividendo == divisorActual = []
obtenerDivisores dividendo divisorActual | mod dividendo divisorActual == 0 = divisorActual : obtenerDivisores dividendo (divisorActual + 1)
                                         | otherwise = obtenerDivisores dividendo (divisorActual + 1)
```

### Ejercicio 10. Implementar la funcion sonAmigos :: Int -> Int -> Bool

```
problema sonAmigos(n,m: Z) : Bool {
    require: {n > 0 }
    require: {m > 0}
    require: {m != n}
    asegura: {res = True <=> n y m son numeros amigos}
}
```

```haskell
sumaEnteros :: [Int] -> Int
sumaEnteros [] = 0
sumaEnteros (actualElemento:elementos) = actualElemento + sumaEnteros elementos


sonAmigos :: Int -> Int -> Bool
sonAmigos x y = (sumaEnteros (divisoresPropios x)) == y && (sumaEnteros (divisoresPropios y)) == x
```

### Ejercicio 11. Implementar la funcion losPrimerosNPerfectos

```
problema losPrimerosNPerfectos(n: Z) : seq<Z> {
    requiere: {n > 0}
    asegura: {res es la lista de los primeros n numeros perfectos, de menor a mayor}
}
```

```haskell
losPrimerosNPerfectos :: Int -> [Int]
losPrimerosNPerfectos n = primerosPerfectos n 0 1

esPerfecto :: Int -> Bool
esPerfecto 1 = False
esPerfecto n = n == sumaEnteros (divisoresPropios n)


primerosPerfectos :: Int -> Int -> Int -> [Int]
primerosPerfectos cantidadDePerfectos encontrados _ | cantidadDePerfectos == encontrados = []
primerosPerfectos cantidadDePerfectos encontrados numeroActual | esPerfecto numeroActual && encontrados < cantidadDePerfectos = numeroActual : primerosPerfectos cantidadDePerfectos (encontrados + 1) (numeroActual + 1)
                                                               | otherwise = primerosPerfectos cantidadDePerfectos encontrados (numeroActual + 1)
```
