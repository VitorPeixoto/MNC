function [ Y ] = SubstituicoesSucessivasPivotais(L, B, Pivot)
  n = length(B);
  
  Pivot
  k = Pivot(1);
  Y(1) = B(k);
  for i = 1:n
    Soma = 0;
    for j = 1:(i-1)
      Soma += L(i,j)*Y(j);
    endfor
    k = Pivot(i);
    Y(i) = B(k) - Soma;
  endfor
endfunction