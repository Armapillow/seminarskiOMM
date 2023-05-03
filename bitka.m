
% Snage vojske
A = 54000;
J = 21500;

% Efikasnost vojske
efiAmer = 0.0106;
efiJap  = 0.0544;


X = [J, A];
f = @(t, x) [-efiAmer*x(2); -efiJap * x(1)];

span = linspace(0, 70, 10000);
[t, x] = ode45(f, span, X);

size(x);
size(span);

index = find(x(:, 1) < 0, 1);
time  = t(index);
sldrs = x(index, 2);


fprintf('Vreme trajanja bitke: %f\n', time);
fprintf('Broj preostalih vojnika: %f\n', sldrs);

plot(t, x(:, 1), t, x(:, 2));

% Ne radi u Octave
yline(0, '-', 'Istrebljenje');

xlabel('vreme')
ylabel('vojnici')
legend('Japanci', 'Amerikanci');


% ind30 = find(t < 30, 1, 'last') + 1;
% jap30 = x(ind30, 1);
% amer30 = x(ind30, 2);

% fprintf('Ameri posle 30 dana: %f\n', floor(amer30));
% fprintf('Japanci posle 30 dana: %f\n', floor(jap30));