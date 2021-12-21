pkg load image

clear all
close all
% -------------------------------------------------------------------------
% Introdução = Leitura das imagens de entrada e saida;

input1 = imread('iris.jpg');
% figure('Name','iris')
% imshow(input1)

input2 = imread('mascara.jpg');
figure('Name','mascara')
imshow(input2)

input3 = imread('PDI.jpg');
% figure('Name','PDI')
% imshow(input3)

input4 = imread('Praia.jpg');
%figure('Name','Praia')
%imshow(input4)

output = imread('Saida.jpg');
figure('Name','Saida')
imshow(output)

% -------------------------------------------------------------------------
% 1º Passo = Troca vertical da imagem praia
saida = zeros(400,400,3);
saida = uint8(saida);

saida(:,1:200,:) = input4(:,201:400,:);
saida(:,201:400,:) = input4(:,1:200,:);
figure('Name','Troca');
imshow(saida);

% -------------------------------------------------------------------------
% 2º Passo = Enquadramente invertido

% Colunas
saida(:,10:20,:) = 255 - saida(:, 10:20, :);
saida(:,380:390,:) = 255 - saida(:, 380:390, :);
% Linhas
saida(10:20,:,:) = 255 - saida(10:20, :, :);
saida(380:390,:,:) = 255 - saida(380:390, :, :);
% Colunas 2x 
saida(10:20,10:20,:) = 255 - saida(10:20, 10:20,:);
saida(10:20,380:390,:) = 255 - saida(10:20, 380:390,:);
% Linhas 2x
saida(380:390,10:20,:) = 255 - saida(380:390, 10:20,:);
saida(380:390,380:390,:) = 255 - saida(380:390, 380:390,:);

figure('Name','Enquadramento');
imshow(saida);

% -------------------------------------------------------------------------
% 3º Passo = Aplicação da mascara e suas lacunas

mask = zeros(400,400,3);
mask = uint8(mask);
mask(:,:,:) = saida(:,:,:);
mask(:,:,:) = 0;

for i=1:size(input2,1)
  for j=1:size(input2,2)
    if(input2(i,j) < 100)
       mask(i,j,:) = saida(i,j,:);
    end
    if(input2(i,j) > 240)
       mask(i,j,:) = 255;
    end
    if(input2(i,j) > 190 && input2(i,j) < 250)
       mask(i,j,:) = input1(i,j,:);
    end
  endfor
endfor

saida (:,:,:) = mask(:,:,:);
figure('Name','Lacunas');
imshow(saida);

% -------------------------------------------------------------------------
% 4º Passo = Sobreposição das imagens PDI e Iris

%for i=1:size(saida,1)
%  for j=1:size(saida,2)
%    if(mascara > 100) % PDI
%       input3(i,j,:) = saida(i,j,:);
%   end
%   if(saida(150:260,36:360,:) > 100) % Iris
%       input1(i,j,:) = input3(i,j,:);
%    end
%  endfor
%endfor

%figure('Name','Lacunas');
%imshow(saida);
