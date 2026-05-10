# 3. Crie um programa que lê o mês e o ano de nascimento de uma pessoa e o mês e ano atual. Calcule e mostre qual é: a idade da pessoa em meses.

.data
  msg1: .asciiz "\nDigite o mes de nascimento: "
  msg2: .asciiz "\nDigite o ano de nascimento: "
  msg3: .asciiz "\nDigite o mes atual: "
  msg4: .asciiz "\nDigite o ano atual: "
  msg5: .asciiz "\nA idade da pessoa em meses e: "
.text
main:
  li $t0, 0 #mes nascimento
  li $t1, 0 #ano nascimento
  li $t2, 0 #mes atual
  li $t3, 0 #ano atual
  li $t4, 0 #idade em meses

  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada: mes nascimento
  li $v0, 5
  syscall
  add $t0, $v0, 0

  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  #entrada: ano nascimento
  li $v0, 5
  syscall
  add $t1, $v0, 0

  #print msg3
  li $v0, 4
  la $a0, msg3
  syscall

  #entrada: mes atual
  li $v0, 5
  syscall
  add $t2, $v0, 0

  #print msg4
  li $v0, 4
  la $a0, msg4
  syscall

  #entrada: ano atual
  li $v0, 5
  syscall
  add $t3, $v0, 0

  #calculo
  #ano atual - ano nascimento
  sub $t4, $t3, $t1
  mul $t4, $t4, 12
  add $t4, $t4, $t2
  sub $t4, $t4, $t0

  #verifica se $t4 é negativo, se for, inverte o sinal
  bltz $t4, negativo
  j end

negativo:
  sub $t4, $zero, $t4

end:
  #print msg5
  li $v0, 4
  la $a0, msg5
  syscall

  #saída: idade em meses
  li $v0, 1
  move $a0, $t4
  syscall

  #finaliza
  li $v0, 10
  syscall