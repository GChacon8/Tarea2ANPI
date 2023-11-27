function I = gaussiana_compuesta_iterativa(f, a, b, tol, iterMax)
  % La función gaussiana_compuesta_iterativa aproxima la integral definida de una función mediante cuadratura gaussiana compuesta iterativa.
  % La sintaxis de la función es: I = gaussiana_compuesta_iterativa(f, a, b, tol, iterMax)
  % Parámetros de entrada:
  %       f: Función de entrada a integrar.
  %       a: Límite de integración inferior.
  %       b: Límite de integración superior.
  %       tol: Tolerancia para la comparación de la cota de error entre iteraciones consecutivas.
  %       iterMax: Número máximo de iteraciones permitidas.
  %
  % Parámetros de salida:
  %     I: Aproximación del valor de la integral definida.

    iterMin = 1;
    for k = iterMin:iterMax
        Inew = gaussiana_compuesta(f, a, b, k);
        if k > iterMin
            er = abs(Inew - I);
            if er < tol
                I = Inew;
                break;
            end
        end
        I = Inew;
    end
end
