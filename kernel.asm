;;kernel.asm
bits 32 ;tell nasm to compile to 32 bits
section .text ;defines a segment
; This code defines a fixed memory size (does not change at runtime) and executable instructions
; The .text section is where we put our code

    ;multiboot spec (for GRUB)
    align 4
    dd 0x1BADB002               ;magic number
    dd 0x00                     ;flags
    dd - (0x1BADB002 + 0x00)    ;checksum. magic number + flags + checksum should equal 0

global start ;create a globally accessible label "start", which we must use for the linker
extern kmain ;tells nasm that we will use an externally defined function called "kmain"

start:
    cli     ;blocks interrupts, "clear interrupts"
    mov esp, stack_space ;
    call kmain
    hlt ;halt CPU after kmain has finished execution ie. Shut down the OS

section .bss ; Basic Service Set
;; This is a standard section for statically allocated variables that are not explicitly initialized ie. we are defining areas of reserved memory.
resb 8192   ;reserves 8192 bytes of memory which we will point the stack pointer to - this is a NASM directive
stack_space: ;points to the edge of memory reserved in the line before
