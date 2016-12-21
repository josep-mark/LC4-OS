;;This program draws a red box using TRAP_DRAW_BOX
;;It then draws a 1 in the red  box
;;R0 x coordinate
;;R1 y coordinate
;;R2 length
;;R3 colors start in data address


.code
.ADDR x0000
DATA_BOX_1
	HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
	CONST R6, x00				;;
	HICONST R6, x7C				;;R6 = x7C00 (red) using R6 to store the value
	CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
	CONST R1, x00				;;R1 = 0 for the row count
	
	JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
								;;The same sub routine used in user_draw
	
CREATE_BOX_1					;;Set values for box 1 all other registers 0
	CONST R0, #30				;;sets the values for x, y, length, and Data mem start address
	CONST R1, #50
	CONST R2, #50
	CONST R3, x00
	HICONST R3, x40
	CONST R4, x00
	CONST R5, x00
	CONST R6, x00
	TRAP x0A					;;calls TRAP_DRAW_BOX

DATA_BOX_2						;;Creates the color data for the second box
								;;This box has the same red values except for the 1 to be drawn where the pixels will be black
	CONST R3, x19
	HICONST R3, x40				;;R3 = x4019 start data mem address for black pixels 
	CONST R6, x00				;;
	HICONST R6, x00				;;R6 = x0000 (black)
	CONST R5, #40				;;R5 = 40 for the length of the 1
	CONST R1, x00				;;R1 = 0 for the row count
	CONST R4, x00				;;R4 = 0 to reset value
	ADD R3, R3, R2				;;Adds 50 to to R3 to advance the data memory address
	
	JSR CREATE_PIXEL_COLORS_2	;;Jump to fill data mem sub-routine
	
CREATE_BOX_2					;;Set values for box 1 all other registers 0
	CONST R0, #30				;;Sets x, y, length, and data mem start all others set to 0
	CONST R1, #50
	CONST R2, #50
	CONST R3, x00
	HICONST R3, x40
	CONST R4, x00
	CONST R5, x00
	CONST R6, x00
	TRAP x0A					;;Calls TRAP_DRAW_BOX

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
		

	.FALIGN						;;create subroutine for filling colors for the 1	
CREATE_PIXEL_COLORS_2			;;stores a single black value in the 
	
	STORE_BLACK
		CONST R1 #50
		STR R6, R3, #0			;;Store color in R6 in address stored in R3
		ADD R3, R3, R1			;;Add 50 to R3 (data address) to advance to the aligned pixel
		ADD R4, R4, #1			;;Add 1 to r4 (count for the column)
		CMP R4, R5				;;loop
		BRNZ Store_Black
	
	RET
		
END