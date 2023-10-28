function [p,q] = matrizB (m)
    n = m ^ 2;
    h = 1 / (m + 1);

    B = ones(n,1);
    for j = 1 : n
        B(j,1) = (1 - i) * j / (h * (j + 1) ^ 2);
    endfor
    p = real(B);
    q = imag(B);
endfunction
