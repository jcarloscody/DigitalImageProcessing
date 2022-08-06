clear all
close all

pkg load image

im = imread('c:\imagens\rgb5.jpg');
figure(1)
imshow(im)

r = im(:,:,1);
g = im(:,:,2);
b = im(:,:,3);

figure(2)
imshow(r)
figure(3)
imshow(g)
figure(4)
imshow(b)

linhas = size(im,1);
colunas = size(im,2);

limiar = 80; %este é o valor de corte



azul = im;
for i=1:linhas 
  for j=1:colunas
    if ((r(i,j)>limiar) && (g(i,j)>limiar) && (b(i,j)<limiar)) %vermelho alto e verde baixo e azul baixo
      azul(i,j,3) = 255;
      azul(i,j,2)=0;
      azul(i,j,1)=0;
    end
  end
end
    
figure(5)
imshow(azul)  


