close all
clear all

pkg load image


original = imread('C:/Users/developer/Documents/Repositorios/DigitalImageProcessing/UFRN/AulasPDI/aula4/aula4exercicio.jpeg');
figure('Name', 'Original');
imshow(original)

###TRANSFORMANDO A IMAGEM EM BINARIO COM FUNCAO
##originalBW2 = im2bw(original);
##figure('Name', 'OriginalBW binaria ');%mostrando na forma binaria
##imshow(originalBW2); %colocando um escalonamento de 0-1

originalBW2 = uint8(zeros(size(original,1), size(original,2)));
originalBW2(original>126) = 1;

figure('Name','Imagem binária 3');
imshow(originalBW2, [0 1]);





##7. Mostrar, em intensidades de cinza diferentes, os objetos individuais da imagem conforme 
##Imagem3. Para este passo, observe as informações a seguir:
primeiroErro = 1;%flag - primeiro erro de vizinhos com rotulos diferentes encontrado
rotulosIguais = 0;
r = 1; %inidice do vetor rotulos iguais


rotulo = 40; %rotulo inicial
imRotulo = originalBW2; %imagem copia para armazenar os rotulos

##imRotulo = zeros(size(originalBW2,1), size(originalBW2,2));

##Procedimento a ser seguido pelo algoritmo:
##? Se p = 0 então verifica o próximo pixel;
##? Se p =1, examina r e t
for i=2:size(originalBW2,1)
  for j=2:size(originalBW2,2)
    if originalBW2(i,j)==1 % se o pixel é =1 - foreground, examina os vizinhos de e da esquerda
      
      %Se (r = 0 e t = 0) então rotula p com novo rótulo; ------   r(esquerda)=0 e t(top)=0
      if((originalBW2(i-1,j)==0) && (originalBW2(i,j-1)==0)) %se os vizinhos forem pixeis de background, o pixel recebe
        rotulo += 5;%novo rotulo (soma de 5 em 5 para aumentar a diferença visual entre as intensidades)
        imRotulo(i,j) = rotulo;
        
## Se (r = 1(se o vizinho da esquerda foi rotulado) e t = 0 (e o de cima nao foi rotulado)) - rouba o rotulo da esquerda 
##ou (r = 0 (se o vizinho da esquerda nao foi rotulado) e t = 1 (se o vizinho de cima foi rotulado)) - rouba o rotulo de cima 
      else
        if((originalBW2(i-1,j)==1) && (originalBW2(i,j-1)==0))%se o vizinho de cima for pixel de foreground, o pixel recebe
          imRotulo(i,j) = imRotulo(i-1,j);
        else
          if((originalBW2(i-1,j)==0) && (originalBW2(i,j-1)==1))%se o vizinho de esquerda for pixel de foreground, o pixel recebe
            imRotulo(i,j) = imRotulo(i,j-1);
  
  
##Se (r = 1 e t = 1) e possuem o mesmo rótulo então rotula p com este rótulo;
          else
            if(((originalBW2(i-1,j)==1) && (originalBW2(i,j-1)==1)) && (originalBW2(i-1,j)==originalBW2(i,j-1)))%se ambos os vizinhos forem pixels de foreground e tiverem o mesmo rotulo, o pixel recebe o rotulo do seus vizinhos
              imRotulo(i,j) = imRotulo(i-1,j);
  
  
##? Se (r = 1 e t = 1) e possuem rótulos diferentes então rotula p com um dos rótulos e armazena ambos os 
##rótulos, que são diferentes mas que marcam uma mesma região (equivalências de rótulos) e, portanto, 
##deveriam ser iguais, para posterior correção de erro
            else
              if(((originalBW2(i-1,j)==1) && (originalBW2(i,j-1)==1)) && (imRotulo(i-1,j)!=imRotulo(i,j-1)))%se ambos os vizinhos forem pixels de foreground e tiverem rotulo diferentes, o pixel recebe o rotulo de um do nesse caso, o de cima
                imRotulo(i,j) = imRotulo(i-1,j);
                
                %guardando erro
                eq1 = imRotulo(i-1, j); %o erro é registrado - visinho de esquerda com rotulo errado
                eq2 = imRotulo(i, j-1);%o erro é registrado - visinho de top com rotulo errado
                
                %......tratando erro - 
                #busca no vetor se ja foi armazenado esse erro (dois vizinhos com rotulos diferentes)
                ultimaLinha = size(rotulosIguais,1);
                ultimaColuna = size(rotulosIguais,2);
                [l1,c1] = find(rotulosIguais==eq1); #busca o 1º elemento e retorna sua coordenada (linha, coluna)
                [l2,c2] = find(rotulosIguais==eq2); #busca o 2º elemento e retorna sua coordenada (linha, coluna)
                if((isempty(l1)) && (isempty(l2))) #nao achou nenhum dos elementos (coordenadas vazia)
                  if(primeiroErro) #a nova linha é a primeira
                    rotulosIguais(ultimaLinha,1) = eq1;#insere o primeiro rotulo errado na 1º linha 
                    rotulosIguais(ultimaLinha,2) = eq2;# insere o primeio rotulo errado na 1º linha
                    primeiroErro = 0;#marca flag com false
                  else # a nova linha nao é a primeira
                    rotulosIguais(ultimaLinha+1,1) = eq1;#insere o primeiro rotulo errado na proxima linha 
                    rotulosIguais(ultimaLinha+1,2) = eq2;# insere o primeio rotulo errado na proxima linha
                  endif
                else 
                  if ((!isempty(l1)) && (isempty(l2))) #achou o 1º elemento, insere o 2º elemento na linha
                      rotulosIguais(l1, ultimaColuna+1) = eq2;
                  else
                    if ((isempty(l1)) && (!isempty(l2))) #achou o 1º elemento, insere o 2º elemento na linha
                      rotulosIguais(l2, ultimaColuna+1) = eq1;
                    endif
                  endif
                endif     
              endif
            endif
          endif
        endif
      endif
    endif
  endfor
endfor
 

#retirar erros de equivalencia de rotulos previamente armazenadas
for(i=2:size(imRotulo,1))
  for(j=2:size(imRotulo,2))
    if(imRotulo(i,j)!=0)#se o pixel nao for de background
      #encontre a ocorrencia (coordenada) onde o pixel tem o valor de um rotulo errado
      [l,c] = find(imRotulo(i,j)==rotulosIguais);
      if(!isempty(l))#se encontrar, substituio valor do pixel pelo valor da primeira coluna da linha correspondente
        imRotulo(i,j) = rotulosIguais(l,1);
      endif
    endif
  endfor
endfor



#retorna valores unicos da primeira dimensao
qtdRegioes = size(unique(imRotulo),1)-1;#-1 para desconsiderar o fundo
imRotulo = uint8(imRotulo);
figure('Name', 'Imagem Rotulada 2');
imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))]);


title(strcat('Quantidade de regioes (foreground): ', int2str(qtdRegioes)));






##qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
##imRotulo = uint8(imRotulo);
##figure('Name','Imagem Rotulada 2')
##imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
###imwrite(imRotulo, 'D:\EAJ\2020\20202\PDI\Aulas\Aula 3 - Fundamentos e relacoes\imRotulo.jpg');
##
##title(strcat('Quantidade de Regioes (foreground): ',int2str(qtdRegioes)))



#figure('Name', 'Imagem de Rotulo');



%funcao [x,y] = find() -> busca um valor e retorna sua coordenada
%funcao isempty(x) - verifica se esta vazio