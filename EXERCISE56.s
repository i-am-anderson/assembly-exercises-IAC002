# 56. Faça um algoritmo que leia um número (1 < número < 10000 e, caso não seja, deve ser novamente solicitado) e caso ele não seja um número palíndromo (capicua), apontar qual o número palíndromo (capicua) mais próximo a anterior a ele.

.data
  msg1: .asciiz "\nDigite um numero: "
  msg2:  .asciiz "\nO numero ja e um palindromo."
  msg3: .asciiz "\nO palindromo anterior mais proximo e: "
.text
main:
  li $t0, 0 # Numero
  li $t7, 0 # Contador

input:
  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada
  li $v0, 5
  syscall
  add $t0, $v0, 0

  # 1 < $t0 < 10000
  bge $t0, 10000, input
  ble $t0, 1, input

inverted:
  li $t5, 0 # Numero Invertido

  # $t1 = milhar, $t2 = centena, $t3 = dezena, $t4 = unidade
  li $t6, 1000
  div $t0, $t6
  mflo $t1 # milhar

  mfhi $t2 # resto
  li $t6, 100
  div $t2, $t6
  mfhi $t3 # resto
  mflo $t2 # centena

  li $t6, 10
  div $t3, $t6
  mfhi $t4 # resto
  mflo $t3 # dezena

  # $t1 = milhar, $t2 = centena, $t3 = dezena, $t4 = unidade
  mul $t4, $t4, 1000
  mul $t3, $t3, 100
  mul $t2, $t2, 10

  add $t5, $t1, $t2
  add $t5, $t5, $t3
  add $t5, $t5, $t4
  
  beqz $t3, div_1000
  beqz $t2, div_100
  beqz $t1, div_10

  j compare

div_10:
  li $t6, 10
  div $t5, $t6
  mflo $t5
  j compare

div_100:
  li $t6, 100
  div $t5, $t6
  mflo $t5
  j compare

div_1000:
  li $t6, 1000
  div $t5, $t6
  mflo $t5

compare:
  beq $t0, $t5, palindrome
  subi $t0, $t0, 1
  addi $t7, $t7, 1
  j inverted

palindrome:
  beqz $t7, already_palindrome

next_palindrome:
  #print msg3
  li $v0, 4
  la $a0, msg3
  syscall

  #print
  li $v0, 1         
  add $a0, $t5, 0
  syscall

  j end

already_palindrome:
  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

end:
  li $v0, 10
  syscall