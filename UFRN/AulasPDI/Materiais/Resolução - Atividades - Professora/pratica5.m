
pkg load image

clear all
close all

original = imread('D:\EAJ\2020\20202\PDI\Aulas\Aula 5-Interpolacao\Lena.jpg'); 
figure('Name','Imagem Original') %abre uma janela
imshow(original) %exibe a imagem na janela aberta

cinza = rgb2gray(original); %transforma para escalas de cinza
imwrite(cinza, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 5-Interpolacao\cinza.jpg');

% Reduza as coordenadas da imagem cinza em 50% e escreva como Peq.jpg (peq);
% a imagem está sendo reduzida em 75%
x=1;
for i=1:2:size(cinza,1)
    y=1;
    for j=1:2:size(cinza,2)
        peq(x,y) = cinza(i,j);
        y=y+1;
    end
    x=x+1;
end
figure('Name','Imagem Reduzida (25%)')
imshow(peq)
imwrite(peq, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 5-Interpolacao\peq.jpg');

% Amplie a imagem peq utilizando o método do vizinho mais próximo e escreva como vizP.jpg (vizp);
% inserindo pixels de peq
imAmpliada = zeros(size(cinza,1), size(cinza,2));
x=1;
for i=1:size(peq,1)
    y=1;
    for j=1:size(peq,2)
        imAmpliada(x,y) = peq(i,j);
        y=y+2;
    end
    x=x+2;
end
imAmpliada = uint8(imAmpliada);
figure('Name','Imagem Ampliada')
imshow(imAmpliada)
imwrite(imAmpliada, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 5-Interpolacao\imAmpliada.jpg');

% vizinhos mais próximos por linha zerada
vizP = imAmpliada;
for i=2:2:size(vizP,1)
  for j=2:2:size(vizP,2)-1
    vizP(i,j) = vizP(i-1,j-1);
    vizP(i,j+1) = vizP(i-1,j+1);
  end
end
figure('Name','Imagem Ampliada - Vizinho mais próximo 1')
imshow(vizP)

%vizinhos mais próximos nas linhas não zeradas (alternadas)
for i=1:size(vizP,1)
  for j=2:size(vizP,2)
    if(vizP(i,j) == 0)
      vizP(i,j) = vizP(i,j-1);
    end
  end
end
figure('Name','Imagem Ampliada - Vizinho mais próximo 2')
imshow(vizP)
imwrite(vizP, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 5-Interpolacao\vizP.jpg');

% inserindo pixels do vizinho mais próximo
% na primeira coluna...
vizP2 = vizP;
for i=2:size(vizP2,1)
  if(vizP2(i,1) == 0)
     vizP2(i,1) = vizP2(i-1,1);
  end
end
figure('Name','Imagem Ampliada - Vizinho mais próximo 3')
imshow(vizP2)

imwrite(vizP, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 5-Interpolacao\vizP.jpg');

% interpolação bilinear por linha zerada
imBilinear = double(imAmpliada);
for i=2:2:size(imBilinear,1)-1
  for j=2:2:size(imBilinear,2)-1
    imBilinear(i,j) = (imBilinear(i-1,j-1)+imBilinear(i-1,j+1)+imBilinear(i+1,j-1)+imBilinear(i+1,j+1))/4;
    imBilinear(i,j+1) = (imBilinear(i-1,j)+imBilinear(i+1,j))/2;
  end
end
figure('Name','Imagem Ampliada - Bilinear 1')
imshow(uint8(imBilinear))

%interpolação bilinear nas linhas não zeradas (alternadas)
for i=1:size(imBilinear,1)
  for j=2:size(imBilinear,2)-1
    if(imBilinear(i,j) == 0)
      imBilinear(i,j) = uint8((imBilinear(i,j-1)+imBilinear(i,j+1))/2);
    end
  end
end
figure('Name','Imagem Ampliada - Bilinear 2')
imshow(uint8(imBilinear))


% inserindo pixels de interpolação bilinear
% na última linha e última colunas...
for i=2:size(imBilinear,1)-1
  if(imBilinear(i,1) == 0)
     imBilinear(i,1) = uint8((imBilinear(i-1,j)+imBilinear(i+1,j))/2);
  end
end
imBilinear = uint8(imBilinear);
figure('Name','Imagem Ampliada - Bilinear 3')
imshow(imBilinear)

imwrite(imBilinear, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 5-Interpolacao\bilinear.jpg');
