function pregunta5_E1
    m = 4; % Colocar aquí el tamaño de matriz deseado
    K = matrizK(2); 
    [p,q] = matrizB(2);
endfunction

function A = tridiag(m, b, a ,c)
    % Generar la matriz tridiagonal
    A = diag(a * ones(1,m)) + diag(b * ones(1,m-1), 1) + diag(c * ones(1,m-1), -1);
    endfunction

function K = matrizK(m)
  I = eye(m); % Definir la matriz identidad
  h = 1 / (m + 1); % Definir la constante h
  Bm = (1 / h ^ 2) * tridiag(m, -1, 2, 1); % Calcular la matriz BM
  K = kron(I, Bm) + kron(Bm, I); % Hacer el cálculo de la matriz K
endfunction

function [p,q] = matrizB (m)
    n = m ^ 2; % Definir el tamaño de matriz n
    h = 1 / (m + 1); % Definir la constante h
    B = ones(n,1); % Crear una matriz momentánea
    for j = 1 : n
        B(j,1) = (1 - i) * j / (h * (j + 1) ^ 2); % Calcular cada espacio de la matriz B
    endfor
    p = real(B); % Obtener la matriz de la parte real
    q = imag(B); % Obtener la matriz de la parte imaginaria
endfunction