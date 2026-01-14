function [x] = gs_it(A, b, it, x0)
    n = length(b);      
    x = x0;      

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