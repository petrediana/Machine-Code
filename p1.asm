segm_stiva        SEGMENT
            stiva      DB 128 DUP (?)
segm_stiva        ENDS
 
segm_date        SEGMENT
            sir_date DB        7,23,13, ?
segm_date        ENDS
 
segm_cod         SEGMENT
            ASSUME CS:segm_cod, DS:segm_date, SS:segm_stiva
            et:        MOV AX, segm_date
                        MOV DS, AX
 
                        MOV  SI, offset sir_date
                        MOV     AL, [SI]
                        ADD     AL, [SI+1]
                        SUB     AL, [SI+2]
                        MOV     [SI+3], AL
 
                        MOV AX, 4C00H
                        INT 21H
segm_cod         ENDS
END et