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
   /* Save Registers */
   
   /* Save a copy of all 3 original parameters */

if:
   /* Compare numDisks with 2 or (numDisks - 2)*/
   /* Check if less than, else branch to else */
   
   /* set start to start for printing */
   /* set end to end for printing */
   /* call print function */
   /* Set return register to 1 */
   /* branch to endif */
else:
   /* Use a saved varable for temp and set it to 6 */
   /* Subract start from temp and store to itself */
   /* Subtract goal from temp and store to itself (temp = 6 - start - goal)*/

   /* subtract 1 from original numDisks and store it to numDisks parameter */

   /* Set end as temp */
   /* Call towers function */
   /* Save result to saved variable for total steps */
   /* Set numDiscs to 1 */
   /* Set start to original start */
   /* Set goal to original goal */
   /* Call towers function */
   /* Add result to total steps so far */
   
   /* Set numDisks to original numDisks - 1 */
   /* set start to temp */
   /* set goal to original goal */
   /* Call towers function */
   /* Add result to total steps so far and save it to return register */

endif:
   /* Restore Registers */

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
	.ascii	"s\012\000"
