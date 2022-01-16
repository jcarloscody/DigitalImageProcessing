pkg load image

clear all
close all

im = imread('E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\soja.jpg');
figure('Name','Imagem original: soja')
imshow(im)

imCinza = rgb2gray(im);
figure('Name','Imagem original: soja cinza')
imshow(imCinza)

figure('Name','Histograma imagem soja');
imhist(imCinza)
hr = imhist(imCinza);

%pegar vale
R = imCinza;
hr1 = hr;
for i=1:255 %size(hr,1)-1
  if(hr1(i)>hr1(i+1))
    hr1(i+1) = hr1(i);
  end
end
figure(8)
plot(hr1)

hr2 = hr;
for i=256:-1:2 %size(hr,1)-1
  if(hr2(i)>hr2(i-1))
    hr2(i-1) = hr2(i);
  end
end
figure(9)
plot(hr2)
hr2

%identificação de valores únicos
[valores_unicos1, ind_unicos1] = unique(hr2);
%identificação de í­ndices de valores repetidos
ind_repetidos1 = setdiff(1:length(hr2), ind_unicos1);
%extraindo valores repetidos
valores_repetidos1 = hr2(ind_repetidos1, 1);
hist_repetidos1(1,:) = valores_repetidos1(:,1);
hist_repetidos1(2,:) = ind_repetidos1(1,:);


tamanho = size(hist_repetidos1,2);
soma = 0;
cont = 1;
qtd(1,cont) = 1; %inicializando
qtd(2,cont) = 1; %inicializando

for i=1:tamanho
  clear i;
  i = sum(qtd(2,:));
  x = hist_repetidos1(1,i);
  soma = 0;
  for j=i:(tamanho-1)
    if(hist_repetidos1(1,j)==x)
      soma = soma + 1;
    else
      qtd(1,cont) = x;
      qtd(2,cont) = soma;
      cont = cont + 1;
      break;
    end
    if(j>=(tamanho-1)) %última contagem
      qtd(1,cont) = x; %eixo x do histograma
      qtd(2,cont) = soma;
    end
  end
end 

aux = qtd;
%clear qtd
qtd

semente = R;

%qtd = horzcat(aux,qtd);
picos = unique(qtd(2,:));
picos = sort(picos,'descend');

menor = max(max(hr));
for i=picos(2):picos(1)
  if(hr(i)<menor)
    menor = hr(i);
    corte = i;
  end
end
  
%fundo = R;
semente = R;

semente(R<corte) = 255;
semente(R>=corte) = 0;

%semente(R<150) = 255;
%semente(R>=150) = 0;
imwrite(semente,'E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\sojaLim1.jpg');

     
result1 = im(:,:,1);
result1(semente==255)=255;
result2 = im(:,:,2);
result2(semente==255)=255;
result3 = im(:,:,3);
result3(semente==255)=255;
result(:,:,1) = result1;
result(:,:,2) = result2;
result(:,:,3) = result3;

figure(12)
imshow(result)

imwrite(result,'E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\sojaLim.jpg');
