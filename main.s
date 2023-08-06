.include "lib.s"

.globl _start
_start:
  sub esp, 4
  push esp
  push 0xf
  call int_to_ascii
  add esp, 0x4

  jmp exit
