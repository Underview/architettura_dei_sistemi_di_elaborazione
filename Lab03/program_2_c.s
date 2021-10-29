.data 

v1: .double 5.5,1.6,8.7,9,5.8,4,9.4,6.9,9.6,7.9
    .double 4.9,7.6,5,2.9,6.7,2.7,8.3,2.3,7.4,2.2
    .double 3.4,9.8,7.3,3.4,1.4,7.6,8.5,8.9,1.2,2.5
    .double 5.2,2.4,4.3,8.1,3.1,5.1,4.2,3,2.3,4.4


v2: .double 5.5,1.6,8.7,9,5.8,4,9.4,6.9,9.6,7.9
    .double 4.9,7.6,5,2.9,6.7,2.7,8.3,2.3,7.4,2.2
    .double 3.4,9.8,7.3,3.4,1.4,7.6,8.5,8.9,1.2,2.5
    .double 5.2,2.4,4.3,8.1,3.1,5.1,4.2,3,2.3,4.4

    
v3: .double 5.5,1.6,8.7,9,5.8,4,9.4,6.9,9.6,7.9
    .double 4.9,7.6,5,2.9,6.7,2.7,8.3,2.3,7.4,2.2
    .double 3.4,9.8,7.3,3.4,1.4,7.6,8.5,8.9,1.2,2.5
    .double 5.2,2.4,4.3,8.1,3.1,5.1,4.2,3,2.3,4.4

v4: .double 5.5,1.6,8.7,9,5.8,4,9.4,6.9,9.6,7.9
    .double 4.9,7.6,5,2.9,6.7,2.7,8.3,2.3,7.4,2.2
    .double 3.4,9.8,7.3,3.4,1.4,7.6,8.5,8.9,1.2,2.5
    .double 5.2,2.4,4.3,8.1,3.1,5.1,4.2,3,2.3,4.4    



v5: .space 320
v6: .space 320
v7: .space 320

DIM: .byte 40
.text

main:
lb r1,DIM(r0)
daddi r2,r0,0
daddi r3,r0,0
daddi r4,r0,0
daddi r5,r0,0
cycle:


;;;;;;;;;;;;;;;;;;;;;;;;;;
daddi r3,r3,8 ; cambia nome
daddi r2,r2,8 ; 
l.d f7,v1(r2); carico v1
l.d f1,v2(r2);carico v2
l.d f2,v3(r2);carico v3
daddi r1,r1,-1
daddi r1,r1,-1
mul.d f11,f5,f10;calcolo prodotto v2*v3
mul.d f3,f1,f2;calcolo prodotto v2*v3
l.d f6,v1(r3); carico v1
l.d f5,v2(r3);carico v2
l.d f10,v3(r3);carico v3
l.d f7,v1(r2); carico v1
l.d f4,v4(r2)
add.d f7,f7,f3;sommo v1 e v2*v3
s.d f7,v5(r2);contiene f5
;;;;;;;;;;;;;;;;;;;;;;;;
mul.d f8,f7,f4
s.d f8,v6(r2)
;;;;;;;;;;;;;;;;;;;;;;;
div.d f9,f8,f1
s.d f9,v7(r2)
;;;;;;;;;;;;;;;;;;;;;;

;f1,f2,f3,f4,f7,f8,f9;
;;;;;;;;;;;;;;;;;;;;;;;;;;

daddi r1,r1,-1
mul.d f11,f5,f10;calcolo prodotto v2*v3
l.d f6,v1(r3); carico v1
l.d f12,v4(r3)
add.d f6,f6,f11;sommo v1 e v2*v3
s.d f6,v5(r3);contiene f5
;;;;;;;;;;;;;;;;;;;;;;;;
mul.d f14,f6,f12
s.d f14,v6(r3)
;;;;;;;;;;;;;;;;;;;;;;;
div.d f13,f14,f5
s.d f13,v7(r3)
;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;
l.d f7,v1(r3); carico v1
l.d f1,v2(r3);carico v2
l.d f2,v3(r3);carico v3
daddi r1,r1,-1
mul.d f3,f1,f2;calcolo prodotto v2*v3
l.d f7,v1(r3); carico v1
l.d f4,v4(r3)
add.d f7,f7,f3;sommo v1 e v2*v3
s.d f7,v5(r3);contiene f5
;;;;;;;;;;;;;;;;;;;;;;;;
mul.d f8,f7,f4
s.d f8,v6(r3)
;;;;;;;;;;;;;;;;;;;;;;;
div.d f9,f8,f1
s.d f9,v7(r3)
;;;;;;;;;;;;;;;;;;;;;;
daddi r4,r4,8 ; cambia nome

;;;;;;;;;;;;;;;;;;;;;;;;;;

l.d f1,v2(r2);carico v2
l.d f2,v3(r2);carico v3
daddi r1,r1,-1
mul.d f3,f1,f2;calcolo prodotto v2*v3
l.d f7,v1(r2); carico v1
l.d f4,v4(r2)
add.d f7,f7,f3;sommo v1 e v2*v3
s.d f7,v5(r2);contiene f5
;;;;;;;;;;;;;;;;;;;;;;;;
mul.d f8,f7,f4
s.d f8,v6(r2)
;;;;;;;;;;;;;;;;;;;;;;;
div.d f9,f8,f1
s.d f9,v7(r2)
;;;;;;;;;;;;;;;;;;;;;;


bnez r1, cycle
daddi r5,r5,8;cambia
halt