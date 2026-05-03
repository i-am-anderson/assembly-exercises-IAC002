# 2. Uma fábrica de camisetas produz os tamanhos pequeno, médio e grande, cada uma sendo vendida respectivamente por 10, 12 e 15 reais. Construa um algoritmo em que o usuário forneça a quantidade de camisetas pequenas, médias e grandes referentes a uma venda, e a máquina informe quanto será o valor arrecadado.

.data
  msg1: .asciiz "\nDigite a quantidade de camisetas pequenas: "
  msg2: .asciiz "\nDigite a quantidade de camisetas medias: "
  msg3: .asciiz "\nDigite a quantidade de camisetas grandes: "
  msg4: .asciiz "\nValor arrecadado: "
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

  #calculo
  li $t3, 10
  mul $t4, $t0, $t3

  li $t5, 12
  mul $t6, $t1, $t5

  li $t7, 15
  mul $t8, $t2, $t7

  add $t9, $t4, $t6
  add $t9, $t9, $t8

  # print(msg4)
  li $v0, 4          
  la $a0, msg4    
  syscall

  # print(valor arrecadado)
  li $v0, 1         
  add $a0, $t9, 0
  syscall