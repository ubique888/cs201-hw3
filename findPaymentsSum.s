.global findPaymentsSum
findPaymentsSum:
    mov $0, %eax
    mov $0, %ecx

loop:
    cmp %esi, %ecx
    jge done

    mov 8(%rdi, %rcx,4), %edx
    add %edx, %eax
    add $1, %ecx
    jmp loop

done：
    ret