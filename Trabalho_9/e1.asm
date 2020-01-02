.text 
li $t0, 150 #t0 é x
li $t1, 230 #t1 é y
li $t2, 991 #t2 é z
li $t3, 0 #t3 é r
li $t4, 1 #critério de parada da recursão
#Passagem de arumentos para a função soma3n 
move $a0, $t0
move $a1, $t1
move $a2, $t2
jal soma3n #chamada da função
move $t3, $v0 #coloca o resultado da função no registrador t3
j fim  #finaliza o programa

soma3n: 
#empilha
addiu $sp, $sp, -4
sw $ra, ($sp)
#chamada da função
jal soma
#modifica os argumentos pra segunda chamada da função
move $a0, $v0
move $a1, $a2
#chama a segunda função novamente
li $t5, 0 #contador de chamadas da recursão
jal soma

#desempilha o valor de retorno
lw $ra, ($sp)
addiu $sp, $sp, 4
#volta pra main
jr $ra

#função de soma
soma:#empilha
addiu $sp, $sp, -4
sw $ra, ($sp)
bne $t5,$t4,  empilhar
add $v0, $a0, $a1
addiu $sp, $sp, 4
lw $a0, 0($sp)
add $v0, $v0, $a3
jr $ra
empilhar:  addiu $sp, $sp, -4
sw $a2, 0($sp) #empilha o valor aqui
addi $t5, $t5, 1
jal soma 
addiu $sp, $sp, 4
lw $a0, 0($sp)
jr $ra



fim :nop