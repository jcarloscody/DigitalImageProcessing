clear all
close all

%Correlação
%imagem Lena
im = imread('c:\imagens\lena.jpg');
f = rgb2gray(im);
figure(1)
imshow(f);

%preenchimento com zeros
f2 = zeros(size(f,1)+4,size(f,2)+4);
f2(3:size(f2,1)-2, 3:size(f2,2)-2) = f(:,:);
figure(2)
imshow(f2, [min(min(f2)) max(max(f2))]);

g = zeros(size(f2,1),size(f2,2));

%pesos w
w = [1 2 3; 4 5 6; 7 8 9];

for x=2:size(f2,1)-1
    for y=2:size(f2,2)-1
        g(x,y) = w(1,1)*f2(x-1,y-1) + w(1,2)*f2(x-1,y) + w(1,3)*f2(x-1,y+1) + ...
                w(2,1)*f2(x,y-1) + w(2,2)*f2(x,y) + w(2,3)*f2(x,y+1) + ...
                w(3,1)*f2(x+1,y-1) + w(3,2)*f2(x+1,y) + w(3,3)*f2(x+1,y+1);
    end
end

g2(:,:) = g(3:size(g,1)-3, 3:size(g,2)-3);
figure(2)
imshow(g, [min(min(g)) max(max(g))])
figure(3)
imshow(g2, [min(min(g2)) max(max(g2))])
