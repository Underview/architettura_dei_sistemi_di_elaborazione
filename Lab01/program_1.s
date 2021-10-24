.data
a: .byte -6, 0x21, 0x8f, 0xbb, -8, 0x00, 0x01, -11
   .byte -6, 0x21, 0x8f, 0xbb, -8, 0x00, 0x01, -11
   .byte -6, 0x21, 0x8f, 0xbb, -8, 0x00, 0x01, -11
   .byte -6, 0x21, 0x8f, 0xbb, -8, 0x00
b: .byte 0x01, 0x00, -4, -2, 0xab, 0x4c, 0x11, 0x00
   .byte 0x01, 0x00, -4, -2, 0xab, 0x4c, 0x11, 0x00
   .byte 0x01, 0x00, -4, -2, 0xab, 0x4c, 0x11, 0x00
   .byte 0x01, 0x00, -4, -2, 0xab, 0x4c
c: .space 30
thresholdh: .space 1
thresholdl: .space 1
max: .space 1
min: .space 1
.text

main:
daddui r1,r0,30 ;r1 è il contatore
daddui r2,r0,0 ;indice

cycle:
;;;;;;;;;;;;;;;;
lb r3, a(r2)
daddu r4,r0,r3
lb r3, b(r2)
daddu r4,r4,r3
sb r4,c(r2)
;;;;;;;;;;;;;;;;
j comparison
end:
daddui r2,r2,1
daddui r1,r1,-1 
bnez r1, cycle

sb r6,thresholdh(r0)
sb r7,thresholdl(r0)
j exit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
comparison:

slti r5,r4,0x00 ; se è minore incrementa low
bnez r5, low
daddi r6,r6,1 ; r6 è per i high

j end

low:
daddi r7,r7,1 ;r7 è per i low
j end
;;;;;;;;;;;;;;;;;max and min ;;;;;;;;;;;;;;;;;;;;;;;;;
exit:
daddui r1,r0,29 ;r1 è il contatore
daddui r2,r0,0 ;indice


lb r7, c(r2) ; r7 ho caricato il max
dadd r8,r0,r7 ; r8 ho caricato il min
daddi r2,r2,1

loop:
lb r4,c(r2)

slt r5,r4,r8 ;

movn r8,r4,r5 ; 



movz r7,r4,r5 


daddi r2,r2,1
daddui r1,r1,-1 
bnez r1, loop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sb r8, min(r0)
sb r7, max(r0)


halt


