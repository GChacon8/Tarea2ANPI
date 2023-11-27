function I=simpson_compuesto(f,a,b,n)
  % La función simpson_compuesto aproxima la integral definida de una función mediante el metodo de simpson compuesto.
  % La sintaxis de la función es: I=simpson_compuesto(f,a,b,n)
  % Parámetros de entrada:
  %       f: Función de entrada a integrar.
  %       a: Límite de integración inferior.
  %       b: Límite de integración superior.
  %       n: Número de puntos a utilizar
  %
  % Parámetros de salida:
  %     I: Aproximación del valor de la integral definida.
  h = (b-a)/(n-1);
  xSoporte = a:h:b;
  I=0;
  for i=1:n-1
    I=I+simpson(f,xSoporte(i),xSoporte(i+1));
  endfor
endfunction
