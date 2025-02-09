# A: array of 100 doublewords
# h: x21
# A Base: x22
# 
# C expression: A[12] = h + A[8];

ld x9, 64(x22)
add x9, x21, x9
sd x9, 96(x22)