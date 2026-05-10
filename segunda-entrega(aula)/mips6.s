# 6. Receba 10 números inteiros reais. Verifique e mostre o maior e o menor valor. Obs.: somente valores positivos. Se o número for negativo, deve ser desconsiderado e solicitado novamente.

.data
  msg1: .asciiz "\nDigite um numero inteiro positivo: "
  msg2: .asciiz "\nO maior numero digitado foi: "
  msg3: .asciiz "\nO menor numero digitado foi: "
.text
main:
  li $t0, 0 # contador   
  li $t1, 0 # menor
  li $t2, 0 # maior

loop:
  beq $t0, 10, end 

  #Imprime msg1
  li $v0, 4
  la $a0, msg1    
  syscall

  # Entrada do número
  li $v0, 5         
  syscall
  add $t3, $v0, 0

  # Verifica se o número é negativo
  bltz $t3, loop

  #Se for a primeira iteração, inicializa o menor e maior com o primeiro número
  beqz $t0, init

  # Verifica se o número é maior que o maior atual
  bgt $t3, $t2, update_max

  # Verifica se o número é menor que o menor atual
  blt $t3, $t1, update_min

  j next

# Primeira iteração
init:
  add $t1, $t3, 0 # menor
  add $t2, $t3, 0 # maior
  j next

# Atualiza o maior número
update_max:
  add $t2, $t3, 0 # atualiza o maior
  j next

# Atualiza o menor número
update_min:
  add $t1, $t3, 0 # atualiza o menor
  j next

#Iterador
next:
  addi $t0, $t0, 1 # incrementa o contador
  j loop

#Finaliza
end:
  # Imprime msg2
  li $v0, 4
  la $a0, msg2
  syscall

  # Imprime o maior número
  li $v0, 1
  add $a0, $t2, 0
  syscall

   # Imprime msg3
  li $v0, 4
  la $a0, msg3
  syscall

  # Imprime o menor número
  li $v0, 1
  add $a0, $t1, 0
  syscall

  # Encerra
  li $v0, 10
  syscall