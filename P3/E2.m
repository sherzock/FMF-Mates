clc
clear

%Datos de entrada
syms x
f = x*sin(power(x, 2)/2) + exp(-x);
a = 1;
b = 3;
tol = 0.000000001;

raiz_fzero = fzero(@(x) x*sin(power(x, 2)/2) + exp(-x), [a, b]);
[raiz_bis, iter_bis] = Biseccion(f, a, b, tol);
[raiz_nr, iter_nr] = NewtonRaphson(f, a, tol);

fprintf('------------------------------------------------------\n');
fprintf('COMPARACIÓN DE RESULTADOS\n');
fprintf('------------------------------------------------------\n');
fprintf('Raíz fzero (Referencia)   : %.10f\n', raiz_fzero);
fprintf('Raíz Bisección (tol=%g) : %.10f (%g iters.)\n', tol, raiz_bis, iter_bis);
fprintf('Raíz Newton-Raphson (tol=%g) : %.10f (%g iters.)\n', tol, raiz_nr, iter_nr);
fprintf('------------------------------------------------------\n');
fprintf('Diferencia Absoluta (|Bis - Rr|): %.10e\n', abs(raiz_bis - raiz_fzero));
fprintf('Diferencia Absoluta (|NR - Rr|): %.10e\n', abs(raiz_nr - raiz_fzero));
fprintf('------------------------------------------------------\n');
