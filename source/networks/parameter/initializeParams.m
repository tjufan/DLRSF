function [Z, L, E, A, O, J, K1, K2, Us] = initializeParams(X, Y, layer, dim)
    rng('default'); tic;
    [d, n] = size(X); [c, ~] = size(Y);  
    ds = [d, 525, 575, 625, 675, 725, 775, 825, 875, 925, 975];
    Z = randn(c, dim); J = zeros(c, dim); K1 = zeros(c, dim); K2 = zeros(c, n); O = 1/d*eye(d);
    E = sparse(c, n); L = randn(dim, c); Us = cell(layer, 1); A = 1/c*eye(c);
    for i = 1:layer
        if i == layer
            Us{layer-i+1} = randn(c, ds(i));
        else
            Us{layer-i+1} = randn(ds(i+1), ds(i));
        end
    end
end