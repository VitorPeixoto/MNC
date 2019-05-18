% Com X e Y
function [ Difs ] = DiferencaFinitaAscendente(X, Y, n)
  Difs = Y';  

  for o = 2:n+1
    for i = 1:length(Y)
      
      if (i-2 + o) > n
        break;
      endif
      
      Difs(i, o) = (Difs(i+1, o-1) - Difs(i, o-1));
    endfor  
  endfor
  dispositivo_pratico(Difs, X, n);
endfunction


function [] = dispositivo_pratico(Difs, X, n)
  Ans = [(1:length(X))', X', Difs];
  
  Header = [''];
  for i = 1:n
    Header = [Header ["  ΔY", num2str(i), "  ", " | "]];
  endfor
  
  disp([" | ", "   i   ", " | ", "   Xi  ", " | ", "   Yi  ", " | ", Header]);
  disp(Ans);
endfunction