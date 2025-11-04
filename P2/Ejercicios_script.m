%Ejercicio  1
A = [ 3    -0.1  -0.2;
      0.1  7    -0.3;
      0.3  -0.2  10  ];

b = [7.85; -19.3; 71.4];

% (Opcional) Resolver el sistema:
% x = A \ b
xo = zeros(1, 120)

x_gaussSeidel = gs_it(A,b, 1, xo)
x_jacobi = jacobi_it(A, b, 1, xo)


%Ejercicio 2

A = [5  2  1  1;
     1  7  3  1;
     1  4  9  2;
     1  1  1  4];

b = [12;
     2;
     1;
     3];

x_gaussSeidel = gs_it(A,b, 1, xo)
x_jacobi = jacobi_it(A, b, 1, xo)

