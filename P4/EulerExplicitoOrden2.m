function [t, u, up] = EulerExplicitoOrden2(h, T, M, B, k, u0, up0)
% EULER_ORDEN2  Método de Euler explícito para el Problema 2:
%
%   M*u'' + B*u' + k*u = 0,   0 < t < T
%   u(0) = u0,   u'(0) = up0
%
%   Se usa el cambio de variable:
%       x1 = u
%       x2 = u'
%   =>  x1' = x2
%       x2' = -(B/M)*x2 - (k/M)*x1
%
%   [t, u, up] = euler_orden2(h, T, M, B, k, u0, up0)
%
%   h   - paso de discretización
%   T   - tiempo final
%   M,B,k,u0,up0 - parámetros físicos y condiciones iniciales
%
%   t   - vector de tiempos
%   u   - posición aproximada u(t)
%   up  - velocidad aproximada u'(t)

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
        % Sistema:
        % u'  = up
        % up' = -(B/M)*up - (k/M)*u
        du  = up(n);
        dup = -(B/M)*up(n) - (k/M)*u(n);

        u(n+1)  = u(n)  + h * du;
        up(n+1) = up(n) + h * dup;
    end
end
