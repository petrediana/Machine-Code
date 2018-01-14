segm_date SEGMENT
    fact DW 3
    rez DW ?
segm_date ENDS

segm_cod SEGMENT
      ASSUME CS:segm_cod,DS:segm_date
    start:
          MOV AX,segm_date
          MOV DS,AX
          MOV CX,fact
          MOV AX,1
    iar:  
          MUL CX
          LOOP iar
	  MOV rez, AX
          MOV AX,4C00H
          INT 21H
segm_cod ENDS
         END start