% Script de teste da convolucao como produto na frequencia
close all
clear all

% Carga da imagem original
disp('Leitura da imagem do disco');
brain = imread('c:\imagens\brain.jpg');

% Criacao da Matriz de filtro Gaussiano
[m,n] = size(brain);
gs = zeros(m,n);
m = fix(m / 2);
n = fix(n / 2);
gs(m-1:m+1,n-1:n+1) = [1/16, 1/8, 1/16; 1/8, 1/4, 1/8; 1/16, 1/8, 1/16];

% Realizando a Convolucao
disp('Realizando a Convolucao');
cv = conv2(brain, gs, 'same');
cv = cv / max(cv(:));

% Calculando a DFT da imagem e do filtro
disp('Calculando a DFT da imagem original');
B = fft2(brain);
Bv = fftshift(log(abs(B)+1));
Bv = Bv / max(Bv(:));

disp('Calculando a DFT do filtro Gaussiano');
G = fft2(gs);
Gv = fftshift(log(abs(G)+1));
Gv = Gv / max(Gv(:));

% Calculando o Produto na frequencia
disp('Calculando o produto das DFTs das imagens');
P = B .* G;
Pv = fftshift(log(abs(P)+1));
Pv = Pv / max(Pv(:));

% Calculando DFT Inversa
disp('Obtendo Imagem da DFT Inversa do produto');
r = fftshift(real(ifft2(P)));
r = r / max(r(:));

% Exibindo as Imagens
disp('Exibindo as Imagens');
figure(1);
set(1,'Name','Imagem Original');
imshow(brain);

figure(2);
set(2,'Name','Imagem Convolucao filtro Gaussiano');
imshow(cv);
imwrite(cv, 'conv-gauss.jpg');

figure(3);
set(3,'Name','DFT da imagem Original');
imshow(Bv);
imwrite(Bv, 'DFT-brain.jpg');

figure(4);
set(4,'Name','DFT do filtro Gaussiano');
imshow(Gv);
imwrite(Gv, 'DFT-gauss.jpg');

figure(5);
set(5,'Name','Imagem Produto na Frequencia');
imshow(Pv);
imwrite(Pv, 'produto.jpg');

figure(6);
set(6,'Name','Imagem Resultante');
imshow(r);
imwrite(r,'result.jpg');