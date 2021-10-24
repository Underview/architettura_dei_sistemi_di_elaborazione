.data
v: .word 0x7ff0000000000000;
y: .word 0x7ff8000000000000 
.text


lw r5, v(r0)
lw r4, 
mfc1 r4, f5  
dsll r4,r4,1 ;tolgo il bit di segno
and r4,r5,r6
