#Name: Cosette Tabucol
#Date: 11/12/2023
#CS2640
#Program 2: Practice with Conditionals and Loops


#Task 2: Advanced Math: x to the power of y
#=============================
.data
prompt_x: .asciiz "Enter a number for x: "
prompt_y: .asciiz "Enter a number for y: "
result_message: .asciiz "x to the power y is: "
program_info: .asciiz "This program asks the user to input a value for x and y. Then, it finds the value of x to the power of y.\nFor example, 2 to the power 3 is 8\n\n"

.text
main:
    # Display program information
    li $v0, 4
    la $a0, program_info
    syscall

    # Get user input for x
    li $v0, 4
    la $a0, prompt_x
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 = x

    # Get user input for y
    li $v0, 4
    la $a0, prompt_y
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # $t1 = y

    # Initialize result to 1
    li $t2, 1  # $t2 = result

    # Loop to calculate x to the power y
    power_loop:
        # Check if y is 0, if yes, exit the loop
        beq $t1, $zero, exit

        # Multiply result by x
        mul $t2, $t2, $t0

        # Decrement y
        subi $t1, $t1, 1

        # Repeat the loop
        j power_loop

    exit:
    # Display the result
    li $v0, 4
    la $a0, result_message
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Program finished
    li $v0, 10
    syscall


