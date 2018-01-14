segm_stiva        SEGMENT
            stiva      DB 128 DUP (?)
segm_stiva        ENDS

segm_date        SEGMENT
       rez 	DB	?
       vector	DB 4 dup(1,5,2,7)

segm_date        ENDS

segm_cod         SEGMENT
            ASSUME CS:segm_cod, DS:segm_date, SS:segm_stiva
            et:        MOV AX, segm_date
                        MOV DS, AX

                        MOV  	SI, offset vector
                        MOV     CX, LENGTH vector
                        MOV     AL, 0
	   reia:
			ADD AL, BYTE PTR [SI]
			ADD SI, TYPE vector
			LOOP reia
			MOV rez, AL

                        MOV AX, 4C00H
                        INT 21H

segm_cod         ENDS
END et