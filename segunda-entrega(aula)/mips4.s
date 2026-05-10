# 4. Receba 4 notas bimestrais de um aluno. Calcule e mostre a média aritmética. Mostre a mensagem de acordo com a média:
#    - a. Se a média for >= 6,0 exibir “APROVADO”;
#    - b. Se a média for >= 3,0 ou < 6,0 exibir “EXAME”;
#    - c. Se a média for < 3,0 exibir “RETIDO”.

.data
	msg1: .asciiz "\nNota N1: "
	msg2: .asciiz "\nNota N2: "
	msg3: .asciiz "\nNota N3: "
	msg4: .asciiz "\nNota N4: "
	msg5: .asciiz "\nA media e: "
	msg6: .asciiz "\nAPROVADO"
	msg7: .asciiz "\nEXAME"
	msg8: .asciiz "\nRETIDO"
.text
main:
	#imprime msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#solicita a entrada: Nota N1
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#imprime msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#solicita a entrada: Nota N2
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#imprime msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#solicita a entrada: Nota N3
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	#imprime msg4
	li $v0, 4
	la $a0, msg1
	syscall
	
	#solicita a entrada: Nota N4
	li $v0, 5
	syscall
	add $t4, $v0, 0
	
	#soma as notas
	add $t5, $t1, $t2
	add $t5, $t5, $t3
	add $t5, $t5, $t4
	
	#divide por 4
	li $t6, 4
	div $t5, $t6
	mflo $t7
	
	#verifica se media ($t7) é MAIOR ou IGUAL a 6
	li $t8, 6
	bge $t7, $t8, aprovado
	
	#verifica se media ($t7) é MENOR que 3
	li $t9, 3
	blt $t7, $t9, retido
	
exame:
	#imprime msg7
	li $v0, 4
	la $a0, msg7
	syscall
		
	j fim
		
aprovado:
	#imprime msg6
	li $v0, 4
	la $a0, msg6
	syscall
	
	j fim
retido:
	#imprime msg8
	li $v0, 4
	la $a0, msg8
	syscall
fim:
	#imprime msg5
	li $v0, 4
	la $a0, msg5
	syscall
	
	#Imprime o resultado
	li $v0, 1
	add $a0, $t7, 0
	syscall