;; This program tests TRAP_GETC and TRAP_PUTS 
;; It starts by printing out my name a new line and the prompt "Start Typing >"
;; Then the user can type and print to the console until the user hits new line

.Data
.ADDR x4000

START_STRING 	;;Fill the values for my name and Start Typing
	.fill x4A
	.fill x6F
	.fill x73
	.fill x65
	.fill x70
	.fill x68
	.fill x20
	.fill x46
	.fill x72
	.fill x61
	.fill x6E
	.fill x7A
	.fill x0A
	.fill x53
	.fill x74
	.fill x61
	.fill x72
	.fill x74
	.fill x20
	.fill x54
	.fill x79
	.fill x70
	.fill x69
	.fill x6E
	.fill x67
	.fill x20
	.fill x3E
	.fill x0A
	.fill x00
	
.code
.ADDR x0000  			;;User code starting at address x0000

	CONST R0, x00		
	HICONST R0, x40		;;Set R0 to x4000 address of the first string to print out
	
	TRAP x08			;;Run TRAP_PUTS
	
Typing 					;;Typing code

	TRAP x00			;;Call TRAP_GETC
	
	CONST R0 x00		;;Set R0 to 0
	HICONST R0 x00
	
	ADD R0, R5, #0		;;Set R0 = R5
	CMPI R0, #10		;;Check value of R0
						;;If it is 10 or ASCII new line
	BRZ END				;;End program 
	
	TRAP x01			;;TRAP_PUTC Prints out the character in R0
	BRNZP TYPING		;;Restart the loop
	
	
END


