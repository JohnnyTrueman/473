.data 
str1: .asciiz  "ECE 473 COOL"
str2: .asciiz   "E"

.text
	la	$t1, str1
      	lb	$t2, str2
      	la	$t3, str1 
  
Loop:  
	lb	$t4, 0($t1)
     	beq	$t4, $t2, exit
     	sb	$t4, 0($t3)
     	addi	$t3, $t3, 1
exit: 
	addi	$t1, $t1, 1  #increments string1 to next in char
     	bne	$t4, $zero, Loop	     
    	
      	la	$a0, str1		
      	li	$v0, 4
 	syscall     			
      	li	$v0,10 #syscall for exit
	syscall