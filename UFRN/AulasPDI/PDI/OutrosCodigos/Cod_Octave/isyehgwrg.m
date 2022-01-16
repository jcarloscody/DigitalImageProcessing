pkg load image

clear all
close all

im = imread('C:\imagens\lena.jpg');

  figure(1);
  imshow(im);

for linha=1 : size(im,1)
  for coluna=1 : size(im,2)

  espver(linha,coluna,:) = im(size(im,1)+1-linha,coluna,:); 
  
  end
  end

  figure(2);
  imshow(espver);
  
  
  
  
  
  
  for linha=1 : size(im,1)
    for coluna=1 : size(im,2)
    
      esphor(linha,coluna,:) = im(linha,size(im,2)+1-coluna,:);

    
    
    end
   end 
   
   
   figure(3);
   imshow(esphor);