
data segment
	cifra	dw	5
	n10	dw	10
	rez	dw	?
data ends

code segment

	assume cs:code,ds:data

afisare proc
	mov	dx,0
	div	n10
	cmp	ax,0
	jz	gata
	push	dx
	call	afisare
	pop	dx
gata:
	mov	al,dl
	add	al,'0'
	mov	ah,14
	int	10h
	ret
afisare endp


start:
	mov	ax,data
	mov	ds,ax

	mov	cx,10
        mov     ax,cifra
ciclu:
        add     ax,cifra
        loop ciclu
	mov 	rez,ax

        call  afisare

	mov	ax,4c00h
	int	21h
code ends
	end	start
