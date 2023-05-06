clear; clc;

% ZADATAK:
%   Posle 30 dana, koliko pojačanje bi trebalo 
%   da stigne Japancima da ne bi izgubili bitku?


% Ucitavanje osnovnih podataka
formule;

% Resavanje dif sistema
X = [J0, A0];
span = linspace(0, 240, 200000);
f = @(t, x) [-efiAmer*x(2); -efiJap * x(1)];

% Nalazenje poslednjeg indeksa koji je manji od 30, pa uzimamo prvi iza njega
index = find (span < 30, 1, 'last') + 1;
% Izdvajamo samo prvih 30 dana
xx30 = span(1:index);
[t30, x30] = ode45(f, xx30, X);

%time  = t30(index);
%sldrs = x30(index, 1);
%fprintf('Vreme trajanja bitke: %f\n', time);
%fprintf('Broj preostalih vojnika: %f\n', sldrs);

% Ne radi u Octave
nexttile
plot(t30, x30(:, 1), t30, x30(:, 2));
xl = xline(30, '-', 'Trideseti dan');
xl.LabelVerticalAlignment = 'bottom';
title('Prvih 30 dana bitke');
xlabel('vreme')
ylabel('vojnici')
legend('Japanci', 'Amerikanci');


% Racunamo koliko je vojnika ostalo posle 30 dana borbe
vreme = 30;
A30 = floor(A(30));
J30 = floor(J(30));
fprintf('\n');
fprintf('Broj americkih vojnika posle 30 dana: %5d\n', floor(A30));
fprintf('Broj japanskih vojnika posle 30 dana: %5d\n\n', floor(J30));

% Uslov da Japanci pobede
novoJ0 = ceil (sqrt(efiAmer * A30*A30 / efiJap)) + 1;

% Racunamo koliko treba da ih dodamo 
deltaJap = novoJ0 - J30;
fprintf('Potrebno je dodati %d vojnika da bi pobedili Japanci\n', deltaJap);
fprintf('Novi broj japanskih vojnika: %5d\n', novoJ0);

% Resavamo sistem sa novim podacima
X = [novoJ0, A30];
% Uzimamo preostale tacke
xxPreostalo = span(index:end);
[tPreostalo, xPreostalo] = ode45(f, xxPreostalo, X);

% Formula koja racuna vreme kada Amerikanci gube: A(t) = 0
c1 = (koren*A30 - efiJap*novoJ0)/(2*koren);
c2 = (koren*J30 + efiJap*novoJ0)/(2*koren);
timeAmer = (log(c2) - log(-c1))/(2*koren);
fprintf('Vreme trajanja bitke: %d\n', ceil(timeAmer));

nexttile
plot(tPreostalo, xPreostalo(:, 1), tPreostalo, xPreostalo(:, 2));
% Ne radi u Octave
yl = yline(0, '-', 'Istrebljenje');
yl.LabelHorizontalAlignment = 'left';
xl = xline(30, '-', 'Trideseti dan');
xl.LabelVerticalAlignment = 'middle';
xl.LabelHorizontalAlignment = 'left';
title('Novi tok bitke posle pojacanja');
xlabel('vreme');
ylabel('vojnici');
legend('Japanci', 'Amerikanci');