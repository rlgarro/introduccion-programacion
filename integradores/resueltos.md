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
