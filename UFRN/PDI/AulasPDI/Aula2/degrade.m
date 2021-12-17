

clear all
close all

degrade = uint8(zeros(40,255));

for l=1:size(degrade,1)
  for c=1:size(degrade,2)
    degrade(l,c) = c;
  endfor
endfor

figure('Name','Degrade');
imshow(degrade);