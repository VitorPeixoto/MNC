function r = GregoryNewton(m, x, y, z)
    /*
        m -> numero de pontos
        x -> abscissas
        y -> ordenadas
        z -> valor a interpolar
    */
    Dely = zeros(m);
    for(i = 1:m)
        Dely(i) = y(i);
    end
    for(k = 1:(m-1))
        for(i = m:-1:k+1)
            Dely(i) = Dely(i) - Dely(i-1);
        end
    end

    u = (z - x(1))/(x(2) - x(1))
    r = Dely(m);
    for( i = m-1:-1:1)
        r = r * ( u - i + 1 )/i + Dely(i);
    end     
endfunction




peso = [ 50 60 70 80 ];
idade = [ 25 45 65 ];
qtdCal25 = [ 2500 2850 3200 3550 ];
qtdCal45 = [ 2350 2700 3000 3350 ];
qtdCal65 = [ 1900 2250 2750 2850 ];

pesoDesejado = 62;
idadeDesejada = 35;

valorBaseadoEmIdade = zeros(3);
valorBaseadoEmIdade(1) = GregoryNewton(4, peso, qtdCal25, pesoDesejado);
valorBaseadoEmIdade(2) = GregoryNewton(4, peso, qtdCal45, pesoDesejado);
valorBaseadoEmIdade(3) = GregoryNewton(4, peso, qtdCal65, pesoDesejado);

valorFinal = GregoryNewton(3, idade, valorBaseadoEmIdade, idadeDesejada);


disp(valorBaseadoEmIdade);
disp(valorFinal);