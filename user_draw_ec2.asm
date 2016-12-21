;;This program will combine TRAP_DRAW_BOX and GETC
;;I drew the same box as the last extra credit

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

GET_COMMAND 					;;calls TRAP_GETC to get a value from the keyboard

	TRAP x00					;;Call TRAP_GETC
	
	CONST R1, x6A
	CONST R2, x6B
	CONST R3, x69
	CONST R4, x6D
	
	CMP R5, R1
	BRZ Move_LEFT
	
	CMP R5, R2
	BRZ MOVE_RIGHT
	
	CMP R5, R3
	BRZ MOVE_UP
	
	CMP R5, R4
	BRZ MOVE_DOWN
	
	BRNZP END
	

Move_LEFT
	DATA_Black_Box1
		CONST R0, x00
		CONST R1, x00
		CONST R2, x00
		CONST R4, x00
		CONST R3, x00
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x00				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_BLACK_BOX1					;;Set values for box 1 all other registers 0
		CONST R0, #30				;;sets the values for x, y, length, and Data mem start address
		CONST R1, #50
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX
	
	DATA_RED_Box1
		CONST R3, x00
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x7C				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		CONST R1, x00				;;R1 = 0 for the row count
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_LEFT_BOX					;;Set values for box 1 all other registers 0
		CONST R0, #29					;;sets the values for x, y, length, and Data mem start address
		CONST R1, #50
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX
	
	
		BRNZP END

MOVE_RIGHT
	DATA_Black_Box2
		CONST R0, x00
		CONST R1, x00
		CONST R2, x00
		CONST R4, x00
		CONST R3, x000
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x00				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_BLACK_BOX2					;;Set values for box 1 all other registers 0
		CONST R0, #30				;;sets the values for x, y, length, and Data mem start address
		CONST R1, #50
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX

	DATA_RED_Box2
		CONST R3, x00
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x7C				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		CONST R1, x00				;;R1 = 0 for the row count
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_RIGHT_BOX					;;Set values for box 1 all other registers 0
		CONST R0, #31					;;sets the values for x, y, length, and Data mem start address
		CONST R1, #50
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX
	
		BRNZP END
		

MOVE_UP

	DATA_Black_Box3
		CONST R0, x00
		CONST R1, x00
		CONST R2, x00
		CONST R4, x00
		CONST R3, x00
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x00				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_BLACK_BOX3					;;Set values for box 1 all other registers 0
		CONST R0, #30				;;sets the values for x, y, length, and Data mem start address
		CONST R1, #50
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX

	DATA_RED_Box3
		CONST R3, x00
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x7C				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		CONST R1, x00				;;R1 = 0 for the row count
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_UP_BOX					;;Set values for box 1 all other registers 0
		CONST R0, #30					;;sets the values for x, y, length, and Data mem start address
		CONST R1, #49
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX
		
		BRNZP END


MOVE_DOWN
	DATA_Black_Box4
		CONST R0, x00
		CONST R1, x00
		CONST R2, x00
		CONST R4, x00
		CONST R3, x00
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x00				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_BLACK_BOX4				;;Set values for box 1 all other registers 0
		CONST R0, #30				;;sets the values for x, y, length, and Data mem start address
		CONST R1, #50
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX

	DATA_RED_Box4
		CONST R3 x00
		HICONST R3, x40				;;R3 = x4000 start data mem address for color box 1
		CONST R6, x00				;;
		HICONST R6, x7C				;;R6 = x7C00 (red) using R6 to store the value
		CONST R5, #50				;;R5 = 50 using R5 to store the length of the box
		CONST R1, x00				;;R1 = 0 for the row count
	
		JSR CREATE_PIXEL_COLORS		;;Jump to fill data mem sub-routine
									;;The same sub routine used in user_draw
	
	CREATE_DOWN_BOX					;;Set values for box 1 all other registers 0
		CONST R0, #30					;;sets the values for x, y, length, and Data mem start address
		CONST R1, #51
		CONST R2, #50
		CONST R3, x00
		HICONST R3, x40
		CONST R4, x00
		CONST R5, x00
		CONST R6, x00
		TRAP x0A					;;calls TRAP_DRAW_BOX
		
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