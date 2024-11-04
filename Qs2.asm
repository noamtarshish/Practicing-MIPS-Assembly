.data
# ------------------------Write Your Code Here------------------------------
arr: .space 40 # Allocate space for the array (10 integers)
# ------------------------Write Your Code Here-------------------------------
newline:    .asciiz "\n"
result_true: .asciiz "True\n"
result_false: .asciiz "False\n"

.text
main:
    #first 2 elements, dont forget to store them in arr
    li $t0, 0 
    li $t1, 1
    # ------------------------Write Your Code Here------------------------------
    la $s0, arr
    sw $t0, 0($s0) # store the first element in the array - 0
    sw $t1, 4($s0) # store the second element in the array - 1
    
    li $t2, 8 # remaining numbers to generate to the array
    li $t3, 8 # next index in the array to store number
    fib_loop:
    	beqz $t2, end_loop
    	
    	add $t4, $t0, $t1 # generate next fibonacci number
    	
    	sw $t4, 8($s0) # store the number in the array
    	addi $s0, $s0, 4
    
    	# update values to the next iteration
    	move $t0, $t1
    	move $t1, $t4
    
    	addi $t3, $t3, 4 # update index to store next number
    	addi $t2, $t2, -1 # update remaining numbers
    
    	j fib_loop # jump to the next iteration of the loop
    
    end_loop:

    # ------------------------Write Your Code Here-------------------------------
    la $s0, arr
    j check_array

check_array:
    # Check if the first element is 0 and the second one is 1
    lw $t1, 0($s0)   # Load the first element from the array pointed by $s0
    lw $t2, 4($s0)   # Load the second element from the array pointed by $s0

    li $t3, 0       # Constant value for comparison
    li $t4, 1     # Constant value for comparison

    # Check the conditions
    beq $t1, $t3, check_second_element
    j print_false

check_second_element:
    beq $t2, $t4, print_true
    j print_false

print_true:
    # Print True
    li $v0, 4      # System call for print_str
    la $a0, result_true
    syscall
    j end_program

print_false:
    # Print False
    li $v0, 4      # System call for print_str
    la $a0, result_false
    syscall

end_program:
    # Exit the program
    li $v0, 10
    syscall
