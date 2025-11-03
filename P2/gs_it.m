function [x] = gs_it(A, b, it, x0)
    % GS_IT Resuelve el sistema de ecuaciones Ax = b usando el método de Gauss-Seidel.
    %
    %   [x] = GS_IT(A, b, it) resuelve el sistema de ecuaciones lineales Ax = b
    %   utilizando el método iterativo de Gauss-Seidel durante 'it' iteraciones.
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
        for i = 1:n
            sum_ax = 0;
            for j = 1:n
                if j ~= i
                    sum_ax = sum_ax + A(i, j) * x(j);
                end
            end
            x(i) = (b(i) - sum_ax) / A(i, i);
        end
    end
    
end