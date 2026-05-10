# 9. Fazer um algoritmo que leia 2 números inteiros e exiba a divisão destes. Sabe-se que o 2o número não pode ser zero, portanto, deve-se insistir na solicitação do 2o número até ele ser diferente de 0

.data
    msg1: .asciiz "\nDigite o primeiro numero: "
    msg2: .asciiz "\nDigite o segundo numero (diferente de zero): "
    msg3: .asciiz "\nO resultado da divisao e: "
.text
main:
    la $a0, msg1
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, 0

second:
    la $a0, msg2
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    add $t1, $v0, 0

    beq $t1, $zero, second

    div $t0, $t1
    mflo $t2

    la $a0, msg3
    li $v0, 4
    syscall

    add $a0, $t2, 0
    li $v0, 1
    syscall

    li $v0, 10
    syscall