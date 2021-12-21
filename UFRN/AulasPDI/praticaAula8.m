##Ler a imagem desmatamento.jpg na variavel im (imagem 1), mostrando em uma janela com o titulo "imagem original: desmatamento
##e transformar para escalas de cinza na variavel imCinza.

pkg load image

close all
clear all

im = imread('url');
figure('Name', 'Imagem original: desmatamento');
imshow(im)

imCinza = rgb2gray(im);



##Aplicar a limiarização na imagem imCinza, gerando a imagem imLimiar(Imagem2), utilizando um valor de limiar que seja suficiente 
##para separar a região desmatada do resto da imagem, calcular o percentual de desmatamento e mostrar em uma janela com a informação
##"percentual de desmatamento = x%


%limiarizando (limiar = 120)
imLimiar = zeros(size(imCinza, 1), size(imCinza,2));
imLimiar(imCinza>120)-1;

%calculando o percentual de desmatamento
perc = (sum(sum(imLimiar))*100)/(size(imLimiar,1)*size(imLimiar,2));#sum() soma dos valores de cada coluna, sum(sum()) a soma das colunas
figure('Name', 'Imagem original: desmatamento limiarizado');
imshow(imLimiar)

%screvendo na janela
title(strcat('Percentual de desmatamento: ', int2str(perc)));
imwrite(imLimiar, 'url');



##Ler a imagem degrade.jpg na variavel im2(imagem 3) e mostrar em uma janela com o titulo "imagem original: degrade". aplicar
##o logaritmo na imagem im2(imagem4) e, em seguida, aplicar a potencia (expoente =3), tbm na imagem im2 (imagem5). comparar 
##visualmente os resultados

%logaritmo 
im2 = imread('');
figure('Name', 'Imagem original: Degrade');
imshow(im2)
c=1;
imLog=im2uint8(mat2gray(c*log(1+double(im2))));
%mat2gray - traz os valores para [0,1]. maior valor é mapeado para 1 e o menor valor para 0 
%im2uint8 - mapeia [0,1] para [0,2550]
figure('Name', 'Logaritmo da imagem degrade');
imshow(imLog);
imwrite(imLog,'');


%potencia 
c=1;
expoente=3;
imPot = (double(im2)).^expoente;
imPot = im2uint8(mat2gray((double(im2)+eps).^expoente));
%eps evita overflow se im2 tem algum valor  = 0
figure('Name', 'Potencia da imagem degrade com expoente 3');
imshow(imPot);

%Fatiamento de niveis de intensidade 1
%im3 = imread('');
im3 = imread('');
figure('Name', 'Imagem original: tomografia');
imshow(im3)


##ler a imagem tomografia.jpg na variavel im3(imagem 6) e aplicar o fatiamento de niveis de intensidade, baixando os niveis
##de intensidade para 50 caso nao estejam na regiao de interesse e subindo para 200 caso estejam, de tal forma que gere como saida
##a matriz imFat1(imagem 7); aplicar outro fatiamento de niveis de intensidade, baixando os niveis de intensidade em 70 % caso nao estejam
## na regiao  de interesse e ampliando em 50% caso estejam, de tal forma que gere como saida a matriz imFat2(imagem 8)


imFat1 = rgb2gray(im3);
for i=1:size(imFat1,1)
  for j=1:size(imFat1,2)
    if((imFat1(i,j)>40) && (imFat1(i,j)<110))
      imFat1(i,j)=200; %amplia o valor de intensidade do pixel para 1
    else 
      imFat1(i,j)=50; %reduz o valor de intensidade do pixel para 0
    endif
  endfor
  endfor

figure('Name', 'Fatiamento de niveis de intensidade');
imshow(imFat1)
imwrite(imFat1, '');

%fatiamento de niveis de intensidade 2
imFat2 = rgb2gray(im3);
figure('Name', 'Fatiamento de niveis de intensidade');
imhist(uint8(imFat2))
for i=1:size(imFat2,1)
  for j=1:size(imFat2,2)
    if((imFat2(i,j)>100) && (imFat2(i,j)<170))
      imFat2(i,j)*=1.5; %amplia o valor de intensidade do pixel para 50%
    else 
      imFat2(i,j)*=0.3; %reduz o valor de intensidade do pixel para 70%
    endif
  endfor
endfor
figure('Name', 'Fatiamento de niveis de intensidade');
imshow(imFat2)
imwrite(imFat2, '');

