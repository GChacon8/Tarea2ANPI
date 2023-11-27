%la funcion trapecio compuesto aproxima la integral definida de una funcion
%la sintaxis de la función es: I=trapecio_compuesto(f,a,b,N)
%parametros de entrada:
%       f:funcion de entrada a integrar
%       a:limite de integracion inferior
%       b:limite de integración superior
%       N:numero de puntos en los que se divide el interavalo [a,b]
% parametros de salida:
%     I=aproximacion del valor de la integral definida
function I = trapecio_compuesto(f, a, b, N)
  h = (b - a) / (N - 1);
  xSoporte = a:h:b;
  I = 0;
  for i = 1:N-1
    I = I + trapecio(f, xSoporte(i), xSoporte(i+1));
  end
end


