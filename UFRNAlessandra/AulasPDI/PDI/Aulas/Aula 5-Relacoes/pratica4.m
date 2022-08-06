pkg load image

clear all
close all
im = imread('E:\EAJ\2019\PDI\Aulas\Aula 5-Relacoes\objetos.jpg');

figure('Name','Imagem Original')
imshow(im)

imBW = uint8(zeros(size(im,1), size(im,2)));

%for i=1:size(im,1)
%  for j=1:size(im,2)
%    if (im(i,j)>126)
%      imBW(i,j) = 1;
%    else
%      imBW(i,j)=0;
%    end
%  end
%end

imBW(im>126)=1; %mesmo código anterior, mas por atribuição direta

% função que executa o mesmo código anterior  -  passar para imagem binaria 
%imBW = im2bw(im);


figure('Name','Imagem Binaria')
imshow(imBW)
%imwrite(imBW, 'E:\EAJ\2019\PDI\Aulas\Aula 5-Relacoes\objetosBW.jpg');

rotulo = 40; %rótulo inicial
rotulosIguais = 0;
r = 1; %indice do vetor rotulos Iguais
imRotulo = imBW; %imagem cópia para armazenar os rotulos
for(i=2:size(imBW,1))
  for(j=2:size(imBW,2))
    if(imBW(i,j)==1)
      if((imBW(i-1,j)==0)&&(imBW(i,j-1)==0))
        rotulo+=5; % novo rotulo (soma de 5 em 5 para aumentar a diferença visual entre as intensidades)
        %rotulo+=30; % novo rotulo (soma de 5 em 5 para aumentar a diferença visual entre as intensidades)
        imRotulo(i,j)=rotulo;
      else
        if((imBW(i-1,j)==1)&&(imBW(i,j-1)==0))
          imRotulo(i,j)=imRotulo(i-1,j);
        else
          if((imBW(i-1,j)==0)&&(imBW(i,j-1)==1))
            imRotulo(i,j)=imRotulo(i,j-1);
          else
            if(((imBW(i-1,j)==1)&&(imBW(i,j-1)==1))&&(imRotulo(i-1,j)==imRotulo(i,j-1)))
              imRotulo(i,j)=imRotulo(i-1,j);
            else
              if(((imBW(i-1,j)==1)&&(imBW(i,j-1)==1))&&(imRotulo(i-1,j)!=imRotulo(i,j-1)))
                %os vizinhos são rotulados e os rotulos são diferentes...
                imRotulo(i,j)=imRotulo(i-1,j); %insere o rotulo de um dos vizinhos
                eq1 = imRotulo(i-1,j); 
                eq2 = imRotulo(i,j-1);
                
                % tratamento de erro...
                % buscar no vetor se já foi armazenada essa equivalência
                ultimaLinha = size(rotulosIguais,1);
                ultimaColuna = size(rotulosIguais,2);
                [l1,c1]=find(rotulosIguais==eq1); %busca o 1o elemento e retorna coordenada
                [l2,c2]=find(rotulosIguais==eq2); %busca o 2o elemento e retorna coordenada
                if ((isempty(l1))&&(isempty(l2))) %não achou nenhum dos elementos, coordenadas vazias
                  rotulosIguais(ultimaLinha+1,1) = eq1;
                  rotulosIguais(ultimaLinha+1,2) = eq2;
                else
                  if ((!isempty(l1))&&(isempty(l2))) %não achou o 1o elemento
                    rotulosIguais(l1,ultimaColuna+1) = eq2;
                  else
                    if ((isempty(l1))&&(!isempty(l2))) %não achou o 2o elemento
                      rotulosIguais(l2,ultimaColuna+1) = eq1;
                    end
                  end
                end
                
                
              end  
            end
          end
        end
      end
    end
  end
end

matrizComErros = imRotulo;

figure('Name','Imagem Rotulada com erros')
imshow(uint8(imRotulo))
qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
title(strcat('Quantidade de Regioes (foreground): ',int2str(qtdRegioes)))

%retirar erros de equivalências de rótulos previamente armazenadas
for(i=2:size(imRotulo,1))
  for(j=2:size(imRotulo,2))
    if(imRotulo(i,j)!=0)
      [l,c]=find(rotulosIguais==imRotulo(i,j)); %procura o elemento nos erros
      if(!isempty(l))
        imRotulo(i,j) = rotulosIguais(l,1);
      end
    end
  end
end

qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
imRotulo = uint8(imRotulo);
figure('Name','Imagem Rotulada 2')
imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
%imwrite(imRotulo, 'E:\EAJ\2019\PDI\Aulas\Aula 5-Relacoes\imRotulo.jpg');

title(strcat('Quantidade de Regioes (foreground): ',int2str(qtdRegioes)))