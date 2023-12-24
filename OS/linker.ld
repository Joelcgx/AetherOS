
/* Este código define el diseño de las secciones en la memoria de un programa. */


/* `ENTRY(_start)` establece el punto de entrada del programa en la etiqueta `_start`. Esto significa que cuando se ejecuta el programa, la primera instrucción que se ejecutará será la que esté en la etiqueta `_start`. */
ENTRY(_start)

SECTIONS
{
    /* `. = 1M;` está configurando la ubicación de memoria actual en 1 megabyte (1M). Esto significa que las secciones posteriores definidas en el código se colocarán en la memoria a partir de esta ubicación. */
    . = 1M;

    /* Este código define el diseño de las secciones en la memoria de un programa.
    (Read Only .data Section) */
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }

    /* Este código define el diseño de las secciones en la memoria de un programa. */
    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }

   /* Este código define el diseño de las secciones en la memoria de un programa. */
    .data BLOCK(4K) : ALIGN(4K)
    {
        *(.data)
    }

    /* El código `.bss BLOCK(4K): ALIGN(4K)` define el diseño de la sección `.bss` en la memoria de un programa. */
    .bss BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }
}