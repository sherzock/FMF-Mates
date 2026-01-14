
f = @(x) exp(x); 
% Otras funciones para probar:

intervalo = [0, 1];

r = f(intervalo(1));
%r = f((intervalo(1) + intervalo(2)) / 2);
%r = f(intervalo(2));

x_eval = linspace(intervalo(1), intervalo(2), num_puntos_plot);

y_original = f(x_eval);

y_polinomio = linspace(r, r, num_puntos_plot);

error_absoluto = abs(y_original - y_polinomio);

figure('Name', 'Comparación de Funciones', 'NumberTitle', 'off');
hold on;

plot(x_eval, y_original, 'b-', 'LineWidth', 2.5, 'DisplayName', 'Función Original exp(x)');

plot(x_eval, y_polinomio, 'r-', 'LineWidth', 1.5, 'DisplayName', ['Rectángulo izquierdo']);

title(['Comparación: Función Original vs. Fórmula del Rectángulo']);
xlabel('x');
ylabel('y');
legend('show', 'Location', 'best');
grid on;
axis tight;
hold off;


figure('Name', 'Error de Aproximación', 'NumberTitle', 'off');

plot(x_eval, error_absoluto, 'm-', 'LineWidth', 2);

title(['Error Absoluto |exp(x) - r|']);
xlabel('x');
ylabel('Error Absoluto');
grid on;
axis tight;