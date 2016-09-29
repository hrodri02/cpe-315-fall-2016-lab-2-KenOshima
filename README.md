#Towers of Hanoi

The file towers.cpp contains a C++ program that finds the number of moves 
needed to solve the classic Towers of Hanoi puzzle. In this problem a set of 
(golden) discs are stacked, each one in the stack a bit smaller than the one 
beneath. The problem is to move the stack from the first position to the third,
using the second position as an intermediate resting place. Discs must be moved
one at a time (gold is heavy), and a larger disc cannot be placed on top of a 
smaller one. According to the myth, when the priests finish moving the tower 
of discs according to these rules, the world will end.

The C++ program towers.cpp uses a recursive function to solve the problem, 
printing each of the moves and the total moves needed. The file towers.s has 
an outline of the ARM assembly code for the recursive function towers, along 
with complete main and print functions.

1. Complete the assembly implementation of the towers function for towers.s. 
You must use the conventions for ARM function calls and register usage as 
discussed in class. Your program must be recursive.

2. Compare the output of your code to the sample output for one, two, three, 
four, five, six, seven, and eight discs.

