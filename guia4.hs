-- Ejercicio 1)

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = (fibonacci (n - 1)) + (fibonacci (n - 2))

-- Ejercicio 2)

parteEntera :: Float -> Integer
parteEntera n | n < 1 = 0
              | otherwise = (parteEntera (n - 1)) + 1

-- Ejercicio 3)

esDivisible :: Integer -> Integer -> Bool
esDivisible x y | x < y = False
                | x == y = True
                | x > y = esDivisible (x-y) y

-- Ejercicio 4)

sumaImpares :: Integer -> Integer
sumaImpares 1 = 1
sumaImpares n = (sumaImpares (n - 1)) + ((2 * n) - 1)

-- Ejercicio 5)

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * (medioFact (n-2))

-- Ejercicio 6)

sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos n = (mod n 10) + (sumaDigitos (div n 10))

-- Ejercicio 7)

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | (n >= 0) && (n <= 9) = True
                      | otherwise = ((ultimoDigito n) == (ultimoDigito (quitarUltimoDigito n))) && (todosDigitosIguales (quitarUltimoDigito n))

ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10

quitarUltimoDigito :: Integer -> Integer
quitarUltimoDigito n = div n 10

-- Ejercicio 8)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | i == (cantidadDeDigitos n) = ultimoDigito n
                 | i < (cantidadDeDigitos n) = iesimoDigito (quitarUltimoDigito n) i

cantidadDeDigitos :: Integer -> Integer
cantidadDeDigitos n | (n >= 0) && (n <= 9) = 1
                    | otherwise = 1 + cantidadDeDigitos (quitarUltimoDigito n)

-- Ejercicio 9)

esCapicua :: Integer -> Bool
esCapicua n | (n >= 0) && (n <= 9) = True
            | otherwise = (primerDigito n) == (ultimoDigito n) && esCapicua (quitarPrimerDigito (quitarUltimoDigito n))

primerDigito :: Integer -> Integer
primerDigito n = iesimoDigito n 1

quitarPrimerDigito :: Integer -> Integer
quitarPrimerDigito n = n - ((primerDigito n) * 10 ^ (cantidadDeDigitos (n) - 1))

-- Ejercicio 10)

-- a)
f1 :: Integer -> Integer
f1 0 = 1
f1 n = (2 ^ n) * f1 (n - 1)

-- b)
f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = (q ^ n) * (f2 (n - 1) q)

-- c)
f3 :: Integer -> Float -> Float
f3 1 q = q ^ 2
f3 n q = ((q ^ (2 * n)) * (f2 ((2*n) - 1) q)) / q

-- d)
f4 0 q = 1
f4 n q = ((q ^ ((2 * n) - 1)) * (q ^ (2 * n)) * (f4 (n - 1) q)) / (q ^ (n - 1))