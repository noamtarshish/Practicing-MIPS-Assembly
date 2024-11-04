.data
# ------------------------Write Your Code Here------------------------------
#arr: .space 40 # Allocate space for the array (10 integers)
arr:  .word -23, 2354, 34, 10, -3553, 4234, 81, 90, 634, -27
size: .word 10
# ------------------------Write Your Code Here-----------------------------
newline:    .asciiz "\n"
result_true: .asciiz "True\n"
result_false: .asciiz "False\n"

.text
main:
    # ------------------------Write Your Code Here------------------------------
    la $s0, arr
    lw $s1, 0($s0) # min
    lw $s2, 0($s0) # max
    li $s3, 0 # sum
    li $t1, 0 # counter
            
    loop:
    	lw $t0, 0($s0)
    	
    	beq $t1, 10, end_loop
    	
    	blt $t0, $s1, min_update # check min 
    	bgt $t0, $s2, max_update # check max
    	add $s3, $s3, $t0 # add to sum
    	
    	addi $s0, $s0, 4 # move to next element in the array
    	
    	addi $t1, $t1, 1 # increment the counter

    	bnez $t0, loop 
    	
    min_update: # function to update the min number
	move $s1, $t0
	j loop
 	
    max_update: # function to update the max number
 	move $s2, $t0
 	j loop
    
    end_loop:
    # calculate average
    lw $t2, size
    div $s3, $t2
    mflo $s4
    
    move $s0, $s2 # max
    move $s1, $s1 # min
    move $s2, $s3 # sum
    move $s3, $s4 # average
    # ------------------------Write Your Code Here-------------------------------
    
    j checkQs3Partialy


checkQs3Partialy:
	li $t5, 4234
	beq $s0, $t5, print_true
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
