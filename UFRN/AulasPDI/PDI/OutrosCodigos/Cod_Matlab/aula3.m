close all
clear all
im = imread('c:\imagens\lena.jpg');
f = rgb2gray(im);
figure(1)
imshow(f);

%rotação de 90 graus na imagem Lena
im90 = zeros(size(f,2), size(f,1)); % como esta matriz receberá a imagem rotacionada, 
% o tamanho dela já será linhas = colunas da original e colunas = linhas da
% original.
size(f)

for i=1:size(im90,1)
    for j=1:size(im90,2)
        im90(i,j) = f((size(f,2)-j)+1,i);
    end
end

figure(2)
imshow(uint8(im90));
imwrite(im90,'c:\imagens\im90.jpg');

%rotação de 180 graus na imagem Lena
im180 = zeros(size(f,1), size(f,2)); 

for i=1:size(f,1)
    for j=1:size(f,2)
        im180(i,j) = f((size(f,2)-i)+1,(size(f,2)-j)+1);
    end
end

figure(3)
imshow(uint8(im180));
imwrite(im180,'c:\imagens\im180.jpg');

%espelhamento horizontal na imagem Lena
imEspH = zeros(size(f,1), size(f,2)); 

for j=1:size(f,1)
    imEspH(:,j) = f(:,(size(f,2)-j)+1);
end

figure(4)
imshow(uint8(imEspH));
imwrite(imEspH,'c:\imagens\imEspH.jpg');

%espelhamento vertical na imagem Lena
imEspV = zeros(size(f,1), size(f,2)); 

for i=1:size(f,1)
    imEspV(i,:) = f((size(f,1)-i)+1,:);
end

figure(5)
imshow(uint8(imEspV));
imwrite(imEspV,'c:\imagens\imEspV.jpg');
