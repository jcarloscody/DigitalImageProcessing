pkg load image

clear all
close all

original = imread('url');
figure('Name', 'original')
imshow(peq)

cinza = rgb2gray(original); %transforma para escalas de cinza
imwrite(cinza, 'url');

##Reduza as coordenadas da imagem cinza em 50% e escreva como Peq.jpg;
##a imagem está sendo reduzida em 75%

x=1;
for i=1:2:size(cinza,1) %for com incremento de dois
  y=1;
  for j=1:2:size(cinza,2)
    peq(x,y) = cinza(i,j);
    y=y+1;
  endfor
  x=x+1;
endfor

figure('Name', 'Imagem Reduzida (25%)')
imshow(peq)
imwrite(peq, 'url');






##Amplie a imagem peq utilizando o método do vizinho mais próximo e escreva como vizP.jpg;
##inserindo pixels de peq

imAmpliada = zeros(size(cinza,1), size(cinza,2));
x=1;
for i=1:size(cinza,1) %onde está determinando aqui que a linha 1, coluna 2 por exemplo o que deve receber?
  y=1;
  for j=1:size(cinza,2)
    imAmpliada(x,y) = peq(i,j);
    y=y+2;
  endfor
  x=x+2;
endfor

imAmpliada = uint8(imAmpliada);
figure('Name', 'Imagem Ampliada');
imshow(imAmpliada)
imwrite(imAmpliada, 'url');



##
##Interpolar a imagem imAmpliada, utilizando o método do vizinho mais próximo, gerando a imagem imVizProx(imagem com espaços
##vazios=imagem 4 e ampliada=imagem 5);

vizP = imAmpliada;

for i=2:2:size(vizP,1) 
  for j=2:2:size(vizP,2)-1 
    vizP(i,j) = vizP(i-1,j-1);
    vizP(i,j+1) = vizP(i-1,j+1);
  endfor
endfor


figure('Name', 'Imagem Ampliada - vizinho mais proximo 1');
imshow(vizP)


#vizinho mais proximo nas linhas nao zeradas (alternadas)
for i=1:size(vizP,1)  #PODERIA ser alternado de 2 em dois?
  for j=2:size(vizP,2)
    if(vizP(i,j) == 0)
      vizP(i,j) = vizP(i,j-1);
    endif
  endfor
endfor


figure('Name', 'Imagem Ampliada - vizinho mais proximo 2');
imshow(vizP)


#inserindo pixels do vizinho mais proximo na primeira coluna
vizP2 = vizP;

for i=2:size(vizP2,1) 
    if(vizP2(i,1) == 0)
      vizP2(i,1) = vizP2(i-1,1);
    endif
endfor

figure('Name', 'Imagem Ampliada - vizinho mais proximo 3');
imshow(vizP2)


##
##Interpolar a imagem imAmpliada, utilizando o método bilinear, gerando a imagem imBilinear(imagem5);


% interpolação bilinear por linha zeradas
imBilinear = double(imAmpliada);  #qual a finalidade de converter para double?
for i=2:2:size(imBilinear,1)-1
  for j=2:2:size(imBilinear,2)-1
    imBilinear(i,j) = (imBilinear(i-1,j-1) + imBilinear(i-1,j+1) + imBilinear(1+i,j-1) + imBilinear(i+1,j+1))/4;
    imBilinear(i,j+1) = (imBilinear(i-1,j) + imBilinear(i+1,j))/2;
  endfor
endfor

figure('Name', 'Imagem Ampliada - Bilinear #1');
imshow(uint8(imBilinear))




%interpolação bilinear nas linhas não zeradas (Alternadas)
for i=1:size(imBilinear,1)
  for j=2:size(imBilinear,2)-1
    if (imBilinear(i,j)==0)
      imBilinear(i,j) = uint8((imBilinear(i,j-1)+imBilinear(i,j+1))/2);      
    endif
  endfor
endfor
figure('Name', 'Imagem Ampliada - Bilinear #2');
imshow(uint8(imBilinear))



%inserindo pixels de interpolação bilinear na ulima linha e ultima coluna
for i=2:size(imBilinear,1)-1
  if(imBilinear(i,1)==0)
    imBilinear(i,1) = uint8((imBilinear(i-1,j) + imBilinear(i+1,j))/2);
  endif
endfor


figure('Name', 'Imagem Ampliada - Bilinear #3');
imshow(uint8(imBilinear))