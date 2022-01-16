%algoritmo de rotação

clear all % limpa todas as variáveis da memória
close all %fecha todas as janelas


pkg load image % acessa o pacote de imagens que tem as funções de pdi
im = imread('C:\imagens\lena.jpg'); % lê uma imagem e coloca na variável im

figure(1) % abre a janela 1
imshow(im) % mostra a imagem da variável im na janela que foi aberta

im2 = rgb2gray(im); % transforma a imagem im (colorida - RGB) na imagem im2 (tons de cinza)

figure(2) % abre a janela 2
imshow(im2) % mostra a imagem da variável im2 na janela que foi aberta

linhas = size(im2,1); % guarda na variável "linhas" o número de linhas da imagem im2
colunas = size(im2,2); % guarda na variável "colunas" o número de colunas da imagem im2

im90graus = uint8(zeros(colunas, linhas)); % cria uma imagem "im90graus" do tipo inteiro sem sinal (uint8)
                                            % com os mesmos números de linhas e colunas da imagem im2
                                            % contendo o valor "0" em todos os seus pixels

for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    im90graus(i,j) = im2((colunas + 1 - j),i); % atribui a imagem im90graus o valor da imagem im2 rotacionada 90o.
  end
end  

figure(3) % abre a janela 3
imshow(im90graus) % mostra a imagem da variável im90graus na janela que foi aberta

im90graus2 = uint8(zeros(colunas, linhas)); % cria uma imagem "im90graus2" do tipo inteiro sem sinal (uint8)
                                            % com os mesmos números de linhas e colunas da imagem im2
                                            % contendo o valor "0" em todos os seus pixels
                                            
for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    im90graus2(i,j) = im90graus((colunas + 1 - j),i); % atribui a imagem im90graus2 o valor da imagem im90graus rotacionada 90o.
  end
end  

figure(4) % abre a janela 4
imshow(im90graus2) % mostra a imagem da variável im90graus2 na janela que foi aberta

im90graus3 = uint8(zeros(colunas, linhas)); % cria uma imagem "im90graus3" do tipo inteiro sem sinal (uint8)
                                            % com os mesmos números de linhas e colunas da imagem im2
                                            % contendo o valor "0" em todos os seus pixels
                                            
for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    im90graus3(i,j) = im90graus2((colunas + 1 - j),i); % atribui a imagem im90graus3 o valor da imagem im90graus2 rotacionada 90o.
  end
end  

figure(5) % abre a janela 5
imshow(im90graus3) % mostra a imagem da variável im90graus3 na janela que foi aberta




