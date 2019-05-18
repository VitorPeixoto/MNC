function [ R2 ] = CoeficienteDeterminacao(X, Y, B)
  n = length(X);
  
  Y_ = sum(Y) / n;
  
  for i = 1:length(X)
    U(i) = B*[1; X'(i, :)'];
  endfor
  
  SQTot = sum((Y - Y_).^2)
  SQRes = sum((Y - U).^2)
  SQReg = sum((U - Y_).^2)
  
  R2 = 1 - (SQRes / SQTot);
endfunction