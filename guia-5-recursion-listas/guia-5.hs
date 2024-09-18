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
todosIguales lista | [] = True
