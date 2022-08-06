close all
clear all

im = imread('D:\EAJ\2017.1\PDI\aulas\aula 5\praia.jpg');
figure(1)
imshow(im)

% alargamento de contraste
% escala R
menor = min(min(im));
maior = max(max(im));
escalaR = double(maior(1) - menor(1))/255;
escalaG = double(maior(2) - menor(2))/255;
escalaB = double(maior(3) - menor(3))/255;
vetR = zeros(1,256);
vetG = zeros(1,256);
vetB = zeros(1,256);
vetR(1) = menor(1);
vetG(1) = menor(2);
vetB(1) = menor(3);
for i=2:256
    vetR(i) = vetR(i-1) + escalaR;
    vetG(i) = vetG(i-1) + escalaG;
    vetB(i) = vetB(i-1) + escalaB;
end

% alargando o contraste da imagem colorida
imR = im(:,:,1);
for i=1:size(im,1)
    for j=1:size(im,2)
        k=1;
        while (double(imR(i,j))>vetR(k))
            k=k+1;
            if (k>256)
                k=256;
                break;
            end
        end
        imR(i,j) = k;
    end
end
imG = im(:,:,1);
for i=1:size(im,1)
    for j=1:size(im,2)
        k=1;
        while (double(imG(i,j))>vetG(k))
            k=k+1;
            if (k>256)
                k=256;
                break;
            end
        end
        imG(i,j) = k;
    end
end
imB = im(:,:,3);
for i=1:size(im,1)
    for j=1:size(im,2)
        k=1;
        while (double(imB(i,j))>vetB(k))
            k=k+1;
            if (k>256)
                k=256;
                break;
            end
        end
        imB(i,j) = k;
    end
end
imCont(:,:,1) = imR(:,:);
imCont(:,:,2) = imG(:,:);
imCont(:,:,3) = imB(:,:);
figure(2)
imshow(imCont)