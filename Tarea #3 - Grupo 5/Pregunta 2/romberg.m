% La función romberg aproxima la integral definida de una función
% Sintáxis de la función: res = romberg(func, a, b, n)
% Parámetros de entrada:
%         func: función a integrar
%         a: límite de integración inferior
%         b: límite de integración superior
%         n: número de iteraciones deseadas
% Parámetros de salida:
%         res = aproximacion del valor de la integral definida

function res = romberg(func, a, b, n)
    
    % Inicializar la matriz de Romberg
    R = zeros(n, n);

    % Construimos la primera fila con las aproximaciones usando
    % regla del tracio para 1, 2, 4, ..., (2 ^ n) intervalos
    for i = 1: n
        R(i, 1) = trapecio(func, a, b, (2 ^ i));
    endfor

    % Empezamos a extrapolar utilizando los resultados 
    % anteriores utilizando extrapolación de Richarson
    for j = 2:n
        for k = j : n
        R(k, j) = R(k, j-1) + (R(k, j - 1) - R(k-1, j - 1)) / (4 ^ (j - 1) - 1);
        endfor
    endfor

    R
    % El resultado final está en la esquina inferior derecha de la matriz
    resultado = R(n, n);
endfunction

function resultado = trapecio(func, a, b, n)
    % Función para calcular la integral definida mediante el método del trapecio.
    % func: función a integrar
    % a, b: límites de integración
    % n: número de intervalos
    
    h = (b - a) / n;  % Ancho de cada intervalo
    x = a:h:b;        % Puntos de evaluación
    
    % Calcular la suma de los extremos y el doble de la suma de los valores internos
    suma = func(a) + func(b) + 2 * sum(func(x(2:end-1)));
    
    % Calcular el resultado final utilizando el método del trapecio
    resultado = (h / 2) * suma;
endfunction