#Name: Cosette Tabucol
#CS2640
#Task 2: Using the ‘aString’ macro we defined on the previous slide, write a MIPS program that passes the programmer’s defined string to the macro
#Uses a loop to print the string 3 times (each on a new line), 
#and then exits the program.

.macro exit
li $v0, 10
syscall
.end_macro

.macro aString
li $v0, 4
la $a0, string
syscall
.end_macro

.data
#defined string
string: .asciiz "test\n"

.text
main:
	#li $t0, 0
	move $t0, $zero
loop: #loop three times
	beq $t0, 3, end
	aString
	addi $t0, $t0, 1
	j loop

end:
	exit
	
	#printing
	#addi $t0, $t0, 1
	#blt $t0, 5, loop
	#exit
		
	
