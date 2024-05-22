#!/bin/bash

while true; do
    # Mostrar el menú de opciones
    clear
    echo "----- Menu de Servicios -----"
    echo "1. Listar el contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Usar el comando awk"
    echo "5. Usar el comando grep"
    echo "6. Salir"

    # Solicitar al usuario que elija una opción
    read -p "Ejecutar servicio: " opcion

    case $opcion in
        1)
            # Listar el contenido de un fichero
            read -p "Ingrese la ruta absoluta al fichero o carpeta: " ruta
            ls -l "$ruta"
            ;;
        2)
            # Crear un archivo de texto con una línea de texto
            read -p "Ingresa el nombre del archivo: " archivo
            read -p "Ingrese la línea de texto a almacenar en el archivo: " texto
            echo "$texto" > $archivo
            echo "Archivo creado con éxito."
            ;;
        3)
            # Comparar dos archivos de texto
            read -p "Ingrese el nombre del primer archivo: " archivo1
            read -p "Ingrese el nombre del segundo archivo: " archivo2
            diff "$archivo1" "$archivo2"
            ;;
        4)
            # Ejemplo de uso de awk
            echo "Ejemplo de uso de awk:"
            echo "Contenido del archivo archivo.txt:"
            cat archivo.txt
            echo "Utilizando awk para imprimir la primera columna:"
            awk '{print $1}' archivo.txt
            ;;
        5)
            # Ejemplo de uso de grep
            echo "Ejemplo de uso de grep:"
            echo "Contenido del archivo archivo.txt:"
            cat archivo.txt
            echo "Buscando la palabra 'Mundo' en el archivo:"
            grep "Mundo" archivo.txt
            ;;
        6)
            # Salir del script
            echo "Saliendo del script..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, elija una opción válida."
            ;;
    esac

    # Pausar la ejecución hasta que el usuario presione Enter
    read -p "Presione Enter para continuar..."
done
