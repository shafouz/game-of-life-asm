	.file	"lab.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	lea	ecx, 4[esp]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -12[ebp], 4
	mov	edx, DWORD PTR -12[ebp]
	add	edx, 1
	sal	edx, 2
	sub	esp, 12
	push	edx
	mov	ebx, eax
	call	malloc@PLT
	add	esp, 16
	mov	DWORD PTR -16[ebp], eax
	mov	eax, DWORD PTR -16[ebp]
	mov	DWORD PTR [eax], 105
	mov	eax, DWORD PTR -16[ebp]
	mov	DWORD PTR 4[eax], 65
	mov	eax, DWORD PTR -16[ebp]
	mov	DWORD PTR 8[eax], 65
	mov	eax, DWORD PTR -16[ebp]
	mov	DWORD PTR 12[eax], 65
	mov	eax, DWORD PTR -16[ebp]
	mov	DWORD PTR 16[eax], 65
	mov	eax, 0
	lea	esp, -8[ebp]
	pop	ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	lea	esp, -4[ecx]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB7:
	.cfi_startproc
	mov	eax, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE7:
	.ident	"GCC: (Debian 11.3.0-12) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
