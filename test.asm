data segment
	array_num dw 1200h,1435h,1223h,1334h,1297h,1524h
	len equ 6
	
data ends

code segment
	assume ds:data,cs:code
	  start:
	    mov ax,data
	    mov ds,ax
	    mov cx,len-2
	  l1:
	    lea si,array_num
	    mov bx,0
	  l2:
	    inc bx
	    mov ax,array_num[si]
	    inc si
	    inc si
	    cmp ax,array_num[si]
	    jb l3
	    xchg ax,array_num[si]
	    mov array_num[si-2],ax
	    
	  l3: 
	    cmp bx,cx
	    jl l2
	    loop l1
	    mov ah,4ch
	    int 21h
	    code ends
	    end start
