clear all
close all

original = imread('C:\Imagens\Lena.jpg'); %lê uma imagem no caminho indicado e armazena na variável "original"
figure(1) %abre uma janela
imshow(original) %exibe a imagem na janela aberta

cinza = rgb2gray(original); %transforma para escalas de cinza

%preenchimento com zeros
f = zeros(size(cinza,1)+4,size(cinza,2)+4);
f(3:size(f,1)-2, 3:size(f,2)-2)=cinza(:,:);


figure(2)
imshow(f, [min(min(f)) max(max(f))])

g = zeros(size(f,1), size(f,2));

%pesos w
%filtro derivativo - Sobel (bordas horizontais)
w = [-1 -2 -1; 0 0 0; 1 2 1];


for x=2:size(f,1)-1
    for y=2:size(f,2)-1
        g(x,y) =w(1,1)*f(x-1,y-1) + w(1,2)*f(x-1,y) + w(1,3)*f(x-1,y+1) + ...
                w(2,1)*f(x,y-1) + w(2,2)*f(x,y) + w(2,3)*f(x,y+1) + ...
                w(3,1)*f(x+1,y-1) + w(3,2)*f(x+1,y) + w(3,3)*f(x+1,y+1);
    end
end

%cortando área excedente
g1=g(3:size(g,1)-2, 3:size(g,2)-2);

figure(3)
imshow(g, [min(min(g)) max(max(g))])


%detector de altas frequências
g2 = 255-g1;
figure(4)
imshow(g2, [min(min(g2)) max(max(g2))])


%realce de altas frequências
g3 = uint8(double(cinza)+double(g1));
figure(5)
imshow(g3, [min(min(g3)) max(max(g3))])
