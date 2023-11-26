function I=simpson_compuesto_iterativa(f,a,b,tol,iterMax)

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

