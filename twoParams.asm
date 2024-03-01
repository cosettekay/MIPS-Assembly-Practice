#Name: Cosette Tabucol
#CS2640
#Task 1: Write a macro that takes in two parameters

.data
    str_val: .asciiz "\nHello World!" #define the string in the program
    buffer: .space 26

.text
.macro prStr(%string)
    li $v0, 4
    la $a0, (%string)
    syscall
.end_macro

#a macro that takes in two parameters: int and string
.macro twoParams(%int, %str)
    mul $t0, %int, 2 #doubles the int
    li $v0, 1
    move $a0, $t0
    syscall
    #calls another macro to print the string
    prStr(%str)
.end_macro
main:
    li $t0, 5 #define the int in the program
    la $a1, str_val
    twoParams($t0, $a1)

#exit program
   li $v0, 10
   syscall
