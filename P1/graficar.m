

% 1. Función que se va a interpolar (usa el formato de handle @(x) ...)
% f = @(x) exp(x);
% La otra función para probar:
f = @(x) cos(power(x, 2) - 1);

% 2. Grado del polinomio interpolador
n = 2;

% 3. Intervalo de interpolación y ploteo [limite_inferior, limite_superior]
intervalo = [0, 2*pi];

num_puntos_plot = 500;


x_eval = linspace(intervalo(1), intervalo(2), num_puntos_plot);

y_original = f(x_eval);
y_polinomio =  polinomio_lagrange(x_eval, n, f);

error_absoluto = abs(y_original - y_polinomio);

figure('Name', 'Comparación de Funciones', 'NumberTitle', 'off');
hold on;

plot(x_eval, y_original, 'b-', 'LineWidth', 2.5, 'DisplayName', 'Función Original exp(x)');

plot(x_eval, y_polinomio, 'r-', 'LineWidth', 1.5, 'DisplayName', ['Polinomio P(x) (n=' num2str(n) ')']);

title(['Comparación: Función Original vs. Polinomio de Lagrange']);
xlabel('x');
ylabel('y');
legend('show', 'Location', 'best');
grid on;
axis tight; 
hold off;


figure('Name', 'Error de Aproximación', 'NumberTitle', 'off');

plot(x_eval, error_absoluto, 'm-', 'LineWidth', 2);

% Configuración del gráfico
title(['Error Absoluto |exp(x) - P_n(x)| con n = ', num2str(n)]);
xlabel('x');
ylabel('Error Absoluto');
grid on;
axis tight;