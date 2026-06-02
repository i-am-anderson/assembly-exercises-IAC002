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
  add $t2, $t0, 0

loop:
  # Se = 0, terminou
  beqz $t2, compare 
  
  # t5 = t5 * 10
  li $t6, 10
  mul $t5, $t5, $t6
  
  # t3 = t2 % 10
  div $t2, $t6
  mfhi $t3         # resto
  mflo $t2         # inteiro
  
  # t5 = t5 + t3
  add $t5, $t5, $t3
  
  j loop

compare:
  beq $t0, $t5, palindrome
  addi $t0, $t0, -1
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