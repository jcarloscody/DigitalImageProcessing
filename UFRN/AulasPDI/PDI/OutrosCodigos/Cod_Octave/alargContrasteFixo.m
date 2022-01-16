clear all
close all

pkg load image

im = imread('D:\EAJ\2017.1\PDI\imagens\AlargCont.jpg');
img = rgb2gray(im);
figure(1)
imshow(img)

%alargamento de contraste
nova = img;
for i=1:size(nova,1)
  for j=1:size(nova,2)
    if(img(i,j)>=150)
      if (img(i,j)+60)<255
        nova(i,j) = img(i,j)+60;
      else
        nova(i,j) = 255;
      end
     else
      if(img(i,j)-60)>0
         nova(i,j) = img(i,j)-60;
      else
         nova(i,j) = 0;
      end
    end
  end
end

figure(2)
imshow(nova)
