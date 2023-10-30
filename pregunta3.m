% parte 3 de la tarea 2
% Define las matrices y vectores
clear; clc;
% Define matrices W, T, p, q, iterMax, and tol

%W = [12, -2, 6, -2; -2, 5, 2, 1; 6, 2, 9, -2; -2, 1, -2, 1];
%T = [6, 2, 7, 2; 2, 7, 1, 1; 7, 1, 9, 0; 2, 1, 0, 10];
%p = [9; -7; -5; 7];
%q = [12; -4; 17; -2];
%iterMax = 1000;
%tol = 10e-12;

% Define the pregunta3 function
function pregunta3(W, T, p, q, iterMax, tol)
  [x, error, iter, tiempo] = MHSS_method(W, T, p, q, iterMax, tol);
  %disp("resultado");
  %disp(x); si quiere ver el resultado de x entonces descomente esta linea de codigo
  disp("El error es: ");
  disp(error);
  disp("El tiempo de ejecución en segundos es: ");
  disp(tiempo);

  disp("El número de iteraciones es: ");
  disp(iter);
end

% Call pregunta3 with the defined matrices and parameters


% Function that solves the problem using the MHSS method
function [x, error, iter, tiempo] = MHSS_method(W, T, p, q, iterMax, tol)
    tic; % Start the timer
    n = length(W); % Size of the matrix
    Im = eye(n); % Identity matrix

    % Calculate λmin and λmax
    eigenvalues = eig(W);
    lambda_min = min(eigenvalues);
    lambda_max = max(eigenvalues);

    % Calculate the optimal value of alpha_star
    alpha_star = sqrt(lambda_max * lambda_min);

    x = zeros(size(p)); % Initialize x with zeros
    iter = 1;

    % Iterations
    for k = 1:iterMax
        M_alpha = mldivide(alpha_star * Im + T, Im) * (alpha_star * Im + 1i * W) * mldivide(alpha_star * Im + W, Im) * (alpha_star * Im - 1i * T);
        N_alpha = (1 - 1i) * alpha_star * mldivide(alpha_star * Im + T, Im) * mldivide(alpha_star * Im + W, Im);

        x = M_alpha * x + N_alpha * (p + 1i * q);

        error = norm((W + 1i * T) * x - (p + 1i * q));

        % Stopping condition
        if error < tol
            iter = k;
            tiempo = toc; % Stop the timer
            return;
        end
    end
    tiempo = toc; % Stop the timer
end

%pregunta3(W, T, p, q, iterMax, tol);
%[x, error, iter, tiempo] = MHSS_method(W, T, p, q, iterMax, tol);
 % #disp("resultado");
 % #disp(x);
 % #disp("El error es: ");
 % disp(error);
 %disp("El tiempo de ejecución en segundos es: ");
  %disp(tiempo);

  %disp("El número de iteraciones es: ");
  %disp(iter);

