function [ Ans ] = PolinomioNewton(X, x, Y, n)
  Difs = DiferencaDividida(X, Y, n);
  
  Sum = 0;
  for o = 1:n
    Sum += Difs(1, o+1) * prod(-X(1:o)+x);
  endfor
  
  Ans = Y(1) + Sum;
endfunction