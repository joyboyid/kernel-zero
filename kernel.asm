bits 32 ;nasm directive 32
        section .text
        ;multiboot spec
        align 4
        dd 0x1BADB002 ;magic
        dd 0x00 ;flags
        dd - (0x1BADB002 + 0x00)

        global start ;set symbol from source code globally
        extern kernelMain ;func in C file

        start:
          cli ;clear interupts--
          mov esp, stack_space ;stack pointer set
          call kernelMain ;calls the main kernel func from C file 
          hlt ;halt the cpu

        section .bss
        resb 8192 ;8km memory reserved for the stack
        stack_space:
