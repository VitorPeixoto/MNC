function [ Ans ] = PolinomioGregoryNewton(X, x, Y, n)
  Difs = DiferencaFinitaAscendente(X, Y, n);
  
  Sum = 0;
  h   = (X(2) - X(1));
  Ux  = (x - X(1)) / h;
  
  Uxs = repmat(Ux, 1, n);
  Uxs -= (0:(length(Uxs)-1));
  
  for o = 1:n
    Sum += (Difs(1, o+1) / factorial(o)) * prod(Uxs(1:o));
  endfor
  
  print_polinomio(Difs, X, Y, n);
  
  Ans = Y(1) + Sum;
endfunction

function [] = print_polinomio(Difs, X, Y, n)
  Poly = [''];
  
  h   = (X(2) - X(1));
  Ux  = ['((x - ', num2str(X(1)), ') / ', num2str(h), ')'];
  
  Sum = [''];
  for o = 1:n
    Prod = [''];
    for j = 0:o-1
      Prod = ['(', Ux, ' - ', num2str(j), ')', Prod];
    endfor
    Sum = [ ' + ', '(', num2str(Difs(1, o+1) / factorial(o)), ')', Prod, Sum ];
  endfor
  Poly = [ num2str(Y(1)), Sum ]
endfunction