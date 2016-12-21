

.DATA
.ADDR x4000

COLOR_START
	
.CODE
.ADDR x0000

	HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
	CONST R6, xE0				;;
	HICONST R6, x03				;;R6 = x03E0 (Green)
	CONST R5, #50				;;R5 = 50
	CONST R1, x00				;;R1 = 0

	JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine

	CONST R1, x00				;;R1 = 0
	CONST R2, x00				;;R2 = 0
	CONST R3 x00				;;
	HICONST R3, x50				;;R3 = x5000 (address for colors box 2)
	CONST R4, x00				;;R4 = 0	
	CONST R6, x00				;;
	HICONST R6, x7C				;;R6 = x7C00 (Red)
	CONST R5, #20				;;R5 = 20 (box length)
	CONST R1, x00				;;R1 = 0 
	
	JSR CREATE_PIXEL_COLORS

	CONST R0, x00				;;R0 = 0
	CONST R1, x00				;;R1 = 0
	CONST R4, x00				;;R4 = 0
	CONST R3 x00				;;
	HICONST R3, x60				;;R3 = x6000 (starting data mem address for box 3)
	CONST R6, xE0				;;
	HICONST R6, x7F				;;R6 = x7FE0 (Yellow)
	CONST R5, #30				;;R5 = 30 (Square length)
	CONST R1, x00				;;R1 = 0
	
	JSR CREATE_PIXEL_COLORS

CREATE_BOX_1					;;Set values for box 1 all other registers 0
	CONST R0, #50
	CONST R1, #5
	CONST R2, #50
	CONST R3, x00
	HICONST R3, x40
	CONST R4, x00
	CONST R5, x00
	CONST R6, x00
	TRAP x0A
	
CREATE_BOX_2					;;set values for box 2 all other registers 0
	CONST R0, #-10
	CONST R1, #-10
	CONST R2, #20
	CONST R3, x00
	HICONST R3, x50	
	CONST R4, x00
	CONST R5, x00
	CONST R6, x00
	TRAP x0A

CREATE_BOX_3					;;set values for box 3 all other registers 0
	CONST R0, #110
	CONST R1, #100
	CONST R2, #30
	CONST R3, x00
	HICONST R3, x60
	CONST R4, x00
	CONST R5, x00
	CONST R6, x00
	TRAP x0A
	
	BRNZP END
	
.FALIGN						;;create subroutine for filling colors 
CREATE_PIXEL_COLORS
	
	STORE_COLORS
		CMP R4, R5				;;If R4 count is greater than length move to row count
		BRZP MOVE_TO_NEXT_ROW	
		STR R6, R3, #0			;;Store color in address stored in R3
		ADD R3, R3, #1			;;Add 1 to R3 (data address)
		ADD R4, R4, #1			;;Add 1 to r4 (count for the column)
		BRNZP STORE_COLORS		;;loop
	
	MOVE_TO_NEXT_ROW			;;move to next row
		CONST R4, x00			;;Reset column count to R4
		ADD R1, R1, #1			;;R1 (row count) Add 1
		CMP R1, R5				;;compare row count to length
		BRP FINISH				;;If equal to length finish filling data
		BRNZP STORE_COLORS
	
	FINISH
	RET
		
	
END