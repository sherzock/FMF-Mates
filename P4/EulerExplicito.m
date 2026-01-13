function [t, y, err_rel] = EulerExplicito(f, t0, tf, y0, h, y_exac)

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
    y_exact = y_exac(t);   
    y_exact = y_exact(:);

    err_rel = abs(y_exact - y) ./ abs(y_exact);
end
