% Esta funcion se utiliza como función principal para hacer una prueba de los resultados de las funciones posteriores.
function pregunta4()

  clc; clear;

  W=[12 -2 6 -2;-2 5 2 1;6 2 9 -2;-2 1 -2 1];
  T=[6 2 7 2;2 7 1 1;7 1 9 0;2 1 0 10];

  p=[9 -7 -5 7].';
  q=[12 -4 17 -2].';

  M=[W -T;T W];
  d=[p;q];

  n=length(M);

% ----- Eliminación Gaussiana -----
  display ("Eliminación Gaussiana");

  z=elim_gauss(M,d);

  [u, v] = list_div(z);

  x = u + v.*i

  error = norm(M*z-d)

% ----- Factorización QR -----
  display ("\nFactorización QR");

  [Q,R] = metodoQR(M);

  c=(Q')*d;

  Im=eye(n);
  Rinv=mldivide(R,Im);

  z = Rinv*c;

  [u, v] = list_div(z);

  x = u + v.*i

  error = norm(M*z-d)
end

%Esta función divide una lista a la mitad y retorna el resultado de las dos mitades.
function [u, v] = list_div(x)
  indice_de_division = floor(length(x) / 2);

  u = x(1:indice_de_division);
  v = x(indice_de_division+1:end);
end

% ------------------------------------------------------------------------------
% La función elim_gauss define el metodo de Eliminación Gaussiana, creando una matriz triangular superior y resolviendola haciendo sustitución hacia atrás.
% Sintaxis de la función: x=elim_gauss(A,b)
% Parametros de entrada:
%         A = Matriz de entrada conocida
%         b = Vector de entrada conocido
%         iterMax = número entero positivo, que representa la cantidad de iteraciones moximas del motodo
%         tol = número real positivo, que es el criterio de parada del error
% Parametros de salida:
%         x = resultado del metodo de la Eliminación Gaussiana
%         er = error obtenido de la operación
%         k = cantidad de iteraciones realizadas
function x=elim_gauss(A,b)
  [At,bt]=triang_sup(A,b);
  x=sust_atras(At,bt);
end


function x=sust_atras(A,b)
  m=length(b);
  x=zeros(m,1);
  for i=m:-1:1
    aux=0;
    for j=i+1:m
      aux+=A(i,j)*x(j);
    end
    x(i)=(1/A(i,i))*(b(i)-aux);
  end
end

function [Ar,br]=triang_sup(A,b)
  m=size(A,1);
  At=[A b];
  for k=1:m-1
    for i=k+1:m
      p=At(i,k)/At(k,k);
      for j=k:m+1
        At(i,j)=At(i,j)-p*At(k,j);
      end
    end
  end
  Ar=At(:,1:m);
  br=At(:,m+1);
end

% ------------------------------------------------------------------------------
% La función metodoQR define el metodo de Factorización QR.
% Sintaxis de la función: [Q,R] = metodoQR(A)
% Parametros de entrada:
%         A = Matriz invertible de entrada conocida
%         iterMax = número entero positivo, que representa la cantidad de iteraciones moximas del motodo
%         tol = número real positivo, que es el criterio de parada del error
% Parametros de salida:
%         Q = matriz ortogonal Q resultado del Metodo QR
%         R = matriz triangular superior R resultado del Metodo QR
%         er = error obtenido de la operación
%         k = cantidad de iteraciones realizadas

function [Q,R] = metodoQR(A)

  n = size(A,1);
  U = zeros(n,n);
  R = zeros(n,n);
  Q = zeros(n,n);

  U(:,1) = A(:,1);

  Q(:,1) = U(:,1)/norm(U(:,1));

  for k=2:n
    aux = 0;
    for j=1:k-1
      aux = aux + ((A(:,k).')*Q(:,j))*Q(:,j);
    end
    U(:,k) = A(:,k) - aux;

    Q(:,k) = U(:,k)/norm(U(:,k));
  end

  R = (Q.')*A;

end
