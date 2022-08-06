clear all
close all

im = imread('C:\Alessandra\EAJ\2015.2\PDI\Imagens\AlargCont.jpg');
img = rgb2gray(im);
figure(1)
imshow(img)

%escala para alargamento de contraste
menor = min(min(img));
maior = max(max(img));
escala = double(maior - menor)/255;
vet = zeros(1,256);
vet(1) = menor;
for i=2:256
    vet(i) = vet(i-1) + escala;
end

% alargando o contraste
imA = zeros(size(img,1), size(img,2));
for i=1:size(img,1)
    for j=1:size(img,2)
        k=1;
        while (double(img(i,j))>vet(k))
            k=k+1;
        end
        imA(i,j) = k;
    end
end

figure(2)
imshow(imA, [0 255])

