from typing import Tuple
# EJERCICIO 1)

# 1)
def pertenece (s: list([int]), e: int) -> bool:
    res: bool = False
    for i in range (0, len(s), 1):
        if (s[i] == e):
            res = True
    return res

# 2)
def divideATodos (s: list([int]), e: int) -> bool:
    res: bool = True
    for i in range (0, len(s), 1):
        if (s[i] % e != 0):
            res = False
    return res

# 3)
def sumaTotal (s: list([int])) -> int:
    res: int = 0
    for i in range (0, len(s), 1):
        res += s[i]
    return res

# 4)
def ordenados (s: list([int])) -> bool:
    res: bool = True
    for i in range (0, len(s)-1, 1):
        if (s[i] > s[i+1]):
            res = False
    return res

# 5)
def hay_palabra_larga (s: list([str])) -> bool:
    res: bool = False
    for i in range (0, len(s), 1):
        if (len(s[i]) > 7):
            res = True
    return res

# 6)
def es_palindromo(s: str) -> str:
    return (s == reverso(s))

def reverso(s: str) -> str:
    res: str = ""
    for i in range (len(s)-1, -1, -1):
        res += s[i]
    return res

# 7)
def safe_password (p: str) -> str:
    password_colour: int = ""
    if (len(p)>8) and (tiene_mayus(p)) and (tiene_minus(p)) and (tiene_caract_esp(p)):
        password_colour = "VERDE"
    elif (len(p)<5):
        password_colour = "ROJO"
    else:
        password_colour = "AMARILLO"
    return password_colour

def tiene_mayus (p: str) -> bool:
    mayus: str = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
    res: bool = False
    for i in range (0, len(p), 1):
        if (mayus.count(p[i]) > 0):
            res = True
    return res

def tiene_minus (p: str) -> bool:
    minus: str = "abcdefghijklmnñopqrstuvwxyz"
    res: bool = False
    for i in range (0, len(p), 1):
        if (minus.count(p[i]) > 0):
            res = True
    return res

def tiene_caract_esp (p: str) -> bool:
    esp: str = ".,-_*+-$%&#"
    res: bool = False
    for i in range (0, len(p), 1):
        if (esp.count(p[i]) > 0):
            res = True
    return res

# 8)
def saldo_actual (historial: list([Tuple[str, int]])) -> int:
    saldo: int = 0
    for i in range (0, len(historial), 1):
        if (historial[i][0] == "I"):
            saldo += historial[i][1]
        if (historial[i][0] == "R"):
            saldo -= historial[i][1]
    return saldo

# 9)
def tres_vocales_distintas (p:str) -> bool:
    res: str = True
    vocales_posibles: list([str]) = ["A","E","I","O","U"]
    for i in range (0, len(p), 1):
        if (pertenece(vocales_posibles, p[i])):
            vocales_posibles.remove(p[i])
    return (len(vocales_posibles) <= 2)

# EJERCICIO 2)

# 1)
def posiciones_pares_a_0_inout (l: list([int])):
    for i in range (0, len(l), 1):
        if (i % 2 == 0):
            l[i] = 0

# 2)
def posiciones_pares_a_0_in (l: list([int])) -> list([int]):
    res: list = []
    for i in range (0, len(l), 1):
        if (i % 2 == 0):
            res.append(0)
        else:
            res.append(l[i])
    return res

# 3)
def quitar_vocales_in (s: str) -> str:
    res: str = ""
    vocales: str = "aAeEiIoOuU"
    for i in range (0, len(s), 1):
        if (vocales.count(s[i]) == 0):
            res += s[i]
    return res

# 4)
def reemplaza_vocales (s: str) -> str:
    res: str = ""
    vocales: str = "aAeEiIoOuU"
    for i in range (0, len(s), 1):
        if (vocales.count(s[i]) == 0):
            res += s[i]
        else:
            res += " "
    return res

# 5)
def da_vuelta_str (s: str) -> str:
    res: str = ""
    for i in range (len(s)-1, -1, -1):
        res += s[i]
    return res

# EJERCICIO 3)

# 1)
def mis_estudiantes () -> list([str]):
    valor: str = input("Ingrese nombre de alumno -->")
    res: list[(str)] = []    
    while (valor != "listo"):
        res.append(valor)
        valor = input("Ingrese nombre de alumno -->")
    return res

# 2)
def historial_monedero () -> list([(str, int)]):
    estado: str = ""
    res: list([(str, int)]) = []
    while (estado != "X"):
        estado = input("¿En qué puedo ayudarte? -->")
        if (estado == "C"):
            monto_a_cargar: int = input("¿Qué monto desea cargar? -->")
            res.append((estado, monto_a_cargar))
        if (estado == "D"):
            monto_a_descontar: int = input("¿Qué monto desea descontar? -->")
            res.append((estado, monto_a_descontar))
    return res

# 3)
def siete_y_medio ():
    cartas: list ([int]) = [1,2,3,4,5,6,7,10,11,12]
    suma: int = 0