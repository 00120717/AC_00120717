; EJERCICIO 1

; 00120717 -> digitos a utilizar 1,2,7,1,7
; (1+2+7+1+7)/5 = 3.6  

org 100h
section .calc    
    
    mov ax, 1d
    mov bx, 2d
    add ax, bx
    mov bx, 7d
    add ax, bx
    mov bx, 1d
    add ax, bx
    mov bx, 7d
    add ax, bx
    mov bx, 5d
    div bx

 int 20h

section .text

        mov di, 0d
        mov cx, [len]

bucle:  mov bl, [msg + di]
        mov [di+200h], bl
        inc di
        loop bucle

        int 200h

section .data

msg db "Me recupero"
len equ $-msg


;EJERCICIO 2
;Bayib Nukele

org 100h

mov ax, 2d
mov dl, 2d
mov bx, 0000h
mul dl
mov bx, ax
mov [di+210h], bx
mov ax, 2d

calc:   mul bx
        mov bx, ax
        inc di
        mov [di+210h], bx
        mov ax, 2d

        cmp di, 5d
        je fin
        loop calc
        
fin:    mul bx
        mov bx, ax
        inc di
        mov [di+210h], bx
        inc di
        mov ax, 2d

        loop fin

int 20h


; EJERCICIO 3
; Fibonacci

org 100h

mov ax, 0d
mov [220h], ax ;f0 = 0
mov bx, 1d
mov [221h], bx ;f1 = 1

add bx, ax
mov cx, 0d
mov di, 0d ;Contador

fibo:   mov cx, ax
        add cx, bx
        mov[222h + di], cx
        mov ax, bx
        mov bx, cx
    
        cmp di, 11
        je  fin
        inc di

        cmp di, 16
        jb fibo

fin:    inc di
        mov cx, ax
        add cx, bx
        mov [222h + di], cx
int 20h