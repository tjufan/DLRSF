function J = calSoftSVTVar(alpha, mu, W, Y)
    % Solve the rank problem with svt method
    
    temp = W + Y/mu;
    [Us, sigma, Vs] = svd(temp, 'econ');
    sigma = diag(sigma);
    svp = length(find(sigma>alpha/mu));
    if svp>=1
        sigma = sigma(1:svp)-alpha/mu;
    else
        svp = 1;
        sigma = 0;
    end
    U = Us(:, 1:svp);
    D = diag(sigma);
    V = Vs(:, 1:svp);
    J = U*D*V';
    %J = Us(:,1:svp)*diag(sigma)*Vs(:,1:svp)';
end

% function J = calSoftSVTVar(mu, W, Y, lambda)
%     % Solve the rank problem with soft svt method
%     
%     temp = W + Y/mu;
% 	[U,S,V] = svd(temp, 'econ');
% 		   
% 	diagS = diag(S);
% 	svp = length(find(diagS > lambda/mu));
% 	diagS = max(0,diagS - lambda/mu);
% 			
% 	if svp < 1 %svp = 0.5 %svp = 0
% 	   svp = 1;
% 	end
% 	J = U(:,1:svp)*diag(diagS(1:svp))*V(:,1:svp)'; 
% end