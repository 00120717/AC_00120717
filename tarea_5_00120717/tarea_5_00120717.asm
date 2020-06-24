org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di
    
    ;1
    mov	si, 106d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	mov     [0200h],byte 170d
    call 	linea_v
    ;2
	mov 	si, 106d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
    mov     [0202h],byte 230d
	call 	linea_h
    ;3
    mov 	si, 106d ; X -> Columna
	mov 	di, 170d ; Y -> Fila
    mov     [0202h],byte 230d
	call 	linea_h
    ;4
    mov	    si, 230d ; X -> Columna
	mov 	di, 112d ; Y -> Fila
	mov     [0200h],byte 171d
    call 	linea_v
    ;5
    mov 	si, 173d ; X -> Columna
	mov 	di, 112d ; Y -> Fila
    mov     [0202h],byte 230d
	call 	linea_h
    ;6
    mov	    si, 173d ; X -> Columna
	mov 	di, 112d ; Y -> Fila
	mov     [0200h],byte 130d
    call 	linea_v
    ;7
    mov 	si, 173d ; X -> Columna
	mov 	di, 130d ; Y -> Fila
    mov     [0202h],byte 210d
	call 	linea_h
    ;8
    mov	    si, 210d ; X -> Columna
	mov 	di, 130d ; Y -> Fila
	mov     [0200h],byte 151d
    call 	linea_v
    ;9
    mov 	si, 127d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
    mov     [0202h],byte 210d
	call 	linea_h
    ;10
    mov	    si, 127d ; X -> Columna
	mov 	di, 68d ; Y -> Fila
	mov     [0200h],byte 150d
    call 	linea_v
    ;11
    mov 	si, 127d ; X -> Columna
	mov 	di, 68d ; Y -> Fila
    mov     [0202h],byte 230d
	call 	linea_h
    ;12
    mov	    si, 230d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	mov     [0200h],byte 69d
    call 	linea_v

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
        mov	al, 13h
        int 	10h
        ret

pixel:	mov	ah, 0Ch
        mov	al, 1010b
        int 	10h
        ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
        add 	cx, si
        mov	    dx, di ; Fila
        call 	pixel
        inc 	si
        cmp 	si, [0202h]
        jne 	lupi_h
        ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
        mov	dx, 0d ; Fila
        add 	dx, di
        call 	pixel
        inc 	di
        cmp 	di, [0200h]
        jne 	lupi_v
        ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data