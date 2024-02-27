#!/bin/bash

import os

if os.getuid()!= 0:
     print("No eres root")
     exit()

print("Opcion 1: Mostrar info del SSOO y de la CPU")
print("Opcion 2: Pedir un usuario para ver si existe")
print("Opcion 3: Pedir un directorio para ver si existe")
print("Opcion 4: Salir del script")

opcion=int(input("Escoge una opción: "))

if opcion == 1:
     l=os.uname().sysname
     j=os.uname().version
     print("Nombre del Sistema operativo:",l)
     print("Version del Sistema operativo:", j)
     exit()

if opcion == 2:
     fich=open("/etc/passwd","r")
     lineas=fich.readlines()

     for i in lineas:
          usuario = input("Dame el nombre de un usuario ")
          if usuario in i:
               print("Usuario existente, esta es su info: ",i)
               exit()
          else:
               print("Vamos a crear el usuario")
               os.system("useradd -m "+usuario)
               exit()

if opcion == 3:
     direc=input("Dame el nombre de un directorio")
     if os.path.isdir(direc) == True:
          print("Este directorio ya existe")
     else:
          print("Este directorio no existe, creando...")
          os.system("mkdir "+direc)
          print("Operacion completada")

if opcion == 4:
     print("Saliendo")
     exit()