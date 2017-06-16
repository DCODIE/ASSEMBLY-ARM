#program to find whether the given number is prime or not
#data segment
.data
	prompt: .asciiz		"Enter N value: "
	msg_true: .asciiz 	"\nPrime Number"
	msg_false: .asciiz	"\nNon Prime Number"
	n: .word 0
	answer: .word 0

#  Text/code section
.globl main 
.text
main:
#  Read n value from user

	li $v0,4 										# print prompt string
	la $a0,prompt
	syscall
	li $v0,5 										# read N (as integer)
	syscall											#v0 contains N
	li $v1,2										#v1 loop variable

#  compute if number is prime

loop:
	beq $v1,$v0,prime	
	div $v0,$v1
	mfhi $t0										#mfhi save the results of division
	beq $t0,0,non_prime
	addi $v1,$v1,1
	j loop

prime:
	li $v0,4 										# print prompt string
	la $a0,msg_true
	syscall
	j terminate

non_prime:
	li $v0,4 										# print prompt string
	la $a0,msg_false
	syscall

terminate:
	li $v0,10 										# call code for terminate
	syscall 
