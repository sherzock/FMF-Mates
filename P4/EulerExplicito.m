function [t, y, err_rel] = EulerExplicito(f, t0, tf, y0, h, y_exac)
% EULER_EXPLICIT  Método de Euler explícito para EDOs.
%
%   [t, y] = euler_explicit(f, t0, tf, y0, h)
%
%   f  - función manejador @(t,y) que define la EDO y' = f(t,y)
%   t0 - tiempo inicial
%   tf - tiempo final
%   y0 - condición inicial (escalar o vector)
%   h  - tamaño de paso
%
%   t  - vector de tiempos
%   y  - matriz donde cada fila es la solución en un tiempo t(i)

    % Construir el vector de tiempos
    t = t0:h:tf;
    n = length(t);

    % Inicializar solución
    y = zeros(n, 1);
    y(1) = y0;

    % Bucle del método de Euler
    for i = 1:n - 1
        y(i+1) = y(i) + h * f(t(i), y(i));
        disp(y(i));

    end

    %Error relativo

    y_exact = y_exac(t);   % 1 x n (fila)
    y_exact = y_exact(:);  % n x 1 (columna)

    err_rel = abs(y_exact - y) ./ abs(y_exact);
end
