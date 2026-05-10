# 4. O proprietário da empresa ABC LTDA precisa de um programa de computador para calcular o novo salário que seus funcionários irão receber a partir do mês que vem. Sabendo que o aumento de salário para todos os funcionários será de 25%, faça um programa que lê o valor do salário atual do funcionário e informa o seu novo salário acrescido de 25% (Por se tratar de apenas número inteiros, para calcular 25% deve-se multiplicar o valor por 25 e dividir por 100). 

.data
  msg1: .asciiz "\nDigite o salario atual do funcionario: "
  msg2: .asciiz "\nO novo salario do funcionario e: "
.text
main:
  li $t0, 25 # 25%
  li $t1, 100 # 100%
  li $t2, 0 # Salario atual
  li $t3, 0 # Novo salario

  # print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada salario atual
  li $v0, 5
  syscall
  add $t2, $v0, 0

  #calculo
  mul $t3, $t2, $t0
  div $t3, $t1
  mflo $t3
  add $t3, $t3, $t2

  # print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  # print novo salario
  li $v0, 1
  add $a0, $t3, 0
  syscall

  #finaliza
  li $v0, 10
  syscall