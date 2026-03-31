.globl compareAges
compareAges:
    mov 4(%rdi), %ecx
    mov 4(%rsi), %edx
    cmp %edx, %ecx
    je equal
    mov $0, %eax
    ret
equal:
    mov $1, %eax
    ret