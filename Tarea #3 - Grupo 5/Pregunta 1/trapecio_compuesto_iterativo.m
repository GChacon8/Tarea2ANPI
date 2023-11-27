%la funcion trapecio compuesto iterativo aproxima la integral definida de una funcion mediante iteraciones de la regla del trapecio compuesto
%la sintaxis de la función es: I=trapecio_compuesto(f,a,b,N)
%parametros de entrada:
%       f:funcion de entrada a integrar
%       a:limite de integracion inferiorto
%       b:limite de integración superiorto
%       tol: toleracia para comparar la cota de error
%       iterMax:numero de iteraciones deseadas
% parametros de salida:
%     I=aproximacion del valor de la integral definida

function I=trapecio_compuesto_iterativo(f,a,b,tol,iterMax)

  iterMin=1;
  for k=iterMin:iterMax
    Inew=trapecio_compuesto(f,a,b,k);
    if k>iterMin
      er=abs(Inew-I);
      if er<tol
        I=Inew;
        break;
      end
    end
    I=Inew;
  end
end
