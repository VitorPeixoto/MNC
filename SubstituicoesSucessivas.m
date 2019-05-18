function [ X ] = SubstituicoesSucessivas(L, C)
  n = length(C);
  
  X(1) = C(1)/L(1,1);
  for i = 2:n
    Soma = 0;
    for j = 1:(i-1)
      Soma += L(i,j) * X(j);
    endfor
    X(i) = (C(i) - Soma)/L(i,i);
  endfor
endfunction