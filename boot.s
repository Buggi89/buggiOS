.set ALIGN, 1<<0
.set MEMIN, 1<<1
.set FLAGS, ALIGN | MEMIN
.set MAGIC, 0x1BADB002
.set CHECK, -(MAGIC + FLAGS)

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECK

.section .bss
.align 16
stack_bottom:
.skip 16384
stack_top:

.section .text
.global _start
.type _start, @function
_start:
    mov $stack_top, %esp
    call kernel_main

    cli
1:  hlt
    jmp 1b

.size _start, . - _start
