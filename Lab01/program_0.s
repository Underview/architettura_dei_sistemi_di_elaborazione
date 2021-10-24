.data
vector: .word16 5,0x01a1,0x2f,17,0x2fe0,1,0x96a4,0x2f
	.word16 3,0x2f2f,5,0x01a1,0x2f,17,0x2fe0,1
	.word16 0x96a4,0x2f,3,0x2f2f,5,0x01a1,0x2f,17
	.word16 0x2fe0,1,0x96a4,0x2f,3,0x2f2f,5,0x01a1
	.word16 0x2f,17,0x2fe0,1,0x96a4,0x2f,3,0x2f2f
	.word16 5,0x01a1,0x2f,17,0x2fe0,1,0x96a4,0x2f
	.word16	3,0x2f2f,5,0x01a1,0x2f,17,0x2fe0,1
	.word16 0x96a4,0x2f,3,0x2f2f ,5,0x01a1,0x2f,17
	.word16 0x2fe0,1,0x96a4,0x2f,3,0x2f2f,5,0x01a1
	.word16 0x2f,17,0x2fe0,1,0x96a4,0x2f,3,0x2f2f
	.word16 5,0x01a1,0x2f,17,0x2fe0,1,0x96a4,0x2f
	.word16 3,0x2f2f,5,0x01a1,0x2f,17,0x2fe0,1
	.word16 0x96a4,0x2f,3,0x2f2f
val: .byte 0x2f
res: .space 1
.text

start: 
    lbu r9, val(r0)
    
    daddui r2, r0, 0 ;indice
    
    daddi r4, r0, 100 ;contatore
    
    daddi r10,r0, 0;conta

    daddi r5, r0, 0x00ff ; questa è la maschera per la parte destra
    daddi r6, r0, 0xff00 ; questa è la maschera per la parte sinistra

    ;carico 16 bit per volta applico due maschere



    cycle:
    lhu r3, vector(r2)
    ;;;;;;;;;;;;;;;;;;;;;;;;
    and r7,r3,r5
    beq r7,r9, count1
 
    return1:
    ;;;;;;;;;;;;;;;;;;;;;;;
    and r8,r3,r6
    dsrl r8,r8,8
    beq r8,r9,count2
    return2:
    ;;;;;;;;;;;;;;;;;;;;;;;
    daddi r4,r4,-1
    daddui r2,r2,2 ;arriva a 20 mentre dovrebbe fermarsi a 19
    
    bnez r4, cycle ;caricare 16bit usare come se fosse una maschera nelle reti per separe 
    
    j end

    count1:
    daddui r10,r10,1
    j return1

    count2:
    daddui r10,r10,1
    j return2

    end:
    sb r10,res(r0)
    halt


