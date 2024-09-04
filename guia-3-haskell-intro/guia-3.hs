---------------------------------------------------------
-- Ejercicio 1: Funciones f, g, h = f(g(n)) y k = g(f(n))
---------------------------------------------------------
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

g :: Integer -> Integer
g 8 = 16
g 131 = 1
g 16 = 4

-- Composicion f o g
h :: Integer -> Integer
h n = f (g n)

-- Composicion g o f
k :: Integer -> Integer
k n = g (f n)

---------------------------------------------------------------------------------------------
-- Ejercicio 2.  Especificar e implementar las siguientes funciones, incluyendo su signatura.
---------------------------------------------------------------------------------------------

absoluto :: Integer -> Integer
absoluto n | n >= 0 = n
           | otherwise = (-n)

maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto n m | n_absoluto > m_absoluto = n_absoluto
                   | otherwise = m_absoluto
                   where
                   n_absoluto = absoluto n
                   m_absoluto = absoluto m

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 n m o | (n >= m && n >= o) = n
              | (m >= n && m >= o) = m
              | otherwise = o

algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | (x == 0.0 || y == 0.0) = True
              | otherwise = False

-- Version pattern matching:
algunoEs0_pm :: Float -> Float -> Bool
algunoEs0_pm 0 _ = True
algunoEs0_pm _ 0 = True
algunoEs0_pm _ _ = False

ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y = (x == 0 && y == 0)

-- Version pattern matching:
ambosSon0_pm :: Float -> Float -> Bool
ambosSon0_pm 0 0 = True
ambosSon0_pm _ _ = False


mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | (x <= 3 && y <= 3) = True
                   | (x > 3 && x <= 7 && y > 3 && y <= 7) = True
                   | (x > 7 && y > 7) = True
                   | otherwise = False

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos n m o | (n /= m && m /= o && n /= o) = (n + m + o)
                    | (n /= m && m == o) = (n + m)
                    | (n /= m && n == o) = (n + m)
                    | (n == m && m /= o) = (n + o)
                    | (n == m && m == o) = 0

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe n m | (n <= 0 || m <= 0) = undefined
                 | mod n m == 0 = True
                 | otherwise = False

digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

digitoDecenas :: Integer -> Integer
digitoDecenas n | n <= 9 = undefined
                | otherwise = mod (div n 10) 10

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b | (mod numerador denominador) == 0 = True
                      | otherwise = False
                      where
                      numerador = a * a
                      denominador = a * b

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt a b = (fst (a) * fst(b)) + (snd(a) * snd(b))

todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor a b = (fst(a) < fst(b) && snd(a) < snd(b))

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a1, a2) (b1, b2) = sqrt (((b1 - a1) ^ 2) + ((b2 - b2) ^ 2))

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (a, b, c) = a + b + c

sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (a, b, c) n = (esMultiploODefault (a,n) 0) + (esMultiploODefault (b,n) 0) + (esMultiploODefault (c,n) 0)

esMultiploODefault :: (Integer, Integer) -> Integer -> Integer
esMultiploODefault (a, b) n | mod a b == 0 = a
                            | otherwise = n

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (a, b, c) | mod a 2 == 0 = 0
                       | mod b 2 == 0 = 1
                       | mod c 2 == 0 = 2
                       | otherwise = 4

crearPar :: t -> t -> (t, t)
crearPar a b = (a, b)

invertir :: (t, t) -> (t, t)
invertir (a, b) = (b, a)

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (t1, t2, t3) = ((f1 t1) > (g1 t1)) && ((f1 t2) > (g1 t2)) && ((f1 t2) > (g1 t2))

f1 :: Integer -> Integer
f1 n | n <= 7 = n ^ 2
     | otherwise = (2 * n) - 1

g1 :: Integer -> Integer
g1 n | (esPar n) = div n 2
     | otherwise = (3 * n) + 1

esPar :: Integer -> Bool
esPar n = mod n 2 == 0

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (t1, t2, t3) (y1, y2, y3) = absolutoBis (t1 - y1) + absolutoBis (t2 - y2) + absolutoBis (t3 - y3)

absolutoBis :: Float -> Float
absolutoBis n | n >= 0 = n
              | otherwise = (-1) * n

type Anio = Integer
type EsBisiesto = Bool

bisiesto :: Anio -> EsBisiesto
bisiesto n | ((esMultiploDe n 4) == False || ((esMultiploDe n 100) && (esMultiploDe n 400) == False)) = False
           | otherwise = True
