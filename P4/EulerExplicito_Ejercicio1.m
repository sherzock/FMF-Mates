clear; clc; close all;

% parametros
f = @(t, y) y - t.^2 + 1;
t0 = 0; 
tf = 1;
y0 = 0.5;
h = 0.2;   
y_exac = @(t) (t + 1).^2 - 0.5*exp(t);

%EulerExplicito
[t, y, err_rel] = EulerExplicito(f, t0, tf, y0, h, y_exac);

%tabla
Tabla = table(t(:), y_exac(t).', y, err_rel, ...
    'VariableNames', {'t','y_exacta','y_aprox','error_rel'});
disp(Tabla);

%grafica
figure;

plot(t, y, 'o-', 'LineWidth', 1.5);
hold on;

plot(t, y_exac(t), 's-', 'LineWidth', 1.5);

yyaxis right
plot(t, err_rel, '--', 'LineWidth', 1.5);
ylabel('error relativo');

grid on;
xlabel('t'); 
yyaxis left
ylabel('y(t)');
title('Euler Explícito vs Solución Exacta');
legend('Euler','Exacta','Error relativo','Location','Best');