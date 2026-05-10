# 5. Receba 2 números inteiros, verifique qual o maior entre eles. Calcule e mostre o resultado da somatória dos números ímpares entre esses valores.

.data
	msg1: .asciiz "\nDigite o primeiro numero: "
	msg2: .asciiz "\nDigite o segundo numero: "
	msg3: .asciiz "\nO maior numero e: "
	msg4: .asciiz "\nA somatoria dos numeros impares entre eles e: "

.text
main:
	#Inicializa
	li $t5, 0

	# Entrada do primeiro numero
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	# Entrada do segundo numero
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall
	add $t1, $v0, 0

	# Descobrir maior e menor
	bgt $t0, $t1, maior_t0

	# caso t1 seja maior
	add $t2, $t1, 0   # maior
	add $t3, $t0, 0   # menor
	j iniciar

maior_t0:
	add $t2, $t0, 0   # maior
	add $t3, $t1, 0   # menor

iniciar:
	addi $t3, $t3, 1

loop:
	# se chegou ao maior, termina
	beq $t3, $t2, fim

	# verifica se é impar
	andi $t4, $t3, 1
	beq $t4, $zero, prox

	# soma numero impar
	add $t5, $t5, $t3

prox:
	addi $t3, $t3, 1
	j loop

fim:
	# imprime maior numero
	li $v0, 4
	la $a0, msg3
	syscall

	add $a0, $t2, 0
	li $v0, 1
	syscall

	# imprime soma
	li $v0, 4
	la $a0, msg4
	syscall

	add $a0, $t5, 0
	li $v0, 1
	syscall

	# encerra
	li $v0, 10
	syscall