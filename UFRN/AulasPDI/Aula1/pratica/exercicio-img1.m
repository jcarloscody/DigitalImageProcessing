clear all 
close all 

pkg load image


img = imread('C:\Users\developer\Documents\Repositorios\DigitalImageProcessing\UFRN\AulasPDI\Aula1\pratica\img-exercicio1.jpeg');

imgR = imgG = imgA = uint8(zeros(size(img,1), size(img,2),3));
%imgR = uint8(zeros(size(img,1), size(img,2),3));
%imgG = uint8(zeros(size(img,1), size(img,2),3));
%imgB = uint8(zeros(size(img,1), size(img,2),3));




figure('Name', 'Original')
imshow(img)

figure('Name', 'Red')
imshow(imgR)

figure('Name', 'Green')
imshow(imgG)

figure('Name', 'Amarelo')
imshow(imgA)





%canal 1 - r
%canal 2 - g
%canal 3 - b
%imgR = img;
%imgG = img;
%imgB = img;

for i=1:size(img,1)
  for j=1:size(img,2)
    if ((img(i,j,1)>126) && (img(i,j,2)<126) && (img(i,j,3)<126)) %pixel vermelho
       imgR(i,j,:) = img(i,j,:); 
       %imgR(i,j,1) = img(i,j,1); 
       %imgR(i,j,2) = img(i,j,2); 
       %imgR(i,j,3) = img(i,j,3);
     else
       imgR(i,j,:) = 255 ;
    endif
  endfor 
 endfor

for i=1:size(img,1)
  for j=1:size(img,2)
    if ((img(i,j,1)<126) && (img(i,j,2)>126) && (img(i,j,3)<126)) %pixel verde
       imgG(i,j,:) = img(i,j,:); 
     else
       imgG(i,j,:) = 255 ;
    endif
  endfor 
 endfor
 
 
for i=1:size(img,1)
  for j=1:size(img,2)
    if ((img(i,j,1)>126) && (img(i,j,2)>126) && (img(i,j,3)<126)) %pixel amarelo
       imgA(i,j,:) = img(i,j,:); 
     else
       imgA(i,j,:) = 255 ;
    endif
  endfor 
endfor


%entendendo o verde
verde = imread('C:\Users\developer\Documents\JosueCarlosDrive\UFRN\PDI\AulasPDI\img-exercicio1-verde.jpeg');


for i=1:size(img,1)
  for j=1:size(img,2)
    if ((img(i,j,1)<100) && (img(i,j,2)>100) && (img(i,j,3)<100)) %pixel verde
       imgG(i,j,:) = img(i,j,:); 
     else
       imgG(i,j,:) = 255 ;
    endif
  endfor 
 endfor


