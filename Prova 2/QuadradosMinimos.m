function [ B0, B1 ] = QuadradosMinimos(X, Y)
  X2 = X .^ 2;
  Y2 = Y .^ 2;
  XY = X .* Y;
  
  Ex = sum(X);
  Ey = sum(Y);
  Exy = sum(XY);
  Ex2 = sum(X2);
  Ey2 = sum(Y2);
  
  n = length(X);
  
  B1 = (Ex*Ey - n*Exy) / (Ex^2 - n*Ex2);
  B0 = (Ey - B1*Ex)/n;
  
  dispositivo_pratico(X, Y, X2, XY, Y2, [Ex Ey Ex2 Exy Ey2]);
endfunction

function [] = dispositivo_pratico(X, Y, X2, XY, Y2, Es)
  i = 1:length(X);
  
  Ans = [i' X' Y' X2' XY' Y2'; 0 Es ];
  
  max = max(max(abs(Ans)));
  d = numel(num2str(max, "%5.5f"));
  div = ' | ';
  
  disp([div, position('i', d), div, position('Xi', d), div, position('Yi', d), div, position('X2', d), div, position('XY', d), div, position('Y2', d), div]);
  disp(Ans);
endfunction

function [ El ] = position(X, n)
  size = numel(X);
  spaces = (n - size)/2;
  El = [repmat([' '], 1, ceil(spaces)), X, repmat([' '], 1, floor(spaces))];
endfunction