% Pocetni broj Japanaca
J0      = 21500;
% Stopa efikasnosti japanske vojske
efiJap  = 0.0544;
% Pocetni broj Amerikanaca
A0      = 54000;
% Stopa efikasnosti americke vojske
efiAmer = 0.0106;

% Pomocna promenljiva
koren = sqrt(efiJap * efiAmer);

% Jednacina za Amerikance koja zavisi od t
c1 = (koren*A0 - efiJap*J0)/(2*koren);
c2 = (koren*A0 + efiJap*J0)/(2*koren);
A = @(t) c1*exp(koren*t) + c2*exp(-koren * t);

% Jednacina za Japance koja zavisi od t
k1 = (koren*J0 - efiAmer*A0)/(2*koren);
k2 = (koren*J0 + efiAmer*A0)/(2*koren);
J = @(t) k1*exp(koren * t) + k2*exp(-koren * t);

% Formula koja racuna vreme kada Japanci gube: J(t) = 0
timeJap = (log(k2) - log(-k1))/(2*koren);
