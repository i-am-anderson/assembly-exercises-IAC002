# 7. Ler um número inteiro e imprimir a saída da seguinte forma: CENTENA = x DEZENA = y UNIDADE = z
# Exemplo: 
# Entrada = 517
# Saída: CENTENA = 5 DEZENA = 1 UNIDADE = 7
# *Sabe-se que a entrada deve ser um número entre 100 e 999, validar a entrada para que não permita números fora deste intervalo

.data
  msg1: .asciiz "\nEntrada = "
  msg2: .asciiz "\nCENTENA = "
  msg3: .asciiz "\nDEZENA = "
  msg4: .asciiz "\nUNIDADE = "
.text
main:
  li $t0, 0 # Entrada
  li $t1, 0 # CENTENA
  li $t2, 0 # DEZENA
  li $t3, 0 # UNIDADE
  li $t4, 100
  li $t5, 10

loop:
  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada
  li $v0, 5
  syscall
  add $t0, $v0, 0

  #$t0 >= 100 e $t0 <= 999
  blt $t0, 100, loop
  bgt $t0, 999, loop

calc:
  #CENTENA
  div $t0, $t4
  mflo $t1

  #DEZENA
  mfhi $t2
  div $t2, $t5
  mflo $t2

  #UNIDADE
  mfhi $t3

prints:
  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  #print CENTENA
  li $v0, 1
  add $a0, $t1, 0
  syscall

  #print msg3
  li $v0, 4
  la $a0, msg3
  syscall

  #print DEZENA
  li $v0, 1
  add $a0, $t2, 0
  syscall

  #print msg4
  li $v0, 4
  la $a0, msg4
  syscall

  #print UNIDADE
  li $v0, 1
  add $a0, $t3, 0
  syscall

end:
  li $v0, 10
  syscall
