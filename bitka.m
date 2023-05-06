clear; clc;

% ZADATAK:
%   Koliko je dugo trajala bitka do istrebljenja jednog od učesnika? 
%   Koliko je preostalo vojnika na pobedničkoj strani?

% Ucitavanje osnovnih podataka
formule;

% Resavanje sistema dif jednacina
X = [J0, A0];
f = @(t, x) [-efiAmer*x(2); -efiJap * x(1)];
span = linspace(0, 70, 20000);
[t, xx] = ode45(f, span, X);

% Pronalazimo index kada japanska vojska ode u minus, pa uzimamo index pre toga
index = find(xx(:, 1) < 0, 1) - 1;
% Citamo vreme zavrsetka bitke
time  = t(index);
% Citamo koliko je americkih vojnika ostalo
sldrs = xx(index, 2);

fprintf('\n');
fprintf('Vreme trajanja bitke: %5d\n', ceil(time));
fprintf('Broj preostalih vojnika: %5d\n\n', floor(sldrs));

% Plotujemo rezultate
plot(t, xx(:, 1), t, xx(:, 2));
% Ne radi u Octave
yl = yline(0, '-', 'Istrebljenje');
yl.LabelHorizontalAlignment = 'left';
xlabel('Vreme')
ylabel('Vojnici')
legend('Japanci', 'Amerikanci');
title('Broj vojnika kroz vreme');
