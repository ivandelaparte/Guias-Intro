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