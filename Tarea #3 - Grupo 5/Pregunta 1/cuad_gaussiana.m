function cuad_gaussiana(f, n)
  syms x
  [xv,p]=ceros_pol_legendre(n);
  w=pesos(xv,p);
  fs=sym(f);
  fn=matlabFunction(fs);
  I=0;
  for k=1:n
    I=I+w(k)*fn(xv(k));
  end
end

function [xv,p]=ceros_pol_legendre(n)
  syms x
  q=diff((x^2-1)^n,n);
  p=(1/(factorial(n)*2^n)*q);
  xv=solve(p==0);
  xv=double(xv);
end

function w=pesos(xv,p)
  syms x
  n=length(xv);
  pd=diff(p);
  pd_n=matlabFunction(pd);
  w=2./((1-xv.^2).*(pd_n(xv)).^2);
end

