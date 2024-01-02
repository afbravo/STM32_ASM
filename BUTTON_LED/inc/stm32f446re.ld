MEMORY {
    FLASH   : ORIGIN = 0x08000000, LENGTH = 512K
    SRAM    : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS {
    .VectorTable : {
        *(.VectorTable)
    } > FLASH

    .text : {
        *(.text)
    } > FLASH

    .data (NOLOAD) : {
        . = . + 0x400;
        _StackEnd = .;
        *(.data)
    } > SRAM
}