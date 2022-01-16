pkg load image

close all
clear all
A = imread('D:\EAJ\2017.1\PDI\imagens\lena.jpg');
figure('Name','Imagem Original')
imshow(A,[])
%A = double(A);

%transformada de Fourier
FA = fft2(A);
FA = fftshift(FA);  % a imagem é quase "vazia". Vamos mover o componente do canto superior
                    % esquerdo para o centro da imagem (fftshift) 

%filtro gaussiano
filtro = fspecial('gaussian',size(A),6);
T = fft2(filtro);
T = fftshift(T);  

%filtragem
Afilt = (T.*FA);
Afilt = ifft2(Afilt);
Afilt = fftshift(Afilt);


% Melhorando valores baixos (log) somente para fins de visualização
% Uma imagem complexa não pode ser exibida, por isso é necessária a
% conversão para real (função abs)
% Na imagem resultante, o meio representa a frequência zero e as frequências 
% maiores estão mais afastadas do centro
figure('Name','Filtro Gaussiano')
imagesc(log(1+(filtro)));

figure('Name','Transformada')
imagesc(log(1+(abs(T))));

figure('Name','Imagem Filtrada')
imagesc(log(1+(abs(Afilt))));
