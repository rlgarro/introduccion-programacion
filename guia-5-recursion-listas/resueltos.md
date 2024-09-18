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
