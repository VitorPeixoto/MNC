function [x] = Jacobi(A, B, Epsilon, Kmax)
  Xanterior = B./diag(A)

  D = diag(A) .* eye(size(A))
  E = tril(A, -1)
  F = triu(A, 1)
  
  for k = 1:Kmax
    Xk = (-(inv(D))*(E+F))*Xanterior + inv(D)*B;
    disp(["X", num2str(k), " = "]);
    disp(Xk);
    if(stop_criteria(Xk, Xanterior, Epsilon, 1))
      break;
    endif
    Xanterior = Xk;
  endfor
endfunction