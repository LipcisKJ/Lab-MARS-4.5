# Script 2: Número menor

.data
prompt_min: .asciiz "Ingrese el primer número: "
prompt2_min: .asciiz "Ingrese el siguiente número: "
min_msg: .asciiz "El número menor es: "

.text
main_min:
    # Solicitar al usuario el primer número
    li $v0, 4
    la $a0, prompt_min
    syscall

    # Leer el primer número
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el primer número en $t0

    # Solicitar al usuario los siguientes números
    li $v0, 4
    la $a0, prompt2_min
    syscall

    # Leer los siguientes números
    li $v0, 5
    syscall
    move $t1, $v0  # Guardar el segundo número en $t1

    li $v0, 4
    la $a0, prompt2_min
    syscall

    # Leer los siguientes números
    li $v0, 5
    syscall
    move $t2, $v0  # Guardar el tercer número en $t2

    # Comparar los números
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