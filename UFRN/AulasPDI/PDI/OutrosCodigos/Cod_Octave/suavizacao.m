clear all
close all

pkg load image

im=imread('c:\imagens\negativo2.jpg');

figure(1)
imshow(im)

linhas=size(im,1)
colunas=size(im,2)

im2=im;

for i=1:linhas
for j=1:colunas
   im2(i,j,:)=255-im(i,j,:);
end
end

figure(2)
imshow(im2)

im3=rgb2gray(im2);

im4=im3;

figure(3)
imshow(im3)

for i=1:linhas
for j=1:colunas
  im4(i,j)=255-im3(i,j);
  
  end
  end
  
 figure(4)
 imshow(im4)