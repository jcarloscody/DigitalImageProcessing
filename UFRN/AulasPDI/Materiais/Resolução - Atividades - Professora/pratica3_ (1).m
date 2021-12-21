pkg load image

clear all
close all

im = imread('D:\EAJ\2020\20202\PDI\Aulas\Aula 3 - Fundamentos e relacoes\soja.jpg');
figure('Name','Imagem original: soja')
imshow(im)

imagem2 = rgb2gray(im);
figure('Name','Imagem original: soja cinza')
imshow(imagem2)

figure('Name','Histograma imagem soja');
imhist(imagem2)

imagem4 = uint8(zeros(size(imagem2,1), size(imagem2,2)));
imagem4(:,:) = 255;

limiar = 60; %valor fixo para corte do histograma - observação
imagem4(imagem2>limiar) = 0;

%for(i=1:size(imagem2,1))
%  for(j=1:size(imagem2,2))
%    if(imagem2(i,j)>limiar)
%      imagem4(i,j) = 0;
%    end
%  end
%end
figure('Name', 'Segmentação por corte do histograma');
imshow(imagem4)

imagem5 = uint8(zeros(size(imagem4,1), size(imagem4,2), 3));
%{
for(i=1:size(imagem2,1))
  for(j=1:size(imagem2,2))
    if(imagem4(i,j)==0) % é um pixel de foreground (semente)
      imagem5(i,j,:) = im(i,j,:);
    else
      imagem5(i,j,:) = 255;
    end
  end
end

figure('Name','Imagem segmentada');
imshow(imagem5)
%}

imagem6 = uint8(zeros(size(imagem4,1), size(imagem4,2)));
imagem7 = uint8(zeros(size(imagem4,1), size(imagem4,2)));
imagem8 = uint8(zeros(size(imagem4,1), size(imagem4,2)));
imagem6(:,:) = imagem7(:,:) = imagem8(:,:) = 255;

imR = im(:,:,1);
imG = im(:,:,2);
imB = im(:,:,3);

%imR(imagem4==255) = 255;
%imG(imagem4==255) = 255;
%imB(imagem4==255) = 255;

imagem6(imagem4==0) = imR(imagem4==0);
imagem7(imagem4==0) = imG(imagem4==0);
imagem8(imagem4==0) = imB(imagem4==0);

%figure('Name','Imagem segmentada - canal R');
%imshow(imagem6)
%figure('Name','Imagem segmentada - canal G');
%imshow(imagem7)
%figure('Name','Imagem segmentada - canal B');
%imshow(imagem8)

imagem5(:,:,1) = imagem6(:,:);
imagem5(:,:,2) = imagem7(:,:);
imagem5(:,:,3) = imagem8(:,:);

figure('Name','Imagem segmentada');
imshow(imagem5)


% ----------------------------------------------------------------

im2 = imread('D:\EAJ\2020\20202\PDI\Aulas\Aula 3 - Fundamentos e relacoes\objetos1.jpg');

figure('Name','Imagem Original - Objetos PB')
imshow(im2)

imBW = uint8(zeros(size(im2,1), size(im2,2)));

%for(i=1:size(im2,1))
%  for(j=1:size(im2,2))
%    if(im2(i,j)>126)
%      imBW(i,j) = 1;
%    else
%      imBW(i,j) = 0;
%    end
%  end
%end

%figure('Name','Imagem binária');
%imshow(imBW);
%figure('Name','Imagem binária 2');
%imshow(imBW, [0 1]);

%imBW2 = im2bw(im2);
%figure('Name','Imagem binária 4');
%imshow(imBW2);

imBW(im2>126) = 1;

figure('Name','Imagem binária 3');
imshow(imBW, [0 1]);

%controle dos erros
primeiroErro = 1; %flag - primeiro erro de vizinhos com rótulso diferentes encontrado
rotulosIguais = 0;
r = 1; %indice do vetor rotulos Iguais


rotulo = 40; %rótulo inicial
imRotulo = imBW; %imagem cópia para armazenar os rotulos
for(i=2:size(imBW,1))
  for(j=2:size(imBW,2))
    if(imBW(i,j)==1) % Se o pixel é = 1 - foreground, examina os vizinhos de cima e da esquerda
      if((imBW(i-1,j)==0)&&(imBW(i,j-1)==0)) % Se os vizinhos forem pixels de background, o pixel recebe um novo rótulo
        rotulo+=5; % novo rotulo (soma de 5 em 5 para aumentar a diferença visual entre as intensidades)
        imRotulo(i,j)=rotulo;
      else
        if((imBW(i-1,j)==1)&&(imBW(i,j-1)==0)) % Se o vizinho de cima for pixel de foreground, o pixel recebe o rótulo desse vizinho 
          imRotulo(i,j)=imRotulo(i-1,j);
        else
          if((imBW(i-1,j)==0)&&(imBW(i,j-1)==1)) % Se o vizinho da esquerda for pixel de foreground, o pixel recebe o rótulo desse vizinho 
            imRotulo(i,j)=imRotulo(i,j-1);
          else
            if(((imBW(i-1,j)==1)&&(imBW(i,j-1)==1))&&(imRotulo(i-1,j)==imRotulo(i,j-1))) % se ambos os vizinhos de cima e da esquerda 
            % forem pixels de foreground e tiverem o mesmo rótulo, o pixel recebe o rótulo dos seus vizinhos
              imRotulo(i,j)=imRotulo(i-1,j);
            else
              if(((imBW(i-1,j)==1)&&(imBW(i,j-1)==1))&&(imRotulo(i-1,j)!=imRotulo(i,j-1))) % se ambos os vizinhos de cima e da esquerda 
                % forem pixels de foreground e tiverem rótulo diferentes, o pixel recebe o rótulo de um dos seus vizinhos 
                % nesse caso, o de cima
                imRotulo(i,j)=imRotulo(i-1,j); 
                
                %guardando o erro
                eq1 = imRotulo(i-1,j); % o erro é registrado - vizinho da esquerda com rótulo errado
                eq2 = imRotulo(i,j-1); % o erro é registrado - vizinho de cima com rótulo errado
                
                %......
                %-------------------------------------------------------------------------------------
                % tratamento de erro...
                % buscar no vetor se já foi armazenado esse erro (dois vizinhos com rótulos diferentes)
                ultimaLinha = size(rotulosIguais,1);
                ultimaColuna = size(rotulosIguais,2);
                [l1,c1]=find(rotulosIguais==eq1); %busca o 1o elemento e retorna sua coordenada (linha, coluna)
                [l2,c2]=find(rotulosIguais==eq2); %busca o 2o elemento e retorna sua coordenada (linha, coluna)
                if ((isempty(l1))&&(isempty(l2))) %não achou nenhum dos elementos (coordenadas vazias), abre uma nova linha de erros equivalentes
                  if(primeiroErro) % a nova linha é a primeira
                    rotulosIguais(ultimaLinha,1) = eq1; %insere o primeiro rótulo errado na 1a linha, 1a coluna
                    rotulosIguais(ultimaLinha,2) = eq2; %insere o primeiro rótulo errado na 1a linha, 2a coluna
                    primeiroErro = 0; %marca flag com false
                  else % a nova linha não é a primeira
                    rotulosIguais(ultimaLinha+1,1) = eq1; %insere o primeiro rótulo errado na próxima linha, 1a coluna
                    rotulosIguais(ultimaLinha+1,2) = eq2; %insere o primeiro rótulo errado na próxima linha, 2a coluna
                  end
                else
                  if ((!isempty(l1))&&(isempty(l2))) % achou o 1o elemento, insere o 2o elemento na linha do 1o elemento que já foi inserido
                    rotulosIguais(l1,ultimaColuna+1) = eq2;
                  else
                    if ((isempty(l1))&&(!isempty(l2))) % achou o 2o elemento, insere o 1o elemento na linha do 2o elemento que já foi inserido
                      rotulosIguais(l2,ultimaColuna+1) = eq1;
                    end
                  end
                end
                %-------------------------------------------------------------------------------------
                
              end  
            end
          end
        end
      end
    end
  end
end

matrizComErros = imRotulo;
rotulosIguais

figure('Name','Imagem Rotulada com erros')
imshow(uint8(imRotulo))
qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
title(strcat('Quantidade de Regioes (foreground): ',int2str(qtdRegioes)))

%retirar erros de equivalências de rótulos previamente armazenadas
for(i=2:size(imRotulo,1))
  for(j=2:size(imRotulo,2))
    if(imRotulo(i,j)!=0) % se o pixel não for de background
      % encontre a ocorrência (coordenada) onde o pixel tem o valor de um rótulo errado
      [l,c]=find(imRotulo(i,j)==rotulosIguais); 
      if(!isempty(l)) %se encontrar, substitui o valor do pixel pelo valor da primeira coluna da linha com os rótulos errados que são equivalentes
        imRotulo(i,j) = rotulosIguais(l,1);
      end
    end
  end
end

qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
imRotulo = uint8(imRotulo);
figure('Name','Imagem Rotulada 2')
imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
imwrite(imRotulo, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 3 - Fundamentos e relacoes\imRotulo.jpg');

title(strcat('Quantidade de Regioes (foreground): ',int2str(qtdRegioes)))