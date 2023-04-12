doubleMe :: Integer -> Integer
doubleMe x = x + x

-- Ejercicio 1

-- a)
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

-- b)
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1

-- c)
h :: Integer -> Integer
h x = g (f x)

k :: Integer -> Integer
k x = f (g x)

-- Ejercicio 2

-- a)
absoluto :: Integer -> Integer
absoluto x | x >= 0 = x
           | otherwise = -x

-- b)
maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto x y | (absoluto x) >= (absoluto y) = (absoluto x)
                   | otherwise = (absoluto y)

-- c)
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z | (x >= y) && (x >= z) = x
              | (y >= z) && (y >= x) = y
              | (z >= x) && (z >= y) = z

-- d)
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y = (x == 0) || (y == 0)

algunoEs0v2 :: Float -> Float -> Bool
algunoEs0v2 _ 0 = True
algunoEs0v2 0 _ = True
algunoEs0v2 x y = False

-- e)
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y = (x == 0) && (y == 0)

ambosSon0v2 :: Float -> Float -> Bool
ambosSon0v2 0 0 = True
ambosSon0v2 x y = False

-- f)
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | (x <= 3) && (y <= 3) = True
                   | (x > 3) && (x <= 7) && (y > 3) && (y <= 7) = True
                   | (x > 7) && (y > 7) = True
                   | otherwise = False

-- g)
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z | (x == y) && (x == z) = x
                    | (x == y) && (x /= z) = x + z
                    | (x == z) && (x /= y) = x + y
                    | (z == y) && (x /= z) = z + x
                    | (x /= y) && (x /= z) = x + y + z

-- h)
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y = mod x y == 0

-- i)
digitoUnidades :: Integer -> Integer
digitoUnidades x = mod x 10

-- j)
digitoDecenas :: Integer -> Integer
digitoDecenas x = digitoUnidades (div x 10)

-- Ejercicio 3

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados 0 0 = undefined
estanRelacionados a b = esMultiploDe b (-a)

-- Ejercicio 4

-- a)
prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (fx, sx) (fy, sy) = fx * fy + sx * sy

-- b)
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (fx, sx) (fy, sy) = (fx < fy) && (sx < sy)

-- c)
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (fx, sx) (fy, sy) = sqrt (((fy - fx) ^ 2) + ((sy - sx) ^ 2))

-- d)
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x, y, z) = x + y + z

-- e)
sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (x, y, z) e = (conservarMultiplo x e) + (conservarMultiplo y e) + (conservarMultiplo z e) 

conservarMultiplo :: Integer -> Integer -> Integer
conservarMultiplo n e | esMultiploDe n e = n
                      | otherwise = 0

-- f)
posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x, y, z) | esPar x = 0
                       | esPar y = 1
                       | esPar z = 2
                       | otherwise = 4

esPar :: Integer -> Bool
esPar x = mod x 2 == 0 

-- g)
crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)

-- h)
invertir :: (a, b) -> (b, a)
invertir (x, y) = (y, x)

-- Ejercicio 5

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (x, y, z) = ((funcionF x) > (funcionG x)) && ((funcionF y) > (funcionG y)) && ((funcionF z) > (funcionG z))

funcionF :: Integer -> Integer
funcionF n | n <= 7 = n^2
           | otherwise = 2 * n - 1

funcionG :: Integer -> Integer
funcionG n | esPar n = div n 2
           | otherwise = 3 * n + 1

-- Ejercicio 6

bisiesto :: Integer -> Bool
bisiesto y = esMultiploDe y 4

-- Ejercicio 7

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (p1, p2, p3) (q1,q2, q3) = (modulo (p1 - q1)) + (modulo (p2 - q2)) + (modulo (p3 - q3))

modulo :: Float -> Float
modulo n | n >= 0 = n
         | otherwise = -n

-- Ejercicio 8

comparar :: Integer -> Integer -> Integer
comparar a b | (sumaUltimosDosDigitos a) < (sumaUltimosDosDigitos b) = 1
             | (sumaUltimosDosDigitos a) > (sumaUltimosDosDigitos b) = -1
             | otherwise = 0

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos n = (digitoUnidades (absoluto n)) + (digitoDecenas (absoluto n))