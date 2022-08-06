##explicar novamente a vizinhaça de 4 e oito, por com 8 ele encontraria 5  e com 4 encontraria 6
%nao pegou o escalonamento
%se eu faço um im2bw numa imagem, ela aceita intensidade != 0 1

close all
clear all

#unique = dá os valores unicos de uma matriz. retorna n linhas de 1 coluna, 
a = [1 2 50; 20 2 4];
unique(a) %1 2 

##6. Transformar a imagem original (im2) em uma imagem binária (imBW), considerando 1-
##branco e 0-preto (não utilizar a função im2bw do Octave);
##funcao im2bw transforma em binario, mas faremos laços

original = imread('C:/Users/developer/Documents/Repositorios/DigitalImageProcessing/UFRN/AulasPDI/aula4/aula4exercicio.jpeg');
figure('Name', 'Original');
imshow(original)

#TRANSFORMANDO A IMAGEM EM BINARIO COM LOOP
originalBW = uint8( zeros(size(original,1), size(original,2)));
for i=1:size(original,1)
  for j=1>size(original,2)
    if original(i,j)>126;
      originalBW(i,j)=1; %imagem BW - black white, é imagem binaria
     else
      originalBW(i,j)=0;
    endif
  endfor
endfor

#TRANSFORMANDO A IMAGEM EM BINARIO COM ATRIBUICAO DIRETA
originalBW(original>126) = 1;
originalBW(original<126) = 0;

figure('Name', 'OriginalBW');
imshow(originalBW)

figure('Name', 'OriginalBW binaria');%mostrando na forma binaria
imshow(originalBW, [0 1]); %colocando um escalonamento de 0-1


#TRANSFORMANDO A IMAGEM EM BINARIO COM FUNCAO
originalBW2 = im2bw(original);
figure('Name', 'OriginalBW binaria 2');%mostrando na forma binaria
imshow(originalBW2); %colocando um escalonamento de 0-1

