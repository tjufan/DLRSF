function E = Update_E(beta, mu2, Q, Z, L, E, Y2)
    %P = Q-Z*L*Q-E+Y2/mu2;
    P = Q-Z*L*Q+Y2/mu2;
    for i = 1:size(P, 2)
        nw = norm(P(:, i));
        if nw>beta
            E(:, i) = (nw-beta)*P(:, i)/nw;
        else
            E(:, i) = zeros(length(P(:, i)), 1);
        end
    end
end