function [ X ] = SubstituicoesRetroativas(U, D)
  n = length(D);
  
  X(n) = D(n)/U(n,n);
  for i = (n-1):-1:1
    Soma = 0;
    for j = (i+1):n
      Soma += U(i,j) * X(j);
    endfor
    X(i) = (D(i) - Soma)/U(i,i);
  endfor
endfunction