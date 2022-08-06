clear all
close all

pkg load image

im = imread('C:\imagens\lena.jpg');

figure(1)
imshow(im)

im2 = rgb2gray(im);

figure(2)
imshow(im2)

linha = size(im2,1);
coluna = size(im2,2);

fonte = 80;

im3 = im2;
im4 = im2;

for i=1:linha
  for j=1:coluna
  if((im2(i,j) + fonte) < 255)
  im3(i,j) = im2(i,j) + fonte;
  else
  im3(i,j) = 255;
  end
  if((im2(i,j) - fonte) > 0 )
  im4(i,j) = im2(i,j) - fonte;
  else
  im4(i,j) = 0;
  end
 end
  end
  
  figure(3)
  imshow(im3)
  
  figure(4)
  imshow(im4)