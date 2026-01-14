function [x] = jacobi_it(A, b, it, x0)
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