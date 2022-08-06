pkg load image

clear all
close all

im = imread('E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\mulherNeg.jpg');

figure('Name','Imagem original: mulher em negativo');
imshow(im);

roi = imread('E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\ROI_circular.jpg');

figure('Name','Região de Interesse em .jpg');
imshow(roi);

roiBW = zeros(size(roi,1), size(roi,2));
roiBW(roi>126) = 1;

figure('Name','Região de Interesse - ROI');
%imshow(roiBW);

imshow(roiBW, [min(min(roiBW)) max(max(roiBW))])

%imOpArit(:,:,1) = im(:,:,1).*roiBW;
%imOpArit(:,:,2) = im(:,:,2).*roiBW;
%imOpArit(:,:,3) = im(:,:,3).*roiBW;

imOpArit = im.*roiBW;

figure('Name','Operação aritmética');
imshow(imOpArit);
%imwrite(imOpArit,'E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\imOpArit.jpg');

imBackG = imread('E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\flores.jpg');

imOperConj = max(imOpArit, imBackG);
%imwrite(imOperConj,'E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\imOperConj.jpg');

figure('Name','Operação com conjuntos - União')
imshow(imOperConj)
 
imOperP2P = 255-imOperConj;
%imwrite(imOperP2P,'E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\imOperP2P.jpg');
figure('Name','OperaçãoPonto a Ponto - Negativo')
imshow(imOperP2P)

imTGeo = imOperP2P; 
for j=1:size(imOperP2P,2)
    imTGeo(:,j,:) = imOperP2P(:,(size(imOperP2P,2)+1)-j,:);
end

%imwrite(imTGeo,'E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\imTGeo.jpg');
figure('Name','Transformação Geométrica - Espelhamento Horizontal')
imshow(imTGeo)

imSaida = imTGeo; 
for i=1:size(imTGeo,1)
  for j=1:size(imTGeo,2)
    if(roiBW(i,j)==1)
      imSaida(i,j,:) = 255-im(i,(size(im,2)+1)-j,:);
    else
      imSaida(i,j,:) = 255-imOperP2P(i,(size(imOperP2P,2)+1)-j,:);
    end
  end
end
%imwrite(imSaida,'E:\EAJ\2019\PDI\Aulas\Aula 6-Operacoes\imSaida.jpg');
figure('Name','Operações matriciais - Imagem Final')
imshow(imSaida)