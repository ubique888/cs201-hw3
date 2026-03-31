.globl sumOfPowers
.globl compareAges
.globl findPaymentsSum
.globl findSalariesSum

# int sumOfPowers(int n)
# Returns 1^2 + 2^2 + ... + n^2
# %edi = n
sumOfPowers:
    mov $0, %eax
    mov $1, %ecx
sumOfPowers_loop:
    cmp %edi, %ecx
    jg sumOfPowers_done
    mov %ecx, %edx
    imul %ecx, %edx
    add %edx, %eax
    add $1, %ecx
    jmp sumOfPowers_loop
sumOfPowers_done:
    ret

# int compareAges(CUSTOMER* a, CUSTOMER* b)
# CUSTOMER: id(0), age(4), payments[5](8)
# Returns 1 if a->age == b->age, 0 otherwise
# %rdi = a, %rsi = b
compareAges:
    mov 4(%rdi), %eax       # a->age
    cmp 4(%rsi), %eax       # compare with b->age
    je compareAges_equal
    mov $0, %eax
    ret
compareAges_equal:
    mov $1, %eax
    ret

# int findPaymentsSum(CUSTOMER* c, int num_of_payments)
# CUSTOMER: id(0), age(4), payments[5](8)
# %rdi = c, %esi = num_of_payments
findPaymentsSum:
    mov $0, %eax            # sum = 0
    mov $0, %ecx            # i = 0
findPaymentsSum_loop:
    cmp %esi, %ecx
    jge findPaymentsSum_done
    movslq %ecx, %rdx
    add 8(%rdi, %rdx, 4), %eax   # sum += c->payments[i]
    add $1, %ecx
    jmp findPaymentsSum_loop
findPaymentsSum_done:
    ret

# int findSalariesSum(EMPLOYEE e[], int size)
# EMPLOYEE: name[8](0), salary(8), total size = 12
# %rdi = e, %esi = size
findSalariesSum:
    mov $0, %eax            # sum = 0
    mov $0, %ecx            # i = 0
findSalariesSum_loop:
    cmp %esi, %ecx
    jge findSalariesSum_done
    # offset = i * 12 + 8 (salary offset)
    movslq %ecx, %rdx
    imul $12, %rdx, %rdx    # rdx = i * 12
    add 8(%rdi, %rdx, 1), %eax   # sum += e[i].salary
    add $1, %ecx
    jmp findSalariesSum_loop
findSalariesSum_done:
    ret
