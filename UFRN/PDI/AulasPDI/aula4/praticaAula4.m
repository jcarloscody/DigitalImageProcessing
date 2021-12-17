
pkg load image

clear all
close all

original = imread('C:\Users\developer\Documents\JosueCarlosDrive\UFRN\PDI\AulasPDI\aula4\aula4exerciciograos.jpeg');
figure('Name', 'Original');
imshow(original)


tonsdecinza = rgb2gray(original);  #converte para tons de cinza. qual camada ele pega?
figure('Name', 'Tons de Cinza');
imshow(tonsdecinza)


figure('Name', 'histograma de tons de cinza');  %o histograma é importante para descobrir o liame, ou seja, 
%{
o ponto de corte do histograma, o numero que vc escolhe que dali para baixo vc entende que é uma regiao e 
outra outra regiao. essa forma de determinar o limiar é muito simples, é mais eficiente usar o algoritmo
CRTL + R
CRTL SHIT T
%}

imhist(tonsdecinza)


#algoritmo de limiarização por atribuição direta
tonsdecinzaLimiar = uint8(zeros(size(tonsdecinza,1), size(tonsdecinza,2))); %cria  uma imagem zerada. com o mesmo tamanho 
tonsdecinzaLimiar(:,:) = 255;
limiar = 60; %este será o valor fixo limiar para cortar o histograma
tonsdecinzaLimiar(tonsdecinza>limiar) = 0;  %para fazer isto as matrizes devem ter as mesmas linhas/colunas e canais
figure('Name', 'Nova imagem tons de cinza com limiar com atribuicao direta');
imshow(tonsdecinzaLimiar)


tic  #tic toc serve para testes, caso vc queira medir o tempo de execucao
#COM LOOP
for(i=1:size(tonsdecinza,1))
  for(j=1:size(tonsdecinza,2))
    if(tonsdecinza(i,j)>limiar)
      tonsdecinzaLimiarLoop(i,j)=0;
     else
       tonsdecinzaLimiarLoop(i,j)=255;
     endifs
   endfor
endfors

figure('Name', 'Nova imagem tons de cinza com limiar com loop');
imshow(tonsdecinzaLimiarLoop)
toc



#loop - colocando fundo branco na original LOOP
originalFundoBrancoLoop = uint8(zeros(size(tonsdecinzaLimiar,1), size(tonsdecinzaLimiar,2),3)); 

for i = 1:size(tonsdecinzaLimiar, 1)
  for j = 1:size(tonsdecinzaLimiar,2)
      if tonsdecinzaLimiar(i,j)==0
        originalFundoBranco(i,j,:) = original(i,j,:);
       else
        originalFundoBranco(i,j,:) = 255;
       endif
  endfor
endfor
figure('Name', 'original fundo branco LOOP');
imshow(originalFundoBrancoLoop)


#atribuição direta 1 RACIONCINIO
originalR = original(:,:,1);
originalG = original(:,:,2);
originalB = original(:,:,3);
originalR(tonsdecinzaLimiar==255) = 255;
originalG(tonsdecinzaLimiar==255) = 255;
originalB(tonsdecinzaLimiar==255) = 255;
originalFundoBrancoDireta (:,:,1) = originalR(:,:);
originalFundoBrancoDireta (:,:,2) = originalG(:,:);
originalFundoBrancoDireta (:,:,3) = originalB(:,:);

#2
originalFundoBrancoDiretaR = uint8(zeros(size(tonsdecinzaLimiar,1), size(tonsdecinzaLimiar,2))); 
originalFundoBrancoDiretaG = uint8(zeros(size(tonsdecinzaLimiar,1), size(tonsdecinzaLimiar,2))); 
originalFundoBrancoDiretaB = uint8(zeros(size(tonsdecinzaLimiar,1), size(tonsdecinzaLimiar,2))); 
originalFundoBrancoDiretaR(:,:) = originalFundoBrancoDiretaG(:,:) = originalFundoBrancoDiretaB(:,:) = 255;
originalR = original(:,:,1);
originalG = original(:,:,2);
originalB = original(:,:,3);
originalFundoBrancoDiretaR(tonsdecinzaLimiar==0) = originalR(tonsdecinzaLimiar==0);
originalFundoBrancoDiretaG(tonsdecinzaLimiar==0) = originalG(tonsdecinzaLimiar==0);
originalFundoBrancoDiretaB(tonsdecinzaLimiar==0) = originalB(tonsdecinzaLimiar==0);


originalFundoBrancoDireta (:,:,1) = originalFundoBrancoDiretaR(:,:);
originalFundoBrancoDireta (:,:,2) = originalFundoBrancoDiretaG(:,:);
originalFundoBrancoDireta (:,:,3) = originalFundoBrancoDiretaB(:,:);
figure('Name', 'original fundo branco ATRIBUICAO DIRETA');
imshow(originalFundoBrancoDireta)

