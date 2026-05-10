# 3. Receba 2 valores inteiros. Calcule e mostre o resultado da diferença do maior pelo menor valor.

.data
	msg1: .asciiz "\nDigite o primeiro valor inteiro: "
	msg2: .asciiz "\nDigite o segundo valor inteiro: "
	msg3: .asciiz "\nA diferença do maior pelo menor e: "
.text
main:
	#imprime msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#solicita a entrada: primeiro valor
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#imprime msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#solicita a entrada: segundo valor
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#compara $t0 > $t1
	bgt $t0, $t1, tzeromaior
	
	#se $t0 < $t1
	#$t1 - $t0
	sub $t2, $t1, $t0
	j fim
	
#se $t0 > $t1
tzeromaior:	
	#$t0 - $t1
	sub $t2, $t0, $t1
	
#finaliza
fim:
	#imprime msg3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#imprime o resultado
	li $v0, 1
	add $a0, $t2, 0
	syscall