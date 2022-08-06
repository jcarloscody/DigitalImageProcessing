clear all
close all

pkg load image

im = imread('C:\imagens\lena.jpg');

figure(1)
imshow(im)

linhas = size(im,1); 
colunas = size(im,2); 

neg=im;

for i=1:linhas 
  for j=1:colunas 
  
       neg(i,j,:)=255-im(i,j,:);
       
  end
end  

figure(2) 
imshow(neg) 

im2=rgb2gray(im);

figure(3)
imshow(im2)

im3=im2;

for i=1:linhas 
  for j=1:colunas 
  
       im3(i,j)=255-im2(i,j);

  end
end  

figure(4) 
imshow(im3) 