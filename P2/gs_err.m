function [x] = gs_err(A, b, x0, tol, max_it)
    % GS_ERR Resuelve el sistema de ecuaciones Ax = b usando el método de Gauss-Seidel con criterio de error.
    %
    %   [x] = GS_ERR(A, b, x0, tol, max_it) resuelve el sistema de ecuaciones lineales Ax = b
    %   utilizando el método iterativo de Gauss-Seidel hasta que la solución converge dentro de una tolerancia
    %   especificada o se alcanza el número máximo de iteraciones.
    %
    %   Entradas:
    %       A      - Matriz de coeficientes (debe ser cuadrada y no singular).
    %       b      - Vector de términos independientes.
    %       x0     - Vector inicial para la iteración.
    %       tol    - Tolerancia para el criterio de convergencia.
    %       max_it  - Número máximo de iteraciones a realizar.
    %
    %   Salidas:
    %       x      - Vector solución aproximada.

    n = length(b);         % Número de ecuaciones
    x = x0;                % Inicialización del vector solución

    for k = 1:max_it
        x_old = x;         % Guardar la solución anterior para el criterio de convergencia
        for i = 1:n
            sum_ax = 0;
            for j = 1:n
                if j ~= i
                    sum_ax = sum_ax + A(i, j) * x(j);
                end
            end
            x(i) = (b(i) - sum_ax) / A(i, i);
        end
        
        % Criterio de convergencia
        if norm(x - x_old, inf) < tol
            break;
        end
    end
    
end