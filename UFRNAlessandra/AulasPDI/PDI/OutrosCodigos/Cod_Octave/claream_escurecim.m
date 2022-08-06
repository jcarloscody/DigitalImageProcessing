%algoritmo de brilho

clear all % limpa todas as variáveis da memória
close all %fecha todas as janelas


pkg load image % acessa o pacote de imagens que tem as funções de pdi
im = imread('C:\imagens\lena.jpg'); % lê a imagem "lena" e coloca na variável im

figure(1) % abre a janela 1
imshow(im) % mostra a imagem da variável im na janela que foi aberta


linhas = size(im,1); % guarda na variável "linhas" o número de linhas da imagem borda
colunas = size(im,2); % guarda na variável "colunas" o número de colunas da imagem borda

im2 = rgb2gray(im); % transforma a imagem RGB "im" em "im2" (tons de cinza) 

figure(2) % abre a janela 1
imshow(im2) % mostra a imagem da variável im2 na janela que foi aberta

escura = im2; % cria uma imagem "nova" igual a imagem "im2"
clara = im2; % cria uma imagem "nova" igual a imagem "im2"

fator = 80; %fator de clareamento e escurecimento

for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    if((im2(i,j) - fator) > 0)
      escura(i,j) = im2(i,j) - fator;
    else
      escura(i,j) = 0;
    end
    if((im2(i,j) + fator) < 255)
      clara(i,j) = im2(i,j) + fator;
    else
      clara(i,j) = 255;
    end
  end
end  

figure(3) % abre a janela 3
imshow(escura) % mostra a imagem da variável escura na janela que foi aberta
figure(4) % abre a janela 3
imshow(clara) % mostra a imagem da variável clara na janela que foi aberta
imwrite(escura,'c:\imagens\lena_escura.jpg');
imwrite(clara,'c:\imagens\lena_clara.jpg');
