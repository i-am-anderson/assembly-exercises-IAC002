# 6. Faça um algoritmo que leia dois valores inteiros A e B se os valores forem iguais deverá se somar os dois, caso contrário multiplique A por B. Ao final de qualquer um dos cálculos deve-se atribuir o resultado para uma variável C e mostrar seu conteúdo na tela.

.data
  msg1: .asciiz "\nDigite o valor de A: "
  msg2: .asciiz "\nDigite o valor de B: "
  msg3: .asciiz "\nO resultado é: "
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

  # comparar os valores
  beq $t0, $t1, sum

multiply:
  mul $t2, $t0, $t1
  j end

sum:
  add $t2, $t0, $t1
  j end

end:
  # print(msg3)
  li $v0, 4
  la $a0, msg3
  syscall

  # print(result)
  li $v0, 1
  add $a0, $t2, 0
  syscall