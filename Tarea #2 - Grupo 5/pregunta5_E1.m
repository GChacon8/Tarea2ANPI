function pregunta5_E1
    clc; clear;

    % Constantes Iniciales
    tol = 10 ^ -6;
    iterMax = 5000;

    m = 16; % Colocar aquí el tamaño de matriz deseado
    x = zeros(m ^ 2, 1); % Generar valor inicial
    [W,T] = matrizWT(m);
    [p,q] = matrizB(m);

    printf("Caso #1: m=16\n");
    % Colocar aquí los métodos
    pregunta1(W, T, p, q, x, tol, iterMax);
    pregunta2 (W, T, p, q, x, 0.65, 0.01, tol, iterMax);
    % #3
    pregunta3 (W, T, p, q, iterMax, tol)
    % #4
    pregunta4(W, T, p, q);

    m = 32; % Colocar aquí el tamaño de matriz deseado
    x = zeros(m ^ 2, 1); % Generar valor inicial
    [W,T] = matrizWT(m);
    [p,q] = matrizB(m);

    printf("Caso #2: m=32\n");
    % Colocar aquí los métodos
    pregunta1(W, T, p, q, x, tol, iterMax);
    pregunta2 (W, T, p, q, x, 0.65, 0.01, tol, iterMax);
    % #3
    pregunta3(W, T, p, q, iterMax, tol)
    % #4
    pregunta4(W, T, p, q);

    m = 64; % Colocar aquí el tamaño de matriz deseado
    x = zeros(m ^ 2, 1); % Generar valor inicial
    [W,T] = matrizWT(m);
    [p,q] = matrizB(m);

    printf("Caso #3: m=64\n");
    % Colocar aquí los métodos
    pregunta1(W, T, p, q, x, tol, iterMax);
    pregunta2 (W, T, p, q, x, 0.65, 0.01, tol, iterMax);
    % #3
    pregunta3(W, T, p, q, iterMax, tol)
    % #4
    pregunta4(W, T, p, q);

    m = 128; % Colocar aquí el tamaño de matriz deseado
    x = zeros(m ^ 2, 1); % Generar valor inicial
    [W,T] = matrizWT(m);
    [p,q] = matrizB(m);

    printf("Caso #4: m=128\n");
    % Colocar aquí los métodos
    pregunta1(W, T, p, q, x, tol, iterMax);
    pregunta2(W, T, p, q, x, 0.65, 0.01, tol, iterMax);
    % #3
    pregunta3(W, T, p, q, iterMax, tol)
    % #4
    pregunta4(W, T, p, q);

    m = 256; % Colocar aquí el tamaño de matriz deseado
    x = zeros(m ^ 2, 1); % Generar valor inicial
    [W,T] = matrizWT(m);
    [p,q] = matrizB(m);

    printf("Caso #5: m=256\n");
    % Colocar aquí los métodos
    pregunta1(W, T, p, q, x, tol, iterMax);
    pregunta2(W, T, p, q, x, 0.65, 0.01, tol, iterMax);
    % #3
    pregunta3(W, T, p, q, iterMax, tol)
    % #4
    pregunta4(W, T, p, q);
endfunction

function [W,T] = matrizWT (m)
    I = eye(m ^ 2); % Definir la matriz identidad
    h = 1 / (m + 1); % Definir la constante h

    K = matrizK(m);
    W = K + I * (3 - sqrt(3)) / h;
    T = K + I * (3 + sqrt(3)) / h;
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
