# Script 1: N�mero mayor

.data
prompt: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el siguiente n�mero: "
max_msg: .asciiz "El n�mero mayor es: "

.text
main:
    # Solicitar al usuario el primer n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el primer n�mero
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el primer n�mero en $t0

    # Solicitar al usuario los siguientes n�meros
    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer los siguientes n�meros
    li $v0, 5
    syscall
    move $t1, $v0  # Guardar el segundo n�mero en $t1

    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer los siguientes n�meros
    li $v0, 5
    syscall
    move $t2, $v0  # Guardar el tercer n�mero en $t2

    # Comparar los n�meros
    bgt $t0, $t1, check_t0_t2
    move $t0, $t1

check_t0_t2:
    bgt $t0, $t2, max_t0
    move $t0, $t2

max_t0:
    # Imprimir el resultado
    li $v0, 4
    la $a0, max_msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

exit:
    # Salir del programa
    li $v0, 10
    syscall
