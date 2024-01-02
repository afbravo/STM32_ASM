.syntax unified
.cpu cortex-m4
.thumb

.text
.type Reset_Handler, %function
.global Reset_Handler

.include "inc/stm32f446.inc"

Reset_Handler:
@ Enable Clock for Port A
ldr r0, =RCC_AHB1ENR
ldr r1, [r0]
orr r1, r1, #RCC_GPIOA_EN
str r1, [r0]

@ Set Port A, Pin 5 to Output
ldr r0, =GPIOA_MODER
ldr r1, [r0]
orr r1, r1, #GPIOA_MODER5_OUTPUT
str r1, [r0]

@ Turn ON LED
ldr r0, =GPIOA_ODR
ldr r1, [r0]
orr r1, r1, #GPIOA_ODR5
str r1, [r0]
b .
