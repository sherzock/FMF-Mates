function [subResults, total] = newton_cotes_cerrada_subintervalos(f, a, b, N, n, D, c)
    edges = linspace(a, b, N+1);
    subResults = zeros(1, N);

    for i = 1:N
        ai = edges(i);
        bi = edges(i+1);
        subResults(i) = newton_cotes_cerrada(f, ai, bi, n, D, c);
    end

    total = sum(subResults);
end
