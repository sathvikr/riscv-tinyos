#
# Function to copy a string from source to destination
# 
# C code:
# void strcpy(char x[], char y[]) {
#     size_t i;
#     i = 0;
#     while ((x[i] = y[i]) != '\0') /* copy & test byte */
#         i += 1;
# }
#
# Register mapping for RV64:
# a0 - char x[] (destination)
# a1 - char y[] (source)
# t0 - size_t i
#

strcpy:
    li t0, 0

    Loop: slli t1, t0, 3 # t1 = i * 8
    add t2, a0, t1 # t2 = addr(x) + t1
    ld t2, 0(t2)
    add t3, a1, t1 # t3 = addr(y) + t1
    ld t3, 0(t3)







