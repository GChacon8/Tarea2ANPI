function K = matrizK(m)

  I = eye(m);
  h= 1/(m+1);

  Bm = (1/ h^2) * tridiag(m,-1,2,1);

  K = kron(I,Bm) + kron(Bm,I);
  endfunction
