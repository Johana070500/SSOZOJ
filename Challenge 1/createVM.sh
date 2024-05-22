#!/bin/bash

# Verificar si se han proporcionado todos los argumentos necesarios
if [ "$#" -ne 10 ]; then
    echo "Uso: $0 <nombre_vm> <tipo_so> <cpus> <memoria_ram> <memoria_vram> <tamano_disco> <nombre_sata> <nombre_ide>"
    exit 1
fi


# Asignar los argumentos a las variables
nombre_vm="$1"
tipo_so="$2"
cpus="$3"
memoria_ram="$4"
memoria_vram="$5"
tamano_disco="$6"
nombre_sata="$7"
nombre_ide="$8"

# Crear la máquina virtual
VBoxManage createvm --name "$nombre_vm" --ostype "$tipo_so" --register

# Configurar la cantidad de CPUs
VBoxManage modifyvm "$nombre_vm" --cpus "$cpus"

# Configurar la memoria RAM
VBoxManage modifyvm "$nombre_vm" --memory "$memoria_ram"

# Configurar la memoria VRAM
VBoxManage modifyvm "$nombre_vm" --vram "$memoria_vram"

# Crear y configurar el disco duro virtual
VBoxManage createhd --filename "$nombre_vm.vdi" --size "$tamano_disco"
VBoxManage storagectl "$nombre_vm" --name "$nombre_sata" --add sata --controller IntelAHCI
VBoxManage storageattach "$nombre_vm" --storagectl "$nombre_sata" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"

# Crear y configurar el controlador IDE
VBoxManage storagectl "$nombre_vm" --name "$nombre_ide" --add ide

# Imprimir la configuración de la máquina virtual
VBoxManage showvminfo "$nombre_vm"
