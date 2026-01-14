function y_poly = polinomio_lagrange(x_eval, n, f)
if isempty(x_eval)
    y_poly = [];
    return;
end

% 1. Determinar el intervalo a partir de los puntos de evaluación
limite_inferior = min(x_eval);
limite_superior = max(x_eval);

% 2. Generar n+1 nodos de interpolación equidistantes en el intervalo deducido
x_nodes = linspace(limite_inferior, limite_superior, n + 1);
y_nodes = f(x_nodes);

% 3. Preparar el vector de salida
num_puntos_eval = length(x_eval);
y_poly = zeros(size(x_eval));

% 4. Evaluar el polinomio en cada punto de 'x_eval' usando la fórmula de Lagrange
for i = 1:num_puntos_eval
    x = x_eval(i);
    suma_total = 0;
    
    for j = 1:(n + 1)
        producto_L_j = 1;
        for k = 1:(n + 1)
            if k ~= j
                producto_L_j = producto_L_j * (x - x_nodes(k)) / (x_nodes(j) - x_nodes(k));
            end
        end
        suma_total = suma_total + y_nodes(j) * producto_L_j;
    end
    y_poly(i) = suma_total;
end

end