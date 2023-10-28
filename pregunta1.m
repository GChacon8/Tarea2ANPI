function R = pregunta1()

  x = zeros(4,1);
  I = eye(4);
  iterMax = 1000;

  W = [
  12, -2, 6, -2;
  -2, 5, 2, 1;
  6, 2, 9, -2;
  -2, 1, -2, 1];

  T = [
  6, 2, 7, 2;
  2, 7, 1, 1;
  7, 1, 9, 0;
  2, 1, 0, 10];

  S = T*i;

  p = [9; -7; -5; 7];

  q = [12; -4; 17; -2];

  b = p + i*q;

  for c=1 : 1000
    z = ((I+W)\I) * (I - S) * x + ((I+W)\I)*b;
    x = ((I+S)\I) * ((I-W)*z) + ((I+S)\I) * b;
  endfor

  x

  endfunction
