# 1. Receba os valores do comprimento, largura e altura de um paralelepípedo. Calcule e mostre seu volume.

.data
	msg1: .asciiz "\nDigite o comprimento do paralelepipedo: "
	msg2: .asciiz "\nDigite a largura do paralelepipedo: "
	msg3: .asciiz "\nDigite a altura do paralelepipedo: "
	msg4: .asciiz "\nO paralelepipedo tem area de:  "
.text
main:
	#imprime msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#solicita a entrada: comprimento
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#imprime msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#solicita a entrada: largura
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#imprime msg3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#solicita a entrada: altura
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#Multiplica COMPRIMENTO * LARGURA
	mul $t3, $t0, $t1
	
	#Multiplica o RESULTADO ANTERIOR * ALTURA
	mul $t4, $t3, $t2
	
	#imprime msg4
	li $v0, 4
	la $a0, msg4
	syscall
	
	#Imprime o resultado
	li $v0, 1
	add $a0, $t4, 0
	syscall