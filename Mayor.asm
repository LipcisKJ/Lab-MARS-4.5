# Script 1: Número mayor

.data
prompt: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el siguiente número: "
max_msg: .asciiz "El número mayor es: "

.text
main:
    # Solicitar al usuario el primer número
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el primer número
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el primer número en $t0

    # Solicitar al usuario los siguientes números
    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer los siguientes números
    li $v0, 5
    syscall
    move $t1, $v0  # Guardar el segundo número en $t1

    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer los siguientes números
    li $v0, 5
    syscall
    move $t2, $v0  # Guardar el tercer número en $t2

    # Comparar los números
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
