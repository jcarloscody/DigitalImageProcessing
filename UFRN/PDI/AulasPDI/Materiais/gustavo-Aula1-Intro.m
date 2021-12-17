close all 
%"Cole all" fecha todas as figuras em aberto;
clear all 
%"clear all" apaga todas as variáveis do espaço;

% Lembrete: Sem o ponto e virgula o Octace ecoa(printa) o comando;

im = imread('ponto.jpg'); 
% imread = comando de leitura da imagem;

figure (1)
% figure (n) = (sem ponto e virgula) Gera uma janela de imagem aonde uma figura pode ser impressa;
imshow(im) 
% imshow(x) = (sem ponto e virgula) imprime a imagem;

im 
% Nome da váriavel (sem ponto e virgula) imprime a matriz;
% Caso a foto seja colorida, esse comando ira imprimir as matrizes nos 3 canais;
% Seguindo o sistema RGB (1 - red, 2- green, 3- blue);

size (im) 
% Função "size" imprime o tamanho da matriz.


for i = 1:size(im,1)
  for j = 1:size (im,2)
    if (im (i,j) < 100)
      im (i,j) = 70;
    end
  end
end
% Laço (For): Comando de repetição;
% im (i,j) = 70 -> Deixa o pixel com uma coloração cinza escuro;

figure (2)
% figure (n) = (sem ponto e virgula) Gera uma janela de imagem aonde uma figura pode ser impressa;
imshow(im) 
% imshow(x) = (sem ponto e virgula) imprime a imagem;

for i = 1:size(im,1)
  for j = 1:size (im,2)
    if (im (i,j) < 100)
      im (i,j) = 150;
    end
  end
end
% Laço (For): Comando de repetição;
% im (i,j) = 150 -> Deixa o pixel com uma coloração cinza claro;

figure (3)
% figure (n) = (sem ponto e virgula) Gera uma janela de imagem aonde uma figura pode ser impressa;
imshow(im) 
% imshow(x) = (sem ponto e virgula) imprime a imagem na ultima figura aberta;
% Caso não haja uma figura aberta, ele abri a primeira e os proximos printes são feitos nela;

%---------------------------------------------------------------------------------------------------

im2 = zeros(20,20); 
% zeros(x,y) = cria uma imagem toda preta;
% Os parametros da função "Zeros" representam as metricas da imagem;

im2

for i=1:size(im2,1) 
  % Para todas as linhas 1 até a quantidade maxima de linhas (im,1);
  for j=6:15 
    % Nas colunas de 6 até 15
    im2(i,j) = 255; 
    % Nessas coordenas insira a intensidade 255
  end
end

im2
figure (4)
imshow(im2)

for i=6:15
  % Nas linhas de 6 até 15
  for j=1:size(im2,2)
    % Para todas as colunas 1 até a quantidade maxima de linhas (im,2);
    im2(i,j) = 90;
    % Nessas coordenas insira a intensidade 90
  end
end


im2
figure (5)
imshow(im2)

im2 = uint8(im2)
% Natualmente o octave entende que os pixels possuem um valor double de intensidade
% Graças a isso valores de cinza não são vistos;
% Para corrigir essa falha a imagem tem que ser alterada para pixels inteiros de 8bits(256 valores);

figure (6)
imshow(im2)

% imwrite = grava a imagem x em um endereço desejado no disco: 
imwrite(im2,'F:\Mat_Exclusivo-TADS\1. Desenvolvimento de algoritmos\PDI\1 - Pratica - Primeiros Testes\figure6.jpg');
% Em um formato definido como JPG;
imwrite(im2,'F:\Mat_Exclusivo-TADS\1. Desenvolvimento de algoritmos\PDI\1 - Pratica - Primeiros Testes\figure6.png');
% Em um formato definido como PNG;
