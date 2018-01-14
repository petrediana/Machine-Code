segm_date SEGMENT
    
	factorial DW 3
    
	rezultat DW ?

segm_date ENDS


segm_cod SEGMENT
      ASSUME CS:segm_cod,DS:segm_date
    
    start:
          
	  MOV AX,segm_date
          
          MOV DS,AX
          
	  MOV CX,factorial
          
	  MOV AX,1

    inmultirea:  
          MUL CX
          
	  LOOP inmultirea
	  
          MOV rezultat, AX
          
          MOV AX,4C00H
          
          INT 21H

segm_cod ENDS
         
	END start