# Recursive factorial function that computes n!
#
# C function:
# long long int factorial(long long int n) {
#     if (n < 1) {
#         return 1;
#     } else {
#         return n * fact(n - 1);
#     }
# }
#
# Register mapping:
#   n: x10/a0 - Input parameter n
#   x6: Temporary register to store recursive result
#   x9: Temporary register for comparison

factorial:
    # Allocate stack space and save registers
    addi sp, sp, -16        # Make room for 2 8-byte values
    sd   a0, 8(sp)         # Save input parameter n
    sd   ra, 0(sp)         # Save return address

    # Check if n < 1
    addi x9, a0, -1        # x9 = n - 1
    bge  x9, x0, rec       # If n-1 >= 0, goto recursive case

    # Base case (n < 1)
    li   a0, 1             # Return 1
    addi sp, sp, 16        # Restore stack pointer
    jr   ra                # Return

rec:
    # Recursive case
    addi a0, a0, -1        # Calculate n-1
    jal  ra, factorial     # Call factorial(n-1)
    addi x6, a0, 0         # Save factorial(n-1) result
    ld   a0, 8(sp)         # Restore original n
    ld   ra, 0(sp)         # Restore return address
    addi sp, sp, 16        # Restore stack pointer
    mul  a0, a0, x6        # Calculate n * factorial(n-1)
    jr   ra                # Return
