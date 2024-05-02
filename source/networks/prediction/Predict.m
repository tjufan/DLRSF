function [AP, CO, OE, RL, HL] = Predict(X, Y, Us, Z, L)
    Y_true = Y; U = dotSeries(Us); Y_pred = pinv(Z*L)*(U*X); 
    L_pred = -1*ones(size(Y_pred)); Y_pred = exp(Y_pred); 
    for i = 1:size(Y_pred, 2)
        val = Y_pred(:, i); mean_P = mean(val); var_P = sqrt(var(val));
        index = find(val>mean_P+3*var_P); L_pred(index, i) = 1;
        total=sum(val); Y_pred(:, i) = val/total;
    end
         
    AP = Average_precision(Y_pred, Y_true);
    HL = Hamming_loss(L_pred, Y_true);
    RL = Ranking_loss(Y_pred, Y_true);
    OE = One_error(Y_pred, Y_true);
    CO = coverage(Y_pred, Y_true);
end