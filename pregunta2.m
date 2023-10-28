function pregunta2
    clc; clear;
    % Definición de la Matriz para probar los códigos
    W = [12 -2 6 -2; -2 5 2 1; 6 2 9 -2; -2 1 -2 1];
    T = [6 2 7 2; 2 7 1 1; 7 1 9 0; 2 1 0 10];
    p = [9; -7; -5; 7];
    q = [12; -4; 17; -2];

    % Definición de otros parametros importantes
    tol = 10 ^ -12; % Tolerancia para la condicion de parada
    iterMax = 1000; % Número de iteraciones máximas para la serie
    x0 = [0;0;0;0]; % Vector inicial de prueba

    % Soluciones usando los diferentes métodos
    fprintf("Solución utilizando el metodo PNHSS: \n");
    [x_1, Error_1, Iter_1] = PNHSS(W, T, p, q, x0, tol, iterMax)
    fprintf('\n');

    fprintf("Solución utilizando el metodo PS*HSS: \n");
    [x_2, Error_2, Iter_2] = PS_HSS(W, T, p, q, x0, tol, iterMax)
endfunction
        
function [xk, err, iter] = PNHSS (W, T, p, q, x0, tol, iterMax)
    % Definicion de constantes
    w = 1; 
    a = 1; 
    n = length(W);

    % Establecer valor inicial y matrices A y b
    xk = x0; 
    A = W + i * T;
    
    b = p + i * q; 

    % Iniciar el método iterativo
    for iter = 1 : iterMax
        % Cálculo de x^(1/2) que corresponde a un paso intermedio
        C = w * W + T;
        D = -i * (w * T - W) * xk + (w - i) * b;  
        x_aux = mldivide(C, D);

        % Cálculo de xk1 usando el valor intermedio anterior
        X = a * eye(n) + w * W + T;
        Z = (a * eye(n) - i * (w * T - W)) * x_aux + (w-i) * b;
        xk1 = mldivide(X, Z);

        % Verificar condición de parada
        xk = xk1;
        err = norm(A * xk - b);
        if err <= tol
            break;
        endif
    endfor
endfunction

function [xk, err, iter] = PS_HSS (W, T, p, q, x0, tol, iterMax)
    % Definición de constante
    w = 1;
    
    % Establecer valor inicial y matrices A y b
    xk = x0;
    A = W + i * T;
    b = p + i * q;
    
    % Iniciar el método iterativo
    for iter = 1 : iterMax
        % Cálculo del siguiente valor de la sucesión
        C = w * W + T;
        D = -i * (w * T - W) * xk + (w - i) * b;
        xk1 = mldivide(C, D);

        xk = xk1;
        
        err = norm(A * xk - b);
        if err <= tol
            break;
        endif
    endfor
endfunction


