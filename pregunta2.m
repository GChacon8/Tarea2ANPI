% Si quiere probar el método usando la matriz de ejemplo del ejercicio 1, copiar la siguiente linea de código en la consola
% pregunta2([12 -2 6 -2; -2 5 2 1; 6 2 9 -2; -2 1 -2 1], [6 2 7 2; 2 7 1 1; 7 1 9 0; 2 1 0 10], [9; -7; -5; 7], [12; -4; 17; -2], [0;0;0;0], 1, 1, 10 ^ -12, 1000);

function pregunta2 (W, T, p, q, x0, w, a, tol, iterMax)
    % Soluciones usando los diferentes métodos
    printf("    Método #2 = PNHSS\n");
    [Error, TiempoEjecucion, Iteraciones] = PNHSS(W, T, p, q, x0, w, a, tol, iterMax);
    printf("        Error = %d\n", Error);
    printf("        Tiempo de Ejecucion = %d", TiempoEjecucion) 
    printf(" segundos\n");
    printf("        Iteraciones = %d\n", Iteraciones);

    printf("    Método #3 = PS*HSS\n");
    [Error, TiempoEjecucion, Iteraciones] = PS_HSS(W, T, p, q, x0, w, tol, iterMax);
    printf("        Error = %d\n", Error);
    printf("        Tiempo de Ejecucion = %d", TiempoEjecucion) 
    printf(" segundos\n");
    printf("        Iteraciones = %d\n", Iteraciones);
    
endfunction
        
function [err, tiempo, iter] = PNHSS (W, T, p, q, x0, w, a, tol, iterMax)
    inicio = time();
    % Establecer valor inicial y matrices A y b
    n = length(W);
    xk = x0; 
    A = W + i * T;
    b = p + i * q; 
    I = eye(n);

    % Iniciar el método iterativo
    for iter = 1 : iterMax
        % Cálculo de x^(1/2) que corresponde a un paso intermedio
        C = w * W + T;
        D = -i * (w * T - W) * xk + (w - i) * b;  
        x_aux = mldivide(C, D);

        % Cálculo de xk1 usando el valor intermedio anterior
        X = a * I + w * W + T;
        Z = (a * I - i * (w * T - W)) * x_aux + (w-i) * b;
        xk1 = mldivide(X, Z);

        % Verificar condición de parada
        xk = xk1;
        err = norm(A * xk - b);
        if err <= tol
            break;
        endif
    endfor
    final = time();
    tiempo = final - inicio;
endfunction

function [err, tiempo, iter] = PS_HSS (W, T, p, q, x0, w, tol, iterMax)
    inicio = time();
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
    
        % Verificar condición de parada
        xk = xk1;
        err = norm(A * xk - b);
        if err <= tol
            break;
        endif
    endfor
    final = time();
    tiempo = final - inicio;
endfunction


