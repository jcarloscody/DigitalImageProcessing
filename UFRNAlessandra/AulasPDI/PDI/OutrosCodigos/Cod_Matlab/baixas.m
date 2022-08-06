function y=baixas(Do, n, nx, ny);
% Retorna o Spectro do filtros Butterworth passa-baixas
  
  [u,v] = meshgrid(1:ny, 1:nx);
  u = u .* u;
  v = v .* v;
  d = (u + v).^(1/2);
  d = 1 + (2^(1/2)-1) * ((d / Do).^(2 * n));
  y = ones(nx, ny);
  y = y ./ d;