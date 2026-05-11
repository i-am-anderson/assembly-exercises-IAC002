# 8. Escreva um algoritmo que leia (em números inteiros) o valor da compra de um produto da Loja Vende Tudo. A loja só vende produtos de valor entre R$1000.00 e R$9999.99 (Que deve ser validado na entrada). A loja permite pagar o valor em parcelas fixas. O algoritmo deve ler também o valor da parcela a ser paga, que deve ser um valor entre R$100.00 e R$500.00 (Que deve ser validado na entrada). O algoritmo,   sabendo que a última parcela pode ser de valor inferior às anteriores, deve calcular quantas parcelas serão pagas.

.data
  msg1: .asciiz "\nValor da compra: "
  msg2: .asciiz "\nValor da parcela: "
  msg3: .asciiz "\nQuantidade de parcela(s): "
.text
main:
  li $t0, 1000  #preco minimo produto
  li $t1, 10000 #preco maximo produto
  li $t2, 100   #valor minimo da parcela
  li $t3, 500   #valor maximo da parcela
  li $t4, 0     #valor do produto
  li $t5, 0     #valor da parcela
  li $t6, 0     #quantidade de parcelas

loop_preco:
  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada
  li $v0, 5
  syscall
  add $t4, $v0, 0

  #$t4 >= 1000 e $t4 < 10000
  blt $t4, $t0, loop_preco
  bge $t4, $t1, loop_preco

loop_parcela:
  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  #entrada
  li $v0, 5
  syscall
  add $t5, $v0, 0

  #$t0 >= 100 e $t0 <= 550
  blt $t5, $t2, loop_parcela
  bgt $t5, $t3, loop_parcela

calc:
  div $t4, $t5
  mflo $t6
  mfhi $t7

  bgtz, $t7, increase
  j prints

increase:
  addi $t6, $t6, 1

prints:
  #print msg3
  li $v0, 4
  la $a0, msg3
  syscall

  #print quantidade de parcelas
  li $v0, 1
  add $a0, $t6, 0
  syscall

end: 
  li $v0, 10
  syscall
