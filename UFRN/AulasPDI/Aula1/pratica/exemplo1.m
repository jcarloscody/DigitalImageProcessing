close all
clear all

pkg load image

im = imread('E:\EAJ\2019\PDI\Aulas\Aula 2-Etapas PDI\cores.jpg');
figure(1)
imshow(im)

imR = im(:,:,1);
figure(2)
imshow(imR)

imG = im(:,:,2);
figure(3)
imshow(imG)

imB = im(:,:,3);
figure(4)
imshow(imB)

saida = im;
saida(:,:,:) = 255;
      
for i=1:20
  for j=1:20
    if((imR(i,j)>126)&&(imG(i,j)<126)&&(imB(i,j)<126))
      saida(i,j,:) = im(i,j,:);
    end
  end
end

figure(5)
imshow(saida)

imAmarela = im;
imAmarela(:,:,:) = 255;

for i=1:20
  for j=1:20
    if((imR(i,j)>126)&&(imG(i,j)<126)&&(imB(i,j)<126))
      imAmarela(i,j,3) = 0;
      
    end
  end
end

figure(6)
imshow(imAmarela)



%imwrite(saida,'E:\EAJ\2019\PDI\Imagens\vermelha.jpg');







