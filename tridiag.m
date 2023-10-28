function A = tridiag(m, b, a ,c)


  A = diag(a*ones(1,m)) + diag(b*ones(1,m-1),1) + diag(c*ones(1,m-1),-1);

  endfunction
