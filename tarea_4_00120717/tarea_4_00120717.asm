; 00120717 -> digitos a utilizar 1,2,7,1,7
; (1+2+7+1+7)/5 = 3.6  
	org 	100h
section .text

	call 	texto	
	xor		bx,	bx
	call 	cursor
	call 	phrase

	call	kb
	add		al,	bl
	mov		bl,	al
	
	call 	kb
	add		al, bl
	mov		bl,	al
	
	call 	kb
	add		al, bl
	mov		bl,	al
	
	call 	kb
	add		al, bl
	mov		bl,	al

	call 	kb
	add		al, bl
	mov		bl,	al
	mov		bx, ax
	mov 	bl, 5d
	div 	bl
	mov		[300h],al

mostrar:call 	w_strng
        call 	kb
        int 	20h

;modo texto
texto:	mov 	ah, 00h
		mov		al, 03h
		int 	10h
		ret

w_strng:mov		ah, 13h
        mov 	al, 01h 
        mov 	bh, 00h 
        mov		bl, 00100000b ;00101110b
        mov		cx, len1
        mov		dl, 30h ; columna 
        mov		dh, 15h	; fila 
        push 	cs 
        pop	es 
        mov	bp, msg1 
        int 10h
        ret

kb:	mov	ah, 1h
	int 	21h
	ret

;mensaje inicio

cursor: mov		ah, 01h
		mov 	ch, 00000000b
		mov 	cl, 00001110b
		int 	10h
		ret

w_char:	mov 	ah, 09h
		mov 	al, cl
		mov 	bh, 00h
		mov 	bl, 00000111b
		mov 	cx, 1h
		int 	10h
		ret

kbwait: mov 	ax, 0000h
		int 	16h
		ret

m_cursr:mov 	ah, 02h
		mov 	dx, di  ; columna
		mov 	dh, 1d ; fila
		mov 	bh, 0h
		int 	10h
		ret

phrase:	mov 	di, 1d
lupi:	mov 	cl, [msg+di-1d]
		call    m_cursr
		call 	w_char
		inc	di
		cmp 	di, len
		jb	lupi
		ret

section .data
msg	db 	"Ingrese notas: "
len 	equ	$-msg+1d
msg1	db 	"En el segundo "
len1 	equ	$-msg1+1d