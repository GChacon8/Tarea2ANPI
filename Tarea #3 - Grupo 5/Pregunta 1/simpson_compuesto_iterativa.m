function I=simpson_compuesto_iterativa(f,a,b,tol,iterMax)
% La función simpson_compuesto_iterativa aproxima la integral definida de una función mediante el metodo de simpson compuesto iterativo. O sea, hasta que el error sea menor a una tolerancia.
  % La sintaxis de la función es: I=simpson_compuesto_iterativa(f,a,b,tol,iterMax)
  % Parámetros de entrada:
  %       f: Función de entrada a integrar.
  %       a: Límite de integración inferior.
  %       b: Límite de integración superior.
  %       tol: Tolerancia para el error de la aproximacion.
  %       iterMax: Iteraciones maximas que toma el calculo.
  %
  % Parámetros de salida:
  %     I: Aproximación del valor de la integral definida.
  for k=1:iterMax
    Inew = simpson_compuesto(f,a,b,k);
    if k>1
      er=abs(Inew-I);
      if er<tol
        I=Inew;
        break;
      endif
    endif
    I=Inew;
  endfor
endfunction

