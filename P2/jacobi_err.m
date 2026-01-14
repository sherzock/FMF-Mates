function [x, it] = jacobi_err(A, b, x0, tol, max_it)
    
    n = length(b);       
    x = x0;                
    it = 0;

    for k = 1:max_it
        it = it + 1;
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