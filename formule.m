
b = 0.0544;    % bitan redosled!
a = 0.0106;
A0 = 21500;
B0 = 54000;

ab = sqrt(a * b);

% Pocetne jednacine
A = @(t) ((ab*A0 - a*B0)/(2*ab))*exp(ab*t) + ((ab*A0 + a*B0)/(2*ab))*exp(-ab * t);
B = @(t) ((ab*B0 - b*A0)/(2 * ab))*exp(ab * t) + ((ab * B0 + b*A0)/(2*ab))*exp(-ab * t);


AP = @(t) ((ab*A0 - a*B0)/(2))*exp(ab * t) - ((ab*A0 + a*B0)/(2))*exp(-ab * t);
BP = @(t) ((ab*B0 - b*A0)/(2))*exp(ab * t) - ((ab*B0 + b*A0)/(2))*exp(-ab * t);


% Koliko vojnika treba dodati da bi se bitka zavrsila za 28 dana
dA = (ab * A0 * exp(ab * 28) + ab * A0 * exp(-ab * 28))/(a*exp(ab*28) - a*exp(-ab*28)) - B0;

% Racunanje vremena za prvu stavku
c1 = (ab*A0 - a*B0)/(2*ab);
c2 = (ab*A0 + a*B0)/(2*ab);
time = (log(c2) - log(-c1))/(2*ab)