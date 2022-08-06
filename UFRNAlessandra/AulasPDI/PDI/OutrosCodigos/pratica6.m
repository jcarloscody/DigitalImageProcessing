pkg load image

close all
clear all

im = imread('E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\desmatamento.jpg');
figure('Name','Imagem original: desmatamento')
imshow(im)

imCinza = rgb2gray(im);

%limiarizando (limiar = 120)
imLimiar = zeros(size(imCinza,1), size(imCinza,2));
imLimiar(imCinza>120) = 1;
%calculando o percentual de desmatamento
perc = (sum(sum(imLimiar))*100)/(size(imLimiar,1)*size(imLimiar,2));
figure('Name','Imagem original: desmatamento limiarizado')
imshow(imLimiar)
%escrevendo na janela 
title(strcat('Percentual de desmatamento: ',int2str(perc)))
imwrite(imLimiar, 'E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\imLimiar.jpg');

% logaritmo
im2 = imread('E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\degrade.jpg');
figure('Name','Imagem original: Degrade')
imshow(im2)
c=1;
imLog = im2uint8(mat2gray(c*log(1+double(im2))));
% mat2gray - traz os valores para [0,1]. Maior valor é mapeado para 1 e o menor valor para 0
% im2uint8 - mapeia [0,1] para [0,255]
figure('Name','Logaritmo da imagem Degrade');
imshow(imLog);
imwrite(imLog, 'E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\imLog.jpg');

% potência
c=1; 
expoente = 3;
imPot = (double(im2)).^expoente;
imPot = im2uint8(mat2gray((double(im2)+eps).^expoente));
% eps evita overflow se im2 tem algum valor = 0
figure('Name','Potência da imagem Degrade com expoente 3');
imshow(imPot);
imwrite(imPot, 'E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\imPot.jpg');

%Fatiamento de níveis de intensidade 1
%im3 = imread('D:\EAJ\2017.1\PDI\Aulas\Aula 5\aerea1.jpg');
im3 = imread('E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\tomografia.jpg');
figure('Name','Imagem original: Tomografia')
imshow(im3)
imFat1 = rgb2gray(im3);
for i=1:size(imFat1,1)
  for j=1:size(imFat1,2)
    if((imFat1(i,j)>40)&&(imFat1(i,j)<110))
      imFat1(i,j)=200; %amplia o valor de intensidade do pixel para 1  
    else
      imFat1(i,j)=50; %reduz o valor de intensidade do pixel para 0
    end
  end
end
figure('Name','Fatiamento de níveis de intensidade I')
imshow(imFat1)
imwrite(imFat1, 'E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\imFat1.jpg');

%Fatiamento de níveis de intensidade 2
imFat2 = rgb2gray(im3);
figure('Name','Histograma')
imhist(uint8(imFat2))
for i=1:size(imFat2,1)
  for j=1:size(imFat2,2)
    if((imFat2(i,j)>100)&&(imFat2(i,j)<170))
      imFat2(i,j)*=1.5; %amplia o valor de intensidade do pixel em 50%
    else
      imFat2(i,j)*=0.3; %reduz o valor de intensidade do pixel em 70%
    end
  end
end
figure('Name','Fatiamento de níveis de intensidade II')
imshow(imFat2)
imwrite(imFat2, 'E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\imFat2.jpg');

