bits 64

global _start

section .data
	num: dq 114.63 ; ponto flutuante de dupla precisão.
section .bss
	res: resq 1

section .text

_start:
	fld qword [num] ; "Floating Load" (fld) trata o num como QWORD e guarda o resultado em st0.
	fsqrt ; "Floating Square Root" (Raiz Quadrada) calcula a raiz quadrada do valor de st0, e guarda o resultado em st0.

	fstp qword [res] ; guarda o valor em st (resultado) em "res" tratando
	como QWORD.

	mov eax, 1 ; 1 = exit()
	mov ebx, 0 ; exit(0)
	int 0x80 ; interrupção 0x80
