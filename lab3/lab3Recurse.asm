.data
x: .word 8
i: .word 10
.text
 	lw	$a0, x
 	lw 	$a1, i
 	
 	jal	fix
 	add	$t0, $zero, $v0
 	li	$v0,10 #syscall for exit
	syscall
	
.text
fix:
	addi	$sp, $sp, -12
	sw 	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 8($sp)
	blt	$a0, 3, else1
	subi 	$a0,$a0, 1
	jal	fix
	subi 	$a0, $a0,1
	jal	fix	
	addi	$v0,$v0, 1
	b 	else3
else1:
	blez 	$a0, else2
	subi 	$a0,$a0, 1
	jal	fix
	addi	$v0,$v0, 2
	b 	else3


else2:
	blez	$a1, else3
	subi 	$a0,$a0, 1
	subi	$a1, $a1,1
	jal	fix
	addi	$v0,$v0, 3
	b 	else3

else3:
	lw	$a0, 0($sp)
	lw	$a1, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jr 	$ra
	
			 	
		 	