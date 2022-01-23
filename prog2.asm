TITLE Program Template     (prog1.asm)

; Author:					Nils Streedain
; Last Modified:			1/16/2022
; OSU email address:		streedan@oregonstate.edu
; Course number/section:	271-001
; Assignment Number:		1
; Due Date:					1/16/2022
; Description:				Write a MASM program to perform the tasks listed below. Test your program to ensure that it functions correctly.
;							Display your name and program title on the output screen.
;							Display instructions for the user.
;							Prompt the user to enter two numbers.
;							Calculate the sum, difference, product, (integer) quotient and remainder of the numbers.
;							Display a terminating message.

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
; (insert variable definitions here)
	; interface strings
	prog_title	BYTE		"Elementary Arithmetic by Nils Streedain", 13, 10, 0
	extra_1		BYTE		"**EC: Program verifies second number less than first.", 13, 10, 0
	extra_2		BYTE		"**EC: Program displays the square offset each number.", 13, 10, 0
	intro		BYTE		"Enter 2 numbers, and I'll show you the sum, difference, product, quotient, and remainder.", 13, 10, 0
	prompt_1	BYTE		"First number: ", 0
	prompt_2	BYTE		"Second number: ", 0
	error_1		BYTE		"The second number must be less than the first!", 13, 10, 0
	bye			BYTE		"Impressed? Bye!", 0

	; user inputs
	input_1		DWORD		?
	input_2		DWORD		?

	; equation formatting strings
	add_char	BYTE		" + ", 0
	sub_char	BYTE		" - ", 0
	mul_char	BYTE		" x ", 0
	div_char	BYTE		" / ", 0
	eql_char	BYTE		" = ", 0
	rem_string	BYTE		" remainder ", 0
	squ_string	BYTE		"Square of ", 0

	; calculated values
	sum			DWORD		?
	difference	DWORD		?
	product		DWORD		?
	quotient	DWORD		?
	remainder	DWORD		?
	square_1	DWORD		?
	square_2	DWORD		?

.code
main PROC

; (insert executable instructions here)

; 1. Introduction
	; print title
	mov		edx, OFFSET prog_title
	call	WriteString

	; print extra credit
	mov		edx, OFFSET extra_1
	call	WriteString
	mov		edx, OFFSET extra_2
	call	WriteString

	; print intro
	mov		edx, OFFSET intro
	call	WriteString

; 2. Get the data
	; ask for and save first input number
	mov		edx, OFFSET prompt_1
	call	WriteString
	call	ReadInt
	mov		input_1, eax

	; ask for and save second input number
	mov		edx, OFFSET prompt_2
	call	WriteString
	call	ReadInt
	mov		input_2, eax

	; make sure input_1 > input_2
	mov		eax, input_1
	cmp		eax, input_2
	jle		Error
	jg		Calculate

; run if input_2 >= input_1
Error:
	; prints error and ends program
	mov		edx, OFFSET error_1
	call	WriteString
	jmp		Farewell

; 3. Calculate the required values
Calculate:
	; calculate sum
	mov		eax, input_1
	add		eax, input_2
	mov		sum, eax

	; calculate difference
	mov		eax, input_1
	sub		eax, input_2
	mov		difference, eax

	; calculate product
	mov		eax, input_1
	mov		ebx, input_2
	mul		ebx
	mov		product, eax

	; caclulate quotient
	mov		eax, input_1
	mov		ebx, input_2
	div		ebx
	mov		quotient, eax
	mov		remainder, edx

	; calculate square 1
	mov		eax, input_1
	mov		ebx, input_1
	mul		ebx
	mov		square_1, eax

	; calculate square 2
	mov		eax, input_2
	mov		ebx, input_2
	mul		ebx
	mov		square_2, eax

; 4. Display the results
	; display sum "input_1 + input_2 = sum"
	mov		eax, input_1
	call	WriteDec

	mov		edx, OFFSET add_char
	call	WriteString

	mov		eax, input_2
	call	WriteDec

	mov		edx, OFFSET eql_char
	call	WriteString
	
	mov		eax, sum
	call	WriteDec

	call	Crlf

	; display difference  "input_1 - input_2 = difference"
	mov		eax, input_1
	call	WriteDec

	mov		edx, OFFSET sub_char
	call	WriteString

	mov		eax, input_2
	call	WriteDec

	mov		edx, OFFSET eql_char
	call	WriteString
	
	mov		eax, difference
	call	WriteDec

	call	Crlf

	; display product  "input_1 x input_2 = product"
	mov		eax, input_1
	call	WriteDec

	mov		edx, OFFSET mul_char
	call	WriteString

	mov		eax, input_2
	call	WriteDec

	mov		edx, OFFSET eql_char
	call	WriteString
	
	mov		eax, product
	call	WriteDec

	call	Crlf

	; display quotient  "input_1 / input_2 = quotient remainder remainder"
	mov		eax, input_1
	call	WriteDec

	mov		edx, OFFSET div_char
	call	WriteString

	mov		eax, input_2
	call	WriteDec

	mov		edx, OFFSET eql_char
	call	WriteString
	
	mov		eax, quotient
	call	WriteDec

	mov		edx, OFFSET rem_string
	call	WriteString
	
	mov		eax, remainder
	call	WriteDec

	call	Crlf

	; display square 1 "Square of input_1 = square_1"
	mov		edx, OFFSET squ_string
	call	WriteString

	mov		eax, input_1
	call	WriteDec

	mov		edx, OFFSET eql_char
	call	WriteString

	mov		eax, square_1
	call	WriteDec

	call	Crlf

	; display square 2 "Square of input_2 = square_2"
	mov		edx, OFFSET squ_string
	call	WriteString

	mov		eax, input_2
	call	WriteDec

	mov		edx, OFFSET eql_char
	call	WriteString

	mov		eax, square_2
	call	WriteDec

	call	Crlf

; 5. Say goodbye
Farewell:
	mov		edx, OFFSET bye
	call	WriteString

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
