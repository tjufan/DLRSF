function S = dotSeries(Ss)
    % series matrix multiply
    if length(Ss) ==1
        S = Ss{1};
    else
        S = Ss{1};
        for i = 2 : length(Ss)
            S = S * Ss{i};
        end
    end
end

