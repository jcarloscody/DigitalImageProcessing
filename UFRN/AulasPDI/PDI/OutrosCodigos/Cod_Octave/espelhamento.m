%algoritmo de espelhamento

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

imEspH = zeros(linhas, colunas); % cria uma imagem "imEspH" do tipo inteiro sem sinal (uint8)
                                            % com os mesmos números de linhas e colunas da imagem im2
                                            % contendo o valor "0" em todos os seus pixels
         
        
for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    imEspH(i,j) = im2(i,(colunas + 1 - j)); % atribui a imagem imEspH o valor da imagem im2 espelhada horizontalmente.
  end
end  

figure(3) % abre a janela 3
imshow(uint8(imEspH)) % mostra a imagem da variável im90graus na janela que foi aberta

imEspV = uint8(zeros(colunas, linhas)); % cria uma imagem "imEspV" do tipo inteiro sem sinal (uint8)
                                            % com os mesmos números de linhas e colunas da imagem im2
                                            % contendo o valor "0" em todos os seus pixels
                                            
for i=1:linhas % laço para variar o i de 1 até o total de linhas
  for j=1:colunas % laço para variar o j de 1 até o total de colunas
    imEspV(i,j) = im2((colunas + 1 - i),j); % atribui a imagem imEspV o valor da imagem im2 espelhada verticalmente.
  end
end  

figure(4) % abre a janela 4
imshow(imEspV) % mostra a imagem da variável im90graus na janela que foi aberta


% sobrepõe duas imagens espelhadas, criando uma nova imagem colorida
imNova(:,:,1) = imEspH(:,:); %camada R (vermelhos) recebe a imagem espelhada
imNova(:,:,2) = im2(:,:); %camada G (verdes) recebe a imagem original (cinza)
imNova(:,:,3) = 0; %camada B (azul) recebe somente "0"
 
figure(5) % abre a janela 5
imshow(imNova) % mostra a imagem montada


