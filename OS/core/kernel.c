// Kernel Main AetherOS Copyright (C) 2023-2024, By The AetherOS Project
// This program is free software: you can redistribute it and/or modify

// Importaciones
#include "./system_files/vga/vga.h"
#include <stdint.h>

void load_Kernel()
{
    // Establece el color de fondo
    set_color_background(0x8 << 4);
    // Establece Info en Pantalla
    print_string("AetherOS", 0, 24, 0x8 << 4 | 0xF);

    print_string("Loading ASM...", 0, 25, 0x8 << 4 | 0xF);

    KB();
}
