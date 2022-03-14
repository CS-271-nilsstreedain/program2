# Fibonacci Numbers

## Objectives
1. Getting string input
2. Designing and implementing a counted loop
3. Designing and implementing a post-test loop
4. Keeping track of a previous value
5. Implementing data validation

## Problem Definition
Write a program to calculate Fibonacci numbers.
- Display the program title and programmer’s name. Then prompt the user for their name and greet them (by name).
- Prompt the user to enter the number of Fibonacci terms to be displayed. Advise the user to enter an integer in the range [1 .. 46].
- Get and validate the user input (n).
- Calculate and display all of the Fibonacci numbers up to and including the nth term. The results should be displayed 4 terms per line with at least 5 spaces between terms.
- Display a parting message that includes the user’s name, and terminate the program.

## Requirements
1. The programmer’s name and the user’s name must appear in the output.
2. The loop that implements data validation must be implemented as a post-test loop.
3. The loop that calculates the Fibonacci terms must be implemented using the MASM loop instruction.
4. Numeric user input must be aquired using the ReadInt Irvine procedure (as a signed integer).
5. The main procedure must be modularized into at least the following sections (procedures are not required in this program):
    - introduction
    - displayInstructions
    - getUserInfo
    - displayFibs
    - goodbye
6. Note that each of the above sections (introduction, displayInstructions, getUserInfo, etc) needs to have a header block explaining its purpose.
7. Recursive solutions are not acceptable for this assignment. This one is about iteration.
8. The upper limit must be defined and used as a constant.
9. The usual requirements regarding documentation, readability, user-friendliness, etc., apply.

## Notes
1. It is not necessary to store the Fibonacci numbers in an array. The terms may be displayed as they are generated.
2. The second-order Fibonacci sequence is defined as:
  1. The first two terms are both 1.
  2. All other terms are calculated as the sum of the two previous terms.
3. The reason for restricting n to [1 .. 46] is that the 47th Fibonacci number is too big for DWORD data type.

Example Program Operation
```
Fibonacci Numbers
Programmed by Leonardo Pisano
What’s your name? Paul
Hello, Paul
Enter the number of Fibonacci terms to be displayed.
Provide the number as an integer in the range [1 .. 46].
How many Fibonacci terms do you want? 50
Out of range. Enter a number in [1 .. 46]
How many Fibonacci terms do you want? -6
Out of range. Enter a number in [1 .. 46]
How many Fibonacci terms do you want? 14
1     1     2     3
5     8     13     21
34     55     89     144
233     377
Results certified by Leonardo Pisano.
Goodbye, Paul.
```

## Extra Credit Option (original definition must be fulfilled)
- (1 pt) Display the numbers in aligned columns.

Remember, in order to ensure you receive credit for any extra credit work, you must add one print statement to your program output PER EXTRA CREDIT which describes the extra credit you chose to work on. You will not receive extra credit points unless you do this. The statement must be formatted as follows...

```
--Program Intro--
**EC: DESCRIPTION
--Program prompts, etc--
```

Please refer back to the documentation for Program 1 to see a sample of the extra credit format.
