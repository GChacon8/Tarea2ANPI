% parte 3 de la tarea 2
% Define las matrices y vectores
W = [12, -2, 6, -2;
    -2, 5, 2, 1;
    6, 2, 9, -2;
    -2, 1, -2, 1];

T = [6, 2, 7, 2;
    2, 7, 1, 1;
    7, 1, 9, 0;
    2, 1, 0, 10];

p = [9; -7; -5; 7];
q = [12; -4; 17; -2];

iterMax = 1000;
tolerancia = 1e-12;
% Calcular los valores propios de W
function [x, alpha_opt] = MHSS_method(W, T, p, q, iterMax, tolerancia)
    % Calcular los valores propios de W
    eigenvalues = eig(W);
    lambda_min = min(eigenvalues);
    lambda_max = max(eigenvalues);

    % Calcular el valor óptimo de alpha
    alpha_opt = sqrt(lambda_min * lambda_max);

    % Construir M(α) y N(α) utilizando alpha_opt
    Im = eye(size(W));
    M_alpha = inv(alpha_opt * Im + T) * (alpha_opt * Im + 1i * W) * inv(alpha_opt * Im + W) * inv(alpha_opt * Im - T);
    N_alpha = (1 - 1i) * alpha_opt * inv(alpha_opt * Im + T) * inv(alpha_opt * Im + W);

    % Inicializar el vector x
    x = zeros(size(p));

    % Implementar el método MHSS
    for k = 1:iterMax
        x = M_alpha * x + N_alpha * (p + 1i * q);

        % Comprobar la condición de parada
        if norm(W * x - (p + 1i * q)) < tolerancia
            break;
        end
    end
end



[x, alpha_opt] = MHSS_method(W, T, p, q, iterMax, tolerancia);

disp("Solución del sistema Ax = b:");
disp(x);
disp("Valor óptimo de alpha: ");
disp(alpha_opt);
