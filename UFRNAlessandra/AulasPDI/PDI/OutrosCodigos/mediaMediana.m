pkg load image

close all
clear all

A = imread('E:\EAJ\2019\PDI\Aulas\Aula 8-Morfologia\geometrico.jpg');
figure('Name','Imagem Original')
imshow(A)

%inserindo ruído na imagem
B = imnoise(A,"salt & pepper");
figure('Name','Imagem Original')
imshow(B)
imwrite(B,'E:\EAJ\2019\PDI\Aulas\Aula 8-Morfologia\geometrico2.jpg');

%removendo o ruído pela mediana (ordem 5)
C = B;
for i=2:size(B,1)-1
  for j=2:size(B,2)-1
    vizA = [B(i-1,j-1) B(i-1,j) B(i-1,j+1)...
          B(i,j-1) B(i,j) B(i,j+1)...
          B(i+1,j-1) B(i+1,j) B(i+1,j+1)];
    vizA = sort(vizA, "ascend");
    C(i,j) = vizA(5);
  end
end

figure('Name','Imagem Saída Mediana')
imshow(C)

%removendo o ruído pela média
D = B;
for i=2:size(B,1)-1
  for j=2:size(B,2)-1
    vizA = uint8(vizA);      
    vizA = [B(i-1,j-1) B(i-1,j) B(i-1,j+1)...
          B(i,j-1) B(i,j) B(i,j+1)...
          B(i+1,j-1) B(i+1,j) B(i+1,j+1)];
    vizA = double(vizA);      
    media = (vizA(1) + vizA(2) + ...
    vizA(3) + vizA(4) + vizA(5) +...
    vizA(6) + vizA(7) + vizA(8) + vizA(9))/9;
    vizA
    media
    D(i,j) = uint8(media);
  end
end

figure('Name','Imagem Saída Média')
imshow(D)