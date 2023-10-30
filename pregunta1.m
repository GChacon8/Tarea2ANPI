
%Para probar el ejemplo dado en el instructivo, lo puede comprobar ejecutando la siguiente linea en consola.
%pregunta1([12, -2, 6, -2; -2, 5, 2, 1; 6, 2, 9, -2; -2, 1, -2, 1], [6, 2, 7, 2; 2, 7, 1, 1; 7, 1, 9, 0; 2, 1, 0, 10], [9; -7; -5; 7], [12; -4; 17; -2], [0; 0; 0; 0],10e-12,1000)

function F = pregunta1(W, T, p, q, x, tol, iterMax)

printf("Método #1 = HSS\n");

  tic;

  m = length(W);
  I = eye(m);

  printf("  Caso para m = %d\n", m);

  S = T*i;

  b = p + i*q;

  A = W + S;

  for j=1 : iterMax
    z = ((I+W)\I) * (I - S) * x + ((I+W)\I)*b;
    x = ((I+S)\I) * ((I-W)*z) + ((I+S)\I) * b;
    err = norm((A*x - b));
    if err < tol
      break;
    endif
  endfor

  aprox = x;
  Iter = j;
  t= toc;

  printf("    Error = %d\n", err);
  printf("    Tiempo de ejecucion = %d\n", t);
  printf("    Iteraciones = %d\n", Iter);


  endfunction
