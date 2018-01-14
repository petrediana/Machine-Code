segm_stiva        SEGMENT
            stiva      DW 128 DUP (?)
segm_stiva        ENDS

segm_date        SEGMENT
       rez 	DW	?
       vector	DW 4 dup(1,5,2,7)

segm_date        ENDS

segm_cod         SEGMENT

            ASSUME CS:segm_cod, DS:segm_date, SS:segm_stiva

            et:        MOV AX, segm_date
                        MOV DS, AX

                        MOV  	SI, offset vector
                        MOV     CX, LENGTH vector-1
                        MOV     AX, [SI]
	   reia:
			CMP [SI+2], AX
			JL maxbun
			MOV AX, [SI+2]
	   maxbun:
                       	ADD SI, TYPE vector
			LOOP reia
			MOV rez, AX
			
			MOV AX, 4C00H
                        INT 21H

segm_cod         ENDS
END et