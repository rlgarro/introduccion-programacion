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


-- Ejercicio 8


esCaminoFibo :: [Int] -> Int -> Bool
esCaminoFibo [ultimoValor] indice = ultimoValor == (fibonacci indice)
esCaminoFibo (valor:valores) indiceActual = (valor == fibonacci indiceActual) && esCaminoFibo valores (indiceActual + 1)


fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
