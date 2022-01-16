pkg load image

clear all
close all

%imagem Lena
im = imread('E:\EAJ\2019\PDI\Aulas\Aula 10-Filtragem\lena.jpg');
f1 = rgb2gray(im);
figure('Name','Original')
imshow(f1);

%preenchimento com zeros
f2 = zeros(size(f1,1)+6,size(f1,2)+6);
f2(4:size(f2,1)-3, 4:size(f2,2)-3) = f1(:,:);

g = zeros(size(f2,1),size(f2,2));

% pesos w
% filtro passa-baixa: m�scara 1/25
w = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];

for x=3:size(f2,1)-2
    for y=3:size(f2,2)-2
        g(x,y) = (w(1,1)*f2(x-2,y-2) + w(1,2)*f2(x-2,y-1) + w(1,3)*f2(x-2,y) + w(1,4)*f2(x-2,y+1) + w(1,5)*f2(x-2,y+2) + ...
                w(2,1)*f2(x-1,y-2) + w(2,2)*f2(x-1,y-1) + w(2,3)*f2(x-1,y) + w(2,4)*f2(x-1,y+1) + w(2,5)*f2(x-1,y+2) + ...
                w(3,1)*f2(x,y-2) + w(3,2)*f2(x,y-1) + w(3,3)*f2(x,y) + w(3,4)*f2(x,y+1) + w(3,5)*f2(x,y+2) + ...
                w(4,1)*f2(x+1,y-2) + w(4,2)*f2(x+1,y-1) + w(4,3)*f2(x+1,y) + w(4,4)*f2(x+1,y+1) + w(4,5)*f2(x+1,y+2) + ...
                w(5,1)*f2(x+2,y-2) + w(5,2)*f2(x+2,y-1) + w(5,3)*f2(x+2,y) + w(5,4)*f2(x+2,y+1) + w(5,5)*f2(x+2,y+2))/25;
    end
end

g2(:,:) = g(3:size(g,1)-6, 3:size(g,2)-6);
figure('Name','Passa-baixa')
imshow(g2, [min(min(g2)) max(max(g2))])

imwrite(uint8(g2),'E:\EAJ\2019\PDI\Aulas\Aula 10-Filtragem\lenaSuavizada.jpg');
