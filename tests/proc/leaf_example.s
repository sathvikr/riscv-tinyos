# Leaf function that performs arithmetic on 4 parameters
#
# C function:
# long long int leaf_example(long long int g, long long int h,
#                           long long int i, long long int j) {
#     long long int f;
#     f = (g + h) - (i + j);
#     return f;
# }
#
# Register mapping:
#   g: x10 - First parameter
#   h: x11 - Second parameter 
#   i: x12 - Third parameter
#   j: x13 - Fourth parameter
#   f: x20 - Result stored here (internal reg)

leaf_example:
    addi sp, sp, -8
    sd x20 0(sp) # There might have been something in x20 (internal reg) before leaf_example(...) is called
                 # Save it in memory before executing the subroutine

    add x20, x10, x11
    sub x20, x20, x12
    sub x10, x20, x13 # Copy (f - j) into parameter g to return

    ld x20 0(sp) # Before returning, restore reg x20
    addi sp, sp, 8

    jalr x0, 0(x1)
