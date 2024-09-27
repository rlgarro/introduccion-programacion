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
