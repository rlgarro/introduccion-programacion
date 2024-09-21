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

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar elem (x:xs) | elem == x = xs
                   | otherwise = x : (quitar elem xs)

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
