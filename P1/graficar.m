% =========================================================================
% SCRIPT PARA VISUALIZAR LA INTERPOLACIÓN DE LAGRANGE Y SU ERROR
%
% Descripción:
%   Este script interpola una función 'f' con un polinomio de Lagrange
%   de grado 'n' en un intervalo definido. Luego, genera dos gráficos:
%   1. Una comparación visual de la función original vs. el polinomio.
%   2. Un gráfico del error absoluto de la aproximación.
%
% Dependencia:
%   Requiere la función 'evaluarLagrange_auto.m' en el mismo directorio.
% =========================================================================

% --- Limpieza del Entorno ---
clear;         % Borra las variables del workspace
clc;           % Limpia la ventana de comandos
close all;     % Cierra todas las figuras abiertas

% --- PARÁMETROS DEFINIBLES POR EL USUARIO ---
% Modifica estas tres líneas para experimentar

% 1. Función que se va a interpolar (usa el formato de handle @(x) ...)
% f = @(x) exp(x);
% La otra función para probar:
f = @(x) cos(power(x, 2) - 1);

% 2. Grado del polinomio interpolador
n = 2;

% 3. Intervalo de interpolación y ploteo [limite_inferior, limite_superior]
intervalo = [0, 2*pi];

% --- PARÁMETROS TÉCNICOS ---
% Número de puntos para generar los gráficos (a mayor número, más suave la curva)
num_puntos_plot = 500;


% --- CÁLCULOS ---

% 1. Crear el vector de puntos para la evaluación y el ploteo
x_eval = linspace(intervalo(1), intervalo(2), num_puntos_plot);

% 2. Evaluar la función original en esos puntos para tener la curva "real"
y_original = f(x_eval);

% 3. Calcular los valores del polinomio de Lagrange en los mismos puntos
%    Llamamos a la función que creamos en el paso anterior.
y_polinomio =  polinomio_lagrange(x_eval, n, f);

% 4. Calcular el error absoluto en cada punto
error_absoluto = abs(y_original - y_polinomio);


% --- GENERACIÓN DE GRÁFICOS ---

% GRÁFICO 1: Comparación de la función original y el polinomio
figure('Name', 'Comparación de Funciones', 'NumberTitle', 'off');
hold on;

% Plotea la función original (línea azul sólida y gruesa)
plot(x_eval, y_original, 'b-', 'LineWidth', 2.5, 'DisplayName', 'Función Original exp(x)');

% Plotea el polinomio interpolador (línea roja discontinua)
plot(x_eval, y_polinomio, 'r-', 'LineWidth', 1.5, 'DisplayName', ['Polinomio P(x) (n=' num2str(n) ')']);

% Configuración del gráfico
title(['Comparación: Función Original vs. Polinomio de Lagrange']);
xlabel('x');
ylabel('y');
legend('show', 'Location', 'best');
grid on;
axis tight; % Ajusta los ejes para que se vean todos los datos
hold off;


% GRÁFICO 2: Error de la aproximación
figure('Name', 'Error de Aproximación', 'NumberTitle', 'off');

% Plotea el error absoluto con una línea de color magenta
plot(x_eval, error_absoluto, 'm-', 'LineWidth', 2);

% Configuración del gráfico
title(['Error Absoluto |exp(x) - P_n(x)| con n = ', num2str(n)]);
xlabel('x');
ylabel('Error Absoluto');
grid on;
axis tight;