.globl sumOfPowers
sumOfPowers:

    mov $0, %eax
    mov $1, %ecx
loop:
    cmp %edi, %ecx
    jg done
    mov %ecx, %edx
    imul %ecx, %edx
    add %edx, %eax
    add $1, %ecx
    jmp loop

done:
    ret
