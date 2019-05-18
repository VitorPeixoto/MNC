function [L, U, P, p, Det] = decomposicao_LU(A)
  L = P = eye(size(A));
  
  Det = det(A);
  
  n = length(A);
  M = zeros(n);
  A = [A (1:length(A))'];
  for coluna = 1:n
    [Amax Pindex] = max(A(coluna:n, coluna));
    Pindex += coluna - 1;
    p(coluna) = A(Pindex, n+1);
    
    aux = A(coluna, :);
    A(coluna, :) = A(Pindex, :);
    A(Pindex, :) = aux;
    
    if coluna != n
      M(coluna+1:n, coluna) = A(coluna+1:n, coluna)./Amax;
    endif
    
    disp("|\tm\t\t|\tA\t|\tOp\t| P |");
    disp("-----------------------------------------------------");
    dispositivo_pratico(coluna, M, A, n, Amax);
    disp("-----------------------------------------------------");
    
    A(:, 1:n) -= M(:, coluna)*A(coluna,1:n);
  endfor
  P = swap_rows(P, p);
  L += M;
  U = A(:, 1:n);
endfunction

function dispositivo_pratico(coluna, M, A, n, pivot)
    for i = coluna:n
    disp(["| M", num2str(i), num2str(coluna), " = (", num2str(A(i, coluna)), "/", num2str(pivot), ") = ", num2str(M(i, coluna)), "\t| ",mat2str(A(i, 1:n)), "\t|\t \t| ",num2str(A(i, n+1)), " |"]);
  endfor
endfunction

function [N] = swap_rows(M, P)
  for i = 1:length(P)
    N(i, :) = M(P(i), :);
  endfor
endfunction