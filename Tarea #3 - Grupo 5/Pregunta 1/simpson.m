function I=simpson(f,a,b)
  % La función simpson aproxima la integral definida de una función mediante el metodo de simpson simple.
  % La sintaxis de la función es: I = simpson(f, a, b)
  % Parámetros de entrada:
  %       f: Función de entrada a integrar.
  %       a: Límite de integración inferior.
  %       b: Límite de integración superior.
  %
  % Parámetros de salida:
  %     I: Aproximación del valor de la integral definida.
  fn = str2func(['@(x)' f]);
  I=((b-a)/6)*(fn(a)+4*fn((a+b)/2)+fn(b));
endfunction

