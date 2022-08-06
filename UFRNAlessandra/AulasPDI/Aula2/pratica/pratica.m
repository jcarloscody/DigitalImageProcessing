clear all
close all

imagemPreta = uint8(zeros(15,15));
imagemPreta;

figure('Name','Imagem Preta');
imshow(imagemPreta);

imagemPretaOLHO(:,:) = imagemPreta(:,:);

for l=4:5
  for c=5:6
    imagemPretaOLHO(l,c) = 255;
    imagemPretaOLHO(l,c+6) = 255;     
  endfor
endfor


figure('Name','Imagem Preta - Olho');
imshow(imagemPretaOLHO);

imagemPretaOlho = imagemPretaOLHO;

for l=9:13
  for c=4:13
    if(l==10)
      imagemPretaOlho(l,c+1) = 255;
      imagemPretaOlho(l,13) = 0;
      imagemPretaOlho(l,14) = 0;
      continue;
    endif
    if(l==11)
      imagemPretaOlho(l,c+1) = 255;
      imagemPretaOlho(l,12) = 0;
      imagemPretaOlho(l,13) = 0;
      continue;
    endif
    if(l==12)
      imagemPretaOlho(l,c+1) = 255;
      imagemPretaOlho(l,11) = 0;
      imagemPretaOlho(l,12) = 0;
      continue;
    endif
    if(l==13)
      imagemPretaOlho(l,c+1) = 255;
      imagemPretaOlho(l,10) = 0;
      imagemPretaOlho(l,11) = 0;
      continue;
    endif
    imagemPretaOlho(l,c+1) = 255;
  endfor
endfor

figure('Name','Imagem Preta - boca');
imshow(imagemPretaOlho);


colorida(:,:,1) = imagemPretaOlho(:,:);
colorida(:,:,2) = imagemPretaOlho(:,:);
colorida(:,:,3) = imagemPretaOlho(:,:);

for c=5:6
  colorida(4,c,2)=0;
  colorida(4,c,3)=0;
endfor


colorida(6,8,3)=255;
colorida(6,9,3)=255;

figure('Name','Imagem colorida 1');
imshow(colorida);

imwrite(colorida,'C:/Users/developer/Documents/JosueCarlosDrive/UFRN/PDI/AulasPDI/Aula2/colorida1.png');

%%%%%%%%%%%%%%%%%%DENTES

for l=9:14
  for c=4:13
    imagemPretaOLHO(l,c) = 255;
  endfor
endfor

figure('Name','Imagem Preta - DENTES');
imshow(imagemPretaOLHO);

coloridaDENTE(:,:,1) = imagemPretaOLHO(:,:);
coloridaDENTE(:,:,2) = imagemPretaOLHO(:,:);
coloridaDENTE(:,:,3) = imagemPretaOLHO(:,:);

for c=5:6
  coloridaDENTE(4,c,2)=0;
  coloridaDENTE(4,c,3)=0;
endfor


coloridaDENTE(6,8,3)=255;
coloridaDENTE(6,9,3)=255;

figure('Name','Imagem colorida - DENTES');
imshow(coloridaDENTE);

for l=11:12
  for c=4:2:12
    coloridaDENTE(l,c,1) = 0;
    coloridaDENTE(l,c,2) = 0;
    coloridaDENTE(l,c,3) = 0;
    
  endfor
endfor

figure('Name','Imagem colorida - DENTES');
imshow(coloridaDENTE);

imwrite(coloridaDENTE,'C:/Users/developer/Documents/JosueCarlosDrive/UFRN/PDI/AulasPDI/Aula2/DENTESCOLORIDAS.png');
for l=9:10
  for c=4:13    
    if(l==9)
      coloridaDENTE(l+4,c,1) = 142;
      coloridaDENTE(l+4,c,2) = 57;
      coloridaDENTE(l+4,c,3) = 57;
      coloridaDENTE(l+5,c,1) = 142;
      coloridaDENTE(l+5,c,2) = 57;
      coloridaDENTE(l+5,c,3) = 57;
   endif
    coloridaDENTE(l,c,1) = 142;
    coloridaDENTE(l,c,2) = 57;
    coloridaDENTE(l,c,3) = 57;
  endfor
endfor

coloridaDENTE(11,5,1) = 126;
coloridaDENTE(11,5,2) = 126;
coloridaDENTE(11,5,3) = 126;
coloridaDENTE(12,5,1) = 126;
coloridaDENTE(12,5,2) = 126;
coloridaDENTE(12,5,3) = 126;


for l=1:size(coloridaDENTE,1)
  for c=1:size(coloridaDENTE,2 )
    if(coloridaDENTE(l,c)==0)
          coloridaDENTE(l,c,1) = 205;
    coloridaDENTE(l,c,2) = 133;
    coloridaDENTE(l,c,3) = 63;
   endif
  endfor
endfor


figure('Name','Imagem colorida - FINAL');
imshow(coloridaDENTE);
imwrite(coloridaDENTE,'C:/Users/developer/Documents/JosueCarlosDrive/UFRN/PDI/AulasPDI/Aula2/COLORIDAFINAL.png');