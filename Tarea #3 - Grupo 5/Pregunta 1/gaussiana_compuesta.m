function I = gaussiana_compuesta(f, a, b, m)
    [xv, p] = ceros_pol_legendre(m);
    w = pesos(xv, p);

    h = (b - a) / m;
    I = 0;

    for i = 1:m
        xi = a + (i - 1) * h;
        xi1 = a + i * h;

        I = I + h/2 * sum(w .* arrayfun(@(x) feval(f, (xi1 - xi) * x/2 + (xi + xi1)/2), xv));
    end
end

function [xv, p] = ceros_pol_legendre(n)
    syms x
    q = diff((x^2 - 1)^n, n);
    p = (1 / (factorial(n) * 2^n) * q);
    xv = solve(p == 0);
    xv = double(xv);
end

function w = pesos(xv, p)
    syms x
    n = length(xv);
    pd = diff(p);
    pd_n = matlabFunction(pd);
    w = 2 ./ ((1 - xv.^2) .* (pd_n(xv)).^2);
end
