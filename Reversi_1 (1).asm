#Data
.data
#Input variables
rowInput:		.word 0		#variable for user row input
colInput:		.word 0		#variable for user col input
indexInput:		.word -1	#variable for converted input so that it works for a 1D array
playerOne:		.asciiz "Player One: \n"
playerTwo:		.asciiz "Player Two: \n"
rowPrompt:		.asciiz "Enter the row: "
colPrompt:		.asciiz "Enter the column: "

#Game control
player:			.word 1		#keep track of whose turn it is
turn:			.word 0		#keep track of the number of turns taken
isWon:			.byte 0		#boolean to check if someone won: 0 = false (game needs to keep running), 1 = true (someone won)

#Counters
numPieces:		.word 4		#keep track of the number of pieces on the board - set to 4 because the game starts with 2 black pieces and 2 white pieces
pOnePieces:		.word 2
pTwoPieces:		.word 2

#Arrays to check valid moves
pVM:			.asciiz "pvm1"
playerValidMoves:	.word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
pVm2:			.asciiz "pvm2"
cvm:			.asciiz "cvm1"
computerValidMoves:	.word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
cvm2:			.asciiz "cvm2"
playerWeights:		.word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
computerWeights:	.word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
counter:		.word 0
boardIndex:		.word 0
maxGainIndex:		.word -1	# index that will give the computer the biggest gain

#Array containing players' token locations
playerTokens:		.word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
computerTokens:		.word -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

#Strings and chars
pOneToken:		.ascii "+"
pTwoToken:		.ascii "-"

newLine:		.asciiz "\n"
newLine2:		.asciiz "\n\n"
space:			.asciiz "  "
sign:			.asciiz "$"

oneWon:			.asciiz "Player One won the round. "
twoWon:			.asciiz "Player Two won the round. "

welcomeMsg:		.asciiz "Welcome to Reversi!\nPlayer One: +\nPlayer Two: -\nPress 0 to get started.\n"
inputTooBig:		.asciiz "Input is too large. Try again...\n"
inputTooSmall:		.asciiz "Input is too small. Try again...\n"
invalidInputMsg:	.asciiz "Input is invalid. Try again...\n"

#1D array for the game board
board:			.asciiz "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$", "$"

#Program
	.text
main:
	li $v0, 4
	la $a0, welcomeMsg
	syscall
	li $v0, 5
	syscall
	
	#Keep looping until the user enters 0
	bne  $v0, $0, main
	
	#Initialize and print the board (4,4) (5,4) (4,5) (5,5)
	la $t8, initializeBoard
	jalr $t9, $t8
	
	la $t8, printBoard
	jalr $t9, $t8
	
	j loop
	
	li $v0, 10
	syscall


initializeBoard:
	la $t0, board
	
	#Initialize first piece - player one
	lb $t1, pOneToken	#load byte - load X token
	sb $t1, 54($t0)		#store byte - load that X token into index 54
	
	#Initialize second piece - player ones
	lb $t1, pOneToken
	sb $t1, 72($t0)
	
	#Initialize third piece - player two
	lb $t1, pTwoToken
	sb $t1, 56($t0)
	
	#Initialize fourth piece - player two
	lb $t1, pTwoToken
	sb $t1, 70($t0)
	
	#Jump to return address
	jalr $t8, $t9

loop:
	
	# jump to loopPlayerInput here - then get rid of the jal statements for the input right below
	#Get input
	jal loopPlayer
	
	la $t8, printBoard
	jalr $t9, $t8
	
	jal loopComputer
	
	la $t8, printBoard
	jalr $t9, $t8
	
	j loop
	#update the board
	#update the valid moves arrays
		# Here the idea is that there will be arrays of indices that store valid moves for both players 
		#and to validate user and computer input, all you have to do is check if the inputIndex exists in the array
	
	#print the board here

		
#-----------------------	    Start: Human Player    -----------------------#

			#		  TASKS			#
			#	  1. Get input 			#
			#	  2. Convert input		#
			#	  3. Validate input		#
			#	     - Ask until its valid	#
			#	  4. Update board		#
			#	  5. Update pOnePieces		#
			#	  6. Update numPieces		#
			#	  7. Check for win		#
			#	  8. Update player		#
			#	  9. Return to loop		#

loopPlayer:
	#keep asking until the input is valid
	#Should save return address to the stack here
	#And then laod it later to return to the loop
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal start
	
	addi $sp, $sp, 4
	lw $ra, ($sp)
	sw $0, ($sp)
	jr $ra

start:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	la $a0, playerOne
	li $v0, 4
	syscall
	j getRowInput

getRowInput:
	la $a0, rowPrompt
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, rowInput
	j getColInput
	
getColInput:
	la $a0, colPrompt
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, colInput
	j convertInput

convertInput:
	lw $t0, rowInput
	lw $t1, colInput
	#convert(row, col) = 8(row - 1) + (col - 1)
	addi $t0, $t0, -1	# row = (row - 1)
	li $t5, 8
	mult $t0, $t5
	mflo $t0		# row = 8 * row
	addi $t1, $t1, -1	# col = (col - 1)
	add $t3, $t0, $t1	#index = row + col
	sll $t3, $t3, 1
	sw $t3, indexInput	#store in memory
	j initialValidate

initialValidate:
	li $t0, 126
	lw $t1, indexInput
	li $t2, 1
	
	sgt $t3, $t1, $t0
	slt $t4, $t1, $0
	beq $t2, $t3, printTooBig
	beq $t2, $t4, printTooSmall
	j findPlayerTokens
	
	printTooBig:
		li $v0, 4
		la $a0, inputTooBig
		syscall
		j getRowInput
	printTooSmall:
		li $v0, 4
		la $a0, inputTooSmall
		syscall
		j getRowInput

findPlayerTokens:
	la $s0, board
	la $t0, playerTokens
	lb $t1, pOneToken
	li $t2, 0		# total token count
	li $t3, 0		# index
	li $t4, 65
	li $t5, 0		# counter to 65
	
	find:	beq $t5, $t4, prepareFindValidMoves	#if the counter is at 65, then move on to findValidMoves
		lb $t6, ($s0)				#load from board
		beq $t6, $t1, found			#if token found, go to found
		addi $t3, $t3, 2
		addi $t5, $t5, 1
		addi $s0, $s0, 2
		j find				# else loop
	
	found:	addi $t2, $t2, 1
		sw $t2, pOnePieces
		sw $t3, ($t0)
		addi $t0, $t0, 4
	
	update:	addi $t3, $t3, 2
		addi $t5, $t5, 2
		addi $s0, $s0, 2
		j find

prepareFindValidMoves:
	li $t0, 0			# condition for the loop to end -> go until t0 = pOnePieces
	li $t1, 0			# t1 index of playerTokens
	li $t2, 0			# t2 holds the number of enemy pieces that can be taken
	li $s0, 0			# index of board
	lb $a2, pTwoToken		# a2 has pTwoToken
	lb $a3, sign			# a3 has a space
	#lw $t4, pOnePieces		# total num of player one pieces - can be used as length of playerTokens array

findValidMoves:
	lw $a1, playerTokens ($t1)	# a1 has the index of the plus on the board
	li $t3, -1
	beq $a1, $t3, validateInput
	# check row forward
	li $a0, 1
	jal check
	# check row backward
	li $a0, -1
	lw $a1, playerTokens ($t1)
	li $t2, 0
	jal check
	# check column forward
	li $a0, 8
	lw $a1, playerTokens ($t1)
	li $t2, 0
	jal check
	# check column backward
	li $a0, -8
	lw $a1, playerTokens ($t1)
	li $t2, 0
	jal check
	# check diagonal forward
	li $a0, 9
	lw $a1, playerTokens ($t1)
	li $t2, 0
	jal check
	# check diagonal backward
	li $a0, -9
	lw $a1, playerTokens ($t1)
	li $t2, 0
	jal check
	# check diagonal by 7
	li $a0, 7
	lw $a1, playerTokens ($t1)
	li $t2, 0
	jal check
	# check diagonal by 7 backwards
	li $a0, -7
	lw $a1, playerTokens ($t1)
	li $t2, 0
	jal check
	
	addi $t1, $t1, 4
	j findValidMoves
	
	check:
		sll $a0, $a0, 1			# every token is null terminated so they take two bytes
		add $a1, $a1, $a0		# a1 = index = (plus from playerTokens array) + increment
		lb $t5, board($a1)		# t4 holds token being chekced, $a1, holds index of token being checked
		
		bne $t5, $a2, returnValidation		# if first token being checked is not other players token it will move on
		
		checkNext:				# checks to see other players' token in a row/column/diagaonal
			bne $t5, $a2, checkSign
			addi $t2, $t2, 1 		# t2 holds number of tokens being taken
			add $a1, $a1, $a0
			validBound:
				la $t6, checkBounds
				jalr $t7, $t6
				beq $v0, $0, returnValidation
				
			lb $t5, board($a1)
			j checkNext
		
		checkSign:			# checks to see if there is a space to put players token 
			beq $t5, $a3, addMove
			j returnValidation
		
		addMove:
			sw $a1, playerValidMoves($s0)
			sw $t2, playerWeights($s0) # parallel with valid moves array
			addi $s0, $s0, 4	# saves index of valid moves array
		
		returnValidation:
			jr $ra		# return back to validate

validateInput:	
	# traverse through the valid moves array and check if input was valid
	lw $t0, indexInput		#load index input
	la $t1, playerValidMoves
	li $t3, -1
	lw $t4, playerValidMoves($0)
	beq $t3, $t4, endPlayerTurn	# if the playerValidmoves has not been changed from -1 at all, there are no valid moves -> pass to next player
		#TODO: endPlayerTurn
	
	checkValid:
		lw $t2, ($t1)
		beq $t0, $t2, prepareFlipHuman	# if the user input == one of the valid moves -> start flipping pieces
		beq $t2, $t3, invalidInput	# if validMove == -1, that means there are no more valid moves -> go back to getting more input
		addi $t1, $t1, 4
		j checkValid

	invalidInput:
		li $v0, 4
		la $a0, invalidInputMsg
		syscall
		j getRowInput
	
prepareFlipHuman:
	lb $t0, pOneToken
	lb $t1, pTwoToken
	lw $t2, indexInput
	j flipPieces	

prepareFlipComputer:
	lb $t0, pTwoToken
	lb $t1, pOneToken
	lw $t2, indexInput	# this indexInput is set to the bot's pick in the pickIndex funciton at the bottom
	j flipPieces

flipPieces:
	# find out how many opponent pieces to flip - or have that done before
	# and find which rows/cols/diagonals to flip and flip them
	# I think we can use something similar to the code we have for finding valid places
	
	lb $t3, sign
	li $a1, 0
	sb $t0, board($t2)
	
	startFlip:
		# flip row forward
		li $a0, 2
		jal setFlip
		
		# flip row backward
		li $a0, -2
		lw $t2, indexInput
		jal setFlip
		
		# flip column downward
		li $a0, 16
		lw $t2, indexInput
		jal setFlip
		
		# flip column upward
		li $a0, -16
		lw $t2, indexInput
		jal setFlip
		
		# flip diagonal top left to bottom right
		li $a0, 18
		lw $t2, indexInput
		jal setFlip
		
		# flip diagonal bottom right to top left
		li $a0, -18
		lw $t2, indexInput
		jal setFlip
		
		# flip diagonal top right to bottom left
		li $a0, 14
		lw $t2, indexInput
		jal setFlip
		
		# flip diagonal bottom left to top right
		li $a0, -14
		lw $t2, indexInput
		jal setFlip
		
		j prepareUpdateCounters
		
		setFlip:
			add $t2, $t2, $a0
			lb $t4, board($t2)
			beq $t1, $t4, checkNextToken	# checks if t4 has an opponent token, if it does then check if the next one is a $ sign
			bne $t1, $t4, returnFlip
			j setFlip
			
		checkNextToken:				# checks if next token is a $ or your token
			add $t2, $t2, $a0
			lb $t6, board($t2)
			beq $t6, $t3, return		# if $ sign return
			beq $t6, $t0, flip		# if next sign is your token, then flip all the way backward
			j checkNextToken
			
		flip:
			sb $t0, board($t2)
			sub $a0, $0, $a0
			
			flipLoop:
				add $t2, $t2, $a0
				lb $t6, board($t2)
				beq $t6, $t0, return
				sb $t0, board($t2)
				j flipLoop
			
		returnFlip:
			jr $ra

prepareUpdateCounters:
	la $t0, board
	li $t1, 0		#counter to 64
	li $t2, 64
	lb $t3, pOneToken
	lb $t4, pTwoToken
	
	li $s0, 0		# counter for user pieces
	li $s1, 0		# counter for computer pieces
	li $s2, 0		# coutner for total pieces

updateCounters:
	lb $t5, ($t0)
	beq $t5, $t3, incrementUser
	beq $t5, $t4, incrementComputer
	beq $t1, $t2, updateTotalPieces
	
	addi $t0, $t0, 2
	addi $t1, $t1, 1
	j updateCounters
	
	incrementUser:
		addi $s0, $s0, 1
		addi $t0, $t0, 2
		addi $t1, $t1, 1
		j updateCounters
	
	incrementComputer:
		addi $s1, $s1, 1
		addi $t0, $t0, 2
		addi $t1, $t1, 1
		j updateCounters
	
	updateTotalPieces:
		add $s2, $s0, $s1
		j checkWin

checkWin:
	lw $t0, pOnePieces
	lw $t1, pTwoPieces
	
	bgt $t0, $t1, pOneWon
	bgt $t1, $t0, pTwoWon

	jal clearArrays
	lw $ra, ($sp)
	sw $0, ($sp)
	jr $ra

endPlayerTurn:
	jal clearArrays
	lw $ra, ($sp)
	sw $0, ($sp)
	jr $ra

#-----------------------	    End: Human Player    	-----------------------#


#-----------------------	   Start: Computer Bot    	-----------------------#

			#		  TASKS			#
			#	  1. Generate input 		#
			#	  2. Validate input		#
			#	     - Ask until its valid	#
			#	  3. Update pOnePieces		#
			#	  4. Update numPieces		#
			#	  5. Check for win		#
			#	  6. Update player		#
			#	  7. Return to loop		#

loopComputer:
	#keep asking until the input is valid
	#Should save return address to the stack here
	#And then load it later to return to the loop
	
	addi $sp, $sp, -4		#make space for return address
	sw $ra, ($sp)			#save return address
	
	jal startBot
	
	addi $sp, $sp, 4
	lw $ra, ($sp)
	sw $0, ($sp)
	jr $ra

startBot:
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	li $v0, 4
	la $a0, playerTwo
	syscall
	
	j findBotTokens
	
findBotTokens:
	la $s0, board
	la $t0, computerTokens
	lb $t1, pTwoToken
	li $t2, 0		# total token count
	li $t3, 0		# index
	li $t4, 65
	li $t5, 0		# counter to 65
	
	findBot:	beq $t5, $t4, prepareFindValidMovesBot		#if the counter is at 65, then move on to findValidMoves
			lb $t6, ($s0)					#load from board
			beq $t6, $t1, foundBot				#if token found, go to found
			addi $t3, $t3, 2
			addi $t5, $t5, 1
			addi $s0, $s0, 2
			j findBot					# else loop
	
	foundBot:	addi $t2, $t2, 1
			sw $t2, pTwoPieces
			sw $t3, ($t0)
			addi $t0, $t0, 4
	
	updateBot:	addi $t3, $t3, 2
			addi $t5, $t5, 2
			addi $s0, $s0, 2
			j findBot

prepareFindValidMovesBot:
	li $t0, 0			# condition for the loop to end -> go until t0 = pOnePieces
	li $t1, 0			# t1 index of playerTokens
	li $t2, 0			# t2 holds the number of enemy pieces that can be taken
	li $s0, 0			# index of board
	lb $a2, pOneToken		# a2 has opponent token
	lb $a3, sign			# a3 has a space
	
findValidMovesBot:
	lw $a1, computerTokens ($t1)	# a1 has the index of the plus on the board
	li $t3, -1
	beq $a1, $t3, pickIndex
	# check row forward
	li $a0, 1
	jal checkBot
	# check row backward
	li $a0, -1
	lw $a1, computerTokens ($t1)
	li $t2, 0
	jal checkBot
	# check column forward
	li $a0, 8
	lw $a1, computerTokens ($t1)
	li $t2, 0
	jal checkBot
	# check column backward
	li $a0, -8
	lw $a1, computerTokens ($t1)
	li $t2, 0
	jal checkBot
	#  diagonal forward
	li $a0, 9
	lw $a1, computerTokens ($t1)
	li $t2, 0
	jal checkBot
	# check diagonal backward
	li $a0, -9
	lw $a1, computerTokens ($t1)
	li $t2, 0
	jal checkBot
	# check diagonal by 7
	li $a0, 7
	lw $a1, computerTokens ($t1)
	li $t2, 0
	jal checkBot
	# check diagonal by 7 backwards
	li $a0, -7
	lw $a1, computerTokens ($t1)
	li $t2, 0
	jal checkBot
	
	addi $t1, $t1, 4
	j findValidMovesBot
	
	checkBot:
		sll $a0, $a0, 1			# every token is null terminated so they take two bytes
		add $a1, $a1, $a0		# a1 = index = (plus from playerTokens array) + increment
		lb $t5, board($a1)		# t4 holds token being chekced, $a1, holds index of token being checked
		
		bne $t5, $a2, returnValidationBot	# if first token being checked is not other players token it will move on
		
		checkNextBot:				# checks to see other players' token in a row/column/diagaonal
			bne $t5, $a2, checkSignBot
			addi $t2, $t2, 1 		# t2 holds number of tokens being taken
			add $a1, $a1, $a0
			validBoundBot:
				la $t6, checkBounds
				jalr $t7, $t6
				beq $v0, $0, returnValidationBot
				
			lb $t5, board($a1)
			j checkNextBot
		
		checkSignBot:			# checks to see if there is a space to put players token 
			beq $t5, $a3, addMoveBot
			j returnValidationBot
		
		addMoveBot:
			sw $a1, computerValidMoves($s0)
			sw $t2, computerWeights($s0) 	# parallel with valid moves array
			addi $s0, $s0, 4		# saves index of valid moves array
		
		returnValidationBot:
			jr $ra		# return back to validate


pickIndex:
	li $t1, 0				# counter
	sw $0, maxGainIndex
	li $t8, 0				#current max
		
	findMaxBot:
		lw $t7, maxGainIndex
		lw $t2, computerWeights($t7)	# load the current max weight into t2
		lw $t3, computerWeights($t1)	# loads weight that needs to be checked into t3
		sgt $t4, $t3, $t2		# if the move being checked is greater than the current max $t4 will be set to 1
		beq $t4, 1, newMaxBot		# if $t4 is 1 jump to new max
		addi $t1, $t1, 4			# increments index
		
		beq $t3, -1, gotoFlipBot		# if there are no more valid moves return
		beq $t1, 256, gotoFlipBot		# if end of array return
		j findMaxBot			# else repeat
	newMaxBot:
		sw $t1, maxGainIndex		# adds new max
		addi $t1, $t1, 4
		j findMaxBot			
		
	gotoFlipBot:
		lw $t6, maxGainIndex
		lw $t2, computerValidMoves($t6)
		sw $t2, indexInput
		j prepareFlipComputer

#-----------------------	   End: Computer Bot    	-----------------------#



printBoard:

	la $t0, board
	li $t1, 65	#board size
	li $t2, 8	#length
	li $a1, 0	#rowCounter
	li $a2, 0	#colCounter
	li $a3, 1	#counter to 64
	li $t3, 5

	printBoardLoop:
		beq $a2, $t2, printNewLine
		beq $a3, $t1, returnJalr
		li $v0, 4
		la $a0, ($t0)
		syscall
		la $a0, space
		syscall
		addi $a2, $a2, 1
		addi $t0, $t0, 2
		addi $a3, $a3, 1
		j printBoardLoop

printNewLine:
	li $v0, 4
	la $a0, newLine2
	syscall
	
	addi $a1, $a1, 1
	addi $a2, $0, 0
	
	j printBoardLoop

#----Start bounds checking function----#

checkBounds:
	# Each label needs to return back up to the proper function with the correct value... 0 or 1 depending on the bounds
	# index to check is in a1
	
	
	li $s7, -2
	beq $a0, $s7, checkNegOne
	
	li $s7, 2
	beq $a0, $s7, checkPosOne
	
	li $s7, -16
	beq $a0, $s7, checkNegEight
	
	li $s7, 16
	beq $a0, $s7, checkPosEight
	
	li $s7, -14
	beq $a0, $s7, checkNegSeven
	
	li $s7, 14
	beq $a0, $s7, checkPosSeven
		
	li $s7, -18
	beq $a0, $s7, checkNegNine
	
	li $s7, 18
	beq $a0, $s7, checkPosNine
			
	checkNegOne:
			li $s6, 16
			div $a1, $s6
			mfhi $s6
			sne $v0, $s6, 14
			
			jalr $t6, $t7
	
	checkPosOne:	
			li $s6, 16
			div $a1, $s6
			mfhi $t4
			sne $v0, $s6, 14
			
			jalr $t6, $t7
	
	checkNegEight:
			li $s6, 14	  # if the index is greater than 7 its not on the top row
			sgt $v0, $a1, $s6 # if on top row $t3 will be 0
			jalr $t6, $t7
	
	checkPosEight:
			li $s6, 112	  # if index is less than 56 its not on the bottom row
			slt $t3, $a1, $s6 # if on bottom row $t3 will be 0
			jalr $t6, $t7
			
	checkNegSeven:
			li $s6, 16
			div $a1, $s6
			mfhi $s6
			sne $v0, $s6, 14
			jalr $t6, $t7
	
	checkPosSeven:
			li $s6, 16
			div $a1, $s6
			mfhi $s6
			sne $v0, $s6, $0
			jalr $t6, $t7
	
	checkNegNine:
			li $s6, 16
			div $a1, $s6
			mfhi $s6
			sne $v0, $s6, $0
			jalr $t6, $t7
	
	checkPosNine:
			li $s6, 16
			div $a1, $s6
			mfhi $s6
			sne $v0, $s6, 14
			jalr $t6, $t7

#----End bounds checking function----#

#----Start clear arrays function----#

clearArrays:
	li $t1, 0		
	li $t2, -1		

	nextIndex:
		# sets all values to -1
		sw $t2, playerValidMoves($t1) 		
		sw $t2, computerValidMoves($t1)
		sw $t2, playerWeights($t1)
		sw $t2, computerWeights($t1)
		sw $t2, playerTokens($t1)
		sw $t2, computerTokens($t1)
	
		addi $t1, $t1, 4
	
		bne $t1, 256, nextIndex
	
	return:
		jr $ra

#-----End clear arrays function-----#


returnJalr:
	jalr $t8, $t9

returnToCaller:
	jr $ra
	

pOneWon:
	li $v0, 4
	la $a0, oneWon
	syscall
	li $v0, 10
	syscall

pTwoWon:
	li $v0, 4
	la $a0, twoWon
	syscall
	li $v0, 10
	syscall	

exit:
	li $v0, 10
	syscall


#while (!isWon) {
#	//printBoard();
#	rowInput = getInput("row");
#	colInput = getInput("col");
#	updateBoard(rowInput, colInput);
#	out.println("row: " + rowInput);
#	out.println("col: " + colInput);
#	isWon = checkWin();
#	turn++;
#}


#	li $t0, 0
#	li $t1, 0
#	li $t2, 0
#	li $t3, 0
#	li $t4, 0
#	li $t5, 0
#	li $t6, 0
#	li $t7, 0
#	li $t8, 0
#	li $t9, 0
#	li $s0, 0
#	li $s1, 0
#	li $s2, 0
#	li $s3, 0
#	li $s4, 0
#	li $s5, 0
#	li $s6, 0
#	li $s7, 0
