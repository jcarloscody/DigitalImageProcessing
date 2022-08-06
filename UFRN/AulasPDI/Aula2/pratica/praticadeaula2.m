#clear all      apaga todas as variaveis
#close all         fecha todas as janelas
#pkg load image;    sobe o pacote de processamento de imagem


im2 = zeros(20,20);  #uint8(zeros(20,20))
im2
size(im2)
#fazendo uma linha na vertical
for i=1:size(im2,1) #faz um loop para mudar a intensidade de cada pixel
  for k=6:15
    im2(i,k)=40;
  end
end
im2


figure( 1) #para ver a imagem, primeiro a gente abre uma figura
imshow(im2)#e pede para mostrar

#fazendo uma linha na horizontal
for i=6:15
  for k=1:size(im2,2)
    im2(i,k) = 126;
  end
 end

im2

figure(2)
imshow(im2)


#est� aparecendo tudo branco pq uma variavel matricial ela vem como um double, � necess�rio passar para inteiro
im2 = uint8(im2) #passando a matriz para o lado inteiro da for�a, insigh de 8 bits, dentro dessa variavel so cabe 0-255
im2

figure(3)
imshow(im2)


#vamos escrever no disco
#imwrite(im2, 'C:\Users\josue\OneDrive\Documentos\Repositorios\estudos\DigitalImageProcessing\UFRN\AulasPDI\Aula2\img\imagemaula2-1.jpg');
#o algoritmo de compress�o do jpg vai transformar numa imagem, por�m vai sair um pouco nebulosa, sem ser pura

#imwrite(im2, 'C:\Users\developer\Documents\JosueCarlosDrive\UFRN\PDI\imagemaula2-1_png.png'); #o png responde melhor


#vamos ler aqui as imagens salvas
#im3_jpg = imread('C:\Users\josue\OneDrive\Documentos\Repositorios\estudos\DigitalImageProcessing\UFRN\AulasPDI\Aula2\img\imagemaula2-1.jpg');
#im3_png = imread('C:\Users\josue\OneDrive\Documentos\Repositorios\estudos\DigitalImageProcessing\UFRN\AulasPDI\Aula2\img\imagemaula2-1_png.png');



#pintando de azul a figura im2, linha 1 coluna 6.
#teremos que transformar a matriz de 1 canal em 3. declaramos uma variavel
im2Color(:,:,1) = im2(:,:) #faremos atribui��o direta, que a variavel em todas as linhas/colunas no 1 canal as linhas/colunas da variavel im2
im2Color(:,:,2) = im2(:,:) #2 canal com im2
im2Color(:,:,3) = im2(:,:) #3 com im2

#1 canal red, 2 canal green, 3 canal blue   rgb

for i=1:size(im2Color,1)
  for j=1:5
    im2Color(i,j,1) = 10; #r
    im2Color(i,j,2) = 10; #g
    im2Color(i,j,3) = 210; #b
  endfor
endfor

figure(4)
imshow(im2Color)



for i=16:20
  for j=16:20
    im2Color(i,j,1) = 230; #r
    im2Color(i,j,2) = 0; #g
    im2Color(i,j,3) = 0; #b
  endfor
endfor


figure(5)
imshow(im2Color)


figure(6)
imshow(im2Color(:,:,1))

figure(7)
imshow(im2Color(:,:,2))

figure(8)
imshow(im2Color(:,:,3))
