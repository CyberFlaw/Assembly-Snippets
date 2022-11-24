.model small
.stack 100h

data segment

msg db 10,13,"Enter the number :$"
result db 10,13,"Result : $"
rem db 10,13,"Reminder : $"
write macro
mov dl,al
add dl,30h
mov ah,02h
int 21h
endm

reads macro
mov ah,01h
int 21h
sub al,30h
mov ah,00h
endm

data ends

code segment
assume cs:code,ds:data

start:


mov ax,data
mov ds,ax

lea dx,msg
mov ah,09h
int 21h

call read
push ax

lea dx,msg
mov ah,09h
int 21h

call read
push ax

lea dx,result
mov ah,09h
int 21h


pop bx
pop ax

xor dx,dx

div bx    ;divide
xor si,si

mov si,dx ; reminder


call print_digit

lea dx,rem   ; print reminder
mov ah,09h
int 21h

mov ax,si   ;

call print_digit





mov ah,4ch
int 21h


read  proc

xor cx,cx
mov cl,03h

reads

tops:
mov bx,000ah

mul bx

mov bx,ax

reads
add ax,bx
dec cl
jnz tops

ret
read endp
print_digit proc

mov bx,000ah
xor cx,cx
l2:
mov dx,0000h
div bx
push dx
inc cx
cmp ax,bx
jge l2
write

l3:
pop ax
write
loop l3

ret
print_digit endp

code ends
end start
