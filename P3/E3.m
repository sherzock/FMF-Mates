clc
clear

syms x

f1 = sin(x) - 0.3*exp(x);
f1_tol = 1/100;

f1_1_a = 1;
f1_1_b = 4;

f1_ref = fzero(@(t) sin(t) - 0.3*exp(t), [f1_1_a, f1_1_b]);

[f1_1_raiz, f1_1_iters] = Biseccion(f1, f1_1_a, f1_1_b, f1_tol);
fprintf('f1_1 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f1_1_raiz, f1_1_iters, f1_ref, abs(f1_1_raiz - f1_ref));

f1_2_a = 1;

[f1_2_raiz, f1_2_iters] = NewtonRaphson(f1, f1_2_a, f1_tol);
fprintf('f1_2 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f1_2_raiz, f1_2_iters, f1_ref, abs(f1_2_raiz - f1_ref));

f2 = sqrt(x) - cos(x);

f2_tol = 1/1000;

f2_1_a = 0;
f2_1_b = 4;

f2_ref = fzero(@(t) sqrt(t) - cos(t), [f2_1_a, f2_1_b]);

[f2_1_raiz, f2_1_iters] = Biseccion(f2, f2_1_a, f2_1_b, f2_tol);
fprintf('f2_1 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f2_1_raiz, f2_1_iters, f2_ref, abs(f2_1_raiz - f2_ref));

f2_2_a = 1;

[f2_2_raiz, f2_2_iters] = NewtonRaphson(f2, f2_2_a, f2_tol);
fprintf('f2_2 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f2_2_raiz, f2_2_iters, f2_ref, abs(f2_2_raiz - f2_ref));

f2_3_a = 0.5;
f2_3_b = 1;

[f2_3_raiz, f2_3_iters] = Biseccion(f2, f2_3_a, f2_3_b, f2_tol);
fprintf('f2_3 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f2_3_raiz, f2_3_iters, f2_ref, abs(f2_3_raiz - f2_ref));

f2_4_a = 0.5;

[f2_4_raiz, f2_4_iters] = NewtonRaphson(f2, f2_4_a, f2_tol);
fprintf('f2_4 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f2_4_raiz, f2_4_iters, f2_ref, abs(f2_4_raiz - f2_ref));

f3 = 2*x^3 - 11.7*x^2 + 17.7*x - 5;

f3_bis_tol = 1e-3;

f3_1_a = 0;
f3_1_b = 1;

f3_ref_1 = fzero(@(t) 2*t.^3 - 11.7*t.^2 + 17.7*t - 5, [f3_1_a, f3_1_b]);

[f3_1_raiz, f3_1_iters] = Biseccion(f3, f3_1_a, f3_1_b, f3_bis_tol);
fprintf('f3_1 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f3_1_raiz, f3_1_iters, f3_ref_1, abs(f3_1_raiz - f3_ref_1));

f3_2_a = 1;
f3_2_b = 3;

f3_ref_2 = fzero(@(t) 2*t.^3 - 11.7*t.^2 + 17.7*t - 5, [f3_2_a, f3_2_b]);

[f3_2_raiz, f3_2_iters] = Biseccion(f3, f3_2_a, f3_2_b, f3_bis_tol);
fprintf('f3_2 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f3_2_raiz, f3_2_iters, f3_ref_2, abs(f3_2_raiz - f3_ref_2));

f3_3_a = 3;
f3_3_b = 5;

f3_ref_3 = fzero(@(t) 2*t.^3 - 11.7*t.^2 + 17.7*t - 5, [f3_3_a, f3_3_b]);

[f3_3_raiz, f3_3_iters] = Biseccion(f3, f3_3_a, f3_3_b, f3_bis_tol);
fprintf('f3_3 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f3_3_raiz, f3_3_iters, f3_ref_3, abs(f3_3_raiz - f3_ref_3));

f3_nr_tol = 1e-10;

f3_4_a = 0.5;

[f3_4_raiz, f3_4_iters] = NewtonRaphson(f3, f3_4_a, f3_nr_tol);
fprintf('f3_4 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f3_4_raiz, f3_4_iters, f3_ref_1, abs(f3_4_raiz - f3_ref_1));

f3_5_a = 1.5;

[f3_5_raiz, f3_5_iters] = NewtonRaphson(f3, f3_5_a, f3_nr_tol);
fprintf('f3_5 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f3_5_raiz, f3_5_iters, f3_ref_2, abs(f3_5_raiz - f3_ref_2));

f3_6_a = 4;

[f3_6_raiz, f3_6_iters] = NewtonRaphson(f3, f3_6_a, f3_nr_tol);
fprintf('f3_6 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f3_6_raiz, f3_6_iters, f3_ref_3, abs(f3_6_raiz - f3_ref_3));

f4 = exp(x/2) + 5*x - 5;

f4_tol = 1e-3;

f4_1_a = 0;
f4_1_b = 4;

f4_ref = fzero(@(t) exp(t/2) + 5*t - 5, [f4_1_a, f4_1_b]);

[f4_1_raiz, f4_1_iters] = Biseccion(f4, f4_1_a, f4_1_b, f4_tol);
fprintf('f4_1 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f4_1_raiz, f4_1_iters, f4_ref, abs(f4_1_raiz - f4_ref));

f4_2_a = 1;

[f4_2_raiz, f4_2_iters] = NewtonRaphson(f4, f4_2_a, f4_tol);
fprintf('f4_2 : %.10f (%g iters.) R=%.10f |Δ|=%.10e\n', f4_2_raiz, f4_2_iters, f4_ref, abs(f4_2_raiz - f4_ref));
