clear all
close all
im = imread('c:\imagens\morangos.jpg');

figure(1)
imshow(im);

r = im(:,:,1);
g = im(:,:,2);
b = im(:,:,3);

figure(2)
imshow(r)
figure(3)
imshow(g)
figure(4)
imshow(b)

im2 = im;
im2(:,:,1)= 255;

figure(5)
imshow(im2)

im3 = im;
im3(:,:,3)= 0;

figure(6)
imshow(im3)

im4 = rgb2hsv(im);
figure(7)
imshow(im4)

h = im4(:,:,1);
s = im4(:,:,2);
v = im4(:,:,3);

figure(8)
imshow(h)
figure(9)
imshow(s)
figure(10)
imshow(v)

b2=b;
for i=1:size(b,1)
    for j=1:size(b,2)
        if b(i,j)>70
            b2(i,j)=1;
        else
            b2(i,j)=0;
        end
    end
end
figure(11)
imshow(b2, [0, 1])


b3 = b2;
g2(:,:)=255;
b2(:,:)=255;

im3 = im;
im3(:,:,2)=g2;
im3(:,:,3)=b2;
figure(12)
imshow(im3)

im4 = im;
for i=1:size(im4,1)
    for j=1:size(im4,2)
        if (b3(i,j)==1)
            im4(i,j,1)=255;
            im4(i,j,2)=255;
            im4(i,j,3)=255;
        end
    end
end
figure(13)
imshow(im4)
