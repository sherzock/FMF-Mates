function [x, k] = jacobi_err(A, b, x0, tol, max_it)
    % JACOBI_ERR Resuelve el sistema de ecuaciones Ax = b usando el método de Jacobi con criterio de error.
    %
    %   [x] = JACOBI_ERR(A, b, x0, tol, max_it) resuelve el sistema de ecuaciones lineales Ax = b
    %   utilizando el método iterativo de Jacobi hasta que la solución converge dentro de una tolerancia
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
        
        % Criterio de convergencia
        if norm(x_new - x, inf) < tol
            break;
        end
        
        x = x_new; % Actualizar la solución para la siguiente iteración
    end
    
end