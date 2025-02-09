# Conditional statement that sets f based on comparison of i and j
#
# Register mapping:
# f: x19 - Result stored here
# g: x20 - First operand
# h: x21 - Second operand
# i: x22 - First comparison value
# j: x23 - Second comparison value
#
# C statement:
# if (i == j) {
#     f = g + h;
# } else {
#     f = g - h;
# }

bne x22, x23, Else
add x19, x20, x21
beq x0, x0, Exit # Jump to exit, because we don't want to jump to Else if Condition 1
Else: sub x19, x20, x21
Exit: # N/A
