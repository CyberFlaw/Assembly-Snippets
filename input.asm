data segment
    num1 db "Enter 1st number: $"
    num2 db "Enter 2nd number: $"
    result db "Result = $" 
end

code segment
    assume cs:code, ds:data
    start:
        mov ax, @data 
        mov ds, ax

        lea dx, a
        mov ah, 09h
        int 21h

    end start
