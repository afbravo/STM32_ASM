.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32f446.inc"

.text
.type Reset_Handler, %function
.global Reset_Handler

Reset_Handler:
@ Enable Clock for Port A
ldr r0, =RCC_AHB1ENR
ldr r1, [r0]
orr r1, r1, #RCC_GPIOA_EN
str r1, [r0]

@ Enable Clock for Port C
orr r1, r1, #RCC_GPIOC_EN
str r1, [r0]

@ Set Port A Pin 5 as Output
ldr r0, =GPIOA_MODER
ldr r1, [r0]
orr r1, r1, #GPIOA_MODER5_OUTPUT

@ Set Port C Pin 13 as Input
ldr r0, =GPIOC_MODER
ldr r1, [r0]
orr r1, r1, #GPIOC_MODER13_INPUT

@ Some constants in r5 and r6 for easy reference
ldrh r5, =GPIOA_ODR5 @ Bit set for pin 5
ldr r7, =0xFFFFFFFF @ To get the xor thing
eor r6, r5, r7 @all 1 except pin 5

ldr r3, =GPIOA_ODR @ Load GPIO A output register address
ldr r0, =GPIOC_IDR @ LOAD GPIO C input register address

ldr r7, =GPIOC_IDR13

LOOP:
    ldrh r1, [r0] @ LOAD current value of GPIOC_IDR (button)
    and r2, r1, r7 @ AND it to see if PIN 13 is set high (button pressed)
    ldrh r4, [r3] @ LOAD current value of LED
    cbz r2, OFF @ IF button is NOT pressed, turn the LED off
ON:
    orr r4, r4, r5 @ Set the LED to on
    b SET_LED 
OFF:
    and r4, r4, r6 @ Set the LED to off
SET_LED:
    strh r4, [r3] @ write to LED
    b LOOP @ Loop over
