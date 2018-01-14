segm_date SEGMENT
    text DB 'ABCDEFGHIJ'
    ltext EQU $-text
segm_date ENDS

segm_cod SEGMENT
      ASSUME CS:segm_cod,DS:segm_date
    start:
          MOV AX,segm_date
          MOV DS,AX
          MOV CX,ltext
          MOV BX,OFFSET text
    iar:  
          MOV DL,[BX]
          INC BX
          MOV AH,2
          INT 21H
          LOOP iar
          MOV AX,4C00H
          INT 21H
segm_cod ENDS
         END start