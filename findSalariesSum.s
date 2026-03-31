.global findSalariesSum
findSalariesSum:
    mov $0, %eax
    mov $0, %ecx
loop:
    cmp %esi, %ecx
    jge done
lea (%rcx, %rcx, 2), %r8
mov 8(%rdi, %r8, 4), %edx

add %edx, %eax
add $1, %ecx

jmp loop

done:
    ret
