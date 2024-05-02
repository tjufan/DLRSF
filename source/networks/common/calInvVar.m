function temp1 = calInvVar( X )
    % solve the problem : tr(XY^{-1}X^{T})
    Z_multiply = X' * X;
    
    try
        temp1=sqrtm(Z_multiply);
        temp1=real(temp1);%make sure temp1 is a real matrix
    catch ErrorInfo
        disp(ErrorInfo);
        add_value=trace(abs(Z_multiply))/(size(Z_multiply,1)*10);
        Z_multiply=Z_multiply+add_value*eye(size(Z_multiply,1));
        temp1=sqrtm(Z_multiply);
        temp1=real(temp1);
    end
    %temp1 = temp1+temp1'; %abs(temp1);
    temp1 = temp1/trace(temp1);
end

