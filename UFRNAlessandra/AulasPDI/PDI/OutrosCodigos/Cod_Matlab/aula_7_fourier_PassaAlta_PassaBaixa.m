pkg load image

clear all
close all

% teste1.m
% Script de teste para aplicação de filtros passa-baixa e passa-alta.

% lendo a imagem original
img     = imread('D:\EAJ\2017.1\PDI\imagens\brain.jpg');

% exibindo a imagem original
figure(1);
set(1,'Name','Imagem original');
imshow(img);
pause;

% exibindo a TDF da imagem original
S       = fft2(img);
Sv      = fftshift(log(abs(S)+1));
G       = uint8(Sv * 255/max(Sv(:)));
figure(1);
set(1,'Name','TDF da imagem original convertida para visualizaçao');
imshow(G);
pause;

% exibindo o filtro passa-baixas
f_baixas = baixas(50,2,size(img,1),size(img,2));
Fv       = fftshift(log(abs(f_baixas)+1));
G        = uint8(Fv * 255/max(Fv(:)));
figure(1);
set(1,'Name','Espectro do filtro passa-baixas');
imshow(G);
pause;

% exibindo a TDF da imagem filtrada
% utilizaçao do teorema da convoluçao:
%    TDF(img) .* filtro = TDF(convolução entre img e filtro)
S2       = S .* f_baixas;
S2v      = fftshift(log(abs(S2)+1));
G        = uint8(S2v * 255/max(S2v(:)));
figure(1);
set(1,'Name','TDF da convoluçao entre imagem e filtro');
imshow(G);
pause;

% exibindo a imagem filtrada -> convoluçao entre a img e o filtro
S3       = ifft2(S2);
figure(1);
set(1,'Name','Imagem filtrada');
imshow( uint8(abs(S3)) );
pause;

% exibindo o filtro passa-altas
f_altas  = altas(50,2,size(img,1),size(img,2));
Fv       = fftshift(log(abs(f_altas)+1));
G        = uint8(Fv * 255/max(Fv(:)));
figure(1);
set(1,'Name','Espectro do filtro passa-altas');
imshow(G);
pause;

% exibindo a TDF da imagem filtrada
% utilizaçao do teorema da convoluçao:
%    TDF(img) .* filtro = TDF(convolução entre img e o filtro)
S2      = S .* f_altas;
S2v     = fftshift(log(abs(S2)+1));
G       = uint8(S2v * 255/max(S2v(:)));
figure(1);
set(1,'Name','TDF da convoluçao entre imagem e filtro');
imshow(G);
pause;

% exibindo a imagem filtrada -> convoluçao entre a img e o filtro
S3      = ifft2(S2);
S3v     = fftshift(log(abs(S3)+1));
G       = uint8(S3v * 255/max(S3v(:)));
figure(1);
set(1,'Name','Imagem filtrada');
imshow( uint8(abs(S3)) );