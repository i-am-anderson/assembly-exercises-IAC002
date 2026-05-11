# 5. Escreva um programa que pergunte os coeficientes de uma equação de segundo grau (A, B e C) e:
#    - a) se DELTA for maior que zero: imprima “DUAS RAÍZES REAIS”;
#    - b) se DELTA for igual a zero: imprima apenas “UMA RAÍZ REAL”;
#    - c) se DELTA menor que zero: imprima a mensagem “NÃO EXISTEM RAÍZES REAIS”.
# (Não é necessário calcular as raízes caso existam).

.data
  msg1: .asciiz "\nDigite o valor de A: "
  msg2: .asciiz "\nDigite o valor de B: "
  msg3: .asciiz "\nDigite o valor de C: "
  msg4: .asciiz "\nDUAS RAIZES REAIS"
  msg5: .asciiz "\nUMA RAIZ REAL"
  msg6: .asciiz "\nNAO EXISTEM RAIZES REAIS"
.text
main:
  #print msg1
  li $v0, 4
  la $a0, msg1
  syscall

  #entrada: A
  li $v0, 5
  syscall
  add $t0, $v0, 0

  #print msg2
  li $v0, 4
  la $a0, msg2
  syscall

  #entrada: B
  li $v0, 5
  syscall
  add $t1, $v0, 0

  #print msg3
  li $v0, 4
  la $a0, msg3
  syscall

  #entrada: C
  li $v0, 5
  syscall
  add $t2, $v0, 0

  #calculo
  # B^2
  mul $t3, $t1, $t1 
  # AC
  mul $t4, $t0, $t2 
  # 4AC
  mul $t4, $t4, 4   
  # DELTA
  sub $t5, $t3, $t4 

  # DELTA > 0
  bgtz $t5, duas_raizes 
  
  # DELTA == 0
  beqz $t5, uma_raiz
  
  # DELTA < 0
  li $v0, 4
  la $a0, msg6
  syscall
  j end

duas_raizes:
  li $v0, 4
  la $a0, msg4
  syscall
  j end

uma_raiz:
  li $v0, 4
  la $a0, msg5
  syscall

end:
  li $v0, 10
  syscall