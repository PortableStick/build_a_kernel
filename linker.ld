OUTPUT_FORMAT(elf32-1386)
ENTRY(start)
SECTIONS
{
    . = 0x100000;
    .text   :   { *(.text) }
    .data   :   { *(.data) }
    .bss    :   { *(.bss)  }
}
