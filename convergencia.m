function [ Ans ] = convergencia(Matriz)
  Diagonal = abs(diag(Matriz))
  Sum      = abs(Matriz - (diag(Matriz).*eye(size(Matriz))))*ones(length(Matriz), 1)
  Result = Diagonal - Sum
  Ans = (sum(Result == abs(Result)) == length(Result)) && (all(Result))
endfunction