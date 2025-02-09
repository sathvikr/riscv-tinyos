#
# Iterates through array 'save' until finding an element not equal to k
#
# Register mapping:
# i: x22     - Array index
# k: x24     - Comparison value 
# save: x25  - Base address of array save
#
# C code:
# while (save[i] == k) {
#     i += 1;
# }
#

Loop: slli x9, x22, 3      # x9 = i * 8 (offset for doublewords)
add x9, x9, x25      # x9 = save + (i * 8)
ld x9, 0(x9)         # x9 = save[i]

# Exit loop if save[i] != k
bne x9, x24, Exit    

# Increment index and continue
addi x22, x22, 1     # i++
beq x0, x0, Loop     # Unconditional branch to loop start

Exit:
