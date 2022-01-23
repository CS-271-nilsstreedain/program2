TITLE Program Template     (prog2.asm)

; Author:					Nils Streedain
; Last Modified:			1/22/2022
; OSU email address:		streedan@oregonstate.edu
; Course number/section:	271-001
; Assignment Number:		2
; Due Date:					1/22/2022
; Description:				Write a program to calculate Fibonacci numbers.
;							Display the program title and programmer’s name. Then prompt the user for their name and greet them (by name).
;							Prompt the user to enter the number of Fibonacci terms to be displayed. Advise the user to enter an integer in the range [1 .. 46].
;							Get and validate the user input (n).
;							Calculate and display all of the Fibonacci numbers up to and including the nth term. The results should be displayed 4 terms per line with at least 5 spaces between terms.
;							Display a parting message that includes the user’s name, and terminate the program.

INCLUDE Irvine32.inc

; constants
RANGE_MIN = 1
RANGE_MAX = 46

.data
; (insert variable definitions here)
	; interface strings
	prog_title	BYTE		"Fibonacci Numbers", 13, 10, "Programmed by Nils Streedain", 13, 10, 0
	extra		BYTE		"**EC: Displays the numbers in aligned columns.", 13, 10, 0
	prompt_1	BYTE		"What is your name? ", 0
	greeting	BYTE		"Hello, ", 0
	prompt_2a	BYTE		"Enter the number of Fibonacci terms to be displayed.", 13, 10, "Provide the number as an integer in the range [1 .. 46].", 13, 10, 0
	prompt_2b	BYTE		"How many Fibonacci terms do you want? ", 0

	error		BYTE		"Out of range. Enter a number in [1 .. 46]", 13, 10, 0
	bye			BYTE		"Results certified by Nils Streedain.", 13, 10, "Goodbye, ", 0

	; user inputs
	username	BYTE		33 DUP(0)
	num_fibs	DWORD		?

.code
main PROC

; Prints the program title, author's name, & extra credit tag.
introduction:
	mov		edx, OFFSET prog_title
	call	WriteString
	mov		edx, OFFSET extra
	call	WriteString

; Asks for and stores user's name. Also greets user using the name.
getUserInfo:
	; prompt for username
	mov		edx, OFFSET prompt_1
	call	WriteString

	; store username
	mov		edx, OFFSET username
	mov		ecx, 32
	call	ReadString

	; greet user
	mov		edx, OFFSET greeting
	call	WriteString
	mov		edx, OFFSET username
	call	WriteString
	call	Crlf

; Tells the user to enter the number of fibs they'd like printed.
displayinstructions:
	mov		edx, OFFSET prompt_2a
	call	WriteString

; Prompts for number of fibs in the range 1-46. If the input is out of range, the program jumps to outOfRange.
fibPrompt:
	; prompts for number of fibs in range
	mov		edx, OFFSET prompt_2b
	call	WriteString
	call	ReadInt

	; check if input is out of range
	; (ReadInt already stores input in eax)
	cmp		eax, RANGE_MIN
	jl		outOfRange
	cmp		eax, RANGE_MAX
	jg		outOfRange
	
	; if not outOfRange, store num_fibs & then displayFibs
	mov		num_fibs, eax
	jmp		displayFibs

; Gives the user an out of range error & then jumps to fibPrompt to get another user input.
outOfRange:
	mov		edx, OFFSET error
	call	WriteString
	jmp		fibPrompt

; Starts a counted loop to print out a certain number of Fibonacci numbers.
displayFibs:
	; eax & ebx are used to store current fib values
	mov		eax, 0
	mov		ebx, 0
	; ecx stores the number of fibs to find/print, this is decreased after each loop
	mov		ecx, num_fibs

; Calculates the next fibonacci number
calcNthFib:
	; if eax is 0, it is increased
	; (this is for the first two iterations where 1 is printed)
	cmp		eax, 0
	je		incEbx

	; add eax to ebx
	; (these will be swapped later so eax is always larger)
	add		ebx, eax

; Swaps eax & ebx after they have been added together in ebx. This is done because the old ebx value is unimportant but the larger of the two still need to be in the same order. eax is also printed.
swapAndPrint:
	; swap eax & ebx using edx as temp
	mov		edx, eax
	mov		eax, ebx
	mov		ebx, edx

	; print eax (current fib number) & restart the loop for the next number.
	call	WriteDec
	call	Crlf
	loop	calcNthFib

	; once ecx = 0, jump to goodbye
	jmp		goodbye

incEbx:
	inc		ebx
	jmp		swapAndPrint

; Gives the user a salutation & exits the program.
goodbye:
	mov		edx, OFFSET bye
	call	WriteString
	mov		edx, OFFSET username
	call	WriteString

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
