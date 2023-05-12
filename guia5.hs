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

-- 3)
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga [x] = [x]
palabraMasLarga l | longitud (primeraPalabra l) >= longitud (palabraMasLarga (quitarPrimeraPalabra l)) = primeraPalabra l
                  | otherwise = palabraMasLarga (quitarPrimeraPalabra l)


longitudPalabra :: [Char] -> Integer
longitudPalabra [] = 0
longitudPalabra (x:xs) = 1 + longitudPalabra xs

-- 4)
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras [x] = [[x]]
palabras l = primeraPalabra l : palabras (quitarPrimeraPalabra l)

primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra [x] = [x]
primeraPalabra (' ':xs) = []
primeraPalabra (x:xs) = x : primeraPalabra xs

quitarPrimeraPalabra :: [Char] -> [Char]
quitarPrimeraPalabra [] = []
quitarPrimeraPalabra [x] = []
quitarPrimeraPalabra (' ':xs) = xs
quitarPrimeraPalabra (x:xs) = quitarPrimeraPalabra xs

-- 5)
aplanar :: [[Char]] -> [Char]
aplanar [[]] = []
aplanar [x] = x
aplanar (x:xs) = x ++ aplanar xs

-- 6)
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [[]] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ [' '] ++ aplanarConBlancos xs

-- 7)
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [[]] _ = []
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = agregarNBlancos x n ++ aplanarConNBlancos xs n

agregarNBlancos :: [Char] -> Integer -> [Char]
agregarNBlancos l 0 = l
agregarNBlancos l n = agregarNBlancos l (n - 1) ++ [' ']

-- Ejercicio 5)

-- 1)
nat2bin :: Integer -> [Integer]
nat2bin 0 = [0]
nat2bin 1 = [1]
nat2bin n = nat2bin (div n 2) ++ [mod n 2]

-- 2)
bin2nat :: [Integer] -> Integer
bin2nat [1] = 1
bin2nat (x:xs) = x * 2 ^ (longitud (x:xs) - 1) + bin2nat xs

-- 3)
nat2hex :: Integer -> [Char]
nat2hex n | n >= 0 && n <= 15 = [iesimoCaracter n ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']]
          | div n 16 == 0 = nat2hex n
          | otherwise = nat2hex (div n 16) ++ nat2hex (mod n 16)

iesimoCaracter :: Integer -> [Char] -> Char
iesimoCaracter 0 (x:xs) = x
iesimoCaracter i (x:xs) = iesimoCaracter (i-1) xs

-- 4)
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = x: sumaAcumulada (x+y:xs)

-- 5)
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos [x] = [descomponerEnPrimosInd x]
descomponerEnPrimos (x:xs) = descomponerEnPrimosInd x : descomponerEnPrimos xs

descomponerEnPrimosInd :: Integer -> [Integer]
descomponerEnPrimosInd n = descomponerEnPrimosIndDesde n 2

descomponerEnPrimosIndDesde :: Integer -> Integer -> [Integer]
descomponerEnPrimosIndDesde n s | esPrimo n = [n]
                                | mod n s == 0 = s : descomponerEnPrimosIndDesde (div n s) s
                                | otherwise = descomponerEnPrimosIndDesde n (primerPrimoDesde s)

primerPrimoDesde :: Integer -> Integer
primerPrimoDesde n | esPrimo (n + 1) = n + 1
                   |otherwise = primerPrimoDesde (n + 1)

esPrimo :: Integer -> Bool
esPrimo n = esPrimoDesde n 2

esPrimoDesde :: Integer -> Integer -> Bool
esPrimoDesde n s | s == n = True
                 | mod n s == 0 = False
                 | otherwise = esPrimoDesde n (s + 1)

-- Ejercicio 6)

type Set t = [t]

-- 1)
agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer)
agregarATodos n [a] = [n:a]
agregarATodos n (x:xs) | pertenece n x = x : agregarATodos n xs 
                       | otherwise = (n:x) : agregarATodos n xs

-- 2)
partes :: Integer -> Set (Set Integer)
partes 1 = [[],[1]]
partes n = partes (n - 1) ++ agregarATodos n (partes (n - 1))

-- 3)
productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano [] _ = []
productoCartesiano (s:ss) r = duplasNEnR s r ++ productoCartesiano ss r

duplasNEnR :: Integer -> Set Integer -> Set (Integer, Integer)
duplasNEnR _ [] = []
duplasNEnR n (r:rs) = (n, r) : duplasNEnR n rs