#
# A: array of 100 doublewords
# h: x21
# A Base: x10
# 
# C expression: A[30] = h + A[30] + 1;
#

# Load A[30] into x9
ld x9, 240(x10)      # offset=240 (30*8)

# Add h (x21) and A[30] (x9)
add x9, x21, x9      

# Add 1 to result
addi x9, x9, 1       

# Store result back to A[30]
sd x9, 240(x10)      # offset=240 (30*8)

# Binary instruction formats:
# -----------------------------------------------
# ld x9, 240(x10):
#   imm[11:0]     rs1   f3  rd    opcode
#   1111 0000     01010 011 01001 0000011
#   (240)         (x10) (3) (x9)  (0x03)

# add x9, x21, x9:
#   f7      rs2   rs1   f3  rd    opcode
#   0000000 10101 01001 000 01001 0110011
#   (0)     (x21) (x9)  (0) (x9)  (0x33)

# addi x9, x9, 1:
#   imm[11:0]     rs1   f3  rd    opcode
#   0000 0001     01001 000 01001 0010011
#   (1)           (x9)  (0) (x9)  (0x13)

# sd x9, 240(x10):
#   imm[11:5] rs2   rs1   f3  imm[4:0] opcode
#   0000111   01001 01010 011 10000    0100011
#   (7)       (x9)  (x10) (3) (16)     (0x23)

# Final binary encoding:
# 1111000001010011010010000011     # ld x9, 240(x10)
# 00000001010101001000010010110011 # add x9, x21, x9
# 00000001010010000010010010011    # addi x9, x9, 1
# 00001110100101010011100000100011 # sd x9, 240(x10)
