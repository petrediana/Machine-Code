segm_stiva        SEGMENT

            stiva      DW 128 DUP (?)

segm_stiva        ENDS

 

segm_date        SEGMENT

            a DW 7
            b DW 23
            c DW 13
          rez DW ?

segm_date        ENDS

 

segm_cod         SEGMENT

            ASSUME CS:segm_cod, DS:segm_date, SS:segm_stiva

            et:        MOV AX, segm_date

                        MOV 	DS, AX

                        MOV     AX, a

                        ADD     AX, b

                        SUB     AX, c

                        MOV     rez, AX
 

                        MOV AX, 4C00H

                        INT 21H

segm_cod         ENDS

END et