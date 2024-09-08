# Guia 4 Resueltos explicados.
# Hice desde el ejercicio 9 que es el primero que me parecio dentro de todo interesante, ademas necesito no hacer todos porque tengo que asignar cierto tiempo para estudiar algebra tambien.


## Ejercicio 9: Especificar e implementar una funcion esCapicua :: Integer -> Bool que dado un N >= 0, determina si n es un numero capicúa.


```
problema esCapicua(n : Z) : Bool {
    requiere: {n es mayor o igual a 0}
    asegura: { (resultado es True) <=> el numero se lee igual de adelante a hacia atras, es decir, si se invierte el numero el numero queda igual.}
}
```

```haskell
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
```
