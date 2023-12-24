// Archivo Cabacera de la librería VGA
#define VGA_MEMORY_ADDRESS 0xB8000
#define VGA_WIDTH 80
#define VGA_HEIGHT 25
#define VGA_BUFFER_SIZE (uint16_t *)VGA_MEMORY_ADDRESS

void pint_string(char *string);

#include <stdint.h>

// La función `print_string` se utiliza para imprimir una cadena en la pantalla VGA. Se necesitan cuatro parámetros: `str` (la cadena que se va a imprimir), `cordernada_x` (la coordenada x de la posición inicial), `coredenada_y` (la coordenada y de la posición inicial) y `color` (la color del texto).
void print_string(const char *str, int cordernada_x, int coredenada_y, uint16_t color)
{
    uint16_t *BUFFER = VGA_BUFFER_SIZE;
    uint32_t index = coredenada_y * VGA_WIDTH + cordernada_x;

    while (*str != '\0')
    {
        uint16_t caracter_con_color = color << 8 | *str;

        BUFFER[index] = caracter_con_color;

        index++;
        str++;
    }
}

// La función `set_color_background` se utiliza para configurar el color de fondo de la pantalla VGA. Se necesita un parámetro "color", que es el color deseado para el fondo.
void set_color_background(uint16_t color)
{
    uint16_t *BUFFER = VGA_BUFFER_SIZE;
    for (int i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++)
    {
        BUFFER[i] = color << 8 | ' ';
    }
}