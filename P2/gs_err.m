function [x, k] = gs_err(A, b, x0, tol, max_it)

    n = length(b);         
    x = x0;              

    for k = 1:max_it
        x_old = x;       
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