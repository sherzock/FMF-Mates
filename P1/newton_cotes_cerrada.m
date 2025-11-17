function [I] = newton_cotes_cerrada(f, a, b, n, D, c)

h = (b-a)/n;
points = a:h:b;

I = 0;
for i = 1:n+1
    I = I + c(i)*f(points(i));
end
I = ((b-a)/D) * I;

end