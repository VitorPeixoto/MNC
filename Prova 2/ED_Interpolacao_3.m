Pesos = [50 60 70 80];
Idades = [25 45 65];
Calorias = [ 2500 2350 1900; 2850 2700 2250; 3200 3000 2750; 3550 3350 2850];

Peso  = 62;
Idade = 35;

NewCs = [];
NewP  = [];

for i = 1:length(Pesos)
  [NewC, G] = PolinomioLagrange(Idade, Idades(1:2), Calorias(i, 1:2));
  NewCs = [NewCs; NewC];
endfor

[NewP, G] = PolinomioLagrange(Peso, Pesos(2:3), NewCs(2:3)')

NewP