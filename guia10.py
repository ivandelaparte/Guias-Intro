# EJERCICIO 1)

# 1)
def contar_lineas (nombre_archivo: str) -> int:
    archivo = open(nombre_archivo + ".txt")
    cantidad_de_lineas: int = 0
    for linea in archivo.readlines():
        cantidad_de_lineas += 1
    archivo.close()
    return cantidad_de_lineas

# 2)
def existe_palabra (palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo + ".txt")
    res: bool = False
    for linea in archivo.readlines():
        if linea_contiene_palabra(palabra, linea):
            res = True
    archivo.close()
    return res

def linea_contiene_palabra (palabra: str, linea: str):
    res: bool = False
    recorrido_linea: str = linea
    while (res == False) and (len(palabra) <= len(recorrido_linea)):
        coinciden: bool = True
        for i in range (0, len(palabra), 1):
            if palabra[i] != recorrido_linea[i]:
                coiciden = False
        if coinciden:
            res = True
        else:
           recorrido_linea = recorrido_linea[1::1]
    return res

# 3)
def cantidad_apariciones (nombre_archivo: str, palabra: str):
    archivo = open(nombre_archivo + ".txt")
    apariciones: int = 0
    for linea in archivo.readlines():
        apariciones += cantidad_apariciones_linea(palabra, linea)
    archivo.close()
    return apariciones

def cantidad_apariciones_linea (palabra: str, linea: str):
    apariciones: int = 0
    recorrido_linea: str = linea
    while (len(palabra) <= len(recorrido_linea)):
        coinciden: bool = True
        for i in range (0, len(palabra), 1):
            if palabra[i] != recorrido_linea[i]:
                coinciden = False
        if coinciden:
            apariciones += 1
            recorrido_linea = recorrido_linea[len(palabra)::1]
        else:
           recorrido_linea = recorrido_linea[1::1]
    return apariciones
    
# Ejercicio 2)
def clonar_sin_comentarios (nombre_archivo: str):
    archivo = open(nombre_archivo + ".txt")
    nombre_archivo_destino = nombre_archivo + "-sin_comentarios.txt"
    destino = open(nombre_archivo_destino, "w", encoding='utf8')
    for linea in archivo.readlines():
        recorrido_linea: str = linea
        while (len(recorrido_linea) > 0) and (recorrido_linea[0] == " "):
            recorrido_linea = recorrido_linea[1::1]
        if recorrido_linea[0] != "#":
            destino.write(linea)
    archivo.close()
    destino.close()

# Ejercicio 3)
def dar_vuelta (nombre_archivo: str):
    archivo = open(nombre_archivo + ".txt")
    destino = open("reverso.txt", "w", encoding='utf8' )
    contenido: list = []
    for linea in archivo.readlines():
        contenido.insert(0, linea)
    for linea in contenido:
        destino.write(linea)
    archivo.close()
    destino.close()

# Ejercicio 4)
def agregar_frase_final (frase: str, nombre_archivo: str):
    archivo = open(nombre_archivo + ".txt", "a")
    archivo.write("\n"+frase)
    archivo.close()

# Ejercicio 5)
def agregar_frase_inicial (frase: str, nombre_archivo: str):
    archivo = open(nombre_archivo + ".txt", "r")
    contenido: list = [frase + "\n"]
    for linea in archivo.readlines():
        contenido.append(linea)
    archivo.close()
    archivo_editado = open(nombre_archivo + ".txt", "w")
    for linea in contenido:
        archivo_editado.write(linea)
    archivo_editado.close()

# Ejercicio 7)
def promedio_estudiante (lu: str, nombre_archivo: str) -> float:
    archivo = open(nombre_archivo + ".txt")
    notas: list = []
    suma_notas: int = 0
    def obtener_nota (linea: str) -> float:
        posicion_dato: int = 0
        nota_encontrada: str = ""
        for caracter in linea:
            if posicion_dato == 3:
                nota_encontrada = nota_encontrada + caracter
            if caracter == ",":
                posicion_dato += 1
        return float(nota_encontrada)
    def obtener_lu (linea: str) -> str:
        posicion_dato: int = 0
        lu_encontrada: str = ""
        for caracter in linea:
            if caracter == ",":
                posicion_dato += 1
            if posicion_dato == 0:
                lu_encontrada = lu_encontrada + caracter
        return lu_encontrada
    for linea in archivo.readlines():
        if obtener_lu(linea) == lu:
            notas.append(obtener_nota(linea))
    for nota in notas:
        suma_notas += nota
    promedio = suma_notas / len(notas)
    return promedio

# Ejercicio 8)
from random import sample
def generar_nros_al_azar (n: int, desde: int, hasta: int) -> list ([int]):
    posibles_nros: list([int]) = []
    for i in range (desde, hasta + 1, 1):
        posibles_nros.append(i)
    lista: list ([int]) = sample(posibles_nros, n)
    return lista

# Ejercicio 9)
from queue import LifoQueue as Pila
def armar_pila_azarosa (n: int, desde: int, hasta: int):
    lista = generar_nros_al_azar(n, desde, hasta)
    pila_res = Pila()
    for el in lista:
        pila_res.put(el)
    return pila_res

# Ejercicio 10)
def cantidad_elementos_pila (p: Pila) -> int:
    contador: int = 0
    while (not p.empty()):
        contador += 1
        p.get()
    return contador

# Ejercicio 11)
def buscar_el_maximo_pila (p: Pila()) -> int:
    maximo: int = p.get()
    while (not p.empty()):
        actual: int = p.get()
        if actual > maximo:
            maximo = actual
    return maximo

# Ejercicio 12)
def esta_bien_balanceada (s: str) -> bool:
    parentesis = Pila()
    res: bool = True
    for caracter in s:
        if parentesis.empty() and caracter == ")":
            res = False
        elif caracter == "(":
            parentesis.put(1)
        elif caracter == ")":
            parentesis.get()
    if not parentesis.empty():
        res = False
    return res

# Ejercicio 13)
from queue import Queue as Cola
def armar_cola_azarosa (n: int, desde: int, hasta: int):
    lista = generar_nros_al_azar(n, desde, hasta)
    cola_res = Cola()
    for el in lista:
        cola_res.put(el)
    return cola_res

# Ejercicio 14)
def cantidad_elementos_cola (c: Cola) -> int:
    contador: int = 0
    while (not c.empty()):
        contador += 1
        c.get()
    return contador

# Ejercicio 15)
def buscar_el_maximo_cola (c: Cola()) -> int:
    maximo: int = c.get()
    while (not c.empty()):
        actual: int = c.get()
        if actual > maximo:
            maximo = actual
    return maximo

# Eejrcicio 16)
def armar_secuencia_bingo () -> Cola(int):
    numeros: list([int]) = []
    for i in range (1,100,1):
        numeros.append(i)
    numeros_desordenados = sample(numeros, 99)
    cola = Cola()
    for numero in numeros_desordenados:
        cola.put(numero)
    return cola

def jugar_carton_bingo (carton: list([int]), bolillero: Cola(int)) -> int:
    numeros_restantes = carton.copy()
    jugadas: int = 0
    while (len(numeros_restantes) > 0):
        jugadas += 1
        numero_actual: int = bolillero.get()
        if pertenece(numeros_restantes, numero_actual):
            numeros_restantes.remove(numero_actual)
    return jugadas
    
def pertenece (l: list, elem) -> bool:
    res: bool = False
    for i in l:
        if (elem == i):
            res = True
    return res

# Ejercicio 17)
from typing import Tuple
def n_pacientes_urgentes (c: Cola((int, str, str))) -> int:
    urgentes: int = 0
    while (not c.empty()):
        paciente_actual: Tuple(int, str, str) = c.get()
        if (paciente_actual[0] < 4):
            urgentes += 1
    return urgentes