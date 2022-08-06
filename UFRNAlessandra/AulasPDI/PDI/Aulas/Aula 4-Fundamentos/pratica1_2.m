clear all
close all

pkg load image
cont = 0;
im = zeros(256,100);
for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) = cont;
    end
    cont++;
    end
    
    figure(1)
    imshow(im)
