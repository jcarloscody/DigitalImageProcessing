close all
clear all


imPreto = imread('C:\Users\josue\OneDrive\Documentos\Repositorios\estudos\DigitalImageProcessing\UFRN\AulasPDI\Aula1\img\imagem1.jpg');
imColorida = imread('C:\Users\josue\OneDrive\Documentos\Repositorios\estudos\DigitalImageProcessing\UFRN\AulasPDI\Aula1\img\imagem2.jpg');

#
figure(1)
imshow(imPreto)

size(imPreto)

imPreto

figure(2)
imshow(imColorida)

size(imColorida)

imColorida

for i=1:size(imPreto, 1)
  for j=1:size(imPreto,2)
    if imPreto(i,j)<100
      imPreto(i,j) = 99;
    endif
  endfor
endfor

figure(3)
imshow(imPreto)




x = uint8(zeros(10, 20))

y = x;
r = 255;
for i=1:size(x,1)
  for j=1:size(x,2)
    y(i,j) = r;
    r-=10;
  endfor
  r=255;
endfor

figure(4)
imshow(y)
