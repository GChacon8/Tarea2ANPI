function ejecutable()
  f = '(log(asin(x)))/(log(x))';
  display("Para simpson la aproximacion es:");
  I=simpson(f,0.1,0.9);
  I
  display("Para simpson compuesto la aproximacion es:");
  I=simpson_compuesto(f,0.1,0.9,20);
  I
  display("Para simpson iterativo la aproximacion es:");
  I = simpson_compuesto_iterativa(f,0.1,0.9,1e-6,2500);
  I
  endfunction