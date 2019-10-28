.data 
.word 1
.word 2
.word 3
.word 4
.word 5
.word 6
.word 7
.word 8
.word 9
.word 10
.word 5
.word 12 #medias de chuva
.word 6 #6 é a média para os valores colocados acima
.space 32 #espaço para guardar o resultado

.text
lui $t1, 0x1001
ori $t2, $zero, 12 
ori $t3, $zero, 0 #acumulador
lw $t4, 48($t1)#guarda a média
loop: beq $t2, $zero, fim
lw $t5, 0($t1)#Lê o valor do vetor
slt $t6, $t5, $t4 #se o valor do vetor é menor que o valor da média...
addi $t1, $t1, 4 #incrementa o contador do vetor
addi $t2, $t2, -1 #decrementa t2
bne $t6, $zero, acumula
j loop
acumula:
add $t3, $t3, $t5
j loop

fim:
sw $t3, 8($t1)# porque t1 está descolado para a última posição de memória com dado antes do espaço, então passa a word da média e salva
