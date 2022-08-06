pkg load image %carrega o pacote image (toolbox pdi)

close all %fecha todas as janelas
clear all %apaga todas as vari√°veis

t = tic; %mediÁ„o de tempo

%%%%%%% CRIANDO A IMAGEM DEGRADE 

imDegrade = zeros(60, 256); %cria uma matriz 60x256 preenchida com zeros

figure('Name','Imagem zerada') %abre uma nova janela com o t√≠tulo "Imagem zerada"
imshow(imDegrade) %mostra a imagemna janela aberta
