function [L, Lt, Det] = DecomposicaoCholesky(A)
  digits = 4;
  
  L = eye(size(A));
  
  Det = det(A);
  
  n = length(A);
  
  for j = 1:n
    result = A(j, j) - sum(L(j, 1:(j-1)).^2);
    L(j,j) = sqrt(result);    
    for i = (j+1):n
      L(i, j) = (A(i, j) - sum(L(i, 1:(j-1)) .* L(j, 1:(j-1)))) / L(j,j);
    endfor
  endfor
  dispositivo_pratico(A, 'A');
  dispositivo_pratico(L, 'L');
  Lt = L';
endfunction

function dispositivo_pratico(A, title)
  i = 1:length(A);
  
  Ans = [i' A ];
  
  max = max(max(abs(Ans)));
  d = numel(num2str(max, "%5.5f"));
  div = ' | ';
  
  Header = [div, position('i\j', d), div];
  for i = 1:length(A)
    Header = [Header position(num2str(i), d) div];
  endfor
  disp(position(title, numel(Header)));
  disp(Header);
  disp(Ans);
endfunction

function [ El ] = position(X, n)
  size = numel(X);
  spaces = (n - size)/2;
  El = [repmat([' '], 1, ceil(spaces)), X, repmat([' '], 1, floor(spaces))];
endfunction