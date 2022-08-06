pkg load image
clear all
close all

t = tic;

im = imread('E:\EAJ\2019\PDI\Aulas\Aula 9-Dominio Espacial\dolar2.jpg');
img = rgb2gray(im);
figure('Name', 'Imagem original');
imshow(im)
figure('Name', 'Imagem original em tons de cinza');
imshow(img)

% fatiamento de bits
% criando as matrizes vazias
img1 = img2 = img3 = img4 = img5 = img6 = img7 = img8 = zeros(size(img,1), size(img,2));
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

% reconstrói a imagem com todos os valores 1's dos bits 7 e 8
im7e8 = max(img7,img8); %operador lógico OU 
imSaida = imDif = zeros(size(img,1), size(img,2), 3);
for i=1:size(img,1)
   for j=1:size(img,2)
      if(im7e8(i,j)==1)
        imSaida(i,j,:) = img(i,j,:);
      else
        imDif(i,j,:) = img(i,j,:);      
      end
   end
end
imSaida = uint8(imSaida);
imDif = uint8(imDif);
figure('Name','Reconstrução utilizando os planos de bits 7 e 8');
imshow(imSaida)
imwrite(imSaida,'E:\EAJ\2019\PDI\Aulas\Aula 9-Dominio Espacial\imSaida.jpg');
figure('Name','Imagem Diferença');
imshow(imDif)
imwrite(imDif,'E:\EAJ\2019\PDI\Aulas\Aula 9-Dominio Espacial\imDif.jpg');

toc(c)