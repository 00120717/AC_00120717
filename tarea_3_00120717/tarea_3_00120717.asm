org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
    call    phrase2
    call    phrase3
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
        mov	    al, 03h
        int 	10h
        ret

cursor: mov	    ah, 01h
        mov 	ch, 00000000b
        mov 	cl, 00001110b
            ;   IRGB
        int 	10h
        ret

w_char:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, 00001111b
        mov 	cx, 1h
        int 	10h
        ret

kbwait: mov 	ax, 0000h
        int 	16h
        ret

;para frase 1
m_cursr:mov 	ah, 02h
        mov 	dx, di  ; columna
        mov 	dh, 05d ; fila
        mov 	bh, 0h
        int 	10h
        ret

phrase:	mov 	di, 01d
lupi:	mov 	cl, [msg+di-01d]
        call    m_cursr
        call 	w_char
        inc	    di
        cmp 	di, len
        jb	    lupi
        ret

;para frase 2
m_cursr2:mov 	ah, 02h
        mov 	dx, di  ; columna
        mov 	dh, 15d ; fila
        mov 	bh, 0h
        int 	10h
        ret

phrase2:	mov 	di, 29d
lupi2:  	mov 	cl, [msg2+di-29d]
            call    m_cursr2
            call 	w_char
            inc	    di
            cmp 	di, len2
            jb	    lupi2
            ret
;para frase 3
m_cursr3:mov 	ah, 02h
        mov 	dx, di  ; columna
        mov 	dh, 24d ; fila
        mov 	bh, 0h
        int 	10h
        ret

phrase3:	mov 	di, 09d
lupi3:  	mov 	cl, [msg3+di-09d]
            call    m_cursr3
            call 	w_char
            inc	    di
            cmp 	di, len3
            jb	    lupi3
            ret

section .data
msg	db 	"pero que pasa chavalesss "
len 	equ	$-msg+01d

msg2	db 	"todo bien, todo correcto? "
len2 	equ	$-msg2+29d

msg3	db 	"y yo q me alegro "
len3 	equ	$-msg3+09d