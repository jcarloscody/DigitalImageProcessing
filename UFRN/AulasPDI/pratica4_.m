pkg load image

clear all
close all

im = imread('D:\EAJ\2020\20202\PDI\Aulas\Aula 4-Operacoes\mulherNeg.jpg');

figure('Name','Imagem original: mulher em negativo');
imshow(im);

roi = imread('D:\EAJ\2020\20202\PDI\Aulas\Aula 4-Operacoes\ROI_circular.jpg');

figure('Name','Região de Interesse em .jpg');
imshow(roi);


roiBW = zeros(size(roi,1), size(roi,2));
roiBW(roi>126) = 1;

figure('Name','Região de Interesse - ROI');
imshow(roiBW);


%imOpArit = zeros(size(roi,1), size(roi,2), 3);

%imOpArit = uint8(imOpArit);
%im = uint8(im);
%roiBW = uint8(roiBW);

%imOpArit(:,:,1) = im(:,:,1) .* roiBW(:,:);
%imOpArit(:,:,2) = im(:,:,2) .* roiBW(:,:);
%imOpArit(:,:,3) = im(:,:,3) .* roiBW(:,:);
%
%figure('Name','Operação Aritmética 1');
%imshow(imOpArit);
%
%for i=1:size(im,1)
%  for j=1:size(im,2)
%    imOpArit(i,j,1) = im(i,j,1) .* roiBW(i,j);
%    imOpArit(i,j,2) = im(i,j,2) .* roiBW(i,j);
%    imOpArit(i,j,3) = im(i,j,3) .* roiBW(i,j);
%  end
%end
%
%figure('Name','Operação Aritmética 2');
%imshow(imOpArit);

imOpArit = im .* roiBW; 

figure('Name','Operação Aritmética');
imshow(imOpArit);


imBackG = imread('D:\EAJ\2020\20202\PDI\Aulas\Aula 4-Operacoes\flores.jpg');
figure('Name', 'Imagem Flores.jpg');
imshow(imBackG)

imOperConj = max(imOpArit, imBackG); %união de conjuntos
figure('Name', 'Operação de União de Conjuntos');
imshow(imOperConj)

imOperP2P = 255 - imOperConj;
figure('Name', 'Operação Ponto a Ponto');
imshow(imOperP2P)


%totalColunas = size(imOperP2P,2);

%for j=1:size(imOperP2P,2)
%  imTGeo(:,size(imOperP2P,2)-j+1,:) = imOperP2P(:,j,:);
%  %imTGeo(:,totalColunas,:) = imOperP2P(:,j,:);
%  %totalColunas--;
%end
  

for j=size(imOperP2P,2):-1:1
  imTGeo(:,j,:) = imOperP2P(:,size(imOperP2P,2)-j+1,:);
end

figure('Name', 'Operação Geométrica');
imshow(imTGeo)

for i=1:size(im,1)
  for j=1:size(im,2)
    if(roiBW(i,j)==1)
      imSaida(i,size(im,2)-j+1,:) = 255-im(i,j,:);
    else
      imSaida(i,size(im,2)-j+1,:) = imBackG(i,j,:); 
    end
  end
end   

    
figure('Name',  'Operações matriciais – Imagem Final');
imshow(imSaida)


