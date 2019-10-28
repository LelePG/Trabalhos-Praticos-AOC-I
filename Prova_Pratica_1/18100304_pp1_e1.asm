#Letícia Pegoraro Garcez 18100304
.text
addi $t1, $zero, 16
ori $t2, $zero, 8
div $t1, $t2 #divide o número por 8
mflo $t2
xor $t7, $t1, $t2
slt $t4, $t7, $zero # se o número for menor que zero, é negativo e t4 fica um