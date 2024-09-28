-- Ejercicio 1: Sistema de stock

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


-- Ejercicio 2
stockDeProducto :: [(String, Int)] -> String -> Int
stockDeProducto [] _ = 0
stockDeProducto (producto:productos) nombreProducto | fst producto == nombreProducto = snd producto
                                                    | otherwise = stockDeProducto productos nombreProducto


-- Ejercicio 3
dineroEnStock :: [(String, Int)] -> [(String, Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock (productoActual:productosRestantes) precios = (precioProducto * fromIntegral (snd productoActual)) + (dineroEnStock productosRestantes precios)
                                                          where precioProducto = precioDeProducto (fst productoActual) precios

precioDeProducto :: String -> [(String, Float)] -> Float
precioDeProducto producto (precioProducto:preciosRestantes) | producto == (fst precioProducto) = snd precioProducto
                                                            | otherwise = precioDeProducto producto preciosRestantes

-- Ejercicio 4

aplicarOferta :: [(String, Int)] -> [(String, Float)] -> [(String, Float)]
aplicarOferta _ [] = []
aplicarOferta stock (precio:preciosRestantes) = (fst precio, precioFinalProducto) : (aplicarOferta stock preciosRestantes)
                                              where precioFinalProducto = getPrecioFinalProducto (snd precio) (stockDeProducto stock (fst precio))

getPrecioFinalProducto :: Float -> Int -> Float
getPrecioFinalProducto precioOriginal stock | stock > 10 = precioOriginal * 0.8
                                            | otherwise = precioOriginal

-- Ejercicio 5

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
                                  | otherwise = maximoFilaRestante
                                   where maximoFilaRestante = maximoEnFila restoDeFila

-- Ejercicio 6

type Aparicion = (Int,Int) -- (numero, cantidad de apariciones de numero)

masRepetido :: Tablero -> Int
masRepetido tablero = fst (masOcurrente (apariciones (unificarEnFila tablero)))

masOcurrente :: [Aparicion] -> Aparicion
masOcurrente [aparicion] = aparicion
masOcurrente (actual:restoApariciones) | snd actual > snd (masOcurrente restoApariciones) = actual
                                       | otherwise = masOcurrente restoApariciones

unificarEnFila :: Tablero -> Fila
unificarEnFila [] = []
unificarEnFila (filaActual:restoFilas) = (unificarEnFila restoFilas) ++ filaActual

quitarTodos :: (Eq a) => a -> [a] -> [a]
quitarTodos _ [] = []
quitarTodos elem (x:xs) | elem == x = quitarTodos elem xs
                        | otherwise = x : quitarTodos elem xs

apariciones :: Fila -> [Aparicion]
apariciones [] = []
apariciones (elemento:elementosRestantes) = (elemento, (snd aparicionElemActual) + 1) : apariciones (quitarTodos elemento elementosRestantes)
                                          where aparicionElemActual = (aparicion elemento elementosRestantes)

aparicion :: Int -> Fila -> Aparicion
aparicion n [] = (n, 0)
aparicion n (elemActual:restoFila) | n == elemActual = (n, snd (aparicion n restoFila) + 1)
                                   | otherwise = (n, snd (aparicion n restoFila))

-- Ejercicio 7


-- Dado un tablero y una posicion me gustaria poder obtener el numero que alli se encuentra, esto haria mucho mas facil hacer este ejercicio.
-- Ya que solo tendria que iterar las posiciones de camino y ir agregando ese resultado de aplicar esta funcion a la lista.

--valoresDeCaminoG

posicionesCanonicas :: Int -> Camino -> [Int]
posicionesCanonicas _ [] = []
posicionesCanonicas largoFila (pos:restoPosiciones) = ((fst pos) - 1) * largoFila + (snd pos) : (posicionesCanonicas largoFila restoPosiciones)

obtenerElementosEnIndices :: [Int] -> [Int] -> [Int]
obtenerElementosEnIndices [] _ = []
obtenerElementosEnIndices _ [] = []
-- Asumo que mi lista de elementos que me dan es la lista completa
obtenerElementosEnIndices (indiceActual:indices) (elementoActual:elementos) = 

--obtenerValor :: Tablero -> Posicion -> Int
--obtenerValor

-- por ahi para esto se puede abusar de que las filas tienen todas el mismo largo.
-- si tengo un tablero con 3 filas con 4 elementos por fila, yo se que la primera fila empieza en el (1,1) (indx: 1) y termina en (1,4) (indx: 4)
-- la segunda empieza en (2,1) (indx: 5 = (2 - 1) * 4 + 1) y termina en (2,4) (indx: 8 = (2 - 1) * 4 + 4)
-- la tercera empieza en (3,1) (indx: 9 = (3 - 1) * 4 + 1) y termina en (3,4) (indx: 12 = (3 - 1) * 4 + 4)
-- [[1,2,3,4], [10,11,12,13]] (2,1) = 10, (2,3) = 12
-- elemento random = (fila, columna) = (fila - 1) * len(filas) + columna
