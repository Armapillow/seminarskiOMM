clear; clc;

% ZADATAK:
%   Ukoliko je potrebno da se pobeda ostvari za 28 dana, 
%   koliko vojnika je neophodno da Amerikanci imaju u početku?


% Ucitavamo sve potrebne podatke
formule;

% Broj vojnika koji je neophodan da Amerikanci imaju u početku
% da bi se bitka zavrsila za 28 dana
novoA0 = koren*J0 * (exp(koren*28) + exp(-koren*28)) / (efiAmer * (exp(28*koren) - exp(-28*koren)));

% Resvamo sitem diferencijalnih jednacina
span = linspace(0, 30, 10000);
f = @(t, x) [-efiAmer*x(2); -efiJap * x(1)];
[t, xx] = ode45(f, span, [J0, novoA0]);

% Pronalazimo prvi index kad je japanska vojska presla u minus,
% i uzimamo index pre toga
index = find(xx(:, 1) < 0, 1) - 1;
time  = t(index);
% Citamo broj preostalih americkih vojnika
sldrs = xx(index, 2);

fprintf('\n')
fprintf('Novi broj americkih vojnika je %5d\n', floor(novoA0));
fprintf('Vreme trajanja bitke: %5d\n', ceil(time));
fprintf('Broj preostalih vojnika: %5d\n\n', floor(sldrs));

plot(t, xx(:, 1), t, xx(:, 2));
% Ne radi u Octave
yl = yline(0, '-', 'Istrebljenje');
yl.LabelHorizontalAlignment = 'left';
xlabel('Vreme')
ylabel('Vojnici')
legend('Japanci', 'Amerikanci');
title('Tok bitke kroz vreme');