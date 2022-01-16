%algoritmo de colagem

clear all % limpa todas as variáveis da memória
close all %fecha todas as janelas


pkg load image % acessa o pacote de imagens que tem as funções de pdi
im = imread('C:\imagens\lena.jpg'); % lê a imagem "lena" e coloca na variável im
smile = imread('C:\imagens\smile.jpg'); % lê a imagem "smile" e coloca na variável smile


figure(1) % abre a janela 1
imshow(im) % mostra a imagem da variável im na janela que foi aberta
figure(2) % abre a janela 1
imshow(smile) % mostra a imagem da variável smile na janela que foi aberta

linhas = size(smile,1); % guarda na variável "linhas" o número de linhas da imagem borda
colunas = size(smile,2); % guarda na variável "colunas" o número de colunas da imagem borda

smileCinza = rgb2gray(smile); % transforma a imagem "smile" em tons de cinza para servir como guia


nova = im; % cria uma imagem "nova" igual a imagem "im"

for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    if(smileCinza(i,j) < 240) % se o pixel de smileCinza não for branco (< 240)
      nova(i,j,:) = smile(i,j,:); % copia as 3 camadas de smiles para nova
    end
  end
end  

figure(3) % abre a janela 3
imshow(nova) % mostra a imagem da variável nova na janela que foi aberta

