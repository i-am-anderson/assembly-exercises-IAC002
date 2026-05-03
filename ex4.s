# 4. Faça um algoritmo que calcule e mostre a área de um trapézio usando apenas números inteiros. Sabe-se que: A = ((base maior + base menor) * altura)/2

.data
  msg1: .asciiz "\nDigite a base maior: "
  msg2: .asciiz "\nDigite a base menor: "
  msg3: .asciiz "\nDigite a altura: "
  msg4: .asciiz "\nA area do trapezio e: "
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

  # calculo da área
  add $t3, $t0, $t1
  mul $t4, $t3, $t2
  li $t5, 2
  div $t6, $t4, $t5

  # print(msg4)
  li $v0, 4
  la $a0, msg4
  syscall

  # print(area)
  li $v0, 1
  add $a0, $t6, 0
  syscall