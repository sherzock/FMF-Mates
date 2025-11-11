
%Datos de entrada
f =  %función
a = %primer parametro del intervalo
b = %segundo parametro del intervalo
tol = %tolerancia


%Función de Bisección
    if f(a) * f(b) > 0
        error('f(a) y f(b) deben tener signos opuestos.');
    end

    maxIter = ceil(log((b - a) / tol)) / log(2);

    for iter = 1:maxIter
        c = (a + b)/2;
        fc = f(c);
        
        if (b - a)/2 < tol
            raiz = c;
            return
        end
        
        if f(a)*fc < 0
            b = c;
        else
            a = c;
        end
    end

    raiz = (a + b)/2; 
    warning('Se alcanzó el número máximo de iteraciones (%d) sin converger.', maxIter);