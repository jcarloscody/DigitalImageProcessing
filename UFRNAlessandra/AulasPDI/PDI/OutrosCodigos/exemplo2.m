pkg load image

close all
clear all

A = imread('E:\EAJ\2019\PDI\Imagens\lena.jpg');
A = im2bw(A); % binarização
figure('Name','Imagem Original')
imshow(A)


% Considerando o elemento estruturante quadrado
B = [1 1 1; 1 1 1; 1 1 1];

C = A;
for i=2:size(A,1)-1
  for j=2:size(A,2)-1
    if(A(i,j)==1) %se o pixel central da vizinhança de A = 1, deve ser analizado
      vizA = [A(i-1,j-1) A(i-1,j) A(i-1,j+1);...
            A(i,j-1) A(i,j) A(i,j+1);...
            A(i+1,j-1) A(i+1,j) A(i+1,j+1)];
      if (sum(sum(vizA==B))!=9) % se nem todos os pixels são iguais entre a vizinhança de A e B
        C(i,j)=0;
      end    
    end
  end
end

figure('Name','Imagem Erodida')
imshow(C)

final = A-C;
figure('Name','Imagem Final - Bordas')
imshow(final)

%C = uint8(C);
final2 = uint8(zeros(size(C,1), size(C,2), 3));

%final2(:,:,1)(C==1)=255;

imwrite(final2,'E:\EAJ\2019\PDI\Aulas\Aula 8-Morfologia\img_lincolnFinal1.jpg');

