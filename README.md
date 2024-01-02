# STM32 Blink LED using Assembly

This project was done to familiarize myself with writing assembly code, linker scripts, and 
makefiles for the STM32 microcontroller. In this project, I used a Nucleo-F446RE board with a
STM32F446RE microcontroller. I previously have messed around with writing assembly code in RISC-V
and x86, but this was my first time writing assembly code for ARM. The transition was pretty
smooth, but there were some canviats with the ARM architecture and the writing.

Most importantly this was a very big step in understanding memory mapping and how to make a linker
script. I had to look up a lot of information and read all the datasheets to understand how to make
it work. The website [mikrocontroller.net](https://www.mikrocontroller.net/articles/ARM-ASM-Tutorial#Microcontroller_selection)
has a great article with very detail explanation on how to make the whole assembly project.

It helped me understand the reasoning behind several conventions in assembly, where code and data goes,
and how to have everything together in a coherent project. I added the makefile (something not found in the
article) to assemble, link, flash and clean the project easily.

## Peripherals Used
The Nucleo-F446RE board has a built in LED and button. They are connected as:
- `BUTTON` : PC13
- `LED` : PA5

## Memory Maps

Reading the programming documentation and the reference manual for the STM32F4456RE, I was able to find
the following characteristics of the memory that were imported into the linker script:

- `FLASH` start = 0x08000000 size = 512k
- `SRAM` start = 0x20000000 size = 128k

## Directory Structure

This project contains several sub-projects that make different things happen in the mcu. The following
are the sub-projects and their descriptions:

- `LED_ON` : Turns the LED on and keeps it on.
- `BLINK_LED` : Blinks the LED on the board based on a delay implemented as a simple loop. No timer were used.
- `BUTTON_LED` : Turns the LED on when the button is pressed and off when it is released.
- `Template` : A template project that can be used to start a new project. It contains the makefile, linker script, and startup code.

All sub-projects have the following structure:

- `main.s | <project_name>.s` : The main assembly file that contains the main function of the project.
- `inc` : Directory that contains the linker script, the vectortable, and the register definitions.
- `Makefile` : The makefile that assembles, links, flashes, and cleans the project.
- `build` : (Will be made after running make) Directory that contains the object files, the final elf, and the final binary.

## The Code

All projects are very straight forward and simple. The code that is implemented was already done in `C` on other
projects. By using register level programming, I was able to implement the same functionality in assembly easily. The
only caviat was remembering that I need to load the address first into a register and then load the value of the address
(something that I messed when I started).

## How to Use

To use this project, you need to have the `GNU ARM Embedded Toolchain`, `openOCD`, and `gdb` installed.

To assemble the project you must be in the project directory and simply run the command `make`. This will assemble the
project and link it. The final binary will be in the `build` directory. To flash the project, you can then simply run
the command `make flash`. This will use `openOCD` to flash the binary to the board. To clean the project, you can run
the command `make clean`. This will remove the `build` directory and all its contents.

