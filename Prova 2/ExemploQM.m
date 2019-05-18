X = [1.2 2.5 3.0 4.1 6.2 7.1 8.8 9.5];
Y = [6.8 6.1 9.9 9.7 12.1 17.9 18.0 21.5];

[ B0, B1 ] = QuadradosMinimos(X, Y)

[ R2 ] = CoeficienteDeterminacao(X, Y, [B0, B1])
[ S2 ] = VarianciaResidual(X, Y, [B0, B1])