function [ B ] = RegressaoLinearMultipla(X, Y)
  addpath('..');
  
  C = ones();
  
  [lines, columns] = size(X);
  variables = lines;
  for L1 = 1:variables
    C(L1+1, 1) = C(1, L1+1) = sum(X(L1, :));
    R(L1+1, 1) = sum(X(L1, :) .* Y);
    for L2 = 1:variables
      C(L1+1, L2+1) = sum(X(L1,:) .* X(L2, :));
    endfor
  endfor
  C(1,1) = length(Y);
  R(1,1) = sum(Y);
  
  C
  
  [L, Lt, Det] = DecomposicaoCholesky(C);
  T = SubstituicoesSucessivas(L, R);
  
  B = SubstituicoesRetroativas(Lt, T);
endfunction