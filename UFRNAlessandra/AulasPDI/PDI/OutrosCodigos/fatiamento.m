pkg load image
clear all
close all

im = imread('E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\dolar.jpg');
img = rgb2gray(im);
figure(1)
imshow(img)

% fatiamento de bits
% criando as matrizes vazias
img1 = zeros(size(img,1), size(img,2));
img2 = zeros(size(img,1), size(img,2));
img3 = zeros(size(img,1), size(img,2));
img4 = zeros(size(img,1), size(img,2));
img5 = zeros(size(img,1), size(img,2));
img6 = zeros(size(img,1), size(img,2));
img7 = zeros(size(img,1), size(img,2));
img8 = zeros(size(img,1), size(img,2));
% dividindo o valor de intensidade de cada pixel em 8 bits
for i=1:size(img,1)
    for j=1:size(img,2)
        byte = dec2bin(img(i,j),8); % decimal para binário
        img8(i,j) = str2num(byte(1));
        img7(i,j) = str2num(byte(2));
        img6(i,j) = str2num(byte(3));
        img5(i,j) = str2num(byte(4));
        img4(i,j) = str2num(byte(5));
        img3(i,j) = str2num(byte(6));
        img2(i,j) = str2num(byte(7));
        img1(i,j) = str2num(byte(8));
    end
end

figure('Name','Decomposição, plano de bits 1');
imshow(img1, [0 1])
figure('Name','Decomposição, plano de bits 2');
imshow(img2, [0 1])
figure('Name','Decomposição, plano de bits 3');
imshow(img3, [0 1])
figure('Name','Decomposição, plano de bits 4');
imshow(img4, [0 1])
figure('Name','Decomposição, plano de bits 5');
imshow(img5, [0 1])
figure('Name','Decomposição, plano de bits 6');
imshow(img6, [0 1])
figure('Name','Decomposição, plano de bits 7');
imshow(img7, [0 1])
figure('Name','Decomposição, plano de bits 8');
imshow(img8, [0 1])

im7e8 = max(max(max(img7,img8),img6),img5); %operador lógico OU
imSaida = zeros(size(img,1), size(img,2));
for i=1:size(img,1)
   for j=1:size(img,2)
      if(im7e8(i,j)==1)
        imSaida(i,j) = img(i,j);
      end
   end
end
figure('Name','Reconstrução utilizando os planos de bits 7 e 8');
imshow(imSaida)
imwrite(imSaida,'E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\imSaida.jpg');

imDif = zeros(size(img,1), size(img,2));
for i=1:size(img,1)
   for j=1:size(img,2)
     if(imSaida(i,j)==0)
       imDif(i,j) = img(i,j);
     end
   end
end
figure('Name','Imagem Diferença');
imshow(imDif)
imwrite(imDif,'E:\EAJ\2018\PDI\Aulas\Aula 7-espacialEFiltragem\imDif.jpg');
