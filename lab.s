.intel_syntax noprefix

.data
  buffer: .fill 32

.text
.include "lib.s"

.globl _start
_start:
  lea eax, buffer

  push eax 
  push 0xffffffff
  call int_to_ascii_binary 
  sub esp, 8
  lea eax, buffer

  push 0x32
  push eax 
  call println
  sub esp, 8

  jmp exit
