
.include "arch/x64/cfi.s"

.text

.global __elf_resolve_pltgot

// calling convension:
// %rsp + 8: index
// %rsp + 0:  object
__elf_resolve_pltgot:
	.cfi_startproc simple
	.cfi_def_cfa %rsp, 0
	.cfi_rel_offset %rip, 16
	sub $8, %rsp  # make room for resolved address
	.cfi_adjust_cfa_offset 8
	pushq_cfi %rax
	pushq_cfi %rbx
	pushq_cfi %rcx
	pushq_cfi %rdx
	pushq_cfi %rsi
	pushq_cfi %rdi
	pushq_cfi %rbp
	pushq_cfi %r8
	pushq_cfi %r9
	pushq_cfi %r10
	pushq_cfi %r11
	pushq_cfi %r12
	pushq_cfi %r13
	pushq_cfi %r14
	pushq_cfi %r15
	mov 16*8+8(%rsp), %edi
	mov 16*8+0(%rsp), %rsi
	call elf_resolve_pltgot
	mov %rax, 15*8(%rsp)
	popq_cfi %r15
	popq_cfi %r14
	popq_cfi %r13
	popq_cfi %r12
	popq_cfi %r11
	popq_cfi %r10
	popq_cfi %r9
	popq_cfi %r8
	popq_cfi %rbp
	popq_cfi %rdi
	popq_cfi %rsi
	popq_cfi %rdx
	popq_cfi %rcx
	popq_cfi %rbx
	popq_cfi %rax
	ret $16
	.cfi_endproc
