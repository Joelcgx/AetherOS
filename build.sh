#!/bin/bash
echo "Compilando codigo Ensamblador..."
if as --32 OS/boot/x86/boot.S -o OS/boot/x86/boot.o; then
    echo "Compilacion exitosa"
else 
    echo "Compilacion fallida"
    exit
fi

echo "Compilando codigo C..."
if gcc -m32 -c OS/core/kernel.c -o OS/core/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra -fstack-protector-strong ; then
    echo "Compilacion exitosa"
else 
    echo "Compilacion fallida"
    exit
fi

echo "Ejecutando el Vinculador(Linker)..."
if ld -m elf_i386 -T OS/linker.ld OS/core/kernel.o OS/boot/x86/boot.o -o OS/temp/AetherOS.bin -nostdlib; then
    echo "Vinculacion exitosa"
else 
    echo "Vinculacion fallida"
    exit
fi

echo "Verificando archivo multiboot..."
grub-file --is-x86-multiboot OS/temp/AetherOS.bin

sleep 0.2
echo "Creando directorios para empaquetar la ISO..."
mkdir -p build/iso_raw/boot/grub

echo "Copiando archivos necesarios para empaquetar la ISO..."
sleep 0.1
cp -v OS/temp/AetherOS.bin build/iso_raw/boot/AetherOS.bin
sleep 0.1
cp -v OS/grub/grub.cfg build/iso_raw/boot/grub/grub.cfg

sleep 1.1
echo "Empaquetando la ISO..."
grub-mkrescue -o build/AetherOS.iso build/iso_raw