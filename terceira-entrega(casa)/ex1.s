# 1. Elaborar um programa que apresente o valor da conversão em real (R$) de um valor lido em dólar (US$). O programa deve considerar a cotação do dólar em R$5 (Usar apenas números inteiros).

.data
  msg1: .asciiz "\nDigite o valor em dolar: "
  msg2: .asciiz "\nO valor em real e: "
.text
main:
  li $t0, 5 # cotacao do dolar

  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada
  li $v0, 5
  syscall
  add $t1, $v0, 0

  #calculo
  mul $t2, $t1, $t0

  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  #print valor em real
  li $v0, 1
  add $a0, $t2, 0
  syscall

  #finalizar programa
  li $v0, 10
  syscall