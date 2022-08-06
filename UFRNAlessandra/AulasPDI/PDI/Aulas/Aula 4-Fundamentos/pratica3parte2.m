

clear all
close all

pkg load image

im = imread('E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\soja.jpg');
figure('Name','Imagem original: soja')
imshow(im)

imCinza = rgb2gray(im); %escalas de cinza
figure('Name','Imagem original: soja cinza')
imshow(imCinza)
