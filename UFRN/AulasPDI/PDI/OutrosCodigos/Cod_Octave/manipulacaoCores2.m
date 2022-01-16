clear all
close all

pkg load image

im = imread('c:\imagens\rgb6.jpg');
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

% retirando os vermelhos
vermelho = im;
for i=1:linhas 
  for j=1:colunas
    if ((r(i,j)>limiar) && (g(i,j)<limiar) && (b(i,j)<limiar)) %vermelho alto e verde baixo e azul baixo
      vermelho(i,j,:) = im(i,j,:);
    else
      vermelho(i,j,:) = 255;
    end
  end
end
    
figure(5)
imshow(vermelho)  
imwrite(vermelho,'c:\imagens\rgb6_verm.jpg');


% retirando os verdes
verde = im;
for i=1:linhas 
  for j=1:colunas
    if ((g(i,j)>limiar) && (r(i,j)<limiar) && (b(i,j)<limiar)) %verde alto e vermelho baixo e azul baixo
      verde(i,j,:) = im(i,j,:);
    else
      verde(i,j,:) = 255;
    end
  end
end
    
figure(6)
imshow(verde)  
imwrite(verde,'c:\imagens\rgb6_verd.jpg');


% retirando os amarelos (vermelhos e verdes)
amarelo = im;
for i=1:linhas 
  for j=1:colunas
    if ((g(i,j)>limiar) && (r(i,j)>limiar) && (b(i,j)<limiar)) %verde alto e vermelho alto e azul baixo
      amarelo(i,j,:) = im(i,j,:);
    else
      amarelo(i,j,:) = 255;
    end
  end
end
    
figure(7)
imshow(amarelo)  
imwrite(amarelo,'c:\imagens\rgb6_amar.jpg');

% retirando os azuis
azul = im;
for i=1:linhas 
  for j=1:colunas
    if ((g(i,j)<limiar) && (r(i,j)<limiar) && (b(i,j)>limiar)) %baixo nas 3 camadas
      azul(i,j,:) = im(i,j,:);
    else
      azul(i,j,:) = 255;
    end
  end
end
    
figure(8)
imshow(azul)
imwrite(azul,'c:\imagens\rgb6_az.jpg');  

