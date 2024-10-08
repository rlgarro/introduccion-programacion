-- Ejercicio 1:

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + (longitud xs)

ultimo :: [t] -> t
ultimo [t] = t
ultimo (x:xs) = ultimo xs

principio :: [t] -> [t]
principio [t] = [t]
principio [t1, t2] = [t1]
principio lista = (head lista) : (principio (tail lista))

reverso :: [t] -> [t]
reverso [] = []
reverso [t1,t2] = [t2, t1]
reverso lista = (ultimo lista) : (reverso (principio lista))

-- Ejercicio 2:

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece n lista | (lista == []) = False 
                  | (head lista) == n = True
                  | otherwise = pertenece n (tail lista)

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [t1, t2] = t1 == t2
todosIguales (x:xs) | x /= (head xs) = False
                    | otherwise = todosIguales xs

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) | (pertenece x xs) = False
                      | otherwise = todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos elementos = not (todosDistintos elementos)


quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar elem (x:xs) | elem == x = xs
                   | otherwise = x : (quitar elem xs)

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos elem lista | not (pertenece elem lista) = lista
                       | otherwise = quitarTodos elem (quitar elem lista)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs) | (hayRepetidos (x : xs)) = x : eliminarRepetidos (quitarTodos x xs) 
                         | otherwise = x : xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos lista1 lista2 = (contieneTodos lista1 lista2) && (contieneTodos lista2 lista1)


-- Si la primera lista contiene todos los de la segunda
contieneTodos :: (Eq t) => [t] -> [t] -> Bool
contieneTodos _ [] = True
contieneTodos lista1 (y:ys) | pertenece y lista1 = contieneTodos lista1 ys
                            | otherwise = False

capicua :: (Eq t) => [t] -> Bool
capicua lista = lista == (reverso lista)

-- Ejercicio 3

maximo :: (Ord t) => [t] -> t
maximo [t] = t
maximo (x:xs) | x >= maximo_tail = x
              | otherwise = maximo_tail
             where
             maximo_tail = maximo xs

ordenar :: (Ord t) => [t] -> [t]
ordenar [] = []
ordenar xs = ordenar (quitar maximo_lista xs) ++ [maximo_lista]
           where maximo_lista = maximo xs

-- Ejercicio 5

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [ultimo] = [ultimo]
sumaAcumulada lista = acumulada ++ [(ultimo lista + ultimo acumulada)]
                    where acumulada = sumaAcumulada (principio lista)

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos [ultimo] = [obtenerPrimos ultimo 2]
descomponerEnPrimos (actual:restantes) = (obtenerPrimos actual 2) : (descomponerEnPrimos restantes)

obtenerPrimos :: Integer -> Integer -> [Integer]
obtenerPrimos n primo | 1 == n || esPrimo n = [n]
                      | mod n primo == 0 && (div n primo /= 1) = primo : obtenerPrimos (div n primo) primo
                      | mod n primo == 0 && (div n primo == 1) = [primo]
                      | otherwise = obtenerPrimos n (siguientePrimo (primo + 1))

siguientePrimo :: Integer -> Integer
siguientePrimo n | esPrimo n = n
                 | otherwise = siguientePrimo (n + 1)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo 2 = True
esPrimo n = divisores == [n]
          where divisores = obtenerDivisores n 2

obtenerDivisores :: Integer -> Integer -> [Integer]
obtenerDivisores dividendo divisorActual | dividendo == divisorActual = [dividendo]
                                         | mod dividendo divisorActual == 0 = divisorActual : obtenerDivisores dividendo (divisorActual + 1)
                                         | otherwise = obtenerDivisores dividendo (divisorActual + 1)


