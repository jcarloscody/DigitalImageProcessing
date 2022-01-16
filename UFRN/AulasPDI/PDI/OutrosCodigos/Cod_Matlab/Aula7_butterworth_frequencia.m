% Script de teste de filtros de butterworth na frequencia

% Carga da imagem original
disp('Leitura da imagem do disco');
brain = imread('D:\PDI\Aulas\Aula 9-Dominio Espacial\tomografia.jpg');

% Calculando a DFT da imagem original
disp('Calculando a DFT da imagem original');
B = fft2(brain);
Bv = fftshift(log(abs(B)+1));
Bv = Bv / max(Bv(:));

% Definindo o filtro passa-baixas
disp('Definindo o filtro passa-baixas');
[m,n] = size(brain);
Pb = baixas(100, 2, m, n);
Pbv = Pb / max(Pb(:));

% Definindo o filtro passa-altas
disp('Definindo filtro passa-altas');
Pa = altas(150, 2, m, n);
Pav = Pa / max(Pa(:));

% Filtrando com passa-baixas
disp('Filtrando com passa-baixas');
Rb = uint8(B) .* uint8(Pb);
Rbv = log(abs(Rb)+1);
Rbv = Rbv / max(Rbv(:));

% Obtendo imagem filtrada por passa-baixas
disp('Obtendo imagem filtrada por passa-baixas');
pb = real(ifft2(Rb));
pb = pb / max(pb(:));

% Filtrando com passa-altas
disp('filtrando com passa-altas');
Ra = B .* Pa;
Rav = log(abs(Ra)+1);
Rav = Rav / max(Rav(:));

% Obtendo imagem filtrada por passa-altas
disp('Obtendo imagem filtrada por passa-altas');
pa = real(ifft2(Ra));
pa = pa / max(pa(:));

% Exibindo as Imagens
disp('Exibindo as Imagens');
figure(1);
set(1,'Name','Imagem Original');
imshow(brain);

figure(2);
set(2,'Name','DFT da imagem Original');
imshow(Bv);
imwrite(Bv, 'DFT-brain.jpg');

figure(3);
set(3,'Name','Filtro passa-baixas');
imshow(Pbv);
imwrite(Pbv, 'baixas.jpg');

figure(4);
set(4,'Name','Filtro passa-altas');
imshow(Pav);
imwrite(Pav, 'altas.jpg');

figure(5);
set(5,'Name','Imagem filtrada por passa-baixas');
imshow(pb);
imwrite(pb, 'res-baixas.jpg');

figure(6);
set(6,'Name','Imagem filtrada por passa-altas');
imshow(pa);
imwrite(pa, 'res-altas.jpg');