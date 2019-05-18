function [ S2 ] = VarianciaResidual(X, Y, B)
  n = length(X);
  p = length(B);
  Y_ = sum(Y) / n;
  
   for i = 1:length(X)
    U(i) = B*[1; X'(i, :)'];
  endfor
  
  D = SQRes = sum((Y - U).^2);
  
  S2 = D / (n - p);
endfunction