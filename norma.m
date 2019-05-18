% Norma infinita com p = 0
function [ Norma ] = norma(p, Vetor)
  if p == 0
    Norma = max(abs(Vetor));
  elseif p > 0
    Norma = sum(abs(Vetor).^p).^(1/p);
  endif  
endfunction