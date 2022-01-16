pkg load image

clear all 
close all 

escreverSaida = 'E:\EAJ\2019\PDI\Aulas\Revisao prv1\Saida.jpg';
im = imread('E:\EAJ\2019\PDI\Aulas\Revisao prv1\textura.jpg'); 
mas = imread('E:\EAJ\2019\PDI\Aulas\Revisao prv1\mascara.jpg'); 
text = imread('E:\EAJ\2019\PDI\Aulas\Revisao prv1\listras.jpg'); 
%figure('Name','Original') 
%imshow(im) 
%figure('Name','Mascara') 
%imshow(mas) 
%imhist(mas)
%figure('Name','Textura') 
%imshow(text) 

%parâmetros
cor = [160; 80; 240]; %vetor de posições da máscara para aplicação das operações

%limiarização da máscara 
masBW = mas;
for i=1:size(mas,1)
  for j=1:size(mas,2)
    if (mas(i,j)<=50) %bordas das figuras
      masBW(i,j) = 0;
    else
      if (mas(i,j)>=110 && mas(i,j)<140) %fundo
        masBW(i,j) = 120;
      else      
        if (mas(i,j)>=140 && mas(i,j)<220) %fig2
          masBW(i,j) = 160;
        else      
          masBW(i,j) = 240; %fig3
        end
      end
    end
  end
end
figure('Name','Mascara BW') 
imshow(masBW) 

%transformação geométrica - giro 90o anti-horário
nova1 = im;
for i=1:size(mas,1)
  for j=1:size(mas,2)
    nova1(i,j,:) = im(j,i,:);
  end
end
figure('Name','Transformação geométrica') 
imshow(nova1)

%inserindo molduras internas pretas
for i=1:size(mas,1)
  for j=1:size(mas,2)
    if (masBW(i,j)==0) %bordas das figuras
      nova1(i,j,:) = 0;
    end
  end
end

% Negativo
nova2 = nova1;
for i=1:size(mas,1)
  for j=1:size(mas,2)
    if(masBW(i,j)==cor(1))
      nova2(i,j,:) = 255-text(i,j,:);
    end
  end
end
figure('Name','Transformação com conjuntos') 
imshow(nova2)


%transformação ponto a ponto - moldura cima com escurecimento
nova3 = nova2;
for i=1:size(mas,1)
  for j=1:size(mas,2)
    if ((i<=20)) 
      nova3(i,j,:) = nova2(i,j,:)*0.7;
    end
  end
end
figure('Name','operação ponto a ponto') 
imshow(nova3)

%sobreposição
nova4 = nova3;
for i=1:size(mas,1)
  for j=1:size(mas,2)
    if(masBW(i,j)==cor(3))
      nova4(i,j,:) = text(i,j,:);
    end
  end
end
figure('Name','Sobreposição') 
imshow(nova4)

%ASSINATURA
ass = imread('E:\EAJ\2019\PDI\Aulas\Revisao prv1\ass.jpg'); 
figure('Name','Assinatura') 
imshow(ass) 
nova5 = nova4;
x=1;
y=1;
for i=(size(mas,1)-size(ass,1)+1):size(mas,1)
  y=1;
  for j=(size(mas,2)-size(ass,2)+1):size(mas,2)
    if(ass(x,y,1)<126)
      nova5(i,j,:) = 1;
    end
    y++;
  end
  x++;
end
figure('Name','Assinada') 
imshow(nova5)
