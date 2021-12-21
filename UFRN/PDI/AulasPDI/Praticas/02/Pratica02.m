close all
clear all

pkg load image


rgb = imread('C:/Users/developer/Documents/Repositorios/DigitalImageProcessing/UFRN/PDI/AulasPDI/Praticas/02/rgb.jpg');

figure('Name', 'original');
imshow(rgb);

imR = rgb;
imG = rgb;
imA = rgb;

for i=1:size(rgb,1)
  for j=1:size(rgb,2)
    if((rgb(i,j,1)>126) && (rgb(i,j,2)<126) && (rgb(i,j,3)<126)) #se pixel vermelho intensifica
      imR(i,j,2) = 0;
      imR(i,j,3) = 0;
     else  #se outra pixel de outra cor vai para branco
      imR(i,j,:) = 255;
    endif
  endfor
endfor

figure('Name', 'VERMELHO');
imshow(imR);

for i=1:size(rgb,1)
  for j=1:size(rgb,2)
    if((rgb(i,j,1)<126) && (rgb(i,j,2)>80) && (rgb(i,j,3)<126)) #se pixel VERDE intensifica
      imG(i,j,1) = 0;
      imG(i,j,3) = 0;
     else  #se outra pixel de outra cor vai para branco
      imG(i,j,:)= 255;
    endif
  endfor
endfor

figure('Name', 'VERDE');
imshow(imG);


for i=1:size(rgb,1)
  for j=1:size(rgb,2)
    if((rgb(i,j,1)>126) && (rgb(i,j,2)>126) && (rgb(i,j,3)<126)) #se pixel amarelo intensifica
      imA(i,j,3) = 0;
     else  #se outra pixel de outra cor vai para branco
      imA(i,j,:) = 255;
    endif
  endfor
endfor

figure('Name', 'Amarelo');
imshow(imA);