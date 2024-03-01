#Name: Cosette Tabucol
#Date: 11/12/2023
#CS2640
#Program 2: Practice with Conditionals and Loops


#Task 1: Return a Letter Grade from User Input
#=============================
.data
prompt_menu: .asciiz "------------MAIN MENU----------------\n(1) Get Letter Grade\n(2) Exit\n\nEnter 1 or 2 for your selection: "
prompt_score: .asciiz "\nPlease enter a score as an integer value: "
prompt_continue: .asciiz "\nWould you like to enter a new score?\n(Y)Yes (N)No\n\nEnter Y or N for your selection: "
grade_message: .asciiz "The grade is: "
grade_A: .asciiz "A\n"
grade_B: .asciiz "B\n"
grade_C: .asciiz "C\n"
grade_D: .asciiz "D\n"
grade_F: .asciiz "F\n"
invalid_input_message: .asciiz "Invalid input. Please enter a valid input.\n"

.text
main:
    # Main menu
    li $v0, 4
    la $a0, prompt_menu
    syscall

    # Get user selection
    li $v0, 5
    syscall
    move $t0, $v0
    
    # Check if user input is valid
    bne $t0, 1, invalid_input
    j get_score

    invalid_input:
    # Display invalid input message
    li $v0, 4
    la $a0, invalid_input_message
    syscall
    j main

    # Loop label
    get_score:
        # Prompt user for score
        li $v0, 4
        la $a0, prompt_score
        syscall

        # Get user score
        li $v0, 5
        syscall
        move $t1, $v0

        # Calculate grade
        # Check if the score is below 0
        li $t2, 0
        blt $t1, $t2, invalid_input
        li $t2, 90   # A
        bge $t1, $t2, grade_a
        li $t2, 80   # B
        bge $t1, $t2, grade_b
        li $t2, 70    # C
        bge $t1, $t2, grade_c
        li $t2, 60   # D
        bge $t1, $t2, grade_d
        j grade_f

    grade_a:
        # Display A
        li $v0, 4
        la $a0, grade_message
        syscall
        li $v0, 4
        la $a0, grade_A
        syscall
        j continue_prompt

    grade_b:
        # Display B
        li $v0, 4
        la $a0, grade_message
        syscall
        li $v0, 4
        la $a0, grade_B
        syscall
        j continue_prompt

    grade_c:
        # Display C
        li $v0, 4
        la $a0, grade_message
        syscall
        li $v0, 4
        la $a0, grade_C
        syscall
        j continue_prompt

    grade_d:
        # Display D
        li $v0, 4
        la $a0, grade_message
        syscall
        li $v0, 4
        la $a0, grade_D
        syscall
        j continue_prompt

    grade_f:
        # Display F
        li $v0, 4
        la $a0, grade_message
        syscall
        li $v0, 4
        la $a0, grade_F
        syscall

    continue_prompt:
        # Prompt for continuing
        li $v0, 4
        la $a0, prompt_continue
        syscall

        # Get user selection
        li $v0, 12  # Read a single character
        syscall
        move $t3, $v0

        # Check if user wants to continue
        beq $t3, 89, get_score  # 'Y'
        beq $t3, 121, get_score # 'y'

    # Exit label
    exit:
        li $v0, 10
        syscall
