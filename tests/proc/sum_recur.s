#
# Recursive function to calculate sum of numbers from 1 to n
# using tail recursion with accumulator
#
# C code:
# long long int sum(long long int n, long long int acc) {
#     if (n > 0)
#         return sum(n - 1, acc + n);
#     else
#         return acc;
# }
#
# Register mapping for RV64:
# x0      - zero (hardwired to 0)
# x1-x4   - special registers (ra, sp, gp, tp)
# x5-x7   - temporary registers (t0-t2)
# x8-x9   - saved registers (s0/fp, s1)
# x10-x11 - function arguments/return values (a0-a1)
# x12-x17 - function arguments (a2-a7)
# x18-x27 - saved registers (s2-s11)
# x28-x31 - temporary registers (t3-t6)
#
sum:
    # Set up stack (16 bytes)
    addi    sp, sp, -16
    sd      a0, 16(sp)
    sd      a1, 8(sp)
    sd      ra, 0(sp)

    ble     a0, x0, base

    # Recur case
    addi    t0, a0, -1      # n = n - 1
    addi    a1, a1, a0      # acc = acc + n
    addi    a0, t0, x0      # Move n to a0
    jal     ra, sum         # Recursive call
    ld      a0, 16(sp)      # Restore saved registers
    ld      a1, 8(sp)
    ld      ra, 0(sp)
    addi    sp, sp, 16      # Clean up stack

    base:
        addi    a0, a1, x0      # Return acc
        addi    sp, sp, 16      # Clean up stack
        jr      ra              # Return
