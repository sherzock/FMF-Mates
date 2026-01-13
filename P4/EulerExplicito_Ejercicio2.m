clear; clc; close all;

%parametros
h = 0.05;
T = 0.1;

% Parametros M=10, B=50, k=200, u0=0, up0=1
[t, u, up] = EulerExplicitoOrden2(h, T, 10, 50, 200, 0, 1);

%graficos
figure;
subplot(2,1,1);
plot(t, u, 'o-','LineWidth',1.5);
grid on;
xlabel('t [s]'); ylabel('u(t) [m]');
title('Posición u(t) - Euler explícito (Problema 2)');

subplot(2,1,2);
plot(t, up, 'o-','LineWidth',1.5);
grid on;
xlabel('t [s]'); ylabel('u''(t) [m/s]');
title('Velocidad u''(t) - Euler explícito (Problema 2)');

%tabla
Tabla2 = table(t(:), u(:), up(:), ...
    'VariableNames', {'t','u_aprox','up_aprox'});

disp(Tabla2);
