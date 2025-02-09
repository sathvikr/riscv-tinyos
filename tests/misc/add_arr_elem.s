# A: array of 100 doublewords
# g, h: x20, x21
# A Base: x22
# 
# C expression: g = h + A[8];

ld x9, 64(x22)
add x20, x21, x9