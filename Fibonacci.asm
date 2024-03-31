# Script 3: Serie Fibonacci

.data
prompt_fib: .asciiz "Ingrese el número de términos de la serie Fibonacci: "
fib_msg: .asciiz "La serie Fibonacci es: "

.text
main_fib:
    # Solicitar al usuario el número de términos
    li $v0, 4
    la $a0, prompt_fib
    syscall

    # Leer el número de términos
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el número de términos en $t0

    # Inicializar los primeros dos términos de la serie Fibonacci
    li $t1, 0  # Primer término
    li $t2, 1  # Segundo término

    # Imprimir los primeros dos términos
    li $v0, 4
    la $a0, fib_msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 11  # Imprimir un espacio
    li $a0, ' '
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Calcular y mostrar los términos restantes
    sub $t0, $t0, 2  # Restar 2 porque ya mostramos los dos primeros términos
    beq $t0, $zero, exit_fib  # Si no hay más términos, salir del bucle

fib_loop:
    # Calcular el siguiente término de Fibonacci y mostrarlo
    add $t3, $t1, $t2  # $t3 = $t1 + $t2
    li $v0, 11  # Imprimir un espacio
    li $a0, ' '
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    # Actualizar los valores de $t1 y $t2 para el siguiente término
    move $t1, $t2
    move $t2, $t3

    # Decrementar el contador de términos
    sub $t0, $t0, 1

    # Verificar si se han calculado todos los términos
    bnez $t0, fib_loop

exit_fib:
    # Salir del programa
    li $v0, 10
    syscall