segm_stiva        SEGMENT
            stiva      DW 128 DUP (?)
segm_stiva        ENDS
 
segm_date        SEGMENT
            sir_date DW        7,23,13, ?
segm_date        ENDS
 
segm_cod         SEGMENT
            ASSUME CS:segm_cod, DS:segm_date, SS:segm_stiva
            et:        MOV AX, segm_date
                        MOV DS, AX
 
                        MOV  SI, offset sir_date
                        MOV     AX, [SI]
                        ADD     AX, [SI+2]
                        SUB     AX, [SI+4]
                        MOV     [SI+6], AX
 
                        MOV AX, 4C00H
                        INT 21H
segm_cod         ENDS
END et