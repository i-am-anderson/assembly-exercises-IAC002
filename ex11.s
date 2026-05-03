# 11. Escrever um algoritmo que leia uma quantidade desconhecida de números e conte quantos deles estão nos seguintes intervalos: [0-25], [26-50], [51-75] e [76-100]. A entrada de dados deve terminar quando for lido um número negativo. Sabe-se que a entrada deve ser um número entre 0 e 100, validar a entrada para que não permita números fora deste intervalo

.data
    msg1: .asciiz "\nDigite um numero entre 0 e 100 (negativo para sair): "
    msg2: .asciiz "\nIntervalo [0-25]: "
    msg3: .asciiz "\nIntervalo [26-50]: "
    msg4: .asciiz "\nIntervalo [51-75]: "
    msg5: .asciiz "\nIntervalo [76-100]: "
    msg6: .asciiz "\nNumero fora do intervalo permitido (0-100)!"
.text
main:
    # Inicializando contadores com zero
    li $t1, 0 # [0-25]
    li $t2, 0 # [26-50]
    li $t3, 0 # [51-75]
    li $t4, 0 # [76-100]

loop:
    # Print do prompt
    li $v0, 4
    la $a0, msg1
    syscall

    # Input do usuário
    li $v0, 5
    syscall
    add $t0, $v0, 0

    # Se for negativo, encerra e mostra resultados
    bltz $t0, end

    # Validação: se maior que 100, é inválido
    bgt $t0, 100, invalid

    # Verificação dos intervalos
    ble $t0, 25, count1
    ble $t0, 50, count2
    ble $t0, 75, count3
    j count4 # Se chegou aqui, é entre 76 e 100

count1:
    addi $t1, $t1, 1
    j loop

count2:
    addi $t2, $t2, 1
    j loop

count3:
    addi $t3, $t3, 1
    j loop

count4:
    addi $t4, $t4, 1
    j loop

invalid:
    li $v0, 4
    la $a0, msg6
    syscall
    j loop

end:
    # Exibição dos resultados
    li $v0, 4
    la $a0, msg2
    syscall
    add $a0, $t1, 0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    add $a0, $t2, 0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, msg4
    syscall
    add $a0, $t3, 0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    add $a0, $t4, 0
    li $v0, 1
    syscall

    # Finalizar o programa
    li $v0, 10
    syscall