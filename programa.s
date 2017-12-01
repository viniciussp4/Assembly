	.data

msgInicial:	.asciiz "Essa calculadora soma dois numeros inteiros.\n"
msgNum1:	.asciiz "Digite o primeiro numero: \n"
msgNum2:	.asciiz "Digite o segundo numero: \n"
msgResult:	.asciiz "O resultado da soma dos dois numeros e: \n"
n1: 	.word 1
n2: 	.word 1
result: 	.word 1

	.text
	# imprime mensagem inicial
main:	li $v0, 4 
	la $a0, msgInicial
	syscall

	# imprime mensagem pedindo o primeiro numero
	li $v0, 4 
	la $a0, msgNum1
	syscall	

	# lê inteiro
	li $v0, 5 
	syscall
			
	# grava numero na memória e no registrador
	sw $v0, n1
	move $s0, $v0

	# imprime mensagem pedindo o segundo numero
	li $v0, 4 
	la $a0, msgNum2
	syscall

	# lê inteiro
	li $v0, 5 
	syscall		
	
	# grava numero na memória e no registrador
	sw $v0, n2
	move $s1, $v0
			
	# calcula a soma dos dois números
	add $t0, $s0, $s1

	# grava sucessor
	sw $t0, result
			
	# imprime mensagem informando que o resultado será mostrado
	li $v0, 4 
	la $a0, msgResult
	syscall

	# imprime inteiro (resultado)
	li $v0, 1
	move $a0, $t0
	syscall

	jr $ra