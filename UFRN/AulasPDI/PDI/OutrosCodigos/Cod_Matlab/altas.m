function y=altas(Do, n, nx, ny);
% Retorna o Spectro do filtros Butterworth passa-altas
  
  [u,v] = meshgrid(1:ny, 1:nx);
  u = u .* u;
  v = v .* v;
  d = (u + v).^(1/2);
  d = 1 + (2^(1/2)-1) * ((Do ./ d).^(2 * n));
  y = ones(nx, ny);
  y = y ./ d;

