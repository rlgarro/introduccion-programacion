-- Ejercicio 9 : Implementacion de esCapicua.

-- Lo voy a hacer utilizando la definicion mas facil, si yo "doy vuelta" el numero
-- entonces tiene que ser igual al numero original.
esCapicua :: Integer -> Bool
esCapicua n = (invertir n) == n


invertir :: Integer -> Integer
invertir n | n <= 9 = n
           | otherwise = (last_digit * 10^((cantidadDigitos n) - 1)) + invertir(div n 10)
           where last_digit = (mod n 10)

cantidadDigitos :: Integer -> Integer
cantidadDigitos n | n <= 9 = 1
                  | otherwise = 1 + (cantidadDigitos (div n 10))

-- Ejercicio 11: Especificar e implementar una funcion eAprox :: Integer -> Float que aproxime el valor del numero e a partir de la siguiente sumatoria:
-- e(n) = sum(i = 0, n) { 1 / i! }

-- Para esto necesitamos la funcion factorial, despues el resto es una sumatoria bien bien -- sencilla.

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / fromInteger (factorial n)) + (eAprox (n - 1))

factorial :: Integer -> Integer
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial(n - 1)

-- Ejercicio 12: Especificar e implementar una funcion raizDe2Aprox :: Integer -> Float que dado n en N devuelva la aproximacion de raiz de 2 definida por raiz de 2 ~= a(n) - 1

sucesionRaizDeDos :: Integer -> Float
sucesionRaizDeDos 1 = 2
sucesionRaizDeDos n = 2 + 1 / sucesionRaizDeDos (n - 1)

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = (sucesionRaizDeDos n) - 1

-- Ejercicio 13: Especificar e implementar la siguiente funcion:
-- $$f(n, m) = \sum_{i=1}^{n} \sum_{j=1}^{m}i^j$$

f :: Integer -> Integer -> Integer
f 1 m = (serieGeometrica m 1) - 1
f n m = ((serieGeometrica m n) - 1) + (f (n - 1) m)

-- Defino una funcion para la serie geometrica

serieGeometrica :: Integer -> Integer -> Integer
serieGeometrica n 1 = n + 1
serieGeometrica n q = ((q ^ (n + 1)) - 1) `div` (q - 1)
