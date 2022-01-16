clear all %limpa as variáveis da memória
close all %fecha todas as janelas abertas

original = imread('C:\Imagens\Lena.jpg'); %lê uma imagem no caminho indicado e armazena na variável "original"
figure(1) %abre uma janela
imshow(original) %exibe a imagem na janela aberta

cinza = rgb2gray(original); %transforma para escalas de cinza

% Reduza a imagem cinza em 50% e escreva como Peq.jpg (peq);
x=1;
for i=1:2:size(cinza,1)
    y=1;
    for j=1:2:size(cinza,2)
        peq(x,y) = cinza(i,j);
        y=y+1;
    end
    x=x+1;
end
figure(2)
imshow(peq)

imwrite(peq, 'C:\Imagens\peq.jpg');

%Amplie a imagem peq utilizando o método do vizinho mais próximo e escreva como vizP.jpg (vizp);
% inserindo pixels de peq
vizP = zeros(size(cinza,1), size(cinza,2));
x=1;
for i=1:size(peq,1)
    y=1;
    for j=1:size(peq,2)
        vizP(x,y) = peq(i,j);
        y=y+2;
    end
    x=x+2;
end
figure(3)
imshow(vizP, [0 255])

% inserindo pixels do vizinho mais próximo
for i=1:size(vizP,1)
    for j=2:size(vizP,2)
        if(vizP(i,j) == 0)
            vizP(i,j) = vizP(i,j-1);
        end
    end
end
figure(4)
imshow(vizP, [0 255])



imwrite(vizP, 'C:\Imagens\vizP.jpg');




