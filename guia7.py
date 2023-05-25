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
def es_peso_util(peso: int) -> bool:
    return (peso >= 400) and (peso <= 1000)

# 3 y 4)
def sirve_pino(altura: int) -> bool:
    return es_peso_util(peso_pino(altura))

# EJERCICIO 5)

# 1)
def devolver_el_doble_si_es_par(un_numero: int) -> int:
    res: int = un_numero
    if (un_numero % 2 == 0):
        res *= 2
    return res

# 2)
def devolver_valor_si_es_par_sino_el_que_sigue(un_numero: int) -> int:
    res: int = un_numero
    if (un_numero % 2 != 0):
        res += 1
    return res

# 3)
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(un_numero: int) -> int:
    res: int = un_numero
    if (un_numero % 9 == 0):
        res *= 3
    elif (un_numero % 3 == 0):
        res *= 2
    return res

# 4)
def nombre_largo(nombre: str) -> str:
    msg: str = ""
    if (len(nombre) >= 5):
        msg = "Tu nombre tiene muchas letras!"
    else:
        msg = "Tu nombre tiene menos de 5 caracteres"
    return msg

# 5)
def trabajo_o_vacaciones(sexo: str, edad: int):
    msg: str = ""
    msg1: str = "Andá de vacaciones"
    msg2: str = "Te toca trabajar"
    if (sexo == "M"):
        if (edad < 18) or (edad >= 65):
            msg = msg1
        else:
            msg = msg2
    else:
        if (edad < 18) or (edad >= 60):
            msg = msg1
        else:
            msg = msg2
    return msg

# EJERCICIO 6)

# 1)
def imprimir_nums_1_al_10():
    i: int = 1
    while (i <= 10):
        print(i)
        i += 1

# 2)
def imprimir_pares_entre_10_y_40():
    i: int = 10
    while (i <= 40):
        print(i)
        i += 2

# 3)
def imprimir_eco_10_veces():
    i: int = 1
    while (i <= 10):
        print("eco")
        i += 1

# 4)
def lanzamiento(num_cuenta: int):
    i: int = num_cuenta
    while (i >= 1):
        print(i)
        i -= 1
    print("Despegue")

# 5)
def viaje_temporal(partida: int, llegada: int):
    current_year: int = partida
    while (current_year > llegada):
        current_year -= 1
        print("Viajó un año al pasado, estamos en el año: " + str(current_year))

# 6)
def conocer_aristoteles(partida: int):
    current_year: int = partida
    while (current_year >= -373):
        current_year -= 20
        print("Viajó veinte años al pasado, estamos en el año: " + str(current_year))
    print("Ya podés conocer a Aristóteles")