f = @(x) exp(x);
a = 0;
b = 1;

% Exacto
exacto = f(b) - f(a);

e_a = @(x) abs(exacto - x);
e_r = @(x) e_a(x)/abs(exacto);
e_rp = @(x) e_r(x) * 100;

% Rectángulo izquierdo
I_ri = rectangulo_izquierda(f, a, b);
disp(["[Rect. izq.],$" + I_ri + "$,$" + e_a(I_ri) + "$,$" + e_r(I_ri) + "$,$" + e_rp(I_ri) + "%$,"]);

% Rectángulo derecho
I_rd = rectangulo_derecha(f, a, b);
disp(["[Rect. der.],$" + I_rd + "$,$" + e_a(I_rd) + "$,$" + e_r(I_rd) + "$,$" + e_rp(I_rd) + "%$,"]);

% Rectángulo punto medio
I_pm = rectangulo_medio(f, a, b);
disp(["[Rect. punto medio],$" + I_pm + "$,$" + e_a(I_pm) + "$,$" + e_r(I_pm) + "$,$" + e_rp(I_pm) + "%$,"]);

% Trapecio
n = 1;
D = 2;
c = [1,1];
I_t = newton_cotes_cerrada(f,a,b,n,D,c);
disp(["[Trapecio],$" + I_t + "$,$" + e_a(I_t) + "$,$" + e_r(I_t) + "$,$" + e_rp(I_t) + "%$,"]);

% Simpson 1/3
n = 2;
D = 6;
c = [1,4,1];
I_s = newton_cotes_cerrada(f, a, b, n, D, c);
disp(["[Simpson 1/3],$" + I_s + "$,$" + e_a(I_s) + "$,$" + e_r(I_s) + "$,$" + e_rp(I_s) + "%$,"]);
