function [t, u, up] = EulerExplicitoOrden2(h, T, M, B, k, u0, up0)

    t0 = 0;

    % Malla temporal
    t = t0:h:T;
    N = length(t);

    % Variables: x1 = u, x2 = u'
    u  = zeros(1, N);
    up = zeros(1, N);

    u(1)  = u0;
    up(1) = up0;

    % Euler explícito con el sistema equivalente
    for n = 1:N-1
        du  = up(n);
        dup = -(B/M)*up(n) - (k/M)*u(n);

        u(n+1)  = u(n)  + h * du;
        up(n+1) = up(n) + h * dup;
    end
end
