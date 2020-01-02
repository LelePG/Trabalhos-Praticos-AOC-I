.text 
li $t0, 4 #valor que eu quero calcular o fatorial
#armazenar o resultado final em t1
move $a0, $t0 #argumento pra subrotina
jal fatorial
move $t1, $v0 #v0 é o retorno da minha função jal
nop


fatorial:
#empilha
addiu $sp, $sp, -4
sw $ra, ($sp)
retorna: #desempilha e retorna a subrotina
addi $a1, $a0,-1 #coloca no segundo parâmetro n-1
jal fatorial#agora faço o fatorial de n-1
lw $ra, ($sp)
addiu $sp, $sp, 4
jr $ra
base: li $v0, 1# o valor de v0 é um, e ai posso retornar pra minha função
j retorna
