.globl factorial

.data
n: .word 3

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:#a0 = n
    addi sp, sp, -4
    sw a1, 0(sp)
    addi a1, x0, 1 #a1 = sum，result in a1
loop:
    mul a1, a1, a0
    addi a0, a0, -1
    bnez a0, loop

    addi a0, a1, 0
    lw a1, 0(sp)
    addi sp, sp, 4
    jr ra
