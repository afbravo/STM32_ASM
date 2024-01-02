.syntax unified 
.cpu cortex-m4 
.thumb 

.equ RCC_BASE, 0x40023800 
.equ GPIOA_BASE, 0x40020000 
.equ GPIOC_BASE, 0x40020800 

@ RCC AHB1 Enable Register 
.equ RCC_AHB1ENR, RCC_BASE + 0x30 

@ RCC AHB1 Enable Register Bitmasks 
.equ RCC_GPIOA_EN, 0x1 
.equ RCC_GPIOC_EN, 0x4 

@ Port A Registers 
.equ GPIOA_MODER,GPIOA_BASE + 0x00 
.equ GPIOA_OTYPER, GPIOA_BASE + 0x04 
.equ GPIOA_ODR,GPIOA_BASE + 0x14 

@ PORT A, PIN 5 Bitmasks (LED) 
.equ GPIOA_MODER5_OUTPUT, 0x400 
.equ GPIOA_ODR5, 0x20 

@ Port C Registers 
.equ GPIOC_MODER, GPIOC_BASE + 0x00 
.equ GPIOC_IDR, GPIOC_BASE + 0x10 

@ PORT C, PIN 13 Bitmasks (Button) 
.equ GPIOC_MODER13_INPUT, 0x0 
.equ GPIOC_IDR13, 0x2000
