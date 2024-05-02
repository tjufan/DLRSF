function [AP, CO, RL, OE, HL] = DLRSF(Para, Xtrain, Ytrain, Xtest, Ytest)
    % base parameters    
    mu1 = Para.mu1; rho1 = Para.rho1; mu2 = Para.mu2; rho2 = Para.rho2;
    alpha = Para.alpha; beta = Para.beta; eta = Para.eta; lambda = Para.lambda; 
    maxIter = optmParam.maxIter; max_mu = 1e10;
    dim = 256; layer = 2; 
    
    X = double(Xtrain'); Y = double(Ytrain'); Y(Y<1) = -1;
    Xtest = double(Xtest'); Ytest = double(Ytest'); Ytest(Ytest<1) = -1;
    [Z, L, E, A, O, J, K1, K2, Us] = initializeParams(X, Y, layer, dim);

    for iter = 1:maxIter
        J = Update_J(alpha, mu1, Z, K1);
        Z = Update_Z(mu1, mu2, X, Y, L, E, J, K1, K2, Us);
        L = Update_L(eta, mu2, X, Y, A, Z, E, K2, Us);
        Us = Update_Us(lambda, X, Y, L, Z, O, Us);
        O = Update_O(Us);
        A = Update_A(L);
        E = Update_E(beta, mu2, Y, Z, L, E, K2);
        [K1, K2, mu1, mu2] = Update_KMU(rho1, rho2, mu1, mu2, max_mu, Y, Z, L, E, J, K1, K2);
        disp(['iter: ', num2str(iter)]);
    end
    [AP, CO, OE, RL, HL] = Predict(Xtest, Ytest, Us, Z, L);        
end