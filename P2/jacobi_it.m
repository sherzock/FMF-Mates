function [x] = jacobi_it(A, b, it, x0)
    % JACOBI_IT Resuelve el sistema de ecuaciones Ax = b usando el método de Jacobi.
    %
    %   [x] = JACOBI_IT(A, b, it) resuelve el sistema de ecuaciones lineales Ax = b
    %   utilizando el método iterativo de Jacobi durante 'it' iteraciones.
    %
    %   Entradas:
    %       A  - Matriz de coeficientes (debe ser cuadrada y no singular).
    %       b  - Vector de términos independientes.
    %       it - Número de iteraciones a realizar.
    %
    %   Salidas:
    %       x  - Vector solución aproximada después de 'it' iteraciones.

    n = length(b);         % Número de ecuaciones
    x = x0;       % Inicialización del vector solución

    for k = 1:it
        x_new = zeros(n, 1); % Nuevo vector solución para esta iteración
        for i = 1:n
            sum_ax = 0;
            for j = 1:n
                if j ~= i
                    sum_ax = sum_ax + A(i, j) * x(j);
                end
            end
            x_new(i) = (b(i) - sum_ax) / A(i, i);
        end
        x = x_new; % Actualizar la solución para la siguiente iteración
    end
    
end