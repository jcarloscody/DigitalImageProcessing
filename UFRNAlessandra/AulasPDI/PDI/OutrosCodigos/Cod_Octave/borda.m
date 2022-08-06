clear all
close all

pkg load image

im = imread('c:\imagens\bola.jpg');
figure(1)
imshow(im)

% escalas de cinza
%img = rgb2gray(im);
img = im;

linhas = size(im,1);
colunas = size(im,2);

for i=1:linhas
  for j=1:colunas
    if(img(i,j)<126)
      img(i,j)=0;
    else
      img(i,j)=255;
    end
  end
end
figure(2)
imshow(img)

nova = uint8(zeros(linhas, colunas));
for i=2:(linhas-1)
  for j=2:(colunas-1)
    if(((img(i,j-1)<126) && (img(i,j+1)>126)) || %pixel da esq e da dir
    ((img(i-1,j)<126) && (img(i+1,j)>126)) || %pixel de cima e de baixo
    ((img(i-1,j-1)<126) && (img(i+1,j+1)>126)) || %pixel das diagonais esq cima e dir baixo
    ((img(i-1,j+1)<126) && (img(i+1,j-1)>126))) %pixel das diagonais dir cima e esq baixo
      nova(i,j)=0;
    else
      nova(i,j)=255;
    end
  end
end

figure(3)
imshow(nova)
    