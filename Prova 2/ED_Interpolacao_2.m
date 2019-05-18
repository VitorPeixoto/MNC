X = [0.35 0.4 0.45 0.5 0.55 0.6 0.65];
Y = [1.52 1.51 1.49 1.47 1.44 1.42 1.39];

x = 0.52;
n = 2;

[ Ans ] = PolinomioGregoryNewton(X(3:length(X)), x, Y(3:length(X)), n);
% [ Ans, G ] = PolinomioLagrange(x, X(3:3+n), Y(3:3+n));
Ans