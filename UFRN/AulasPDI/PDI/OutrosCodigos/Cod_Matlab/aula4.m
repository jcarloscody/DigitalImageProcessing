close all
clear all
im = imread('c:\imagens\lena.jpg');
f = rgb2gray(im);
figure(1)
imshow(f);

imPB126 = zeros(size(f,2), size(f,1)); 
imPB50 = zeros(size(f,2), size(f,1)); 
imPB180 = zeros(size(f,2), size(f,1)); 

%código de limiarização
%limiar: 126
for i=1:size(f,1)
    for j=1:size(f,2)
        if (f(i,j)<=126)
            imPB126(i,j) = 0;
        else
            imPB126(i,j) = 1;
        end
    end
end

figure(2)
imshow(imPB126, [0 1]);
imwrite(imPB126,'c:\imagens\imPB126.jpg');

%limiar: 50
for i=1:size(f,1)
    for j=1:size(f,2)
        if (f(i,j)<=50)
            imPB50(i,j) = 0;
        else
            imPB50(i,j) = 1;
        end
    end
end

figure(3)
imshow(imPB50, [0 1]);
imwrite(imPB50,'c:\imagens\imPB50.jpg');

%limiar: 180
for i=1:size(f,1)
    for j=1:size(f,2)
        if (f(i,j)<=180)
            imPB180(i,j) = 0;
        else
            imPB180(i,j) = 1;
        end
    end
end

figure(4)
imshow(imPB180, [0 1]);
imwrite(imPB180,'c:\imagens\imPB180.jpg');

%negativo
imNeg = 255-f;
figure(5)
imshow(uint8(imNeg));
imwrite(imNeg,'c:\imagens\imNeg.jpg');
