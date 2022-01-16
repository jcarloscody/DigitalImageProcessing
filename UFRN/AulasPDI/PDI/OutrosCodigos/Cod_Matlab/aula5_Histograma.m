clear all
close all

im = imread('C:\Alessandra\EAJ\2015.2\PDI\Imagens\graosEscuros.jpg');
img = rgb2gray(im);
figure(1)
imshow(img)

%plota o histograma utilizando a função imhist
figure(2)
imhist(img)

%plota o histograma utilizando a função bar
h = imhist(img); %vetor com os valores a serem plotados no histograma
figure(3)
%bar(h)
plot(h)
axis([0 255 0 max(h)])
set(gca, 'xtick', 0:50:255)
set(gca, 'ytick', 0:100:max(h))

g = histeq(img, 256);
figure(4)
imshow(g)
figure(5)
imhist(g)


