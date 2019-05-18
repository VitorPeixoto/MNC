function [ L, G ] = PolinomioLagrange(x, X, Y)
  G = zeros(length(X));
  G = transpose((G .- transpose(X)) + X) + (eye(length(X))*x - eye(length(X)).*X);
  
  Gd = prod(diag(G));
  Gi = prod(G);
  L = Gd * sum(Y./prod(G));
  
  disp("\tG:\t\n");
  dispositivo_pratico(X, ' x ');
  
  disp(["\tG com x = ", num2str(x), ":\t\n"]);
  dispositivo_pratico(X, num2str(x));
  
  [ P ] = Polinomio(X, Y);
  disp("\tPolinômio: \t\n");
  polyout(P, 'x');
endfunction

function [] = dispositivo_pratico(X, x)
  L = [''];
  for i = 1:length(X)
    for j = 1:length(X)
      if i == j
        L = [ L, "\t", x, ' - ', num2str(X(i))];
      else
        L = [ L, "\t", num2str(X(i)), ' - ', num2str(X(j))];
      endif
    endfor
    L = [L, "\n"];
  endfor
  disp(L);
endfunction

function [ P ] = Polinomio(X, Y)

  L = [];  
  for i = 1:length(X)
    Pi = poly(X(1:length(X) ~= i));
    polyout(Pi);
    disp(polyval(Pi, X(i)));
    Li = Pi/polyval(Pi, X(i));
    L = [L; Li];
  endfor

  P = sum(L .* Y');
endfunction