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
daddi r3,r0,8
daddi r4,r0,16
daddi r5,r0,24
cycle:



    l.d f1,v2(r2);carico v2
    l.d f2,v3(r2);carico v3
    daddi r1,r1,-1
    mul.d f3,f1,f2;calcolo prodotto v2*v3
    l.d f8,v2(r3);carico v2
    l.d f9,v3(r3);carico v3
    l.d f4,v1(r2); carico v1
    l.d f5,v4(r2)
    daddi r1,r1,-1
    mul.d f10,f8,f9;calcolo prodotto v2*v3
    add.d f4,f4,f3;sommo v1 e v2*v3
    s.d f4,v5(r2);contiene f5
    mul.d f6,f4,f5
    s.d f6,v6(r2)
    div.d f7,f6,f1
    s.d f7,v7(r2)
   
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    l.d f11,v1(r3); carico v1
    l.d f12,v4(r3)
    add.d f11,f11,f10;sommo v1 e v2*v3
    s.d f11,v5(r3);contiene f12
    mul.d f13,f11,f12
    s.d f13,v6(r3)
    div.d f14,f13,f8
    s.d f14,v7(r3)
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    l.d f15,v2(r4);carico v2
    l.d f16,v3(r4);carico v3
    daddi r1,r1,-1
    mul.d f17,f15,f16;calcolo prodotto v2*v3
    l.d f22,v2(r5);carico v2
    l.d f23,v3(r5);carico v3
    daddi r1,r1,-1
    mul.d f24,f22,f23;calcolo prodotto v2*v3
    
    l.d f18,v1(r4); carico v1
    l.d f19,v4(r4)
    add.d f18,f18,f17;sommo v1 e v2*v3
    s.d f18,v5(r4);contiene f19
    mul.d f20,f18,f19
    s.d f20,v6(r4)
    div.d f21,f20,f15
    s.d f21,v7(r4)
 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    l.d f25,v1(r5); carico v1
    l.d f26,v4(r5)
    add.d f25,f25,f24;sommo v1 e v2*v3
    s.d f25,v5(r5);contiene f26
    mul.d f27,f25,f26
    s.d f27,v6(r5)
    div.d f28,f27,f22
    s.d f28,v7(r5)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    daddi r3,r3,8
    daddi r5,r5,8
    daddi r4,r4,8
bnez r1, cycle
    daddi r2,r2,8
   

nop
halt