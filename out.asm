	.data

	true_print_string: .asciiz "true"
	false_print_string: .asciiz "false"

	aa: .word 0
	ab: .word 0
	ac: .word 0
	ad: .word 0
	_ae: .word 79
	_af: .byte 7

	.text
	.globl main

test:

	# Assigning _ae to ab
	lw $a0, _ae
	la $a1, ab
	sw $a0, 0($a1)
	
	# Printing ab
	li $v0, 1
	lw $a0, ab
	syscall
	
	# Printing new line
	li $a0, 0xA
	li $v0, 0xB
	syscall
	
main:

	# Storing string "Hello!..." into data segment
	la $s0, _af
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
	li $s1, '!'
	sb $s1, 5($s0)
	li $s1, ' '
	sb $s1, 6($s0)
	# Assigning _af to ac
	la $s0, _af
	la $s1, ac
	sw $s0, 0($s1)
	
	# Assigning ac to ad
	lw $s0, ac
	la $s1, ad
	sw $s0, 0($s1)
	
	# Printing ac
	li $v0, 4
	lw $a0, ac
	syscall
	
	# Printing ad
	li $v0, 4
	lw $a0, ad
	syscall
	
	# Printing new line
	li $a0, 0xA
	li $v0, 0xB
	syscall
	
	# Exit!
	li $v0, 10
	syscall
	
	
