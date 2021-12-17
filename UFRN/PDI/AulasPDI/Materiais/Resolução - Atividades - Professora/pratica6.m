pkg load image

close all
clear all

im = imread('D:\EAJ\2021\2021.2\PDI\Aulas\Aula 6-Morfologia\img_lincoln.jpg');
im = im2bw(im); % binarização
figure('Name','Imagem Original: Lincoln.jpg')
imshow(im)


% Considerando o elemento estruturante quadrado
EE = [1 1 1; 1 1 1; 1 1 1];

imErode = im;
for i=2:size(im,1)-1
  for j=2:size(im,2)-1
    if(im(i,j)==1) %se o pixel central da vizinhança de im for foreground (1), deve ser analizado
      vizIm = [im(i-1,j-1) im(i-1,j) im(i-1,j+1);...
            im(i,j-1) im(i,j) im(i,j+1);...
            im(i+1,j-1) im(i+1,j) im(i+1,j+1)];
      if (sum(sum(vizIm==EE))!=9) % se nem todos os pixels são iguais entre a vizinhança de im e EE
        imErode(i,j)=0;
      end    
    end
  end
end

figure('Name','Imagem Erodida Lincoln')
imshow(imErode)

final = im-imErode;
figure('Name','Imagem Final - Bordas')
imshow(final)

final2 = uint8(zeros(size(final,1), size(final,2), 3));

for i=1:size(imErode,1)
  for j=1:size(imErode,2)
    if(imErode(i,j)==1)
      final2(i,j,:)=255;
    end
    if(final(i,j)==1)
      final2(i,j,1) = 255;
    end
  end
end


figure('Name','Imagem Final - 2')
imshow(final2, [0 255])
imwrite(final2,'D:\EAJ\2021\2021.2\PDI\Aulas\Aula 6-Morfologia\img_lincolnFinal.jpg');

im = imread('D:\EAJ\2021\2021.2\PDI\Aulas\Aula 6-Morfologia\geometrico.jpg');
% binarização
im2 = zeros(size(im,1),size(im,2));
im2(im>126) = 1;
figure('Name','Imagem Original: Geometrico.jpg')
imshow(im2, [0 1])

% -------------- RETIRANDO RUÍDO PRETO - EROSÃO
EE = [0 0 0; 0 0 0; 0 0 0]; % O EE, dentro da forma escolhida (quadrado), possui valores iguais aos valores de frente da imagem
imErode2 = im2;
for i=2:size(im2,1)-1
  for j=2:size(im2,2)-1
    if(im2(i,j)==0) %se o pixel central da vizinhança de im2 for de frente (foreground preto - 0), deve ser analizado
      % se nem todos os pixels são iguais entre a vizinhança de im2 e EE
      if !(im2(i-1,j-1)==EE(1,1) && im2(i-1,j)==EE(1,2) && im2(i-1,j+1)==EE(1,3) ...
        && im2(i,j-1)==EE(2,1) && im2(i,j)==EE(2,2) && im2(i,j+1)==EE(2,3) ...
        && im2(i+1,j-1)==EE(3,1)   && im2(i+1,j)==EE(3,2)   && im2(i+1,j+1)==EE(3,3) )
         imErode2(i,j)=1; % erode o pixel (passa a ser pixel de fundo - background branco - 1)
      end    
    end
  end
end

figure('Name','Imagem Erodida Geometrico - SEM RUÍDOS PRETOS')
imshow(imErode2)

% -------------- RETIRANDO RUÍDO BRANCO - DILATAÇÃO
EE = [0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0]; % EE quadrado 5x5
imDilate = imErode2;
for i=2:size(im2,1)-1
  for j=2:size(im2,2)-1
    if(imErode2(i,j)==EE(2,2)) %se o PC do EE coincidiro com o pixel, ou seja, sem ambos forem foreground, o pixel deve ser analizado
      % dilata os pixel da vizinhança que coincidirem com o EE (estes passam a ser pixel de foreground - 0)
      if(EE(1,1)==0) imDilate(i-2,j-2) = 0; end
      if(EE(1,2)==0) imDilate(i-2,j-1) = 0; end
      if(EE(1,3)==0) imDilate(i-2,j) = 0; end
      if(EE(1,4)==0) imDilate(i-2,j+1) = 0; end
      if(EE(1,5)==0) imDilate(i-2,j+2) = 0; end
      if(EE(2,1)==0) imDilate(i-1,j-2) = 0; end
      if(EE(2,2)==0) imDilate(i-1,j-1) = 0; end
      if(EE(2,3)==0) imDilate(i-1,j) = 0; end
      if(EE(2,4)==0) imDilate(i-1,j+1) = 0; end
      if(EE(2,5)==0) imDilate(i-1,j+2) = 0; end
      if(EE(3,1)==0) imDilate(i,j-2) = 0; end
      if(EE(3,2)==0) imDilate(i,j-1) = 0; end
      if(EE(3,3)==0) imDilate(i,j) = 0; end
      if(EE(3,4)==0) imDilate(i,j+1) = 0; end
      if(EE(3,5)==0) imDilate(i,j+2) = 0; end
      if(EE(4,1)==0) imDilate(i+1,j-2) = 0; end
      if(EE(4,2)==0) imDilate(i+1,j-1) = 0; end
      % if(EE(4,3)==0) imDilate(i+1,j) = 0; end %PC já foi conferido
      if(EE(4,4)==0) imDilate(i+1,j+1) = 0; end
      if(EE(4,5)==0) imDilate(i+1,j+2) = 0; end
      if(EE(5,1)==0) imDilate(i+2,j-2) = 0; end
      if(EE(5,2)==0) imDilate(i+2,j-1) = 0; end
      if(EE(5,3)==0) imDilate(i+2,j) = 0; end
      if(EE(5,4)==0) imDilate(i+2,j+1) = 0; end
      if(EE(5,5)==0) imDilate(i+2,j+2) = 0; end
    end
  end
end

figure('Name','Imagem Dilatada Geometrico - SEM RUÍDOS BRANCOS')
imshow(imDilate)

imwrite(imDilate,'D:\EAJ\2021\2021.2\PDI\Aulas\Aula 6-Morfologia\GeometricoFinal.jpg');
