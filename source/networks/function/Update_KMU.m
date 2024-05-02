function [K1, K2, mu1, mu2] = Update_KMU(rho1, rho2, mu1, mu2, max_mu, Y, Z, L, E, J, K1, K2)
    leq1 = Z-J; leq2 = Y-Z*L*Y-E;
    K1 = K1 + mu1*leq1;
    K2 = K2 + mu2*leq2;
    mu1 = min(max_mu, rho1*mu1);
    mu2 = min(max_mu, rho2*mu2);
    % stopC = max(max(max(abs(leq1))), max(max(abs(leq2))));
end