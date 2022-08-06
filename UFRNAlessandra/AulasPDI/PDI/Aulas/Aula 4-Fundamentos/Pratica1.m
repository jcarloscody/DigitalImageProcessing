pkg load image %carrega o pacote image (toolbox pdi)

close all %fecha todas as janelas
clear all %apaga todas as variÃ¡veis

t = tic; %medição de tempo

im = imread('E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\soja.jpg');
figure('Name','Imagem original: soja')
imshow(im)

imCinza = rgb2gray(im); %escalas de cinza
figure('Name','Imagem original: soja cinza')
imshow(imCinza)

figure('Name','Histograma');
imhist(imCinza)

imPB = uint8(zeros(size(imCinza,1),size(imCinza,2)));

for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    if(imCinza(i,j)>100)
      imPB(i,j) = 255;
    end
  end
end

figure('Name','Grãos PB');
imshow(imPB);

imSaida = im;

for i=1:size(imSaida,1)
  for j=1:size(imSaida,2)
    if(imPB(i,j)==0)
      imSaida(i,j,:) = 255;
    else
      imSaida(i,j,:) = im(i,j,:);  %redundante
    end
  end
end

figure('Name','Grãos Saída');
imshow(imSaida);


toc(t)