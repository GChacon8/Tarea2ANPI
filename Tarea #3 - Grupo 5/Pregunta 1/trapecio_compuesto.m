%la funcion trapecio compuesto aproxima la integral definida de una funcion
%la sintaxis de la función es: I=trapecio_compuesto(f,a,b,N)
%parametros de entrada:
%       f:funcion de entrada a integrar
%       a:limite de integracion inferiorto
%       b:limite de integración superiorto
%       N:numero de iteraciones deseadas
% parametros de salida:
%     I=aproximacion del valor de la integral definida
function I = trapecio_compuesto(f, a, b, m)
  h = (b - a) / (m - 1);
  xSoporte = a:h:b;
  I = 0;
  for i = 1:m-1
    I = I + trapecio(f, xSoporte(i), xSoporte(i+1));
  end
end

