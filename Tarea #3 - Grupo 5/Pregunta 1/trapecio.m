function I = trapecio(f, a, b)
  fnum = str2func(['@(x)' f]);
  I = (b - a) * (fnum(b) + fnum(a)) / 2;
end
