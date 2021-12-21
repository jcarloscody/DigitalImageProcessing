pkg load image

close all
clear all



####ELABORAR UM ALGORITMO QUE LEIA A IMAGEM GRAOS.JPG E APLIQUE O ALARGAMENTO DE CONTRASTE DESTA IMAGE, GERANDO A IMAGEM 
####GRAOSAC.JPG. OBS>NO PROCEDIMENOT DE ALARGAMENTO DE CONTRASTEA ESCALA DE INTENSIDADE DA IMAGEM -MIN MAX- É MODIFICADA -ALARGADA-
####PARA 0 255 E OS VALRS DOS PIXEL COM BAIOX  CONSTRASTE SAO PROPORCIONALMERTE MODIFICADOS  ARPA A NOVA ESCALA

%alargamento de contraste

im = imread();
imCinza = rgb2gray(im);
figure('Name','Imagem Original: graos');
imshow(imCinza);
figure('Name','Histogrma');
imhist(imCinza);

%escala para alargamento de contraste
menor = min(min(imCinza));
maior = max(max(imCinza));
escala = double(maior-menor)/255;
vet = zeros(1,256); %VETOR de 255 posicoes 
vet(1) = menor;

for i=2:256
  vet(i)  = vet(i-1) + escala;
endfor

%aplicando o alargamento de contraste
%busca o valor mais proximo de pixel e substitui pelo indice de vetor (0-255)
imAC = imCinza;
for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    %imAC(i,j)=max(find(vet<=imCinza(i,j)));
    procurando = imCinza(i,j);
    for x=1:size(vet,2)
      if (vet(x)>=procurando)
        imAC(i,j) = x;
        break;
      endif
    endfor
    endfor
  endfor

  figure('Name','Imagem ');
imshow(uint8(imAC));
figure('Name','Histogrma');
imhist(imAC,'');