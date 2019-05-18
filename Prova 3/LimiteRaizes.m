function [ L ] = LimiteRaizes(C)
  g = length(C) - 1;
  if C(1) == 0
    disp("Coeficiente C(1) nulo.");
    return
  endif
  
  t = g + 1;
  C(t+1) = 0;
  
  while C(t) == 0
    t -= 1;
  endwhile
  
  for i = 1:4
    if i == 2 || i == 4
      for j = 1:(t/2)
        Aux = C(j);
        C(j) = C(t - j + 1);
        C(t - j + 1) = Aux;
      endfor
    else
      if i == 3
        for j = 1:(t/2)
          Aux = C(j);
          C(j) = C(t - j + 1);
          C(t - j + 1) = Aux;
        endfor
        for j = (t-1):-2:1
          C(j) *= -1;
        endfor
      endif
    endif
    
    if C(1) < 0
      for j = 1:t
        C(j) *= -1;
      endfor
    endif
    
    k = 2;
    while C(k) >= 0 && k <= t
      k++;
    endwhile
    
    if k <= t
      B = 0;
      for j = 2:t
        if C(j) < 0 && abs(C(j)) > B
          B = abs(C(j));
        endif        
      endfor
      L(i) = 1 + ((B / C(1))^(1/(k-1)));
    else
      L(i) = 10^100;
    endif
  endfor
  Aux = L(1);
  L(1) = 1 / L(2);
  L(2) = Aux;
  L(3) *= -1;
  L(4) = -1 / L(4);
endfunction