# 2. Ler dois valores para 2 registradores e efetuar a troca dos valores de forma que o valor do primeiro registrador passe ao segundo e o segundo passe ao primeiro. Apresentar os valores após a efetivação do processamento da troca.

.data
  msg1: .asciiz "\nDigite o primeiro valor: "
  msg2: .asciiz "\nDigite o segundo valor: "
  msg3: .asciiz "\nApós a troca, os valores são: "
  msg4: .asciiz " e "
.text
main:
  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada do primeiro valor
  li $v0, 5
  syscall
  add $t1, $v0, 0

  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  #entrada do segundo valor
  li $v0, 5
  syscall
  add $t2, $v0, 0

  #troca dos valores
  move $t3, $t1
  move $t1, $t2
  move $t2, $t3

  #print msg3
  li $v0, 4
  la $a0, msg3
  syscall

  #print primeiro valor
  li $v0, 1
  add $a0, $t1, 0
  syscall

  #print msg4
  li $v0, 4
  la $a0, msg4
  syscall

  #print segundo valor
  li $v0, 1
  add $a0, $t2, 0
  syscall

  #finaliza
  li $v0, 10
  syscall