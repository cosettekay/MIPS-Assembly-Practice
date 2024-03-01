#Name: Cosette Tabucol
#Date: 10/29/2023
#CS2640
#Program 1: Getting Familiar with Assembly


#Task 1: User Input and Output
#=============================

.data
#Task 1
# Get 2 input values from the user
prompt1: .asciiz "Enter the first integer: \n"
prompt2: .asciiz "Enter the second integer: \n"
# Output the user inputs in the "Run I/O" section
output1: .asciiz "You entered the first integer: \n"
output2: .asciiz "You entered the second integer: \n"

#Task 2
sum: .asciiz "The sum is: \n"
difference: .asciiz "The difference is: \n"
product: .asciiz "The product is: \n"
quotient: .asciiz "The quotient is: \n"
.error_div_by_zero: .asciiz "Error: Division by zero\n"

#Task 3
.equal: .asciiz "User inputs are the same\n"
.different: .asciiz "User inputs are different\n"

newline: .asciiz "\n"

.text
main: #use "main" label for this task
    # Display a prompt for the first integer and read user input
    li $v0, 4          # Print string
    la $a0, prompt1    # Load the address of the prompt1 string
    syscall
    
    li $v0, 5          # Read integer
    syscall
    # The user input should be stored in $s0
    move $s0, $v0      # Store the user input in $s0

    # Display a prompt for the second integer and read user input
    li $v0, 4          # Print string
    la $a0, prompt2    # Load the address of the prompt2 string
    syscall
    
    li $v0, 5          # Read integer
    syscall
    # The user input should be stored in $s1
    move $s1, $v0      # Store the user input in $s1

    # Display the outputs
    li $v0, 4          # Print string
    la $a0, output1    # Load the address of the output1 string
    syscall
    
    li $v0, 1          # Print integer
    move $a0, $s0      # Load the first integer from $s0
    syscall
    
    # Output newline
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 4          # Print string
    la $a0, output2    # Load the address of the output2 string
    syscall
    
    li $v0, 1          # Print integer
    move $a0, $s1      # Load the second integer from $s1
    syscall
    
    # Output newline
    li $v0, 4
    la $a0, newline
    syscall
    
#Task 2: Arithmetic Operations
#=============================

    #Operations
    #add two values
    add $t0, $s0, $s1      # Add $s0 and $s1, store result in $t0
    #subtract two values
    sub $t1, $s0, $s1      # Subtract $s1 from $s0, store result in $t1
    #multiply two values
    mul $t2, $s0, $s1      # Multiply $s0 and $s1, store result in $t2

    # Check for division by zero
    beqz $s1, division_by_zero  # Branch to handle division by zero

    #divide two values
    div $s0, $s1            # Divide $s0 by $s1
    mflo $t3               # Get the quotient and store it in $t3

    # Output the arithmetic results
    # Print sum
    li $v0, 4
    la $a0, sum
    syscall

    li $v0, 1
    move $a0, $t0
    syscall
    
    # Output newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Print difference
    li $v0, 4
    la $a0, difference
    syscall

    li $v0, 1
    move $a0, $t1
    syscall
    
    # Output newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Print product
    li $v0, 4
    la $a0, product
    syscall

    li $v0, 1
    move $a0, $t2
    syscall
    
    # Output newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Print quotient
    li $v0, 4
    la $a0, quotient
    syscall

    li $v0, 1
    move $a0, $t3
    syscall
    
    # Output newline
    li $v0, 4
    la $a0, newline
    syscall
    
division_by_zero:
    # Handle division by zero
    li $v0, 4
    la $a0, .error_div_by_zero
    syscall


# Task 3: Conditions
#===================

    # Check if the user inputs are equal or different
    beq $s0, $s1, inputs_equal
    bne $s0, $s1, inputs_different

inputs_equal:
    # User inputs are the same
    li $v0, 4
    la $a0, .equal
    syscall
    j exit

inputs_different:
    # User inputs are different
    li $v0, 4
    la $a0, .different
    syscall

exit:
    # Exit program
    li $v0, 10
    syscall

