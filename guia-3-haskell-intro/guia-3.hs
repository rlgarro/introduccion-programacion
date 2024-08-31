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
