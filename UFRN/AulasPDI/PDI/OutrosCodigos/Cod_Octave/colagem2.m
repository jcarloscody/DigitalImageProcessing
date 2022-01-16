clear all
close all

pkg load image

im = imread('C:\imagens\lena.jpg');
emoji = imread('C:\imagens\smile.jpg');

cinza = rgb2gray(emoji);

figure(1);
imshow(cinza);

for i=1:size(emoji,1)
  for j=1:size(emoji,2)
    if(cinza(i,j) < 230)
      im(i+150,j+150,:) = emoji(i,j,:);
    end
  end
end

figure(2);
imshow(im);
