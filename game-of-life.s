.intel_syntax noprefix

.type	print, @function
print:
    push esp
    mov ebp, esp

    mov eax, 0x4
    mov ebx, 0x1

    push 0x0a
    push 0x41414141
    lea ecx, [esp]

    mov edx, 0x5
    int 0x80

    mov esp, ebp
    pop ebp
    ret

.globl _start
_start:
  call print

  mov eax, 0x1
  mov ebx, 0x0
  syscall

