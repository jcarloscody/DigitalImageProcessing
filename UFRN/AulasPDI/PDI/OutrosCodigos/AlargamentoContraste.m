
close all
clear all

% Alargamento de constraste
im = imread('E:\EAJ\2019\DIPAS\5.jpg');
imCinza = rgb2gray(im);
figure('Name','Imagem Original: Graos')
imshow(imCinza)
figure('Name','Histograma Graos original')
imhist(imCinza)

%escala para alargamento de contraste
menor = min(min(imCinza));
maior = max(max(imCinza));
escala = double(maior - menor)/255;
vet = zeros(1,256);
vet(1) = menor;
for i=2:256
    vet(i) = vet(i-1) + escala;
end
% aplicando o alargamento de contraste
% busca o valor mais proximo do pixel e substitui pelo indice do vetor [0-255]
imAC = imCinza;
for i=1:size(imCinza,1)
    for j=1:size(imCinza,2)
        %imAC(i,j)=max(find(vet<=imCinza(i,j))); 
        procurado = imCinza(i,j);
        for x=1:size(vet,2)
          if(vet(x)>=procurado)
            imAC(i,j) = x;
            break;
          end
        end
    end
end
figure('Name','Imagem Graos - Alargamento de contraste')
imshow(uint8(imAC))
figure('Name','Histograma Graos - alargamento de contraste')
imhist(uint8(imAC))
imwrite(imAC, 'D:\EAJ\2017.1\PDI\Aulas\Aula 5\graosAC.jpg');

imMask = zeros(size(imAC,1), size(imAC,2));
imMask(imAC>40)=1;
figure('Name','imMask');
imshow(imMask)
se = strel('disk',2);

abertura = imopen(imAC, se);
figure('Name','Abertura')
imshow(uint8(abertura))



