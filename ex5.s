5. Faça um algoritmo que receba o valor dos catetos de um triângulo, calcule e mostre o valor da hipotenusa.

.data
  msg1: .asciiz "\nDigite o valor do cateto 1: "
  msg2: .asciiz "\nDigite o valor do cateto 2: "
  msg3: .asciiz "\nO valor da hipotenusa é: "
.text
main:
  # print(msg1)
  li $v0, 4
  la $a0, msg1
  syscall

  # input
  li $v0, 5
  syscall
  add $t0, $v0, 0

  # print(msg2)
  li $v0, 4
  la $a0, msg2
  syscall

  # input
  li $v0, 5
  syscall
  add $t1, $v0, 0

  mul $t2, $t0, $t0
  mul $t3, $t1, $t1
  add $t4, $t2, $t3 

  li $t5, 0 

loop:
  mul $t6, $t5, $t5
  bgt $t6, $t4, end 
  addi $t5, $t5, 1
  j loop

end:
  addi $t5, $t5, -1

  # print(msg3)
  li $v0, 4
  la $a0, msg3
  syscall

  # print
  li $v0, 1
  add $a0, $t5, 0
  syscall