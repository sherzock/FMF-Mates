f = @(x) cos(x) - x .* sin(x);
a = 1;
b = 3;
N_vals = [2, 4, 8, 16, 32]; % Números de sub-intervalos

% Exacto
exacto = integral(f,a,b);

e_a = @(x) abs(exacto - x);
e_r = @(x) e_a(x)/abs(exacto);
e_rp = @(x) e_r(x) * 100;
disp(["[Exacto],$" + exacto + "$,$" + e_a(exacto) + "$,$" + e_r(exacto) + "$,$" + e_rp(exacto) + "%$,"]);

% Milne compuesto para distintos N
n = 4;
D = 90;
c = [7, 32, 12, 32, 7];

for N = N_vals
	[subResults, I_milne] = newton_cotes_cerrada_subintervalos(f, a, b, N, n, D, c);
	disp(["$" + N + "$,$" + I_milne + "$,$num('" + e_a(I_milne) + "')$,$num('" + e_r(I_milne) + "')$,$num('" + e_rp(I_milne) + "')%$,"]);
end
