# 7. Faça um algoritmo que leia uma variável e some 5, caso seja par ou some 8, caso seja ímpar, imprimir o resultado desta operação.

.data
  msg1: .asciiz "\nDigite um numero: "
  msg2: .asciiz "\nO resultado e: "
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

  # verificar se é par ou ímpar
  and $t1, $t0, 1
  beq $t1, $zero, even

odd:
  addi $t2, $t0, 8
  j end

even:
  addi $t2, $t0, 5
  j end

end:
  # print(msg2)
  li $v0, 4
  la $a0, msg2
  syscall

  # print(result)
  li $v0, 1
  add $a0, $t2, 0
  syscall