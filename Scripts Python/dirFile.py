#!/bin/bash
#Dado un fichero denominado rutas.txt, que contiene el nombre de ficheros y
#directorios que ya deben existir, introducir en 2 listas diferentes cada uno de
#ellos, es decir, en una lista los ficheros y en otra los directorios (habrá que
#comprobar línea a línea si lo leído es un fichero o un directorio).
# Autor: Miguel Anxo Parada Bandera
# Fecha: 05/03/2024

import os
import shutil

file=open("/home/alumno/Escritorio/rutas.txt","r")

lista=file.readlines()
dir=[]
file=[]
for i in lista:
    ruta=i.strip()
    if os.path.isfile(ruta):
        print("Fichero ",ruta)
        file.append(ruta)
    elif os.path.isdir(ruta):
        print("Directorio ",ruta)
        dir.append(ruta)
    else:
        print("No existen",ruta)


print("A- Pedir nombre de fichero y eliminarlo")
print("B- Pedir nombre de directorio y mostrar su información")
print("C- Pedir nombre de fichero, nombre de destino y copiarlo en dicho destino")
print("D- Mostrar lista elegida por el usuario")
print("E- Salir")

opcion = input("Elige una de las siguientes opciones: ")



if opcion == "A":
    print("Has seleccionado la opción A")
    nomfich: str = input("Introduzca el nombre de un fichero: ")
    if os.path.isfile(nomfich):
        os.system("rm " + nomfich)
        print("El fichero se ha eliminado del dispositivo.")

if opcion == "B":
    print("Has seleccionado la opción B")
    nomDir = input("Introduzca el nombre de un directorio: ")
    if os.path.isdir(nomDir):
        info = os.listdir(nomDir)
        print(info)

if opcion == "C":
    print("Has seleccionado la opción C")
    nomsrc = input("Introduzca el nombre de un fichero: ")
    if os.path.isdir(nomsrc):
        nomdst= input("Introduzca el nombre de un directorio: ")
        if os.path.isdir(nomdst):
            copiar = shutil.copy(nomsrc, nomdst)

if opcion == "D":
    print("Has seleccionado la opción D")
    dirofile = input("Selecciona una lista de las de antes, dir o file (recuerda que solo puedes elegir o *dir* o *file*): ")
    if dirofile == "dir":
        print(dir)
    if dirofile == "file":
        print(file)

if opcion == "E":
    print("Has seleccionado la opción de salida, saliendo...")
    exit()