function I=simpson(f,a,b)
  syms x
  f1=sym(f);
  fn=matlabFunction(f1);
  I=((b-a)/6)*(fn(a)+4*fn((a+b)/2)+fn(b));
endfunction

