A = 30423;
%J = 8626;
J = 13433;

efiAmer = 0.0106;
efiJap  = 0.0544;

f = @(t, x) [-efiAmer*x(2); -efiJap * x(1)];

span = linspace(0, 200, 200000);
[t, x] = ode45(f, span, [J, A]);

size(x);
size(span);

index = find(x(:, 2) < 0, 1);
time  = t(index);
sldrs = x(index, 1);

fprintf('Vreme trajanja bitke: %f\n', time);
fprintf('Broj preostalih vojnika: %f\n', sldrs);

plot(t, x(:, 1), t, x(:, 2));

% Ne radi u Octave
yline(0, '-', 'Istrebljenje');

xlabel('vreme')
ylabel('vojnici')
legend('Japanci', 'Amerikanci');