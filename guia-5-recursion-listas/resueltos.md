# Ejercicio 1. Definir las siguientes funciones sobre listas:

### 1. longitud :: [t] -> Integer, que dada una lista devuelve su cantidad de elementos.

```haskell
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + (longitud xs)
```

### 2. ultimo :: [t] -> t, segun la siguiente especificacion:

```
problema ultimo(s: seq<T>) : T {
		requiere: {|s| > 0}
		asegura: {resultado = s[|s| - 1]}
}
```

```haskell
ultimo :: [t] -> t
ultimo [t] = t
ultimo (x:xs) = ultimo xs
```

### 3. principio :: [t] -> [t], segun la siguiente especificacion:

```
problema principio(s: seq<T>) : seq<T> {
		requiere: {|s| > 0}
		asegura: { resultado = subseq(s, 0, |s| - 1) }
}
```

```haskell
principio :: [t] -> [t]
principio [t] = [t]
principio [t1, t2] = [t1]
principio lista = (head lista) : (principio (tail lista))
```

### 4. reverso :: [t] -> [t], segun la siguiente especificacion:

```
problema reverso(s: seq<T>) : seq<T> {
		requiere: { True }
		asegura: {resultado tiene los mismos elementos que s pero en orden inverso}
}
```

```haskell
reverso :: [t] -> [t]
reverso [] = []
reverso [t1,t2] = [t2, t1]
reverso lista = (ultimo lista) : (reverso (principio lista))
```

# Ejercicio 2. Definir las siguientes funciones sobre listas:

### 1. pertenece :: (Eq t) -> t -> [t] -> Bool

```
problema pertenece(e: T, s: seq<T>): B {
		requiere: {True}
		asegura: { resultado = true <=> e pertenece a s}
}
```

```haskell
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece n lista | (lista == []) = False 
                  | (head lista) == n = True
                  | otherwise = pertenece n (tail lista)

```

### 2. todosIguales :: (Eq t) -> [t] -> Bool

```
problema todosIguales(s: seq<T>): B {
		requiere: {True}
		asegura: {resultado = true <=> cada elemento de s es igual || s es vacio}
}
```

```haskell
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [t1, t2] = t1 == t2
todosIguales (x:xs) | x /= (head xs) = False
                    | otherwise = todosIguales xs
```

### 3. todosDistintos :: (Eq t) -> [t] -> Bool

```
problema todosDisintos(s: seq<T>) : B {
		requiere: {True}
		// asegura original: asegura: {resultado = false <=> existen dos elementos de s con el mismo valor}
		// asegura mio
		asegura: {resultado = true <=> no existen dos elementos iguales}
}
```

```haskell
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) | (pertenece x xs) = False
                      | otherwise = todosDistintos xs
```

### 4. hayRepetidos :: (Eq t) -> [t] -> Bool


```
problema hayRepetidos(s: seq<T>) : B {
		asegura: {resultado = true <=> existen dos posiciones de s con el mismo valor}
}
```

```haskell
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos elementos = not (todosDistintos elementos)
```

### 5. quitar :: (Eq t) -> t -> [t] -> [t]

```haskell
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar elem (x:xs) | elem == x = xs
                   | otherwise = x : (quitar elem xs)
```

### 6. quitarTodos :: (Eq t) -> t -> [t] -> [t]

```
problema quitarTodos(e: T, s: seq<T>) : seq<T> {
		asegura: { resultado es s pero sin el elemento e}
}
```

```haskell
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos elem lista | not (pertenece elem lista) = lista
                       | otherwise = quitarTodos elem (quitar elem lista)
```

### 7. eliminarRepetidos :: (Eq t) -> [t] -> [t]

```haskell
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs) | (hayRepetidos (x : xs)) = x : eliminarRepetidos (quitarTodos x xs) 
                         | otherwise = x : xs
```

### 8. mismosElementos :: (Eq t) -> [t] -> [t] -> Bool

```
problema mismosElementos(s: seq<T>, r: seq<T>) : B {
		asegura: {resultado = true <=> todo elemento de s esta en r y viceversa}
}
```

```haskell
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos lista1 lista2 = (contieneTodos lista1 lista2) && (contieneTodos lista2 lista1)


-- Si la primera lista contiene todos los de la segunda
contieneTodos :: (Eq t) => [t] -> [t] -> Bool
contieneTodos _ [] = True
contieneTodos lista1 (y:ys) | pertenece y lista1 = contieneTodos lista1 ys
                            | otherwise = False
```

### 9. capicua :: (Eq t) -> [t] -> Bool

```
problema capicua(s: seq<T>) : B {
		asegura: {resultado = true <=> s = reverso(s)}
}
```

```haskell
capicua :: (Eq t) => [t] -> Bool
capicua lista = lista == (reverso lista)
```

# Ejercicio 3

### 3. maximo

```
problema maximo(s: seq<Z>)) : Z {
	requiere: { |s| > 0}
	asegura: { resultado pertenece a S ^ resultado es el elemento mas grande de la lista}
}
```

```haskell
maximo :: (Ord t) => [t] -> t
maximo [t] = t
maximo (x:xs) | x >= maximo_tail = x
              | otherwise = maximo_tail
             where
             maximo_tail = maximo xs
```

### 9. Ordenar

```haskell
ordenar :: (Ord t) => [t] -> [t]
ordenar [] = []
ordenar xs = ordenar (quitar maximo_lista xs) ++ [maximo_lista]
           where maximo_lista = maximo xs
```

# Ejercicio 5

### 1. sumaAcumulada


```haskell
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [ultimo] = [ultimo]
sumaAcumulada lista = acumulada ++ [(ultimo lista + ultimo acumulada)]
                    where acumulada = sumaAcumulada (principio lista)
```

### 2. descomponerEnPrimos :: [Integer] -> [[Integer]]

