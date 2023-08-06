.intel_syntax noprefix

.text
exit:
  mov eax, 0x1
  mov ebx, esi
  int 0x80

.globl int_to_ascii_binary
.type int_to_ascii_binary, @function # void to_ascii_binary(int, char [32])
int_to_ascii_binary:
  push ebp
  mov ebp, esp

  xor ecx, ecx
  mov ecx, 31
   
  loop1:
  mov eax, [ebp+8]
  and eax, 0x1
  add eax, 0x30

  mov edx, [ebp+12]
  mov [edx+ecx], al
  dec ecx

  shr dword ptr [ebp+8]
  cmp ecx, 0
  jge loop1

  mov esp, ebp
  pop ebp
  ret

.type alloc_on_stack_and_add_newline, @function # void *alloc_on_stack_and_add_newline(char *str, int length)
alloc_on_stack_and_add_newline:
  push ebp
  mov ebp, esp

  mov ecx, [ebp + 12] # length
  
  push esi # preserve
  push edi

  dec ecx # read 1 less to save for newline
  sub esp, ecx # alloc on stack

  mov esi, [ebp + 8] # str to be allocated
  lea edi, [esp] # end of string
  lea eax, [esp] # start of string

  rep movsb
  movb [edi], 0x0a # add newline to end of edi
  
  add esp, ecx # restore stack

  pop edi # restore
  pop esi

  mov esp, ebp
  pop ebp
  ret

.globl println
.type println, @function # void println(char *str, int length)
println:
  push ebp
  mov ebp, esp

  push ebx
  push esi
  push edi

  mov ebx, [ebp + 12] # preserved
  inc ebx

  push ebx
  push [ebp + 8]
  call alloc_on_stack_and_add_newline
  add esp, 8

  mov edx, ebx
  mov ecx, eax
  mov eax, 0x4
  mov ebx, 0x1
  int 0x80

  pop edi
  pop esi
  pop ebx

  mov esp, ebp
  pop ebp
  ret

.globl count_bits
.type count_bits, @function
count_bits:
  push ebp
  mov ebp, esp

  xor eax, eax
  mov edx, [ebp + 8]

  while_count_bits:
  inc eax
  mov ecx, edx
  dec edx
  and edx, ecx
  jnz while_count_bits

  mov esp, ebp
  pop ebp
  ret

.globl int_to_ascii_two_digits
.type int_to_ascii_two_digits, @function # void int_to_ascii_two_digits(int i, char (* buf)[4])
int_to_ascii_two_digits:
  push ebp
  mov ebp, esp

  mov eax, [ebp+8]
  xor ecx, ecx
  xor edx, edx

  push 10 # ebp - 4
  
  loop:
  xor edx, edx
  div dword ptr [ebp-4]
  
  to_ascii:
  test eax, eax
  jnz no_swap
  swap:
  xor eax, edx
  xor edx, eax
  xor eax, edx
  no_swap:
  push eax
  push edx

  add eax, 0x30
  mov edx, [ebp+12]
  mov [edx+ecx], eax

  pop eax
  pop edx
  inc ecx

  test eax, eax
  jnz loop

  end:
  mov esp, ebp
  pop ebp
  ret
