# EJERCICIO 1)
def factorialN(n:int) -> int:
    res = 1
    for i in range(1,(n + 1)):
        res *= i
    return res

# 1)
def raizDe2():
    return round(2**0.5, 4)

# 2)
def imprimir_hola():
    print("Hola")
    
# 3)    
def imprimir_un_verso():
    print("Bajan, el día es vidrio sin sol")
    print("Bajan, la noche te oculta la voz")
    print("Y además vos querés sol")
    print("Despacio también podés hallar la luna")
    
# 4)    
def factorial_de_dos() -> int:
    return factorialN(2)

# 5)
def factorial_3() -> int:
    return factorialN(3)

# 6)
def factorial_4() -> int:
    return factorialN(4)

# 7)
def factorial_5() -> int:
    return factorialN(5)

# EJERCICIO 2)

# 1)
def imprimir_saludo(name: str):
    print(f"Hola {name}")

# 2)
def raiz_cuadrada_de(n: int):
    return n**0.5

# 3)
def imprimir_dos_veces(estribillo: str):
    print(estribillo*2)

# 4)
def es_multiplo_de(n: int, m: int) -> bool:
    return n % m == 0

# 5)
def es_par(n: int) -> bool:
    return es_multiplo_de(n, 2)

# 6)
def cantidad_de_pizzas(comensales: int, min_cantidad_de_porciones: int) -> int:
    porciones = comensales * min_cantidad_de_porciones
    if (es_multiplo_de(porciones, 8)):
        return porciones / 8
    else:
        return (porciones // 8) + 1

# EJERCICIO 3)

# 1)
def alguno_es_0(numero1: int, numero2: int) -> bool:
    return numero1 == 0 or numero2 == 0

# 2)
def ambos_son_0(numero1: int, numero2: int) -> bool:
    return numero1 == 0 and numero2 == 0

# 3)
def es_nombre_largo(name: str) -> bool:
    return len(name) >= 3 and len(name) <= 8

# 4)
def es_bisiesto(year: int) -> bool:
    return (es_multiplo_de(year, 4))

# EJERCICIO 4)

# 1)
def peso_pino(altura: int) -> int:
    peso: int = 0
    if altura <= 3:
       peso = altura * 300
    else:
        peso = 900 + (altura - 3) * 200
    return peso

# 2)
def es_peso_util(peso: int) -> int:
    return (peso >= 400) and (peso <= 1000)