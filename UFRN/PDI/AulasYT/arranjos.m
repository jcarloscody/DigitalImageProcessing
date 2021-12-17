%ARRANJOS - vetores e matrizes

[2,3,4,5]

[0:5:50] %cria um vetor de 0 a 50 pulando de 5 em 5 casas

linspace(0,50,10) %cria um vetor de 0 a 50 , com 10 numeros. o algoritmo decide quais numeros colocar

%matrizes
[1,2,4;1,2,4]


%comandos
zeros(3,4)

ones(10,10)

eye(4)


clear

%TRANSPOSICAO E REFERENCIA EM ARRANJOS

v = [ 3 4 5 6 7 8] #linha
v'   %transpoe para coluna

v(3) %5
v(1:3) %3 4 5

v = [ 3 4 5; 2 3 5;  4 6 7] #matriz
v'  %transpoe

v(:,2)  %todas as linhas da coluna 2

v(3,:) %todas as colunas da linha 3

v(1:2, 1:2)


a = [10:-1:4;zeros(1,7);ones(1,7);2:2:14]


%parou na aula 8