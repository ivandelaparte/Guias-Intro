import System.Win32 (WIN32_FILE_ATTRIBUTE_DATA(fadCreationTime))
import GHC.Exts.Heap (IndexTable)
-- Ejercicio 1)

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Ejercicio 2)

parteEntera :: Float -> Integer
parteEntera n | n < 1 = 0
              | otherwise = parteEntera (n - 1) + 1

-- Ejercicio 3)

esDivisible :: Integer -> Integer -> Bool
esDivisible x y | x < y = False
                | x == y = True
                | x > y = esDivisible (x-y) y

-- Ejercicio 4)

sumaImpares :: Integer -> Integer
sumaImpares 1 = 1
sumaImpares n = sumaImpares (n - 1) + ((2 * n) - 1)

-- Ejercicio 5)

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact (n-2)

-- Ejercicio 6)

sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos n = mod n 10 + sumaDigitos (div n 10)

-- Ejercicio 7)

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | (n >= 0) && (n <= 9) = True
                      | otherwise = ultimoDigito n == ultimoDigito (quitarUltimoDigito n) && todosDigitosIguales (quitarUltimoDigito n)

ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10

quitarUltimoDigito :: Integer -> Integer
quitarUltimoDigito n = div n 10

-- Ejercicio 8)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | i == cantidadDeDigitos n = ultimoDigito n
                 | i < cantidadDeDigitos n = iesimoDigito (quitarUltimoDigito n) i

cantidadDeDigitos :: Integer -> Integer
cantidadDeDigitos n | (n >= 0) && (n <= 9) = 1
                    | otherwise = 1 + cantidadDeDigitos (quitarUltimoDigito n)

-- Ejercicio 9)

esCapicua :: Integer -> Bool
esCapicua n | (n >= 0) && (n <= 9) = True
            | otherwise = primerDigito n == ultimoDigito n && esCapicua (quitarPrimerDigito (quitarUltimoDigito n))

primerDigito :: Integer -> Integer
primerDigito n = iesimoDigito n 1

quitarPrimerDigito :: Integer -> Integer
quitarPrimerDigito n = n - (primerDigito n * 10 ^ (cantidadDeDigitos n - 1))

-- Ejercicio 10)

-- a)
f1 :: Integer -> Integer
f1 0 = 1
f1 n = (2 ^ n) * f1 (n - 1)

-- b)
f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = (q ^ n) * f2 (n - 1) q

-- c)
f3 :: Integer -> Float -> Float
f3 1 q = q ^ 2
f3 n q = ((q ^ (2 * n)) * f2 ((2*n) - 1) q) / q

-- d)
f4 :: Integer -> Float -> Float
f4 0 q = 1
f4 n q = ((q ^ ((2 * n) - 1)) * (q ^ (2 * n)) * f4 (n - 1) q) / (q ^ (n - 1))

-- Ejercicio 11)

-- a)
eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / fromIntegral (factorial n)) + eAprox (n - 1)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- b)
e :: Float
e = eAprox 10

-- Ejercicio 12)

raizDe2Aprox :: Integer -> Float
raizDe2Aprox 1 = 1
raizDe2Aprox n = a n - 1

a :: Integer -> Float
a 1 = 2
a n = 2 + 1 / a (n-1)

-- Ejercicio 13)

dobleSumatoria :: Integer -> Integer -> Integer
dobleSumatoria 1 m = m
dobleSumatoria n m = sumatoriaParcialNFijo n m + dobleSumatoria (n - 1) m

sumatoriaParcialNFijo :: Integer -> Integer -> Integer
sumatoriaParcialNFijo n 1 = n
sumatoriaParcialNFijo n m = (n ^ m) + sumatoriaParcialNFijo n (m - 1)

-- Ejercicio 14)

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q 1 m = sumaPotenciasNFijo q 1 m
sumaPotencias q n m = sumaPotenciasNFijo q n m + sumaPotencias q (n-1) m  

sumaPotenciasNFijo :: Integer -> Integer -> Integer -> Integer
sumaPotenciasNFijo q n 1 = q ^ (n + 1)
sumaPotenciasNFijo q n m = q ^ (n + m) + sumaPotenciasNFijo q n (m - 1)

-- Ejercicio 15)
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 m = sumaRacionalesParcial 1 m
sumaRacionales n m = sumaRacionalesParcial n m + sumaRacionales (n - 1) m

sumaRacionalesParcial :: Integer -> Integer -> Float
sumaRacionalesParcial n 1 = fromIntegral n
sumaRacionalesParcial n m = (fromIntegral n / fromIntegral m) + sumaRacionalesParcial n (m - 1)

-- Ejercicio 16)

-- a)
menorDivisor :: Integer -> Integer
menorDivisor x = menorDivisorDesde x 2

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde x s | mod x s == 0 = s
                      | otherwise = menorDivisorDesde x (s + 1)

-- b)
esPrimo :: Integer -> Bool
esPrimo x = menorDivisor x == x

-- c)
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos x y = sonCoprimosDesde x y 2

sonCoprimosDesde :: Integer -> Integer -> Integer -> Bool
sonCoprimosDesde x y s | (s == x && mod y s /= 0) || (s == y && mod x s /= 0) = True
                       | mod x s == 0 && mod y s == 0 = False
                       | otherwise = sonCoprimosDesde x y (s + 1)

-- d)
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = primerPrimoDesde (nEsimoPrimo (n - 1))

primerPrimoDesde :: Integer -> Integer
primerPrimoDesde n | esPrimo (n + 1) = n + 1
                   | otherwise = primerPrimoDesde (n + 1)

-- Ejercicio 17)

esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacciDesde n 0

esFibonacciDesde :: Integer -> Integer -> Bool
esFibonacciDesde n s | fibonacci s > n = False
                     | fibonacci s == n = True
                     | otherwise = esFibonacciDesde n (s + 1)

-- Ejercicio 18)
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar 0 = 0
mayorDigitoPar n | cantidadDeDigitos n == 1 && not (esPar n) = -1
                 | esPar (ultimoDigito n) && ultimoDigito n >= mayorDigitoPar (div n 10) = ultimoDigito n
                 | otherwise = mayorDigitoPar (div n 10)

esPar :: Integer -> Bool
esPar n = mod n 2 == 0

-- Ejercicio 19)

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = restarPrimos n 2 == 0

restarPrimos :: Integer -> Integer -> Integer
restarPrimos n p | n < 2 = n
                 | otherwise = restarPrimos (n - p) (primerPrimoDesde p)

-- Ejercicio 20)

sumaDivisoresDesde :: Int -> Int -> Int
sumaDivisoresDesde n s | n == s = n
                       | mod n s == 0 = s + sumaDivisoresDesde n (s + 1)
                       | otherwise = sumaDivisoresDesde n (s + 1)

sumaDivisores :: Int -> Int
sumaDivisores n = sumaDivisoresDesde n 1

minimo :: Int -> Int -> Int
minimo x y | x <= y = x
           | otherwise = y

maximo :: Int -> Int -> Int
maximo x y | x >= y = x
           | otherwise = y           

tomaValorMax :: Int -> Int -> Int
tomaValorMax n1 n2 | n1 == n2 = n1
                   | sumaDivisores (minimo n1 n2) >= sumaDivisores (tomaValorMax (minimo n1 n2 + 1) (maximo n1 n2)) = n1
                   | otherwise = tomaValorMax (minimo n1 n2 + 1) (maximo n1 n2)