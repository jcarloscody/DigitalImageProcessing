pkg load image

clear 
close

im = imread('C:\Users\developer\Documents\JosueCarlosDrive\UFRN\PDI\AulasPDI');

figure('Name', 'mulher em negativo');
imshow(im)



roi = imread('C:\Users\developer\Documents\JosueCarlosDrive\UFRN\PDI\AulasPDI');

figure('Name', 'regiao de interesse');
imshow(roi)

##Transformar a imagem roi na imagem binária roiBW(imagem 2), considerando 1-branco e 0-preto
## (nao utilizar a funcao im2bw do octave ) e mostrar em outra janela com o titulo regiao de interesse - ROI

roiBW = zeros(size(roi, 1), size(roi,2));
roiBW(roi>126) = 1;

figure('Name', 'regiao de interesse - ROI');
imshow(roiBW) #como ela é um double vc conseguirá ver



##
##Aplicar uma operação aritmética na imagem original, utilizando a imagemm roiBW como mascara,
##de tal forma que gere a imagem imOpArit contendo a mulher somente na área interna da circunferencia
##, e mostrar em outra janela com o título   - opercao aritmetria


##imOpArit(:,:,1) = im(:,:,1) .* roiBW(:,:); 
##imOpArit(:,:,2) = im(:,:,2) .* roiBW(:,:); 
##imOpArit(:,:,3) = im(:,:,3) .* roiBW(:,:); 

imOpArit = im .* roiBW;
figure('Name', 'operacao aritmetria');
imshow(imOpArit)

##ler a imagem flores.jpg na variavel imBackG(imagem4)
imBackG = imread('C:\Users\developer\Documents\JosueCarlosDrive\UFRN\PDI\AulasPDI');
figure('Name', 'flores');
imshow(imBackG);


##Aplicar a uniao (operacao com conjuntos) entre as imagens imOpArit e imBackG, de tal forma
##que gere a imagem imOperConj contendo  a sobreposicao das imagens (img5), e mostrar em outra janela 
##com o titulo - opercaoes com conjunto - uniao 

imOperConj = max(imOpArit, imBackG);  #ele retornar o pixel maximo de um dois dois valors da img 
figure('Name', 'opercaoes com conjunto - uniao ');
imshow(imBackG);




##Elaborar um negativo da imagem imOperConj (operacao ponto a ponto) de tal forma que gere a imagem imOperP2P
##(imagem 6) , e mostrar em outra janela com o titulo - operacao ponto a ponto - negativo.
% o negativo consiste na imagem que eu quero, invertida em termos de intensidade, ou seja, se tenho intensidade 0 então no negativo fica 255

imOperP2P = 255 - imOperConj;
figure('Name', 'operacao ponto a ponto - negativo');
imshow(imOperP2P);



##
##Elaborar o espelhamento horizontal da imagem imOperP2P(transformacao geometrica) de tal forma que gere a imagem
##imTGeo (imagem 7) e mostrar em outra janela como o titulo - transformacoa geometrica - espelhamento horizontal.

##totalColunas = size(imOperP2P,2);
##for j=1:size(imOperP2P,2);
##  imTGeo(:,totalColunas,:) = imOperP2P(:,j,:);
##  totalColunas--;
##endfor

for j=1:size(imOperP2P,2);
  imTGeo(:,j,:) = imOperP2P(:,size(imOperP2P,2)+1-j,:);
  totalColunas--;
endfor

##for j=size(imOperP2P,2):-1:1;  %decremento de for
##  imTGeo(:,j,:) = imOperP2P(:,j+1-size(imOperP2P,2),:);
##  totalColunas--;
##endfor

figure('Name', 'transformacoa geometrica - espelhamento horizontal.');
imshow(imTGeo);

##
##Manipular as imagens existentes de tal forma que seja gerada a imagem imSaida (imagem8)
##e mostrar em outra janela com o titulo - operacoes matriciais - imagem final 

for i=1:size(im,1) # a professora fez com apenas um for e estava dando pau
  for j=1:size(im,2)
    if(roiBW(i,j)==1)
      imSaida(i,size(im,2)-j+1,:) = 255-im(:,j,:);
    else
      imSaida(i,size(im,2)-j+1,:) = imBackG(:,j,:);
    endif
  endfor
endfor

figure('Name', 'operacoes matriciais - imagem final');
imshow(imSaida);


