	.arch armv6
	.fpu vfp
	.text

    .global	print
print:
	stmfd	sp!, {r3, lr}
	mov	r3, r0
	mov	r2, r1
	ldr	r0, startstring
	mov	r1, r3
	bl	printf
	ldmfd	sp!, {r3, pc}

startstring:
	.word	string0

    .global	towers
towers:
	push 	{r4, r5, r6, r7, r8, lr}	@ Save Registers
   
						@ Save a copy of all 3 original parameters
	mov	r4, r0				@ r4 <- numDisks (original)
	mov	r5, r1				@ r5 <- start (original)
	mov	r6, r2				@ r6 <- goal (original)

						@ r7 <- pegs (temp)
						@ r8 <- steps
						
if:
	cmp 	r0, #2 				@ Compare numDisks with 2 or (numDisks - 2)

	bge     else				@ Check if less than, else branch to else (if r0 >= 2, then go to else)   

	mov     r0, r1				@ Set start to start for printing

	mov     r1, r2				@ Set end to end for printing

	bl      print				@ Call print function

	mov     r0, #1  			@ Set return register to 1      
			
	b	endif				@ Branch to endif
else:
        mov     r7, #6        			@ Use a saved variable for temp and set it to 6

        sub     r7, r7, r1			@ Subtract start from temp and store to itself   
 
	sub	r7, r7, r2			@ Subtract goal from temp and store to itself (temp = 6 - start - goal)

        sub     r0, r4, #1			@ Subtract 1 from original numDisks and store it to numDisks parameter

	mov     r2, r7				@ Set end as temp
   
	bl	towers				@ Call towers function
   
	mov	r8, r0				@ Save result to saved variable for total steps
   
	mov     r0, #1				@ Set numDiscs to 1
   
	mov	r1, r5 				@ Set start to original start
   
	mov     r2, r6				@ Set goal to original goal
   
	bl	towers				@ Call towers function
   
	add	r8, r8, r0			@ Add result to total steps so far
   
	sub	r0, r4, #1			@ Set numDisks to original numDisks - 1			

	mov     r1, r7				@ Set start to temp
   
	mov	r2, r6				@ Set goal to original goal
   
	bl	towers				@ Call towers function
   
	add	r0, r8, r0			@ Add result to total steps so far and save it to return register

endif:
	pop	{r4, r5, r6, r7, r8, pc}	@ Restore registers

    .global	main
main:
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	ldr	r0, printdata
	bl	printf
	ldr	r0, printdata+4
	add	r1, sp, #12
	bl	__isoc99_scanf
	ldr	r0, [sp, #12]
	mov	r1, #1
	mov	r2, #3
	bl	towers
	str	r0, [sp]
	ldr	r0, printdata+8
	ldr	r1, [sp, #12]
	mov	r2, #1
	mov	r3, #3
	bl	printf
	mov	r0, #0
	add	sp, sp, #20
	ldr	pc, [sp], #4
end:

printdata:
	.word	string1
	.word	string2
	.word	string3

string0:
	.ascii	"Move from peg %d to peg %d\012\000"
string1:
	.ascii	"Enter number of discs to be moved: \000"
string2:
	.ascii	"%d\000"
	.space	1
string3:
	.ascii	"\012%d discs moved from peg %d to peg %d in %d steps."
	.ascii	"\012\000"
