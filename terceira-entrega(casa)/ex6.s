# 6. Escreva um programa que pergunte dois números e indique se são iguais ou diferentes. Caso sejam diferentes, mostre o maior e o menor (nesta ordem).

.data
  msg1: .asciiz "\nDigite o primeiro numero: "
  msg2: .asciiz "\nDigite o segundo numero: "
  msg3: .asciiz "\nOs numeros sao iguais."
  msg4: .asciiz "\nOs numeros sao diferentes -> "
  msg5: .asciiz " e "
.text
main:
  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada
  li $v0, 5
  syscall
  add $t0, $v0, 0

  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  #entrada
  li $v0, 5
  syscall
  add $t1, $v0, 0

  #comparacao
  beq $t0, $t1, fim #iguais
  bgt $t0, $t1, t0maior

t0menor:
  #print msg4
  li $v0, 4
  la $a0, msg4
  syscall

  #print t1
  move $a0, $t1
  li $v0, 1
  syscall

  #print msg5
  li $v0, 4
  la $a0, msg5
  syscall

  #print t0
  move $a0, $t0
  li $v0, 1
  syscall

  j fim

t0maior:
  #print msg4
  li $v0, 4
  la $a0, msg4
  syscall

  #print t0
  move $a0, $t0
  li $v0, 1
  syscall

  #print msg5
  li $v0, 4
  la $a0, msg5
  syscall

  #print t1
  move $a0, $t1
  li $v0, 1
  syscall

  j fim

fim:
  li $v0, 10
  syscall