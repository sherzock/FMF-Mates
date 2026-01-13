function [raiz, iter] = NewtonRaphson(f_expr, x0, tol)
    syms x

    f_sym  = f_expr;
    df_sym = diff(f_sym);

    df = matlabFunction(df_sym, 'Vars', x);
    f  = matlabFunction(f_sym,  'Vars', x);


    maxIter = 1000;

    x_curr = x0;

    for iter = 1:maxIter
        fx  = f(x_curr);
        dfx = df(x_curr);

        if dfx == 0
            error('La derivada se anuló en x = %g. No se puede continuar.', x_curr);
        end

        x_next = x_curr - fx / dfx;

        if abs(fx) < tol
            raiz = x_next;
            return
        end

        x_curr = x_next;
    end

    raiz = x_curr;
    warning('Se alcanzó el número máximo de iteraciones (%d) sin converger.', maxIter);
end
