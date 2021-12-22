close all
clear all

pkg load image

imagem = imread('C:/Users/developer/Documents/Repositorios/DigitalImageProcessing/UFRN/AulasPDI/Aula3/imagem2.jpg');

vermelho(:,:) = imagem(:,:,1);
verde(:,:) = imagem(:,:,2);
azul(:,:) = imagem(:,:,3);

Sovermelho = vermelho - verde - azul;

figure('Name','sd');
imshow(Sovermelho);

coloridadevermelho = uint8(zeros(size(Sovermelho,1), size(Sovermelho,2),3));
coloridadevermelho(:,:,1) = Sovermelho(:,:);
figure('Name','sd');
imshow(coloridadevermelho);