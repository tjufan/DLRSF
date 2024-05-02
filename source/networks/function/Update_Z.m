function Z = Update_Z(mu1, mu2, X, Q, L, E, J, Y1, Y2, Us)
    U = dotSeries(Us);
    M = (mu1*J-Y1)+(U*X+mu2*Q-mu2*E+Y2)*(Q')*(L');
    N = (1+mu2)*L*Q*(Q')*(L')+mu1*eye(size(L, 1));
    Z = M*pinv(N);
end