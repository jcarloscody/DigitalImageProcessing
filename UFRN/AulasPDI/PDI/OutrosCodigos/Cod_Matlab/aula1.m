clear all %limpa as variáveis da memória
close all %fecha todas as janelas abertas

original = imread('C:\Imagens\Lena.jpg'); %lê uma imagem no caminho indicado e armazena na variável "original"
figure(1) %abre uma janela
imshow(original) %exibe a imagem na janela aberta

size(original) %mostra no console do matlab o tamanho da imagem

original2 = rgb2gray(original); %Transforma de RGB (colorida) para escalas de cinza (original2)
figure(2) %abre outra janela
imshow(original2) %exibe a imagem em tons de cinza na outra janela

imwrite(original2, 'C:\Imagens\LenaG.jpg');

% Utilizando o comando “for”, aumenta o valor de cada pixel da imagem original2 
%em 30%, não permitindo porém que o maior valor ultrapasse 255;
saida1 = original2;
for i=1:size(original2,1)
    for j=1:size(original2,2)
        novoValor = saida1(i,j)*1.3;
        if (novoValor <= 255)
            saida1(i,j) = novoValor;
        end
    end
end
figure(3)
imshow(saida1)

imwrite(saida1, 'C:\Imagens\saida1.jpg');

%Utilizando o comando “for”, diminua o valor de cada pixel da imagem original2 
%em 30%, não permitindo porém que o menor valor seja menor do que 0;
saida2 = original2;
for i=1:size(original2,1)
    for j=1:size(original2,2)
        novoValor = saida2(i,j)-(saida2(i,j)*0.3);
        if (novoValor >= 0)
            saida2(i,j) = novoValor;
        end
    end
end
figure(4)
imshow(saida2)

imwrite(saida2, 'C:\Imagens\saida2.jpg');
