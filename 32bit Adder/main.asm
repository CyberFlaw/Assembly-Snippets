data segment
    num1 dd 12345678h
    num2 dd 9abcdef0h
    carry dw ?
data ends

code segment
assume cs:code, ds:data
    start : mov ax, data
            mov ds, ax
            mov dl, 00h
            mov ax, word ptr [ds:num1]
            mov bx, word ptr [ds:num2]
            add ax, bx
            mov word ptr [ds:carry], ax
            mov ax, word ptr [ds:num1+2] 
            mov bx, word ptr [ds:num2+2]

            adc ax, bx
            mov word ptr [ds:carry+2], ax
            mov ax, word ptr [ds:num1+2]
            mov bx, word ptr [ds:num2+2]

            adc ax, bx
            mov word ptr [ds:carry+2], ax
            jnc move
            inc dl

            move : mov byte ptr [ds:carry+4], dl
            int 3
            code ends
    end start


