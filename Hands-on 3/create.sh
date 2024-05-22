#! /bin/bash

# Crear un archivo de texto plano llamado mytext; agregando a dicho archivo la cadena “Hola Mundo”
echo "Hola Mundo" > mytext

# Desplegar/Imprimir en la terminal el contenido del archivo mytext
cat mytext

# Crear una fichero (folder) llamado backup
mkdir backup

# Mover el archivo mytext al fichero backup
mv mytext ./backup

# Listar el contenido del fichero backup
ls -l ./backup

# Eliminar el archivo mytext del fichero backup
rm ./backup/mytext

# Eliminar el fichero backup
rmdir ./backup
