clear all
close all

%carrega a imagem
I = imread('c:\imagens\football.jpg');
f = I(:,:,1); %canal R
figure(1)
imshow(f)
[M, N] = size(f);

%cria as matrizes contendo as coordenadas u e v nas mesmas dimensões da
%imagem
[u,v]=freqspace([2*M 2*N], 'meshgrid');

%define os parâmtros do filtro, no caso, de Butterworth rejeita-faixa
W=0.1; n=1; D0=.7;

%%%%%%% construção da função de transferência
% cria uma matriz que contém o D(u,v)
D=sqrt(u.^2 +v.^2);

%monta a função de transferência
H=1./(1+((D*W)./(D.^2-D0.^2)).^(2*n));

%%%%%%%%%%% Filtragem no domínio da frequência
H = fftshift(H);
F = fft2(f,2*M, 2*N);
G = H.*F;
g=real(ifft2(G));
g=g(1:M, 1:N);

figure(1)
surfl(fftshift(H));
shading interp
colormap copper

figure(2)
subplot(2,2,1); imshow(f); title('Imagem de entrada');
subplot(2,2,2); imshow(real(g)); title('Imagem filtrada');



