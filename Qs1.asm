.data
# ------------------------Write Your Code Here------------------------------
C: .word 0
D: .word 0
E: .word 0
F: .word 0
# ------------------------Write Your Code Here-----------------------------
newline:    .asciiz "\n"
result_true: .asciiz "True\n"
result_false: .asciiz "False\n"



.text
main:
    # You must use the values of these registers
    li $t0, 15 #A
    li $t1, 30 #B
    
    # ------------------------Write Your Code Here------------------------------
    # Calculate C
    add $s0, $t0, $t1 # C = $S0, C = A + B
    sw $s0, C # store the result in C 
    
    # Calculate D, D = A + 200 - 6
    addi $t2, $t0, 200 # Part1 : A + 200 = $t2
    li $t3, 6 # Part2 : save 6 as temp variable
    sub $s1, $t2, $t3 # Part3 : D = $s1, (A + 200) - 6 = $t2 - $t3
    sw $s1, D # store the result in D 
    
    # Calculate E, E = B^2 (using add only)
    li $t4, 0 # counter
 
    loop_mul:
    	add $s2, $s2, $t1 # E = 0 + 30 
    	addi $t4, $t4, 1 # increment the counter
    	bne $t4, $t1, loop_mul #stop criteria for the loop
    	
    sw $s2, E # store the result in E
    
    # Calculate F, F = C + D + E - 2
    add $t5, $s0, $s1 # part1 : $t5 = C + D
    add $t6, $t5, $s2 # part2 : $t6 = $t5 + E 
    li $t7, 2 
    sub $s3, $t6, $t7 # part3 : $s3 = $t6 - 2
    
    sw $s3, F # store the result in F
    
    # ------------------------Write Your Code Here-------------------------------
    
    j checkQs1Partialy


checkQs1Partialy:
	li $t5, 45
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
