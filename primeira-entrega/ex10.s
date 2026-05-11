# 10. No Assembly MIPS, existe a operação REM que apresenta o resto da divisão de 2 valores inteiros. SEM UTILIZAR A OPERAÇÃO REM, faça um algoritmo usando DIV, MUL e SUB que receba 2 valores inteiros e exiba o resto da divisão do maior pelo menor (Condição que deve ser verificada no início do algoritmo.)

.data
    msg1: .asciiz "Digite o primeiro valor inteiro: "
    msg2: .asciiz "Digite o segundo valor inteiro: "
    msg3: .asciiz "O resto da divisao e: "
.text
main:
    #print(msg1)
    li $v0, 4
    la $a0, msg1
    syscall 

    #input
    li $v0, 5
    syscall
    add $t0, $v0, 0
  
    #print(msg2)
    li $v0, 4
    la $a0, msg2
    syscall

    #input
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #verificar qual é o maior
    bgt $t0, $t1, maior

    #t1 é maior
    add $t2, $t1, 0 #maior
    add $t3, $t0, 0 #menor
    j calcular 

maior:
    add $t2, $t0, 0 #maior
    add $t3, $t1, 0 #menor
    j calcular 

calcular:
    div $t2, $t3
    mflo $t4
    mul $t5, $t4, $t3
    sub $t6, $t2, $t5

    #print(msg3)
    li $v0, 4
    la $a0, msg3
    syscall

    #print(resto)
    li $v0, 1
    add $a0, $t6, 0
    syscall
