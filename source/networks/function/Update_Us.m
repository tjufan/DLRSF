function Us = Update_Us(lambda, X, Q, L, Z, O, Us)
    V = Z*L*Q; O = pinv(O);
    if length(Us) == 1
        Us{1} = V*(X')*pinv(2*lambda*O+X*(X'));
    else
        for i = 1:length(Us)
            if i == 1
                N = dotSeries(Us(i+1:end));
                Us{i} = V*(X')*(N')*pinv(2*lambda*N*O*(N')+N*X*(X')*(N'));
            elseif i == length(Us)
                M = dotSeries(Us(1:end-1));
                Us{i} = pinv(M'*M)*(M'*V*X')*pinv(2*lambda*O+X*(X'));
            else
                M = dotSeries(Us(1:i-1)); N = dotSeries(Us(i+1:end));
                Us{i} = pinv(M'*M)*(M'*V*X'*N')*pinv(2*lambda*N*O*(N')+N*X*(X')*(N'));
            end
            
        end 
    end

end