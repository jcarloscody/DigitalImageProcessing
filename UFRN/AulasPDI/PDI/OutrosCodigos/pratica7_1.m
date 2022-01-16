pkg load image

clear all
close all

im = imread('E:\EAJ\2018\PDI\Aulas\Aula 5-Histograma_cores\rgb6.jpg');
figure('Name','Imagem original: RGB')
imshow(im)

r(:,:) = im(:,:,1);
g(:,:) = im(:,:,2);
b(:,:) = im(:,:,3);

amar = uint8(zeros(size(im,1), size(im,2), size(im,3)));
verm = uint8(zeros(size(im,1), size(im,2), size(im,3)));
verd = uint8(zeros(size(im,1), size(im,2), size(im,3)));
%verm = im;
for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)>100)&&(g(i,j)>100)&&(b(i,j)<100))
      amar(i,j,:) = im(i,j,:);
    else
      amar(i,j,:) = 255;
    end
  end
end

figure('Name','Canal Amarelo');
imshow(amar)

for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)>100)&&(g(i,j)<100)&&(b(i,j)<100))
      verm(i,j,:) = im(i,j,:);
    else
      verm(i,j,:) = 255;
    end
  end
end

figure('Name','Canal Vermelho');
imshow(verm)

for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)<100)&&(g(i,j)>100)&&(b(i,j)<100))
      verd(i,j,:) = im(i,j,:);
    else
      verd(i,j,:) = 255;
    end
  end
end

figure('Name','Canal Verde');
imshow(verd)

im2 = imread('E:\EAJ\2018\PDI\Aulas\Aula 5-Histograma_cores\soja.jpg');
figure('Name','Imagem original: Soja')
imshow(im2)
im2Cinza = rgb2gray(im2);
figure('Name','Histograma Soja');
imhist(im2Cinza)

imLimiar= im2Cinza;
%for i=1:size(im2Cinza,1)
%  for j=1:size(im2Cinza,2)
%    if(im2Cinza(i,j)>50)
%      imLimiar(i,j) = 0;
%    else
%      imLimiar(i,j) = 255;
%    end
%  end
%end

imLimiar(im2Cinza>50) = 0;    
imLimiar(im2Cinza<=50) = 255;    
    
figure('Name','Limiar'); 
imshow(imLimiar)

final = im2;
for i=1:size(im2Cinza,1)
  for j=1:size(im2Cinza,2)
    if(imLimiar(i,j)==0)
      final(i,j,:) = im2(i,j,:);
    else
      final(i,j,:) = 255;
    end
  end
end
    
%final = im2;    
%final(imLimiar!=0) = 255;
figure('Name','Final'); 
imshow(final)