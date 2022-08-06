pkg load image %carrega o pacote image (toolbox pdi)

close all %fecha todas as janelas
clear all %apaga todas as variÃ¡veis

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
imwrite(uint8(imDegrade),'E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\imDegrade.jpg');

%%%%%%% APLICANDO EFEITO DEGRADE NA IMAGEM LENA.JPG

imLena = imread('E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\lenaColor.jpg');
figure('Name', 'Imagem Lena original colorida')
imshow(imLena)

imLena = rgb2gray(imLena);

figure('Name', 'Imagem Lena original')
imshow(imLena)
imwrite(imLena,'E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\Lena.jpg');


valor = -256; %metade da quantidade de coluans da matriz 
for i=1:size(imLena,2) 
  imLena2(:,i) = imLena(:,i)+(++valor); %atribui a todas as linhas da matriz (:), em cada coluna i, o valor de (i-1)
end


figure('Name', 'Imagem Lena com degrade')
imshow(imLena2)
imwrite(imLena2,'E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\LenaDegrade.jpg');


%%%%%%%%%%%%%%%%%%% grãos de soja

im = imread('E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\soja.jpg');
figure('Name','Imagem original: soja')
imshow(im)

imCinza = rgb2gray(im);
figure('Name','Imagem original: soja cinza')
imshow(imCinza)

figure('Name','Histograma imagem soja');
imhist(imCinza)



imwrite(semente,'E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\sojaLim1.jpg');

     

figure('Name','Máscara imagem Soja')
imshow(result)

imwrite(result,'E:\EAJ\2019\PDI\Aulas\Aula 4-Fundamentos\sojaLim.jpg');



toc(t)