.data 
Raio: .word 5
Altura: .word 5
Volume: .space 4


.text
ori $t1, $zero, 1 #0 para cone, 1 para espera
lui $t3, 0x1001#t3 é o base
beq $t1, $zero, cone #se ft1 for diferente de zero, faz o cone

#senão faz o cálculo da esfera
esfera:
ori $t5, $zero, 4#esfera
j comum
#como (314*r²*t5)/300 é comum, faço só uma vez lá em baixo
cone:
lw $t5, 4($t3)#cone

comum: lw $t4,0($t3) #t4 e t6 os auxiliares
mult $t4, $t4
mflo $t4 #t4 tem raio²
mult $t4, $t5 # (h ou 4) * R²
mflo $t4
ori $t5, $zero, 314
mult $t4, $t5
mflo $t4 #314 * (h ou 4) * R²
ori $t5, $zero, 300
div $t4, $t5 #divide (314 * (h ou 4) * R²) por 300
mflo $t4
sw $t4, 8($t3) #guarda o resultado na memória
