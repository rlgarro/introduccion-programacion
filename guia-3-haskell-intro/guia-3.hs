-----------------------------------------------------------------------
-- Ejercicio 1: Funciones f, g, h = f(g(n)) y k = g(f(n))
-----------------------------------------------------------------------
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

-----------------------------------------------------------------------
-- Ejercicio 2.  Especificar e implementar las siguientes funciones, incluyendo su signatura.
-----------------------------------------------------------------------

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
