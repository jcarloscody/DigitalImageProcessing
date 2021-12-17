#subtracao, adjacencia, 
#subtracao, adjacencia, 

a = [1 2 3; 4 5 6; 1 8 1]
b = [1 2 4; 5 8 7; 0 2 5]

c = a - b #subtracao de matrizes de mesmo tamanho. como aqui esta com double, irá aparecer negativos
c

minimoDeCadaColuna = min(a);#min e max retornam vetores
maximoDeCadaColuna = max(a);
menorElementoDaMatriz = min(min(a));
maiorElementoDaMatriz = max(max(a));
 
c = uint8(c)  #os negativos aparecem sendo 0 quando inteiro sem sinal


a = [1 1 1; 2 2 2; 3 3 3];
#colocar 20 onde é 2 sem fazer laços
a(a==2)=20

#travando AULA 40 minutos


original = imread('C:\Users\developer\Documents\JosueCarlosDrive\UFRN\PDI\AulasPDI\img-exercicio1.jpeg');
figure('Name', 'original');
imshow(original)


original(:,:,1) = original(:,:,1) - 255;
original(:,:,3) =  original(:,:,3) - 255;

original(:,:,1) = original(:,:,3) = 0;

mascaraVerde = original(:,:,2);
mascaraVerde(mascaraVerde<100) = 0

original(:,:,2) = mascaraVerde;
figure('Name', 'original');
imshow(mascaraVerde)



#gerando grafico
pkg load image  #precisa importar
figure('Name', 'grafico-mascaraVerde');
imhist(mascaraVerde)

imhist(mascaraVerde)
vetor = imhist(mascaraVerde);
