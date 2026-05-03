# 12. Desenvolver um algoritmo que leia a altura, em centímetros de 15 pessoas. Este programa deverá calcular e mostrar: a. A menor altura do grupo; b. A maior altura do grupo;

.data
    msg1: .asciiz "\nDigite a altura em centimetros: "
    msg2: .asciiz "\nMenor altura: "
    msg3: .asciiz "\nMaior altura: "
.text
main:
    # Inicialização de registradores
    li $t0, 0          # Contador (i = 0)
    li $t1, 15         # Limite
    li $t2, 0          # Maior altura (começa com 0)
    li $t3, 999        # Menor altura (começa com valor alto)

loop:
    # Verifica se já leu 15 pessoas
    beq $t0, $t1, end

    #print(msg1)
    li $v0, 4
    la $a0, msg1
    syscall

    #input
    li $v0, 5
    syscall
    add $t4, $v0, 0

    # Se for a primeira iteração, a altura é tanto a maior quanto a menor
    bnez $t0, check_max
    add $t2, $t4, 0
    add $t3, $t4, 0
    j next_iter

check_max:
    ble $t4, $t2, check_min
    add $t2, $t4, 0
    j next_iter

check_min:
    bge $t4, $t3, next_iter
    add $t3, $t4, 0

next_iter:
    addi $t0, $t0, 1   # i++
    j loop

end:
    # Imprimir Menor Altura
    li $v0, 4
    la $a0, msg2
    syscall

    add $a0, $t3, 0
    li $v0, 1
    syscall

    # Imprimir Maior Altura
    li $v0, 4
    la $a0, msg3
    syscall
    
    add $a0, $t2, 0
    li $v0, 1
    syscall

    # Finalizar programa
    li $v0, 10
    syscall
 