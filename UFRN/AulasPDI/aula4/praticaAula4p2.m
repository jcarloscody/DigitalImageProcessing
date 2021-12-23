##explicar novamente a vizinhaça de 4 e oito, por com 8 ele encontraria 5  e com 4 encontraria 6
%nao pegou o escalonamento
%se eu faço um im2bw numa imagem, ela aceita intensidade != 0 1

close all
clear all

#unique = dá os valores unicos de uma matriz. retorna n linhas de 1 coluna, 
a = [1 2 50; 20 2 4];
unique(a) %1 2 

##6. Transformar a imagem original (im2) em uma imagem binária (imBW), considerando 1-
##branco e 0-preto (não utilizar a função im2bw do Octave);
##funcao im2bw transforma em binario, mas faremos laços

original = imread('C:/Users/developer/Documents/Repositorios/DigitalImageProcessing/UFRN/AulasPDI/aula4/aula4exercicio.jpeg');
figure('Name', 'Original');
imshow(original)

#TRANSFORMANDO A IMAGEM EM BINARIO COM LOOP
originalBW = uint8( zeros(size(original,1), size(original,2)));
for i=1:size(original,1)
  for j=1>size(original,2)
    if original(i,j)>126;
      originalBW(i,j)=1; %imagem BW - black white, é imagem binaria
     else
      originalBW(i,j)=0;
    endif
  endfor
endfor

#TRANSFORMANDO A IMAGEM EM BINARIO COM ATRIBUICAO DIRETA
originalBW(original>126) = 1;
originalBW(original<126) = 0;

figure('Name', 'OriginalBW');
imshow(originalBW)

figure('Name', 'OriginalBW binaria');%mostrando na forma binaria
imshow(originalBW, [0 1]); %colocando um escalonamento de 0-1


#TRANSFORMANDO A IMAGEM EM BINARIO COM FUNCAO
originalBW2 = im2bw(original);
figure('Name', 'OriginalBW binaria 2');%mostrando na forma binaria
imshow(originalBW2); %colocando um escalonamento de 0-1



##7. Mostrar, em intensidades de cinza diferentes, os objetos individuais da imagem conforme 
##Imagem3. Para este passo, observe as informações a seguir:
primeiroErro = 1;%flag - primeiro erro de vizinhos com rotulos diferentes encontrado
rotulosIguais = 0;
r = 1; %inidice do vetor rotulos iguais


rotulo = 40; %rotulo inicial
imRotulo = originalBW2; %imagem copia para armazenar os rotulos


##Procedimento a ser seguido pelo algoritmo:
##? Se p = 0 então verifica o próximo pixel;
##? Se p =1, examina r e t
for i=1:size(originalBW2,1)
  for j=1:size(originalBW2,2)
    if originalBW2(i,j)==1 % se o pixel é =1 - foreground, examina os vizinhos de e da esquerda
      
      %Se (r = 0 e t = 0) então rotula p com novo rótulo; ------   r(esquerda)=0 e t(top)=0
      if((originalBW2(i-1,j)==0) && (originalBW2(i,j-1)==0)) %se os vizinhos forem pixeis de background, o pixel recebe
        rotulo += 5;%novo rotulo (soma de 5 em 5 para aumentar a diferença visual entre as intensidades)
        imRotulo(i,j) = rotulo;
      else
        if((originalBW2(i-1,j)==1) && (originalBW2(i,j-1)==0))%se o vizinho de cima for pixel de foreground, o pixel recebe
            imRotulo(i,j) = originalBW2(i-1,j);
        else
          if((originalBW2(i-1,j)==0) && (originalBW2(i,j-1)==1))%se o vizinho de esquerda for pixel de foreground, o pixel recebe
              imRotulo(i,j) = originalBW2(i,j-1);
           else
              if(((originalBW2(i-1,j)==1) && (originalBW2(i,j-1)==1)) && (originalBW2(i-1,j)==originalBW2(i,j-1)))%se ambos os vizinhos forem pixels de foreground e tiverem o mesmo rotulo, o pixel recebe o rotulo do seus vizinhos
                  imRotulo(i,j) = originalBW2(i-1,j);
              else
                  if(((originalBW2(i-1,j)==1) && (originalBW2(i,j-1)==1)) && (imRotulo(i-1,j)!=imRotulo(i,j-1)))%se ambos os vizinhos forem pixels de foreground e tiverem rotulo diferentes, o pixel recebe o rotulo de um do nesse caso, o de cima
                    imRotulo(i,j) = imRotulo(i-1,j);
                    
                    %guardando erro
                    eq1 = imRotulo(i-1, j); %o erro é registrado - visinho de esquerda com rotulo errado
                    eq2 = imRotulo(i, j-1);%o erro é registrado - visinho de top com rotulo errado
                    
                    %......tratando erro 
                  endif
              endif
            endif
           endif
          endif
         endif
  endfor
endfor
 
 
 figure('Name', 'Imagem Rotulada com erros');
 imshow(uint8(imRotulo))
 
 qtdRegioes = size(unique(imRotulo),1)-1;#-1 para desconsiderar o fundo
 
 title(strcat('Quantidade de regioes (foreground): ', int2str(qtdRegioes)));
 figure('Name', 'Imagem de Rotulo');
 %imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))]);
 
 
 %funcao [x,y] = find() -> busca um valor e retorna sua coordenada
 %funcao isempty(x) - verifica se esta vazio