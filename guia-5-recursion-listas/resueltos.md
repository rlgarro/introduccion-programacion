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

### 4. hayRepetidos :: (Eq t) -> [t] -> Bool


```
problema hayRepetidos(s: seq<T>) : B {
		asegura: {resultado = true <=> existen dos posiciones de s con el mismo valor}
}
```

### 5. quitar :: (Eq t) -> t -> [t] -> [t]

### 6. quitarTodos :: (Eq t) -> t -> [t] -> [t]

```
problema quitarTodos(e: T, s: seq<T>) : seq<T> {
		asegura: { resultado es s pero sin el elemento e}
}
```

### 7. eliminarRepetidos :: (Eq t) -> [t] -> [t]

### 8. mismosElementos :: (Eq t) -> [t] -> [t] -> Bool

```
problema mismosElementos(s: seq<T>, r: seq<T>) : B {
		asegura: {resultado = true <=> todo elemento de s esta en r y viceversa}
}
```

### 9. capicua :: (Eq t) -> [t] -> Bool

```
problema capicua(s: seq<T>) : B {
		asegura: {resultado = true <=> s = reverso(s)}
}
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
