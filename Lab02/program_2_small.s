;con valori piccoli viene corretto

.data 

v1: .double 1.0,2.0,3.0

v2: .double 1.0,2.0,3.0
 

    
v3: .double 1.0,2.0,3.0


v4: .double 1.0,2.0,3.0




v5: .space 320
v6: .space 320
v7: .space 320


DIM: .byte 40
.text

main:
;https://www.binaryconvert.com/result_double.html?decimal=050
lb r1,DIM(r0)
daddi r2,r0,0

cycle:
;;;;;;;;;;;;;;;;;;;;;;;;;;
l.d f1,v1(r2); carico v1
mov.d f7,f1
l.d f1,v2(r2);carico v2
l.d f2,v3(r2);carico v3
mul.d f3,f1,f2;calcolo prodotto v2*v3
add.d f7,f7,f3;sommo v1 e v2*v3
s.d f7,v5(r2);contiene f5
;;;;;;;;;;;;;;;;;;;;;;;;
l.d f4,v4(r2)
mul.d f7,f7,f4
s.d f7,v6(r2)
;;;;;;;;;;;;;;;;;;;;;;;
div.d f7,f7,f1
s.d f7,v7(r2)
;;;;;;;;;;;;;;;;;;;;;;
daddi r2,r2,8
daddi r1,r1,-1
bnez r1, cycle
halt