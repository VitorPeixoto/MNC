% Com X e Y
function [ Difs ] = DiferencaDividida(X, Y, n)
  Difs = Y';  

  for o = 2:n+1
    for i = 1:length(X)
      
      if (i-2 + o) > n
        break;
      endif
      
      Difs(i, o) = (Difs(i+1, o-1) - Difs(i, o-1)) / (X(i+o-1) - X(i));
    endfor  
  endfor
  dispositivo_pratico(X, Difs, n);
endfunction


% Com o Polinomio
function [ Dif ] = DiferencaDivididaPoly(Poly, X, n)
  if n == 0
    Dif = polyval(Poly, X(1));
  elseif
    Dif = (DiferencaDividida(Poly, X(2:length(X)), n-1) - DiferencaDividida(Poly, X, n-1)) / (X(n+1) - X(1));
  endif
endfunction


function [] = dispositivo_pratico(X, Difs,n )
  Ans = [(1:length(X))', X', Difs];
  
  Header = [''];
  for i = 1:n
    Header = [Header ["  ΔY", num2str(i), "  ", " | "]];
  endfor
  
  disp([" | ", "   i   ", " | ", "   Xi  ", " | ", "   Yi  ", " | ", Header]);
  disp(Ans);
endfunction