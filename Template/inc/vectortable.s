.syntax unified
.cpu cortex-m4
.thumb

.section .VectorTable, "a"
.word _StackEnd
.word Reset_Handler
.space 0x400
