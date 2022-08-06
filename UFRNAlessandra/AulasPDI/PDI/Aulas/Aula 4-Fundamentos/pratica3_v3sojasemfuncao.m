pkg load image

clear all
close all

im = imread('D:\EAJ\2017.1\PDI\imagens\soja.jpg');
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

repetidos(1,1)=0;
repetidos(1,2)=0;
i2=1;
for i=1:size(hr2,1)
  elemento = hr2(i); %elemento cujas repetições serão contadas
  achou = 0;
  for j=1:size(repetidos,1)
    if(repetidos(j)==elemento)
      achou = 1;
      break;
    end
  end
  if(achou==0)
    soma = 0;
    for j=1:size(hr2,1)
      if(hr2(j)==elemento)
        soma++;
      end
    end
    repetidos(i2,1)=elemento;
    repetidos(i2,2)=i;
    repetidos(i2,3)=soma;
    i2++;
  end
end

aux = repetidos(:,3);
pico1(1,1) = repetidos(:,1)(repetidos(:,3)==max(aux)); %quantidade de intensidade que mais se repete
aux(aux==max(aux))=0;
pico2(1,1) = repetidos(:,1)(repetidos(:,3)==max(aux)); %quantidade de intensidade que mais se repete


