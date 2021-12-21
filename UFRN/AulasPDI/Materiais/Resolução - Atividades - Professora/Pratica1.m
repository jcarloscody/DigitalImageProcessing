pkg load image %carrega o pacote image (toolbox pdi)

close all %fecha todas as janelas
clear all %apaga todas as variáveis

t = tic; %medição de tempo

%%%%%%% CRIANDO A IMAGEM DEGRADE 

imDegrade = zeros(60, 256); %cria uma matriz 60x256 preenchida com zeros

figure('Name','Imagem zerada') %abre uma nova janela com o tÃ­tulo "Imagem zerada"
imshow(imDegrade) %mostra a imagemna janela aberta

for i=1:size(imDegrade,2) %laço de repetição que começa de 1 e vai até a quantidade de colunas da matriz imDegrade - size(imDegrade,2)
  imDegrade(:,i) = (i-1); %atribui a todas as linhas da matriz (:), em cada coluna i, o valor de (i-1)
end

figure('Name', 'Imagem em degrade uint8')
imshow(uint8(imDegrade))
figure('Name', 'Imagem em degrade double')
imshow(imDegrade, [0 255])
imwrite(uint8(imDegrade),'D:\EAJ\2020\20202\PDI\Aulas\Aula 1-Introd\imDegrade.jpg');

%%%%%%% APLICANDO EFEITO DEGRADE NA IMAGEM LENA.JPG

imLena = imread('D:\EAJ\2020\20202\PDI\Aulas\Aula 1-Introd\Lena_.png');
figure('Name', 'Imagem Lena original colorida')
imshow(imLena)

imLena2 = uint8(zeros(size(imLena,1),size(imLena,2)));


%for i=1:size(imLena,1)
%  for j=1:size(imLena,2) 
%    imLena2(i,j) = 0.3*imLena(i,j,1) +0.59*imLena(i,j,2) +0.11*imLena(i,j,3); 
%  end
%end

%red = im(:,:,1);
%green = im(:,:,2);
%blue = im(:,:,3);
%imCinza = ((red*0.3) + (green*0.59) + (blue*0.11));

imLena2 = rgb2gray(imLena);

figure('Name', 'Imagem Lena cinza')
imshow(imLena2)
imwrite(imLena2,'D:\EAJ\2020\20202\PDI\Aulas\Aula 1-Introd\Lena.jpg');


valor = -256; %metade da quantidade de coluans da matriz 
for i=1:size(imLena,2) 
  saida1(:,i) = imLena(:,i)+(++valor); %atribui a todas as linhas da matriz (:), em cada coluna i, o valor de (i-1)
end


figure('Name', 'Imagem Lena com degrade')
imshow(saida1)
imwrite(saida1,'D:\EAJ\2020\20202\PDI\Aulas\Aula 1-Introd\saida1.jpg');

toc(t)


%%%%%%% SEPARANDO CANAIS DE CORES

t = tic;

% Aumentar o valor de cada pixel da imagem imCinza em 30%. 
% Uint8 não permite que o maior valor ultrapasse 255;
saida2 = imLena2;
%for i=1:size(imLena2,1)
%    for j=1:size(imLena2,2)
%        saida2(i,j) = saida2(i,j)*1.4;
%    end
%end
saida2(:,:) = saida2(:,:)*1.4;
figure(3)
figure('Name','Imagem Saida2');
imshow(saida2)

imwrite(saida2, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 1-Introd\saida2.jpg');

% Diminuir o valor de cada pixel da imagem imCinza em 30%, 
% não permitindo porém que o menor valor seja menor do que 0;
saida3 = imLena2;
%for i=1:size(imLena2,1)
%    for j=1:size(imLena2,2)
%        saida3(i,j) = saida3(i,j)-(saida3(i,j)*0.4);
%    end
%end

%saida3(:,:) = saida3(:,:)-(saida3(:,:)*0.4);
saida3 = saida3-(saida3*0.4);
figure('Name','Imagem Saida3');
imshow(saida3)
sainda3 = uint8(saida3);


imwrite(saida3, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 1-Introd\saida3.jpg');

toc(t)