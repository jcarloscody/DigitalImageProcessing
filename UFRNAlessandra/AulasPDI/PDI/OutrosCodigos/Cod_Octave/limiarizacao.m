% limiarização

clear all
close all

pkg load image

im = imread('c:\imagens\desmatamento.jpg');
figure(1)
imshow(im)

% escalas de cinza
img = rgb2gray(im);

figure(2)
imshow(img)

linhas = size(img,1);
colunas = size(img,2);

%limiarizando
soma = 0; % variável que conta quantos pixels correspondem ao desmatamento

limiar = img;
for i=1:linhas
  for j=1:colunas
    if(img(i,j)>=126)
      limiar(i,j) = 255;
      soma = soma + 1;
     else
      limiar(i,j) = 0;
    end
  end
end

figure(3)
imshow(limiar)

%cortando da original
saida = im;
for i=1:linhas
  for j=1:colunas
    if(limiar(i,j)==255)
      saida(i,j,:) = 255;
    end
  end
end

figure(4)
imshow(saida)

% regra de tres para saber o percentual desmatado
total = (linhas*colunas);
% total --- 100%
% soma --- x
% logo, x = (soma*100)/total;
percDesmat = (soma*100)/total;
percDesmat
soma
total