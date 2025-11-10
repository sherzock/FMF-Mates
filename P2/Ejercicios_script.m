% Ejercicio  1
A = [ 3    -0.1  -0.2;
      0.1   7    -0.3;
      0.3  -0.2   10   ];

b = [7.85; -19.3; 71.4];
sol = [3,-2.5,7];

tol = [1, 0.1, 0.01, 0.001, 0.0001];

xo = zeros(1, 120);
for t = tol
    [x_jacobi, it_jacobi] = jacobi_err(A, b, xo, t, 1000);

    disp("$" + t + "$,$" + x_jacobi(1) + "$,$" + x_jacobi(2) + "$,$" + x_jacobi(3) + "$,$" + it_jacobi + "$,")
end

for t = tol
    [x_gs, it_gs] = gs_err(A,b, xo, t, 1000);

    disp("$" + t + "$,$" + x_gs(1) + "$,$" + x_gs(2) + "$,$" + x_gs(3) + "$,$" + it_gs + "$,")
end

% Ejercicio  2

A = [5  2  1  1;
     1  7  3  1;
     1  4  9  2;
     1  1  1  4];

b = [12;
     2;
     1;
     3];

sol = [2.7273,-0.4040,0.6364,-0.1919];

tol = [1, 0.1, 0.01, 0.001, 0.0001];

xo = zeros(1, 120);
for t = tol
    [x_jacobi, it_jacobi] = jacobi_err(A, b, xo, t, 1000);

    disp("$" + t + "$,$" + x_jacobi(1) + "$,$" + x_jacobi(2) + "$,$" + x_jacobi(3) + "$,$" + x_jacobi(4) + "$,$" + it_jacobi + "$,")
end
for t = tol
    [x_gs, it_gs] = gs_err(A,b, xo, t, 1000);

    disp("$" + t + "$,$" + x_gs(1) + "$,$" + x_gs(2) + "$,$" + x_gs(3) + "$,$" + x_gs(4) + "$,$" + it_gs + "$,")
end
