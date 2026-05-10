# 2. Receba o raio de uma circunferência. Calcule e mostre o comprimento da circunferência. Considere PI = 3.

.data
	msg1: .asciiz "\nDigite o raio da circunferencia: "
	msg2: .asciiz "\nO comprimento da circunferencia e: "
.text
main:
	#inicializa a variavel
	li $t0, 3 # PI = 3
	
	#imprime msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#solicita a entrada: raio
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Multiplica 2 * PI
	mul $t2, $t0, 2
	
	#Multiplica o RESULTADO ANTERIOR * R
	mul $t3, $t2, $t1
	
	#imprime msg2
	li $v0, 4
	la $a0, msg2
	syscall	
	
	#imprime o resultado
	li $v0, 1
	add $a0, $t3, 0
	syscall