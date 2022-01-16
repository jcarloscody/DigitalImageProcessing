clear all
close all

im = imread('C:\Alessandra\EAJ\2015.2\PDI\Imagens\lena.jpg');
img = rgb2gray(im);
figure(1)
imshow(img)

% fatiamento de bits
img1 = uint8(zeros(size(img,1), size(img,2)));
img2 = zeros(size(img,1), size(img,2));
img3 = zeros(size(img,1), size(img,2));
img4 = zeros(size(img,1), size(img,2));
img5 = zeros(size(img,1), size(img,2));
img6 = zeros(size(img,1), size(img,2));
img7 = zeros(size(img,1), size(img,2));
img8 = zeros(size(img,1), size(img,2));
for i=1:size(img,1)
    for j=1:size(img,2)
        byte = dec2bin(img(i,j),8);
        img1(i,j) = str2num(byte(1));
        img2(i,j) = str2num(byte(2));
        img3(i,j) = str2num(byte(3));
        img4(i,j) = str2num(byte(4));
        img5(i,j) = str2num(byte(5));
        img6(i,j) = str2num(byte(6));
        img7(i,j) = str2num(byte(7));
        img8(i,j) = str2num(byte(8));
    end
end

figure(2)
imshow(img1, [0 1])
figure(3)
imshow(img2, [0 1])
figure(4)
imshow(img3, [0 1])
figure(5)
imshow(img4, [0 1])
figure(6)
imshow(img5, [0 1])
figure(7)
imshow(img6, [0 1])
figure(8)
imshow(img7, [0 1])
figure(9)
imshow(img8, [0 1])

