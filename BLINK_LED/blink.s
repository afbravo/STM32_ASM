.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32f446.inc"

.text
.type Reset_Handler, %function
.global Reset_Handler

delay = 1000000

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

@ Set registers to turn on and off the led
ldr r5, =GPIOA_ODR5
ldr r6, =0xffffffff
eor r6, r6, r5

@ Turn off the led
OFF:
    ldr r0, =GPIOA_ODR
    ldr r1, [r0]
    and r1, r1, r6
    str r1, [r0]
    ldr r2, =delay
DELAY1:
    sub r2, r2, #1
    bne DELAY1
ON:
    ldr r0, =GPIOA_ODR
    ldr r1, [r0]
    orr r1, r1, r5
    str r1, [r0]
    ldr r2, =delay
DELAY2:
    sub r2, r2, #1
    bne DELAY2
    b OFF
