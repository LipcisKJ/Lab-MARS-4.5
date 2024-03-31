# Script 2: N�mero menor

.data
prompt_min: .asciiz "Ingrese el primer n�mero: "
prompt2_min: .asciiz "Ingrese el siguiente n�mero: "
min_msg: .asciiz "El n�mero menor es: "

.text
main_min:
    # Solicitar al usuario el primer n�mero
    li $v0, 4
    la $a0, prompt_min
    syscall

    # Leer el primer n�mero
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el primer n�mero en $t0

    # Solicitar al usuario los siguientes n�meros
    li $v0, 4
    la $a0, prompt2_min
    syscall

    # Leer los siguientes n�meros
    li $v0, 5
    syscall
    move $t1, $v0  # Guardar el segundo n�mero en $t1

    li $v0, 4
    la $a0, prompt2_min
    syscall

    # Leer los siguientes n�meros
    li $v0, 5
    syscall
    move $t2, $v0  # Guardar el tercer n�mero en $t2

    # Comparar los n�meros
    blt $t0, $t1, check_t0_t2_min
    move $t0, $t1

check_t0_t2_min:
    blt $t0, $t2, min_t0
    move $t0, $t2

min_t0:
    # Imprimir el resultado
    li $v0, 4
    la $a0, min_msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

exit_min:
    # Salir del programa
    li $v0, 10
    syscall