data segment
    array1 db 01h, 02h, 03h, 04h, 05h
    array2 db 0ah, 0bh, 0ch, 0dh, 0eh
data ends

code segment 
assume cs:code, ds:data
    start : mov ax, data
            mov ds, ax
            lea si, array1
            lea di, array2
            mov cl, 05h
            lp1:
                mov al, [si]
                mov [di], al
                inc si
                inc di
                dec cl
                jnz lp1
            mov ah, 4ch
            int 21h
            code ends
    end start 