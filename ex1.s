# 1. A imobiliária Imóbilis vende apenas terrenos retangulares. Faça um algoritmo para ler as dimensões de um terreno e depois exibir a área do terreno.

.data
  msg1: .asciiz "\nDigite a largura do terreno: "
  msg2: .asciiz "\nDigite o comprimento do terreno: "
  msg3: .asciiz "\nArea do terreno: "
.text
main:
  # print(msg1)
  li $v0, 4          
  la $a0, msg1      
  syscall

  #input
  li $v0, 5          
  syscall
  move $t0, $v0      

  # print(msg2)
  li $v0, 4          
  la $a0, msg2      
  syscall

  #input
  li $v0, 5          
  syscall
  move $t1, $v0      

  # print(msg3)
  li $v0, 4          
  la $a0, msg3    
  syscall
  
  li $v0, 1         
  mul $a0, $t0, $t1
  syscall  
