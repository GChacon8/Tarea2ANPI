function I=simpson_compuesto(f,a,b,n)

  h = (b-a)/(n-1);
  xSoporte = a:h:b;
  I=0;
  for i=1:n-1
    I=I+simpson(f,xSoporte(i),xSoporte(i+1));
  endfor
endfunction
