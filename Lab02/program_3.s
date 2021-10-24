
; è giusto, bisogna solo finire la parte del nan
.data
b: .double 0xab
i:  
    .double -5, 32.3, 42.3, -17, 42.65, -1, 56.45, 6.54, -3, 045.45, -5, 4.34
    .double 0.34, 1.7, -34.3, -1, 0.54, -34, 3, -65, -5, 454.3, 43.5, -1.7
    .double 5.4, 1, 9.6, 56.56, 3, 7.56
w:  
    .double -5, 32.3, 42.3, -17, 42.65, -1, 56.45, 6.54, -3, 045.45, -5, 4.34
    .double 0.34, 1.7, -34.3, -1, 0.54, -34, 3, -65, -5, 454.3, 43.5, -1.7
    .double 5.4, 1, 9.6, 56.56, 3, 7.56
K: .byte 30
y: .space 8
c: .word 0x7ff0000000000000
.text

main:


lbu r1,K(r0)
daddi r2,r0,0
mtc1 r0,f5
l.d f3,b(r0)

cycle:
beqz r1,end

l.d f1,i(r2)
l.d f2,w(r2) 
mul.d f4,f1,f2
add.d f5,f5,f4
daddi r2,r2,8
daddi r1,r1,-1
j cycle
end:
add.d f5,f5,f3
;verifica del NaN

lw r5, c(r0)
mfc1 r4, f5; sposto su registro intero in modo da usare end  
dsll r4,r4,1 ;tolgo il bit di segno
and r4,r5,r6
beq r6,r5, nan
l.d f5, y(r0)
j finish
nan:
mtc1 r0,f5
l.d f5, y(r0)

finish:
halt