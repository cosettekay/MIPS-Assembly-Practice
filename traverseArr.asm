.data
    array: .word 1, 2, 3, 4, 5
    display: .asciiz "Traverse array: "
    spacer: .asciiz " "

.text
main:
    # $s0 for base address
    la $s0, array

    # Display message
    li $v0, 4
    la $a0, display
    syscall

    # Loop counter
    li $t1, 0

loop:
    # Load word of the current element into $t0
    lw $t0, 0($s0)
    
    # Loop Counter
    # Display the current element
    li $v0, 1
    move $a0, $t0
    syscall
    
    # $s0 for base address
    # Move to the next array element
    addi $s0, $s0, 4

    # Increment the loop counter by 1
    addi $t1, $t1, 1
    
    # Check if the loop counter is less than 5
    # Once counter reaches 5, jump to exit
    beq $t1, 5, exit

    # Display a spacer
    li $v0, 4
    la $a0, spacer
    syscall

    # Continue the loop
    j loop

exit:
    # Exit program
    li $v0, 10
    syscall
