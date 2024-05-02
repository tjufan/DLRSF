function Wi = calSYLVar( a, b, c )
    % Solve the problem: AX+XB=C
    try
        Wi=sylvester(a,b,c);
    catch ErrorInfo
        %disp(ErrorInfo);
        %fprintf('solve sylvester error\n');
        add_value_a=trace(abs(a))/(size(a,1)*10);
        add_value_b=trace(abs(b))/(size(b,1)*10);
        a=a+add_value_a*eye(size(a,1));
        b=b+add_value_b*eye(size(b,1));
        Wi=sylvester(a,b,c);
    end
    
end

