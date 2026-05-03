# 3. A empresa Hipotheticus paga R$10,00 por hora normal trabalhada, e R$15,00 por hora extra. Faça um algoritmo para calcular e imprimir o salário bruto e o salário líquido de um determinado funcionário. Considere, também, uma entrada de desconto para calcular o salário líquido.

.data
  msg1: .asciiz "\nDigite o numero de horas normais trabalhadas: "
  msg2: .asciiz "\nDigite o numero de horas extras trabalhadas: "
  msg3: .asciiz "\nDigite o valor do desconto: "
  msg4: .asciiz "\nO salario bruto e: "
  msg5: .asciiz "\nO salario liquido e: "
.text
main:
  # print(msg1)
  li $v0, 4          
  la $a0, msg1      
  syscall

  #input
  li $v0, 5          
  syscall
  add $t0, $v0, 0

  # print(msg2)
  li $v0, 4          
  la $a0, msg2      
  syscall

  #input
  li $v0, 5          
  syscall
  add $t1, $v0, 0

  # print(msg3)
  li $v0, 4          
  la $a0, msg3    
  syscall

  #input
  li $v0, 5          
  syscall
  add $t2, $v0, 0

  #calculo salario bruto
  li $t3, 10
  mul $t4, $t0, $t3

  li $t5, 15
  mul $t6, $t1, $t5

  add $t7, $t4, $t6

  # print(msg4)
  li $v0, 4          
  la $a0, msg4    
  syscall

  # print(salario bruto)
  li $v0, 1         
  add $a0, $t7, 0
  syscall

  #calculo salario liquido
  sub $t8, $t7, $t2

  # print(msg5)
  li $v0, 4          
  la $a0, msg5    
  syscall

  # print(salario liquido)
  li $v0, 1         
  add $a0, $t8, 0
  syscall