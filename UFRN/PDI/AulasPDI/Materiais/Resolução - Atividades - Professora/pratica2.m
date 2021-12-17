pkg load image

clear all
close all

im = imread('D:\EAJ\2021\2021.2\PDI\Aulas\Aula 2-Imagens Coloridas\rgb.jpg');
figure('Name','Imagem original: RGB')
imshow(im)

r(:,:) = im(:,:,1);
g(:,:) = im(:,:,2);
b(:,:) = im(:,:,3);

figure('Name','Canal R');
imshow(r)
figure('Name','Canal G');
imshow(g)
figure('Name','Canal B');
imshow(b)

amar = uint8(zeros(size(im,1), size(im,2), size(im,3)));
for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)>100)&&(g(i,j)>100)&&(b(i,j)<100))
      %amar(i,j,:) = im(i,j,:);
      amar(i,j,1) = r(i,j);
      amar(i,j,2) = g(i,j);
      amar(i,j,3) = b(i,j);
    else
      amar(i,j,:) = 255;
    end
  end
end

figure('Name','Canal Amarelo');
imshow(amar)

verm = uint8(zeros(size(im,1), size(im,2), size(im,3)));
for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)>100)&&(g(i,j)<100)&&(b(i,j)<100))
      verm(i,j,:) = im(i,j,:);
    else
      verm(i,j,:) = 255;
    end
  end
end

figure('Name','Canal Vermelho');
imshow(verm)

verd = uint8(zeros(size(im,1), size(im,2), size(im,3)));
for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)<100)&&(g(i,j)>100)&&(b(i,j)<100))
      verd(i,j,:) = im(i,j,:);
    else
      verd(i,j,:) = 255;
    end
  end
end

figure('Name','Canal Verde');
imshow(verd)

rosa = uint8(zeros(size(im,1), size(im,2), size(im,3)));
for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)>100)&&(g(i,j)<100)&&(b(i,j)<100))
      rosa(i,j,1) = 255;
      rosa(i,j,2) = 0;
      rosa(i,j,3) = 255;
    else
      rosa(i,j,:) = im(i,j,:);
    end
  end
end

figure('Name','Gato com flores rosa');
imshow(rosa)

azul = uint8(zeros(size(im,1), size(im,2), size(im,3)));
for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)>160)&&(g(i,j)>160)&&(b(i,j)>160))
      azul(i,j,1) = 0;
      azul(i,j,2) = 126;
      azul(i,j,3) = 255;
    else
      azul(i,j,:) = rosa(i,j,:);
    end
  end
end

figure('Name','Gato sem branco e com azul');
imshow(azul)