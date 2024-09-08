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
