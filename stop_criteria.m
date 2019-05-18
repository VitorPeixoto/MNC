function [ bool ] = stop_criteria(Xatual, Xanterior, Epsilon, p)
  Xatual - Xanterior;
  norma(p, Xatual - Xanterior)
  norma(p, Xatual)
  Resultado = (norma(p, Xatual - Xanterior) / norma(p, Xatual))
  bool = Resultado <= Epsilon;
endfunction