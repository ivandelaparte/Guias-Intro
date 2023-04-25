-- Ejercicio 1)

-- 1)
longitud :: [t] -> Integer
longitud [] = 0
longitud l = 1 + longitud (tail l)

-- 2)
ultimo :: [t] -> t
ultimo = last 

-- 3)
principio :: [t] -> [t]
principio = init

-- 4)
reverso :: [Integer] -> [Integer]
reverso [] = []
reverso l = last l : reverso (init l)

-- Ejercicio 2)

-- 1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece el (x:xs) | el == x   = True
                    | otherwise = pertenece el xs

-- 2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [_] = True
todosIguales (x:y:xs) | x == y = todosIguales (y:xs)
                      | x /= y = False

-- 3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) = not (pertenece x xs) && todosDistintos xs

-- 4)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise      = hayRepetidos xs

-- 5)
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar el (x:xs) | el == x   = (xs)
                 | otherwise = x : quitar el xs
            
-- 6)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos el (x:xs) | el == x   = quitarTodos el xs
                      | otherwise = x : quitarTodos el xs

-- 7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

-- 8)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos s r = perteneceConjunto s r && perteneceConjunto r s

perteneceConjunto :: (Eq t) => [t] -> [t] -> Bool
perteneceConjunto [] _ = True
perteneceConjunto (s:ss) r | pertenece s r = perteneceConjunto ss r
                           | otherwise     = False

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [_] = True
capicua l = (head l == last l) && capicua (tail (init l))

-- Ejercicio 3)

-- 1)
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- 2)
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- 3)
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x >= maximo xs = x
              | otherwise      = maximo xs

-- 4)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (x + n) : sumarN n xs

-- 5)
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

-- 6)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo l = sumarN (last l) l

-- 7)
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise    = pares xs

-- 8)
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
                      | otherwise    = multiplosDeN n xs

-- 9)
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x] 
ordenar (x:xs) | x <= minimo xs = x : ordenar xs
               | otherwise = ordenar (xs ++ [x])
            
minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:xs) | x <= minimo xs = x
              | otherwise = minimo xs

-- Ejercicio 4)

-- Asumo para este ejercicio que no voy a recibir secuencias que empiecen o terminen con caracteres blancos, así como tampoco voy a recibir secuencias con caracteres blancos consiguos.

-- 1)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:ys) | x == ' ' && y == ' ' = sacarBlancosRepetidos (x:ys)
                               | otherwise = x : sacarBlancosRepetidos (y:ys)

-- 2)
contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:xs) | x == ' ' = 1 + contarPalabras xs
                      | otherwise = contarPalabras xs