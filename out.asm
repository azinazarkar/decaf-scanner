	.data

	_true_print_string: .asciiz "true"
	_false_print_string: .asciiz "false"

	aa: .word 0
	_ab: .space 6
	_ac: .space 6
	_ad: .word 0

	.text
	.globl main

	
_print_true:
	li $v0, 4
	la $a0, _true_print_string
	syscall
	jr $ra
	
_print_false:
	li $v0, 4
	la $a0, _false_print_string
	syscall
	jr $ra
	
_get_string_size:
	move $s0, $a0
	move $s1, $zero
_get_string_size_loop:
	lb $t2, 0($s0)
	beqz $t2, _get_string_size_end
	addi $s1, $s1, 1
	addi $s0, $s0, 1
	j _get_string_size_loop
_get_string_size_end:
	move $v0, $s1
	jr $ra
	
	
main:

	# Storing string "world..." into data segment
	la $s0, _ab
	li $s1, 'w'
	sb $s1, 0($s0)
	li $s1, 'o'
	sb $s1, 1($s0)
	li $s1, 'r'
	sb $s1, 2($s0)
	li $s1, 'l'
	sb $s1, 3($s0)
	li $s1, 'd'
	sb $s1, 4($s0)
	li $s1, ' '
	sb $s1, 5($s0)
	# Assigning _ab to aa
	la $s0, _ab
	la $s1, aa
	sw $s0, 0($s1)
	
	# Storing string "Hello..." into data segment
	la $s0, _ac
	li $s1, 'H'
	sb $s1, 0($s0)
	li $s1, 'e'
	sb $s1, 1($s0)
	li $s1, 'l'
	sb $s1, 2($s0)
	li $s1, 'l'
	sb $s1, 3($s0)
	li $s1, 'o'
	sb $s1, 4($s0)
	li $s1, ' '
	sb $s1, 5($s0)
	# Adding _ac and aa
	lw $a0, aa
	jal _get_string_size
	move $a0, $v0
	li $v0, 1
	syscall
	# Printing _ad
	li $v0, 4
	lw $a0, _ad
	syscall
	
	# Printing new line
	li $a0, 0xA
	li $v0, 0xB
	syscall
	
	# Exit!
	li $v0, 10
	syscall
	
	
