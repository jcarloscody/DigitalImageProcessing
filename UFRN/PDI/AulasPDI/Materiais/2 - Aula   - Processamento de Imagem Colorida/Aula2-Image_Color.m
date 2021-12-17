close all 
%"Cole all" fecha todas as figuras em aberto;
clear all 
%"clear all" apaga todas as variáveis do espaço;

% Lembrete: Sem o ponto e virgula o Octace ecoa(printa) o comando;

im = imread('Colorida.png'); 
% imread = comando de leitura da imagem;

figure (1)
% figure (n) = (sem ponto e virgula) Gera uma janela de imagem aonde uma figura pode ser impressa;
imshow(im) 
% imshow(x) = (sem ponto e virgula) imprime a imagem;

im 
% Nome da váriavel (sem ponto e virgula) imprime a matriz;
% Caso a foto seja colorida, esse comando ira imprimir as matrizes nos 3 canais;
% Seguindo o sistema RGB (1 - red, 2- green, 3- blue);

size (im) 
% Função "size" imprime o tamanho da matriz.
% No caso de imagens coloridas o tamanho vai aparecer (x, y, z);
% Sendo o "Z" a quantidade de dimensões/canais de intensidade (geralmente sendo 3 = RGB);
% ans (x , y, 1) = Intensidades no canal vermelho;
% ans (x , y, 2) = Intensidades no canal Verde;
% ans (x , y, 3) = Intensidades no canal Azul;

% ----------------------------------------------------------------------------------------
% Criando uma imagem e transformando em colorida (AULA 2 - PDI - Alessandra)
pkg load image;
% pkg load image = Subir o pacote para PDI

im2 = uint8(zeros(20,20));

for i=1:size(im2,1)
  for j=6:15
    im2(i,j)=255;
  end
end

for i=6:15
  for j=1:size(im2,2)
    im2(i,j)=126;
  end
end

%im2

imcolor (:,:,1) = im2(:,:);
imcolor (:,:,2) = im2(:,:);
imcolor (:,:,3) = im2(:,:);

%imcolor

figure(2)
imshow(imcolor)

imcolor (1,1,1) = 0;
imcolor (1,1,2) = 0;
imcolor (1,1,3) = 255;

imcolor

figure(3)
imshow(imcolor)

for i=1:5
  for j=16:20
    imcolor (i,j,1) = 255;
    imcolor (i,j,2) = 0;
    imcolor (i,j,3) = 0;
  endfor
endfor

figure(4)
imshow(imcolor)

for i=16:20
  for j=16:20
    imcolor (i,j,1) = 0;
    imcolor (i,j,2) = 255;
    imcolor (i,j,3) = 0;
  endfor
endfor

figure(5)
imshow(imcolor (:,:,1)) %Imprimir o canal vermelho (R)

figure(6)
imshow(imcolor (:,:,2)) %Imprimir o canal verde (G)

figure(7)
imshow(imcolor (:,:,3)) %Imprimir o canal Azul (B)
 
figure(8)
imshow(imcolor) %Imprimir a IMAGEM COMPLETA com todos os canais


