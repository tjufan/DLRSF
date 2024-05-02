function L = Update_L(eta, mu2, X, Q, A, Z, E, Y2, Us)
   U = dotSeries(Us); QQ = pinv(Q*Q'); A = pinv(A);
   At = (1+mu2)*(Z'*Z); Bt = eta*A*QQ;
   Ct = (Z')*(U*X+Y2+mu2*(Q-E))*(Q')*QQ;
   L = calSYLVar(At, Bt, Ct);
end