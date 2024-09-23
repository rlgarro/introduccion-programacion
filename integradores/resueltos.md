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
