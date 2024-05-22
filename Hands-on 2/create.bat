@echo off

::Creamos archivo de texto plano y le insertamos la cadena "Hello World"::
echo Hello World > mytext.txt

::Revisamos el contenido del archivo mytext.txt::
type mytext.txt

::Creamos un subdirectorio llamado "backup"::
mkdir backup

::Copiamos el archivo mytext.txt al subdirectorio "backup"::
copy mytext.txt backup

::Listamos el contenido del subdirectorio "backup"::
dir backup

::Eliminamos el archivo mytext.txt del subdirectorio ""backup"::
del backup\mytext.txt

::Eliminamos el sibdirectorio "backup"::
rmdir backup

::Pausamos la ejecucion del script para que no se cierre la ventana::
pause
