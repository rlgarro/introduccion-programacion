module SolucionT1 where


-- Ejercicio 1
maxMovilN :: [Integer] -> Integer -> Integer
maxMovilN (x:xs) n = maximo (obtenerUltimosN (x:xs) n)

ultimo :: [Integer] -> Integer
ultimo [ultimo] = ultimo
ultimo (x:xs) = ultimo xs

principio :: [Integer] -> [Integer]
principio [ultimo] = []
principio (x:xs) = x : (principio xs)

obtenerUltimosN :: [Integer] -> Integer -> [Integer]
obtenerUltimosN lista 1 = [ultimo lista]
obtenerUltimosN lista n = obtenerUltimosN (principio lista) (n - 1) ++ [ultimo lista]

maximo :: [Integer] -> Integer
maximo [ultimo] = ultimo
maximo (actual: restantes) | actual > maximo restantes = actual
                           | otherwise = maximo restantes

-- Ejercicio 2
promedioPrimo :: Integer -> Float
promedioPrimo n =  fromInteger (sumar factoresPrimos) / fromInteger (len factoresPrimos)
                where 
                factoresPrimos = (obtenerFactoresPrimos n 2)

len :: [a] -> Integer
len [] = 0
len (x:xs) = 1 + (len xs)
                
obtenerFactoresPrimos :: Integer -> Integer -> [Integer]
obtenerFactoresPrimos 2 _ = [2]
obtenerFactoresPrimos 1 _ = []
obtenerFactoresPrimos n primoActual | mod n primoActual == 0 = primoActual : obtenerFactoresPrimos (div n primoActual) primoActual
                                    | otherwise = obtenerFactoresPrimos n (siguientePrimo (primoActual + 1))

siguientePrimo :: Integer -> Integer
siguientePrimo inicio | esPrimo inicio = inicio
                      | otherwise = siguientePrimo (inicio + 1)

esPrimo :: Integer -> Bool
esPrimo n = (obtenerDivisores n 1) == [1, n]

obtenerDivisores :: Integer -> Integer -> [Integer]
obtenerDivisores dividendo divisorActual | dividendo == divisorActual = [divisorActual]
                                         | mod dividendo divisorActual == 0 = divisorActual : obtenerDivisores dividendo (divisorActual + 1)
                                         | otherwise = obtenerDivisores dividendo (divisorActual + 1)
sumar :: [Integer] -> Integer
sumar [ultimo] = ultimo
sumar (x:xs) = x + (sumar xs)

-- Ejercicio 3
letrasIguales :: String -> Integer
letrasIguales "" = 0
letrasIguales [ultimo] = 0
letrasIguales (actual:restantes) | ((apariciones actual restantes) + 1) > 1 = 1 + letrasIguales (sacarCaracter actual restantes)
                                 | otherwise = letrasIguales restantes

apariciones :: Char -> String -> Integer
apariciones _ "" = 0
apariciones ' ' _ = 0
apariciones char (actual:restantes) | char == actual = 1 + (apariciones char restantes)
                                    | otherwise = (apariciones char restantes)

sacarCaracter :: Char -> String -> String
sacarCaracter _ [] = []
sacarCaracter char (actual:restantes) | char == actual = (sacarCaracter char restantes)
                                      | otherwise = actual : (sacarCaracter char restantes)

-- Ejercicio 4
cuantosIguales :: String -> String -> Integer
cuantosIguales "" _ = 0
cuantosIguales _ ""  = 0
cuantosIguales (char1:restantes1) palabra2 | char1 /= ' ' && (pertenece char1 palabra2) = 1 + cuantosIguales (restantes1) (sacarCaracter char1 palabra2)
                                            | otherwise = cuantosIguales restantes1 palabra2 

pertenece :: (Eq a) => a -> [a] -> Bool
pertenece a [] = False
pertenece buscado (actual:restantes) | buscado == actual = True
                                     | otherwise = (pertenece buscado restantes)
