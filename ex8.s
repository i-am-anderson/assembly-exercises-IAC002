# 8. Encontrar o dobro de um número caso ele seja positivo e o seu triplo caso seja negativo, imprimindo o resultado.

.data
  msg1: .asciiz "Digite um numero: "
.text
main:
  #print(msg1)
  li $v0, 4
  la $a0, msg1
  syscall

  #input
  li $v0, 5
  syscall
  add $t0, $v0, 0

  #positive
  bgtz $t0, positive

  #negative
  mul $t1, $t0, 3
  j print_result

positive:
  mul $t1, $t0, 2
  j print_result

print_result:
  #print result
  add $a0, $t1, 0
  li $v0, 1
  syscall