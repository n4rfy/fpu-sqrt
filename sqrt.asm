bits 64

global _start

section .data
	num: dq 114.63 ; ponto flutuante de dupla precisão.
section .bss
	res: resq 1

section .text

_start:
	fld qword [num] ; "Floating Load" (fld) trata o num como QWORD e guarda no topo da pilha.
	fsqrt ; "Floating Square Root" (Raiz Quadrada) calcula a raiz quadrada do valor no topo da pilha, e guarda o resultado em st0.

	fstp qword [res] ; guarda o valor em st (resultado) em "res" tratando como QWORD.

	; exit(0) ;
	mov rax, 60
	mov rdi, 0
	syscall
