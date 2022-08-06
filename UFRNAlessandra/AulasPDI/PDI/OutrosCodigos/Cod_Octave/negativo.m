%algoritmo de negativo

clear all % limpa todas as variáveis da memória
close all %fecha todas as janelas


pkg load image % acessa o pacote de imagens que tem as funções de pdi
im = imread('C:\imagens\negativo6.jpg'); % lê uma imagem e coloca na variável im

figure(1) % abre a janela 1
imshow(im) % mostra a imagem da variável im na janela que foi aberta

im2 = rgb2gray(im); % transforma a imagem im (colorida - RGB) na imagem im2 (tons de cinza)

figure(2) % abre a janela 2
imshow(im2) % mostra a imagem da variável im2 na janela que foi aberta

linhas = size(im2,1); % guarda na variável "linhas" o número de linhas da imagem im2
colunas = size(im2,2); % guarda na variável "colunas" o número de colunas da imagem im2

neg = uint8(zeros(colunas, linhas)); % cria uma imagem "neg" do tipo inteiro sem sinal (uint8)
                                            % com os mesmos números de linhas e colunas da imagem im2
                                            % contendo o valor "0" em todos os seus pixels
%negativo da imagem cinza
for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    neg(i,j) = 255 - im2(i,j); % atribui a imagem neg 255 - o valor de cada pixel da imagem im2
  end
end  

figure(3) % abre a janela 3
imshow(neg) % mostra a imagem da variável neg na janela que foi aberta

%negativo da imagem colorida
negColorida = im;
for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    negColorida(i,j,:) = 255 - im(i,j,:); % atribui a imagem negColorida 255 - o valor de cada pixel da imagem im
  end
end  

figure(4) % abre a janela 3
imshow(negColorida) % mostra a imagem da variável im90graus na janela que foi aberta
imwrite(negColorida,'c:\imagens\negativo6_2.jpg');



