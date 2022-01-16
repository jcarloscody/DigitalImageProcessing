clear all
close all

%Correlação
%imagem f
f = [0 0 0 0 0; 0 0 0 0 0; 0 0 1 0 0; 0 0 0 0 0; 0 0 0 0 0];
f

%preenchimento com zeros
f = zeros(9,9);
f(5,5)=1;
f

g = zeros(9,9);

%pesos w
w = [1 2 3; 4 5 6; 7 8 9];
w

for x=2:8
    for y=2:8
        g(x,y) = w(1,1)*f(x-1,y-1) + w(1,2)*f(x-1,y) + w(1,3)*f(x-1,y+1) + ...
                w(2,1)*f(x,y-1) + w(2,2)*f(x,y) + w(2,3)*f(x,y+1) + ...
                w(3,1)*f(x+1,y-1) + w(3,2)*f(x+1,y) + w(3,3)*f(x+1,y+1);
    end
end

g2 = imcrop(g, [3 3 4 4]);
g2

% ----------------------------------------------
%Convolução
%imagem f
f = [0 0 0 0 0; 0 0 0 0 0; 0 0 1 0 0; 0 0 0 0 0; 0 0 0 0 0];
f

%preenchimento com zeros
f = zeros(9,9);
f(5,5)=1;
f

g = zeros(9,9);

%pesos w
w = [9 8 7; 6 5 4; 3 2 1];
w

for x=2:8
    for y=2:8
        g(x,y) = w(1,1)*f(x-1,y-1) + w(1,2)*f(x-1,y) + w(1,3)*f(x-1,y+1) + ...
                w(2,1)*f(x,y-1) + w(2,2)*f(x,y) + w(2,3)*f(x,y+1) + ...
                w(3,1)*f(x+1,y-1) + w(3,2)*f(x+1,y) + w(3,3)*f(x+1,y+1);
    end
end

g

g2 = imcrop(g, [3 3 4 4]);
g2